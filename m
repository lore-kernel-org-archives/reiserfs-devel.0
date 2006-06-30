From: "Hisashi Hifumi" <hifumi.hisashi@oss.ntt.co.jp>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Sat, 1 Jul 2006 07:59:18 +0900 (JST)
Message-ID: <56260.61.127.129.98.1151708358.squirrel@serv1.oss.ntt.co.jp>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
    <200606292047.14973.mason@suse.com>
    <6.0.0.20.2.20060630094908.0411c9d0@172.19.0.2>
    <200606300824.12352.mason@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <200606300824.12352.mason@suse.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com, reiser@namesys.com, reiserfs-dev@namesys.com, linux-fsdevel@vger.kernel.org

Hi.

> This is correct, excpet you need to put the update_inode_transaction call
> inside reiserfs_write_lock/unlock.

Again, I remade my patch.
I have a question.
I understand update_inode_transaction must be inside reiserfs_write_lock.
Is update_inode_transaction needed to be inside journal_begin/end ?


Signed-off-by :Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>

diff -Nru linux-2.6.17/fs/reiserfs/file.c linux-2.6.17_fix/fs/reiserfs/file.c
--- linux-2.6.17/fs/reiserfs/file.c     2006-06-18 10:49:35.000000000 +0900
+++ linux-2.6.17_fix/fs/reiserfs/file.c 2006-07-01 07:39:11.002239042 +0900
@@ -860,8 +860,12 @@
                        // this sets the proper flags for O_SYNC to
trigger a commit
                        mark_inode_dirty(inode);
                        reiserfs_write_unlock(inode->i_sb);
-               } else
+               } else {
+                       reiserfs_write_lock(inode->i_sb);
+                       reiserfs_update_inode_transaction(inode);
                        mark_inode_dirty(inode);
+                       reiserfs_write_unlock(inode->i_sb);
+               }

                sd_update = 1;
        }


