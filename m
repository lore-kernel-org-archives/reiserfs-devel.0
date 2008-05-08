From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Calling finish_unfinished() too often?
Date: Thu, 08 May 2008 15:44:27 +0400
Message-ID: <4822E79B.9020001@gmail.com>
References: <20080430112329.GE19688@duck.suse.cz> <4818B6CF.7080804@gmail.com> <20080506173424.GF1409@duck.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030701030501040605070809"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080506173424.GF1409@duck.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org, Vladimir Saveliev <Vladimir.Saveliev@sun.com>

This is a multi-part message in MIME format.
--------------030701030501040605070809
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Jan Kara wrote:
> On Wed 30-04-08 22:13:35, Edward Shishkin wrote:
>   
>> Jan Kara wrote:
>>
>>     
>>>  Hi,
>>>
>>>  I was just looking into reiserfs remount code and it seems it calls
>>> finish_unfinished() whenever filesystem is remounted and isn't in 
>>> read-only
>>> mode. Isn't this unnecessary? I thought finish_unfinished() is needed only
>>> when we remount from read-only to read-write state for the first time...
>>>  
>>>       
>> Perhaps, you are right (if we don't miss some points). But we need to keep 
>> a track
>> of first successful remounts to rw state, and it requires a special flag in 
>> in-memory
>> superblock (I don't see another way).
>>
>>     
>>>  Well, I wouldn't mind the performance impact to remount that much
>>>
>>>       
>> yeah,  definitely benchmarks lack "1000 remounts"statistics ;)
>>
>>     
>>> but it
>>> would make my life with journaled quota a bit easier ;). Thanks for an
>>> answer in advance.
>>>       
>   OK, so would you accept the patch below?
>
>   

I think it should work properly, however Linus doesn't like mysterious
values.
The attached patch might look better: it does the same things, but uses
status flags.

Thanks,
Edward.

--------------030701030501040605070809
Content-Type: text/x-patch;
 name="reiserfs-avoid-unneeded-finish_unfinished-calls.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="reiserfs-avoid-unneeded-finish_unfinished-calls.patch"

We need to call finish_unfinished() only when the filesystem is remounted
read-write for the first time. This not only saves a few cycles on remount
(rather irrelevant) but also makes reiserfs handle journaled quota on remount
better - quota is the correctly reenabled on remount read-write.
So:
. add a field to the in-memory superblock for mount status flags;
. keep a track of the first completed finish_unfinished().

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 linux-2.6.25-mm1/fs/reiserfs/inode.c            |    2 +-
 linux-2.6.25-mm1/fs/reiserfs/super.c            |   10 ++++++----
 linux-2.6.25-mm1/include/linux/reiserfs_fs_sb.h |   13 +++++++++----
 3 files changed, 16 insertions(+), 9 deletions(-)

--- linux-2.6.25-mm1/fs/reiserfs/inode.c.orig
+++ linux-2.6.25-mm1/fs/reiserfs/inode.c
@@ -1454,7 +1454,7 @@
 	   nlink==0: processing of open-unlinked and half-truncated files
 	   during mount (fs/reiserfs/super.c:finish_unfinished()). */
 	if ((inode->i_nlink == 0) &&
-	    !REISERFS_SB(inode->i_sb)->s_is_unlinked_ok) {
+	    !(REISERFS_SB(inode->i_sb)->s_mnt_status_flags & UNLINKED_OK)) {
 		reiserfs_warning(inode->i_sb,
 				 "vs-13075: reiserfs_read_locked_inode: "
 				 "dead inode read from disk %K. "
--- linux-2.6.25-mm1/fs/reiserfs/super.c.orig
+++ linux-2.6.25-mm1/fs/reiserfs/super.c
@@ -189,7 +189,7 @@
 #endif
 
 	done = 0;
-	REISERFS_SB(s)->s_is_unlinked_ok = 1;
+	REISERFS_SB(s)->s_mnt_status_flags |= UNLINKED_OK;
 	while (!retval) {
 		retval = search_item(s, &max_cpu_key, &path);
 		if (retval != ITEM_NOT_FOUND) {
@@ -298,7 +298,8 @@
 		printk("done\n");
 		done++;
 	}
-	REISERFS_SB(s)->s_is_unlinked_ok = 0;
+	REISERFS_SB(s)->s_mnt_status_flags &= ~UNLINKED_OK;
+	REISERFS_SB(s)->s_mnt_status_flags |= UNFINISHED_OK;
 
 #ifdef CONFIG_QUOTA
 	/* Turn quotas off */
@@ -1256,8 +1257,9 @@
 	s->s_dirt = 0;
 
 	if (!(*mount_flags & MS_RDONLY)) {
-		finish_unfinished(s);
-		reiserfs_xattr_init(s, *mount_flags);
+	        if (!(REISERFS_SB(s)->s_mnt_status_flags & UNFINISHED_OK))
+			finish_unfinished(s);
+	        reiserfs_xattr_init(s, *mount_flags);
 	}
 
 out_ok:
--- linux-2.6.25-mm1/include/linux/reiserfs_fs_sb.h.orig
+++ linux-2.6.25-mm1/include/linux/reiserfs_fs_sb.h
@@ -341,6 +341,14 @@
 } reiserfs_proc_info_data_t;
 #endif
 
+/* (re)mount status flags */
+#define UNLINKED_OK 1 /* set up when it's ok for reiserfs_read_inode2()
+		       * to read from disk inode with nlink==0.
+		       * Currently this is only used during
+		       * finish_unfinished() processing at mount time */
+#define UNFINISHED_OK 2 /* indicates that finish_unfinished() was
+			 * completed successfully */
+
 /* reiserfs union of in-core super block data */
 struct reiserfs_sb_info {
 	struct buffer_head *s_sbh;	/* Buffer containing the super block */
@@ -389,10 +397,7 @@
 	int s_bmaps_without_search;
 	int s_direct2indirect;
 	int s_indirect2direct;
-	/* set up when it's ok for reiserfs_read_inode2() to read from
-	   disk inode with nlink==0. Currently this is only used during
-	   finish_unfinished() processing at mount time */
-	int s_is_unlinked_ok;
+	unsigned s_mnt_status_flags; /* these flags are set in (re)mount time */
 	reiserfs_proc_info_data_t s_proc_info_data;
 	struct proc_dir_entry *procdir;
 	int reserved_blocks;	/* amount of blocks reserved for further allocations */

--------------030701030501040605070809--
