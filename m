From: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Mon, 03 Jul 2006 10:31:49 +0900
Message-ID: <6.0.0.20.2.20060703095844.04122500@172.19.0.2>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
 <200606300824.12352.mason@suse.com>
 <56260.61.127.129.98.1151708358.squirrel@serv1.oss.ntt.co.jp>
 <200607011534.24157.mason@suse.com>
 <44A7E790.3050003@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44A7E790.3050003@namesys.com>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
 <200606300824.12352.mason@suse.com>
 <56260.61.127.129.98.1151708358.squirrel@serv1.oss.ntt.co.jp>
 <200607011534.24157.mason@suse.com>
 <44A7E790.3050003@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: akpm@osdl.org
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com, linux-fsdevel@vger.kernel.org, Hans Reiser <reiser@namesys.com>, Chris Mason <mason@suse.com>


At 00:34 06/07/03, Hans Reiser wrote:
 >Chris Mason wrote:
 >
 >>
 >>Thanks, this one looks good.
 >>
 >>
 >Hisashi, please submit it to akpm.

Hi, Andrew.

When write() extends a file(i_size is increased) and fsync() is called,
change of inode must be written to journaling area through fsync().
But,currently the i_trans_id is not correctly updated when i_size
is increased. So fsync() does not kick the journal writer.

Reiserfs_file_write() already updates the transaction when blocks are allocated,
but the case when i_size increases and new blocks are not added is not
correctly treated.

Following patch fix this bug.

Signed-off-by :Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>

diff -Nru linux-2.6.17/fs/reiserfs/file.c linux-2.6.17_fix/fs/reiserfs/file.c
--- linux-2.6.17/fs/reiserfs/file.c	2006-06-18 10:49:35.000000000 +0900
+++ linux-2.6.17_fix/fs/reiserfs/file.c	2006-07-03 09:52:51.000000000 +0900
@@ -860,8 +860,12 @@
  			// this sets the proper flags for O_SYNC to trigger a commit
  			mark_inode_dirty(inode);
  			reiserfs_write_unlock(inode->i_sb);
-		} else
+		} else {
+			reiserfs_write_lock(inode->i_sb);
+			reiserfs_update_inode_transaction(inode);
  			mark_inode_dirty(inode);
+			reiserfs_write_unlock(inode->i_sb);
+		}

  		sd_update = 1;
  	}

Thanks. 

