From: Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp>
Subject: Re: [PATCH] fix problems related to journaling in Reiserfs
Date: Tue, 04 Oct 2005 17:47:08 +0900
Message-ID: <6.0.0.20.2.20051004170540.03fa4eb0@129.60.53.12>
References: <6.0.0.20.2.20050831191551.03fdbac0@129.60.53.12>
 <43167718.5080702@namesys.com>
 <20050901220321.454985a3@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20050901220321.454985a3@watt.suse.com>
References: <6.0.0.20.2.20050831191551.03fdbac0@129.60.53.12>
 <43167718.5080702@namesys.com>
 <20050901220321.454985a3@watt.suse.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>, Hans Reiser <reiser@namesys.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

Hello Chris.

I noticed that fsync() also has a BUG related to meta-data journaling in 
Reiserfs.
When write() extends a file(i_size is increased), fsync() must write a
meta-data change to a journaling area on a disk.
But, it seems to me that the Reiserfs does not do this.

I suppose following patch would fix this bug.

Thanks.

Signed-off-by :Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp>

diff -Nru linux-2.6.14-rc3/fs/reiserfs/file.c 
linux-2.6.14-rc3_fix/fs/reiserfs/file.c
--- linux-2.6.14-rc3/fs/reiserfs/file.c	2005-10-03 14:13:57.000000000 +0900
+++ linux-2.6.14-rc3_fix/fs/reiserfs/file.c	2005-10-03 15:27:42.000000000 +0900
@@ -1320,7 +1320,6 @@
  				reiserfs_write_unlock(inode->i_sb);
  				return err;
  			}
-			reiserfs_update_inode_transaction(inode);
  			mark_inode_dirty(inode);
  			err = journal_end(&th, inode->i_sb, 1);
  			if (err) {
diff -Nru linux-2.6.14-rc3/fs/reiserfs/super.c 
linux-2.6.14-rc3_fix/fs/reiserfs/super.c
--- linux-2.6.14-rc3/fs/reiserfs/super.c	2005-10-03 14:13:57.000000000 +0900
+++ linux-2.6.14-rc3_fix/fs/reiserfs/super.c	2005-10-03 15:27:42.000000000 +0900
@@ -563,6 +563,7 @@
  		reiserfs_write_unlock(inode->i_sb);
  		return;
  	}
+	reiserfs_update_inode_transaction(inode);
  	reiserfs_update_sd(&th, inode);
  	journal_end(&th, inode->i_sb, 1);
  	reiserfs_write_unlock(inode->i_sb); 

