From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v2 92/92] fs: rename i_ctime field to __i_ctime
Date: Wed,  5 Jul 2023 14:58:12 -0400
Message-ID: <20230705185812.579118-4-jlayton__29088.7458644406$1688583610$gmane$org@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688583567;
        bh=upDmKDv+6xjSiy7POdUF+8WFopDSBgqOL9aHcGqhK2Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lcNGsVlnIbVft2o9WVSu7oStzcC7UruKn4c1DTBWmjGO00DNBCt3+ZZxjK6miMMj/
         GBdLPvZ/RE2acwmtA26p1q8MtPtZ6AFXE1afuhwSlwu52+nzTrcPM9ox138DUXq3pP
         a+auUEyCQ5+EySj5vT4AGLwnwLHJre6WjBG5uo1Fk/D4NwBI39aiCvuIo2r0b4YzkK
         eGFkZHIr8aozqfMt+EZCLKVtueQinWQYpN5V9F3hby1Tiu5AXVWEdS37dhPfamlHdD
         XsiVC3GdeisubCKxKkTGzRJBTmma2JIDfH5g8iF/7cOUhrr8m/tq4qK4hAP5wOyo8R
         g+tGtW7J9HY7Q==
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jk@ozlabs.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com, surenb@google.com, dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, leon@kernel.org, bwarrum@linux.ibm.com, rituagar@linux.ibm.com, ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com, dsterba@suse.com, dhowells@redhat.com, marc.dionne@auristor.com, viro@zeniv.linux.org.uk, raven@themaw.net, luisbg@kernel.org, salah.triki@gmail.com, aivazian.tigran@gmail.com, ebiederm@xmission.com, kees

Now that everything in-tree is converted to use the accessor functions,
rename the i_ctime field in the inode to discourage direct access.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/fs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 14e38bd900f1..b66442f91835 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -642,7 +642,7 @@ struct inode {
 	loff_t			i_size;
 	struct timespec64	i_atime;
 	struct timespec64	i_mtime;
-	struct timespec64	i_ctime;
+	struct timespec64	__i_ctime; /* use inode_*_ctime accessors! */
 	spinlock_t		i_lock;	/* i_blocks, i_bytes, maybe i_size */
 	unsigned short          i_bytes;
 	u8			i_blkbits;
@@ -1485,7 +1485,7 @@ struct timespec64 inode_set_ctime_current(struct inode *inode);
  */
 static inline struct timespec64 inode_get_ctime(const struct inode *inode)
 {
-	return inode->i_ctime;
+	return inode->__i_ctime;
 }
 
 /**
@@ -1498,7 +1498,7 @@ static inline struct timespec64 inode_get_ctime(const struct inode *inode)
 static inline struct timespec64 inode_set_ctime_to_ts(struct inode *inode,
 						      struct timespec64 ts)
 {
-	inode->i_ctime = ts;
+	inode->__i_ctime = ts;
 	return ts;
 }
 
-- 
2.41.0

