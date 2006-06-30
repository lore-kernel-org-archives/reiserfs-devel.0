From: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Fri, 30 Jun 2006 10:36:02 +0900
Message-ID: <6.0.0.20.2.20060630094908.0411c9d0@172.19.0.2>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
 <200606292047.14973.mason@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <200606292047.14973.mason@suse.com>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
 <200606292047.14973.mason@suse.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com
Cc: reiser@namesys.com, reiserfs-dev@namesys.com, linux-fsdevel@vger.kernel.org

Hi,

At 09:47 06/06/30, Chris Mason wrote:
 >Thanks for the patch.  One problem is this will bump the transaction marker
 >for atime updates too.  I'd rather see the change done inside
 >reiserfs_file_write.

I did not realize that an atime updates is also influenced.

 >
 >reiserfs_file_write already updates the transaction when blocks are allocated,
 >but you're right that to be 100% correct we should cover the case when i_size
 >increases but new blocks are not added.  Was this the case you were trying to
 >fix?

Yes, that's right.

So, I remade my patch as follows.
I tested this patch and confirmed that the kernel with this patch work well.


Signed-off-by :Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>


diff -Nru linux-2.6.17/fs/reiserfs/file.c linux-2.6.17_fix/fs/reiserfs/file.c
--- linux-2.6.17/fs/reiserfs/file.c	2006-06-18 10:49:35.000000000 +0900
+++ linux-2.6.17_fix/fs/reiserfs/file.c	2006-06-30 10:09:35.000000000 +0900
@@ -860,8 +860,10 @@
  			// this sets the proper flags for O_SYNC to trigger a commit
  			mark_inode_dirty(inode);
  			reiserfs_write_unlock(inode->i_sb);
-		} else
+		} else {
+			reiserfs_update_inode_transaction(inode);
  			mark_inode_dirty(inode);
+		}

  		sd_update = 1;
  	}

Thanks.

