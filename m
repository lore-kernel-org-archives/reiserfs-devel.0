From: Jan Kara <jack@suse.cz>
Subject: Re: Calling finish_unfinished() too often?
Date: Tue, 6 May 2008 19:34:25 +0200
Message-ID: <20080506173424.GF1409@duck.suse.cz>
References: <20080430112329.GE19688@duck.suse.cz> <4818B6CF.7080804@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4818B6CF.7080804@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, Vladimir Saveliev <Vladimir.Saveliev@sun.com>

On Wed 30-04-08 22:13:35, Edward Shishkin wrote:
> Jan Kara wrote:
>
>>  Hi,
>>
>>  I was just looking into reiserfs remount code and it seems it calls
>> finish_unfinished() whenever filesystem is remounted and isn't in 
>> read-only
>> mode. Isn't this unnecessary? I thought finish_unfinished() is needed only
>> when we remount from read-only to read-write state for the first time...
>>  
>
> Perhaps, you are right (if we don't miss some points). But we need to keep 
> a track
> of first successful remounts to rw state, and it requires a special flag in 
> in-memory
> superblock (I don't see another way).
>
>>  Well, I wouldn't mind the performance impact to remount that much
>>
>
> yeah,  definitely benchmarks lack "1000 remounts"statistics ;)
>
>> but it
>> would make my life with journaled quota a bit easier ;). Thanks for an
>> answer in advance.
  OK, so would you accept the patch below?

									Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
---

From 1eb1dbd8ebb518b1299bd2c45908db988b56a287 Mon Sep 17 00:00:00 2001
From: Jan Kara <jack@suse.cz>
Date: Tue, 6 May 2008 19:13:38 +0200
Subject: [PATCH] reiserfs: Call finish_unfinished() only during first remount RW

We need to call finish_unfinished() only when the filesystem is remounted
read-write for the first time. This not only saves a few cycles on remount
(rather irrelevant) but also makes reiserfs handle journaled quota on remount
better - quota is the correctly reenabled on remount read-write.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/inode.c            |    2 +-
 fs/reiserfs/super.c            |    7 ++++---
 include/linux/reiserfs_fs_sb.h |    9 +++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 5791793..c2fdeb4 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -1454,7 +1454,7 @@ void reiserfs_read_locked_inode(struct inode *inode,
 	   nlink==0: processing of open-unlinked and half-truncated files
 	   during mount (fs/reiserfs/super.c:finish_unfinished()). */
 	if ((inode->i_nlink == 0) &&
-	    !REISERFS_SB(inode->i_sb)->s_is_unlinked_ok) {
+	    REISERFS_SB(inode->i_sb)->s_unlinked_cleanup != 1) {
 		reiserfs_warning(inode->i_sb,
 				 "vs-13075: reiserfs_read_locked_inode: "
 				 "dead inode read from disk %K. "
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 2c3aa5f..7faed9c 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -189,7 +189,7 @@ static int finish_unfinished(struct super_block *s)
 #endif
 
 	done = 0;
-	REISERFS_SB(s)->s_is_unlinked_ok = 1;
+	REISERFS_SB(s)->s_unlinked_cleanup = 1;
 	while (!retval) {
 		retval = search_item(s, &max_cpu_key, &path);
 		if (retval != ITEM_NOT_FOUND) {
@@ -298,7 +298,7 @@ static int finish_unfinished(struct super_block *s)
 		printk("done\n");
 		done++;
 	}
-	REISERFS_SB(s)->s_is_unlinked_ok = 0;
+	REISERFS_SB(s)->s_unlinked_cleanup = 2;
 
 #ifdef CONFIG_QUOTA
 	/* Turn quotas off */
@@ -1290,7 +1290,8 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	s->s_dirt = 0;
 
 	if (!(*mount_flags & MS_RDONLY)) {
-		finish_unfinished(s);
+		if (!REISERFS_SB(s)->s_unlinked_cleanup)
+			finish_unfinished(s);
 		reiserfs_xattr_init(s, *mount_flags);
 	}
 
diff --git a/include/linux/reiserfs_fs_sb.h b/include/linux/reiserfs_fs_sb.h
index db5ef9b..5c703e6 100644
--- a/include/linux/reiserfs_fs_sb.h
+++ b/include/linux/reiserfs_fs_sb.h
@@ -390,10 +390,11 @@ struct reiserfs_sb_info {
 	int s_bmaps_without_search;
 	int s_direct2indirect;
 	int s_indirect2direct;
-	/* set up when it's ok for reiserfs_read_inode2() to read from
-	   disk inode with nlink==0. Currently this is only used during
-	   finish_unfinished() processing at mount time */
-	int s_is_unlinked_ok;
+	/* set up to 0, initially, to 1 when orphan cleanup is in progress
+	   and to 2 when it is done. Used by reiserfs_read_inode2() to check
+	   when read of inode with nlink==0 is OK and to detect first remount
+	   read-write during which finish_unfinished() needs to be called. */
+	int s_unlinked_cleanup;
 	reiserfs_proc_info_data_t s_proc_info_data;
 	struct proc_dir_entry *procdir;
 	int reserved_blocks;	/* amount of blocks reserved for further allocations */
-- 
1.5.2.4

