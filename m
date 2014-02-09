From: Rashika Kheria <rashika.kheria@gmail.com>
Subject: [PATCH 20/21] fs: Move prototype declaration to header file
 reiserfs.h from super.c
Date: Sun, 9 Feb 2014 18:59:42 +0530
Message-ID: <764a2eddc09cb8670d757cd4170d44d41b3971e0.1391949868.git.rashika.kheria@gmail.com>
References: <b572932c3e016c55e596686283036316a1aacd2f.1391949868.git.rashika.kheria@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=El+QkkNGKQ44y7FE+x0Z0RHqPXhhZVaIGE/0qbebROo=;
        b=BC9i1TTMktg4xNHsXhFeCzGNPNR/fkohFveF+QoYhCThHNzsqowYnu0y61qDaePsWJ
         1SFFSFDGF/7bI9hw95Snww3oD8prZVV3GicKsk4umoVDt/Y4SJwbEPVtF/teRbEyBGvE
         fx6Nrho/PcOnZs5mSxBX4Wlo2OudKHf2ngfC5y2UBLLD9T40y9jGZkpiHmv7XB1wR9/L
         bfGFAHAbSX2BwqVXVlgCltQOU0Nykmy7XqJkd4iFsorJDB/BQsrAOdzZHu1H40gfjPkE
         Ce2cLeLrLlqoENxpBzZ70+5jHe5mdRAvs927T3wwuLjvRBnGKoLGuA86NXK7NGq6Jfy2
         YxyQ==
Content-Disposition: inline
In-Reply-To: <b572932c3e016c55e596686283036316a1aacd2f.1391949868.git.rashika.kheria@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Alex Elder <alex.elder@linaro.org>, "David S. Miller" <davem@davemloft.net>, Jeff Mahoney <jeffm@suse.com>, Rashika Kheria <rashika.kheria@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Ionut-Gabriel Radu <ihonius@gmail.com>, reiserfs-devel@vger.kernel.org, josh@joshtriplett.org

Move prototype declaration to header file reiserfs/reiserfs.h from
reiserfs/super.c because they are used by more than one file.

This eliminates the following warning in reiserfs/bitmap.c:
fs/reiserfs/bitmap.c:647:6: warning: no previous prototype for =E2=80=98=
show_alloc_options=E2=80=99 [-Wmissing-prototypes]

Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---
 fs/reiserfs/reiserfs.h |    1 +
 fs/reiserfs/super.c    |    1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 8d06adf..83d4eac 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -2831,6 +2831,7 @@ void reiserfs_init_alloc_options(struct super_blo=
ck *s);
  */
 __le32 reiserfs_choose_packing(struct inode *dir);
=20
+void show_alloc_options(struct seq_file *seq, struct super_block *s);
 int reiserfs_init_bitmap_cache(struct super_block *sb);
 void reiserfs_free_bitmap_cache(struct super_block *sb);
 void reiserfs_cache_bitmap_metadata(struct super_block *sb, struct buf=
fer_head *bh, struct reiserfs_bitmap_info *info);
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 2c80335..16d5335 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -62,7 +62,6 @@ static int is_any_reiserfs_magic_string(struct reiser=
fs_super_block *rs)
=20
 static int reiserfs_remount(struct super_block *s, int *flags, char *d=
ata);
 static int reiserfs_statfs(struct dentry *dentry, struct kstatfs *buf)=
;
-void show_alloc_options(struct seq_file *seq, struct super_block *s);
=20
 static int reiserfs_sync_fs(struct super_block *s, int wait)
 {
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
