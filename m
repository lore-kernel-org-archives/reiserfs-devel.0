From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v2 07/92] fs: add ctime accessors infrastructure
Date: Wed,  5 Jul 2023 14:58:10 -0400
Message-ID: <20230705185812.579118-2-jlayton__22642.8757816151$1688583559$gmane$org@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688583530;
        bh=rS7mHrqZmoO2H68n3RxhES3IzDPLPysS3UyH3PinCQ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aMKB7Eajzv0HN0RjiqoVKTtlq5KN/eWgB5BWIXdR4yS+qXLo9oJ2A8CvARGhR38SH
         AGVvIkEZAbD+2gqh1hM5AgL3ExspR2noywBNBHZ/Zbz6Jipv98b24C+FbaNuj7Id30
         /vjMmqLNAVgc3TMo2RGbDruAikPadReZuK3KcfWQJbROt+tSH7hONNDFEXZgGO8FCp
         rZUVAJaTqC0bKLSAziTq7i3tC8AVeG/+sFMf01eIn4wnADMCMY5hp3fCv+if/Zhei+
         dNlf5J971crJund4f35sQB+fqWVZ1Rv/WEt2CJNhYXge8soEVT4A/D9IhrSNkZ2pHG
         dVcbUJJd2L7+A==
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jk@ozlabs.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com, surenb@google.com, dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, leon@kernel.org, bwarrum@linux.ibm.com, rituagar@linux.ibm.com, ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com, dsterba@suse.com, dhowells@redhat.com, marc.dionne@auristor.com, viro@zeniv.linux.org.uk, raven@themaw.net, luisbg@kernel.org, salah.triki@gmail.com, aivazian.tigran@gmail.com, ebiederm@xmission.com, kees
Cc: Jan Kara <jack@suse.cz>

struct timespec64 has unused bits in the tv_nsec field that can be used
for other purposes. In future patches, we're going to change how the
inode->i_ctime is accessed in certain inodes in order to make use of
them. In order to do that safely though, we'll need to eradicate raw
accesses of the inode->i_ctime field from the kernel.

Add new accessor functions for the ctime that we use to replace them.

Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/inode.c         | 16 ++++++++++++++++
 include/linux/fs.h | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/fs/inode.c b/fs/inode.c
index d37fad91c8da..21b026d95b51 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2499,6 +2499,22 @@ struct timespec64 current_time(struct inode *inode)
 }
 EXPORT_SYMBOL(current_time);
 
+/**
+ * inode_set_ctime_current - set the ctime to current_time
+ * @inode: inode
+ *
+ * Set the inode->i_ctime to the current value for the inode. Returns
+ * the current value that was assigned to i_ctime.
+ */
+struct timespec64 inode_set_ctime_current(struct inode *inode)
+{
+	struct timespec64 now = current_time(inode);
+
+	inode_set_ctime(inode, now.tv_sec, now.tv_nsec);
+	return now;
+}
+EXPORT_SYMBOL(inode_set_ctime_current);
+
 /**
  * in_group_or_capable - check whether caller is CAP_FSETID privileged
  * @idmap:	idmap of the mount @inode was found from
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 824accb89a91..bdfbd11a5811 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1474,7 +1474,50 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
 	       kgid_has_mapping(fs_userns, kgid);
 }
 
-extern struct timespec64 current_time(struct inode *inode);
+struct timespec64 current_time(struct inode *inode);
+struct timespec64 inode_set_ctime_current(struct inode *inode);
+
+/**
+ * inode_get_ctime - fetch the current ctime from the inode
+ * @inode: inode from which to fetch ctime
+ *
+ * Grab the current ctime from the inode and return it.
+ */
+static inline struct timespec64 inode_get_ctime(const struct inode *inode)
+{
+	return inode->i_ctime;
+}
+
+/**
+ * inode_set_ctime_to_ts - set the ctime in the inode
+ * @inode: inode in which to set the ctime
+ * @ts: value to set in the ctime field
+ *
+ * Set the ctime in @inode to @ts
+ */
+static inline struct timespec64 inode_set_ctime_to_ts(struct inode *inode,
+						      struct timespec64 ts)
+{
+	inode->i_ctime = ts;
+	return ts;
+}
+
+/**
+ * inode_set_ctime - set the ctime in the inode
+ * @inode: inode in which to set the ctime
+ * @sec: tv_sec value to set
+ * @nsec: tv_nsec value to set
+ *
+ * Set the ctime in @inode to { @sec, @nsec }
+ */
+static inline struct timespec64 inode_set_ctime(struct inode *inode,
+						time64_t sec, long nsec)
+{
+	struct timespec64 ts = { .tv_sec  = sec,
+				 .tv_nsec = nsec };
+
+	return inode_set_ctime_to_ts(inode, ts);
+}
 
 /*
  * Snapshotting support.
-- 
2.41.0

