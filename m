From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v2 14/92] reiserfs: convert to simple_rename_timestamp
Date: Wed,  5 Jul 2023 15:00:39 -0400
Message-ID: <20230705190309.579783-12-jlayton@kernel.org>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688583807;
        bh=KWaqWqc/38Kzci3VQKWkRcd53CVOEuWovP0o19vIoz4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WclbXEIC0F2OWeE3/SIvdzxd4Nct3v3+p/ewdhScqQHUiwA8kX38+2hiHQfoI8Kot
         JYAt41YVG5MshRIFOO1EnB67og4b0wfiWgj2rllg0DAdw9AFN+7Heqf+Q6Clg5O7gJ
         jT+9Z4YvmD9VM12ARs/oQWuKCZf9NicyhSkkHqMW5OakqQEJXdErLml+629OSIlBOb
         OlxNTnkYvBfaBB7BQAHf/CoSjf5xPk4deAmP4JYnykwrRAbnf0VSz208Zury3GcS5c
         oezB2tGru9AuPutoCjn0dLEGkg/3Ub54Ypx2O2zFdMc7IjSyWgz0P+zx0oZio7cKdD
         XU17wdH9xrQUQ==
In-Reply-To: <20230705190309.579783-1-jlayton@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/reiserfs/namei.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 52240cc891cf..405ac59eb2dd 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -1325,7 +1325,6 @@ static int reiserfs_rename(struct mnt_idmap *idmap,
 	int jbegin_count;
 	umode_t old_inode_mode;
 	unsigned long savelink = 1;
-	struct timespec64 ctime;
 
 	if (flags & ~RENAME_NOREPLACE)
 		return -EINVAL;
@@ -1576,14 +1575,11 @@ static int reiserfs_rename(struct mnt_idmap *idmap,
 
 	mark_de_hidden(old_de.de_deh + old_de.de_entry_num);
 	journal_mark_dirty(&th, old_de.de_bh);
-	ctime = current_time(old_dir);
-	old_dir->i_ctime = old_dir->i_mtime = ctime;
-	new_dir->i_ctime = new_dir->i_mtime = ctime;
 	/*
 	 * thanks to Alex Adriaanse <alex_a@caltech.edu> for patch
 	 * which adds ctime update of renamed object
 	 */
-	old_inode->i_ctime = ctime;
+	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
 
 	if (new_dentry_inode) {
 		/* adjust link number of the victim */
@@ -1592,7 +1588,6 @@ static int reiserfs_rename(struct mnt_idmap *idmap,
 		} else {
 			drop_nlink(new_dentry_inode);
 		}
-		new_dentry_inode->i_ctime = ctime;
 		savelink = new_dentry_inode->i_nlink;
 	}
 
-- 
2.41.0

