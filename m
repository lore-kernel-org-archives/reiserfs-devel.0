From: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
Subject: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Tue, 20 Jun 2006 17:43:11 +0900
Message-ID: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiser@namesys.com, reiserfs-dev@namesys.com
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

Hi,

  When write() extends a file(i_size is increased) and fsync() is
called, change of inode must be written to journaling area
through fsync().
But,currently the i_trans_id is not correctly updated when i_size
is increased. So fsync() does not kick the journal writer.

Following patch fix this bug.

  Signed-off-by :Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>

diff -Nru linux-2.6.17/fs/reiserfs/super.c linux-2.6.17_fix/fs/reiserfs/super.c
--- linux-2.6.17/fs/reiserfs/super.c	2006-06-18 10:49:35.000000000 +0900
+++ linux-2.6.17_fix/fs/reiserfs/super.c	2006-06-20 14:38:28.000000000 +0900
@@ -558,6 +558,7 @@
  		reiserfs_write_unlock(inode->i_sb);
  		return;
  	}
+	reiserfs_update_inode_transaction(inode);
  	reiserfs_update_sd(&th, inode);
  	journal_end(&th, inode->i_sb, 1);
  	reiserfs_write_unlock(inode->i_sb);


Thanks, 

