From: Nikita Danilov <Nikita@Namesys.COM>
Subject: [PATCH]: reiser4 [1/8] export fsync_super()
Date: Thu, 31 Oct 2002 19:03:05 +0300
Message-ID: <15809.21561.25201.754130@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11864-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <Torvalds@Transmeta.COM>
Cc: Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello, Linus,

    Following patch exports fsync_super() function. fsync_super() is
    required for reiser4, because during umount we want to perform some
    tasks after ->writepage has been called on all pages dirtied through
    mmap (that is, after fsync_super()), but before inodes
    destruction. As a result, reiser4 cannot use kill_block_super() and
    has to call fsync_super() explicitly.

Please apply.
Nikita.
--- linus-bk-2.5/fs/buffer.c	Thu Oct 17 03:01:42 2002
+++ linux-2.5-reiser4/fs/buffer.c	Mon Oct 21 13:43:49 2002
@@ -224,6 +224,7 @@ int fsync_super(struct super_block *sb)
 
 	return sync_blockdev(sb->s_bdev);
 }
+EXPORT_SYMBOL(fsync_super);
 
 /*
  * Write out and wait upon all dirty data associated with this

