From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: disable automatic enabling of reiserfs inode attributes
Date: Sun, 12 Feb 2006 11:37:58 -0500
Message-ID: <20060212163758.GB5190@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751148AbWBLQiA@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>
Cc: Chris Mason <mason@suse.com>, Hans Reiser <reiser@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

 Unfortunately, the reiserfs_attrs_cleared bit in the superblock flag can lie.
 File systems have been observed with the bit set, yet still contain garbage
 in the stat data field, causing unpredictable results.

 This patch backs out the enable-by-default behavior.

 It eliminates the changes from: d50a5cd860ce721dbeac6a4f3c6e42abcde68cd8, and
 ef5e5414e7a83eb9b4295bbaba5464410b11e030.

  fs/reiserfs/super.c |    2 --
  1 files changed, 2 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX dontdiff linux-2.6.15/fs/reiserfs/super.c linux-2.6.15-reiserfs/fs/reiserfs/super.c
--- linux-2.6.15/fs/reiserfs/super.c	2006-02-06 19:54:27.000000000 -0500
+++ linux-2.6.15-reiserfs/fs/reiserfs/super.c	2006-02-12 11:19:15.000000000 -0500
@@ -1121,8 +1121,6 @@ static void handle_attrs(struct super_bl
 					 "reiserfs: cannot support attributes until flag is set in super-block");
 			REISERFS_SB(s)->s_mount_opt &= ~(1 << REISERFS_ATTRS);
 		}
-	} else if (le32_to_cpu(rs->s_flags) & reiserfs_attrs_cleared) {
-		REISERFS_SB(s)->s_mount_opt |= (1 << REISERFS_ATTRS);
 	}
 }
 
-- 
Jeff Mahoney
SuSE Labs
