From: Eric Sandeen <sandeen@redhat.com>
Subject: [PATCH 6/6] reiserfs: fix up error handling for insert_inode_locked4
Date: Tue, 06 Dec 2011 17:12:29 -0600
Message-ID: <4EDEA15D.7040604@redhat.com>
References: <4EDE9D54.1030506@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4EDE9D54.1030506@redhat.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Cc: reiserfs-devel@vger.kernel.org

after 250df6ed274d767da844a5d9f05720b804240197
(fs: protect inode->i_state with inode->i_lock), insert_inode_locked()
no longer returns the inode with I_NEW set on failure.  However,
the error handler still calls unlock_new_inode() on failure,
which does a WARN_ON if I_NEW is not set, so any failure spews
a lot of warnings.

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---

(I had a hard time unraveling the gotos, so punted with an "inode_locked"
var... prettier replacements are fine with me!)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 950f13a..b0cab7c 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -1779,6 +1779,7 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 	struct cpu_key key;
 	struct item_head ih;
 	struct stat_data sd;
+	int inode_locked = 0;
 	int retval;
 	int err;
 
@@ -1816,6 +1817,7 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 		err = -EINVAL;
 		goto out_bad_inode;
 	}
+	inode_locked = 1;
 	if (old_format_only(sb))
 		/* not a perfect generation count, as object ids can be reused, but
 		 ** this is as good as reiserfs can do right now.
@@ -1989,7 +1991,8 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
       out_inserted_sd:
 	clear_nlink(inode);
 	th->t_trans_id = 0;	/* so the caller can't use this handle later */
-	unlock_new_inode(inode); /* OK to do even if we hadn't locked it */
+	if (inode_locked)
+		unlock_new_inode(inode);
 	iput(inode);
 	return err;
 }
