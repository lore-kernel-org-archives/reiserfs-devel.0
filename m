From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: No space left on rfs4
Date: Wed, 12 Mar 2008 00:39:08 +0300
Message-ID: <47D6FBFC.4000905@gmail.com>
References: <47CA7EA8.8070802@gmail.com>	 <cd2131fe2e8cdce7c68183211d98bc90@free.fr> <5c7c368b0803081124i2b6af7a1sfb576429afb58ec4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000308060509020705030606"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5c7c368b0803081124i2b6af7a1sfb576429afb58ec4@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: geearf@free.fr
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------000308060509020705030606
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Edward Shishkin wrote:

>On 3/3/08, John <geearf@free.fr> wrote:
>  
>
>> On Sun, 02 Mar 2008 13:17:12 +0300, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>> > Hello.
>> >
>> > Yeah, indeed, I have reproduced it for reg40 (default plugin):
>> > tar process is in permanent "+D" state. After reboot all files
>> > were successfully deleted, although there is some leak of free
>> > disk space there.
>> >
>> > Ok, I'll take a look at this more carefully (I guess -ENOSPC
>> > error is handled incorrectly somewhere).
>> >
>> > If you have a problems with deleting files on reg40 partition,
>> > then please pack your metadata by
>> > debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>> > and let me download the file meta.gz
>>
>>My FS is currently no full and with no bug, so I hope these are the metadata you wanted.
>> If not I'll fill it again and send it to you again
>>
>> http://www.megaupload.com/?d=XVITV1CU
>>
>>    
>>
>
>Eventually I have not downloaded this:
>It said "No free slots available for your country" ;)
>
>Well, don't bother with this for a while:
>I have caught a mutex leak in cryptcompress plugin,
>(fixup is attached) this explains undeletable files in ccreg40.
>
>I'll try fo fix unix-file plugin a bit later.
>
>  
>

I have found some ancient bugs related to tail conversion.
In particular, it take place when application writes by chunks
< 20K in no-space-left-on-device situation (for example, tar,
which uses 10240 bytes chunks by default).
The bugs are:
. leak of per-inode exclusive access;
. leak of per-inode flag REISER4_PART_IN_CONV
All of them are responsible for reported deadlocks , and, perhaps
can lead to data corruptions.

The fixup is attached.

There still takes place a silent leak of free disk space, when
applications runs in no-space-left-on-device situation. This is also
related only to (default) unix-file plugin with (default) "smart"
formatting policy. Hope to address it soon..

Thanks for reports,
Edward.

>> (sorry I cannot send a file that big by e-mail)
>>
>>    
>>
>> > I don' t see such problems with ccreg40 (compression plugin).
>> > Please, let me know, if something goes wrong here..
>>
>>I just tried and had the same issue with a ccreg40 partition.
>> I could not remove all the files, and when I tried it just froze my shell.
>> After killing my shell I was able to reboot but not to umount the partition.
>> This is the debugfs output:
>>
>> http://www.megaupload.com/?d=CBEGIFDL
>>
>>
>> I also wanted to join an fsck output but I don't know how to do that.
>> Basically the results were in checking the semantic tree
>> FSCK: obj40_repair.c 223: obj40_stat_unix_check: Node (XYZ), item (a), [fgfdgf:fgfdggdf:fhgfhgf] (stat40): wrong bytes (ABCDE), fixed to (EFC).
>>
>> (obviously this is some sort of templated message, they were all like that...)
>>
>>
>> Thank you,
>>
>>
>> John
>>
>>
>>    
>>
>>------------------------------------------------------------------------
>>
>>---
>> linux-2.6.23-mm1/fs/reiser4/plugin/file/cryptcompress.c |    7 ++++---
>> 1 files changed, 4 insertions(+), 3 deletions(-)
>>
>>--- linux-2.6.23-mm1/fs/reiser4/plugin/file/cryptcompress.c.orig
>>+++ linux-2.6.23-mm1/fs/reiser4/plugin/file/cryptcompress.c
>>@@ -2721,7 +2721,8 @@
>> 		if (result)
>> 			goto out;
>> 		if (cont->state == PSCHED_ASSIGNED_NEW)
>>-			goto out_no_release;
>>+			/* done_lh was called in write_pschedule_hook */
>>+			goto out_no_longterm_lock;
>> 
>> 		result = prepare_logical_cluster(inode, pos, count, &clust,
>> 						 LC_APPOV);
>>@@ -2793,9 +2794,9 @@
>> 	} while (count);
>>  out:
>> 	done_lh(&hint->lh);
>>-	mutex_unlock(&info->checkin_mutex);
>> 	save_file_hint(file, hint);
>>- out_no_release:
>>+ out_no_longterm_lock:
>>+	mutex_unlock(&info->checkin_mutex);
>> 	kfree(hint);
>> 	put_cluster_handle(&clust);
>> 	assert("edward-195",
>>    
>>


--------------000308060509020705030606
Content-Type: text/x-patch;
 name="reiser4-handle-enospc-fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-handle-enospc-fixup.patch"

---
 linux-2.6.23-mm1/fs/reiser4/plugin/file/cryptcompress.c   |    7 +--
 linux-2.6.23-mm1/fs/reiser4/plugin/file/file.c            |    8 ++-
 linux-2.6.23-mm1/fs/reiser4/plugin/file/tail_conversion.c |   29 +++++++++-----
 linux-2.6.23-mm1/fs/reiser4/plugin/item/internal.c        |   18 ++++++--
 4 files changed, 43 insertions(+), 19 deletions(-)

--- linux-2.6.23-mm1/fs/reiser4/plugin/file/cryptcompress.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/file/cryptcompress.c
@@ -2721,7 +2721,8 @@
 		if (result)
 			goto out;
 		if (cont->state == PSCHED_ASSIGNED_NEW)
-			goto out_no_release;
+			/* done_lh was called in write_pschedule_hook */
+			goto out_no_longterm_lock;
 
 		result = prepare_logical_cluster(inode, pos, count, &clust,
 						 LC_APPOV);
@@ -2793,9 +2794,9 @@
 	} while (count);
  out:
 	done_lh(&hint->lh);
-	mutex_unlock(&info->checkin_mutex);
 	save_file_hint(file, hint);
- out_no_release:
+ out_no_longterm_lock:
+	mutex_unlock(&info->checkin_mutex);
 	kfree(hint);
 	put_cluster_handle(&clust);
 	assert("edward-195",
--- linux-2.6.23-mm1/fs/reiser4/plugin/file/file.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/file/file.c
@@ -2201,8 +2201,11 @@
 					}
 					if (uf_info->container ==  UF_CONTAINER_TAILS) {
 						result = tail2extent(uf_info);
-						if (result)
+						if (result) {
+							drop_exclusive_access(uf_info);
+							context_set_commit_async(ctx);
 							break;
+						}
 					}
 				}
 				drop_exclusive_access(uf_info);
@@ -2244,7 +2247,7 @@
 			current->backing_dev_info = NULL;
 			drop_access(uf_info);
 			context_set_commit_async(ctx);
-			return result;
+			break;
 		}
 		drop_access(uf_info);
 		ea = NEITHER_OBTAINED;
@@ -2315,6 +2318,7 @@
 		    !rofs_inode(inode)) {
 			result = extent2tail(file, uf_info);
 			if (result != 0) {
+				context_set_commit_async(ctx);
 				warning("nikita-3233",
 					"Failed (%d) to convert in %s (%llu)",
 					result, __FUNCTION__,
--- linux-2.6.23-mm1/fs/reiser4/plugin/file/tail_conversion.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/file/tail_conversion.c
@@ -133,9 +133,11 @@
 
 	for (i = 0; i < nr_pages; i++) {
 		if (pages[i] == NULL) {
+#if REISER4_DEBUG
 			unsigned j;
 			for (j = i + 1; j < nr_pages; j++)
 				assert("vs-1620", pages[j] == NULL);
+#endif
 			break;
 		}
 		page_cache_release(pages[i]);
@@ -348,8 +350,10 @@
 	while (done == 0) {
 		memset(pages, 0, sizeof(pages));
 		result = reserve_tail2extent_iteration(inode);
-		if (result != 0)
+		if (result != 0) {
+			reiser4_inode_clr_flag(inode, REISER4_PART_IN_CONV);
 			goto out;
+		}
 		if (first_iteration) {
 			reiser4_inode_set_flag(inode, REISER4_PART_MIXED);
 			reiser4_update_sd(inode);
@@ -494,11 +498,9 @@
 							  REISER4_PART_MIXED));
 		}
 	}
-
-	reiser4_inode_clr_flag(inode, REISER4_PART_IN_CONV);
-
 	if (result == 0) {
 		/* file is converted to extent items */
+		reiser4_inode_clr_flag(inode, REISER4_PART_IN_CONV);
 		assert("vs-1697", reiser4_inode_get_flag(inode,
 							 REISER4_PART_MIXED));
 
@@ -507,16 +509,21 @@
 	} else {
 		/*
 		 * conversion is not complete. Inode was already marked as
-		 * REISER4_PART_CONV and stat-data were updated at the first
+		 * REISER4_PART_MIXED and stat-data were updated at the first
 		 * iteration of the loop above.
 		 */
-	      error:
+	error:
 		release_all_pages(pages, sizeof_array(pages));
-		warning("nikita-2282", "Partial conversion of %llu: %i",
+		reiser4_inode_clr_flag(inode, REISER4_PART_IN_CONV);
+		warning("edward-1548", "Partial conversion of %llu: %i",
 			(unsigned long long)get_inode_oid(inode), result);
 	}
 
-      out:
+ out:
+	/* this assertion is to make sure get_exclusive_access_careful()
+	   won't fall into deadlock loop */
+	assert("edward-1549", !reiser4_inode_get_flag(inode,
+						      REISER4_PART_IN_CONV));
 	return result;
 }
 
@@ -703,7 +710,7 @@
 	}
 	/*
 	 * conversion is not complete. Inode was already marked as
-	 * REISER4_PART_MIXED and stat-data were updated at the first *
+	 * REISER4_PART_MIXED and stat-data were updated at the first
 	 * iteration of the loop above.
 	 */
 	warning("nikita-2282",
@@ -711,6 +718,10 @@
 		(unsigned long long)get_inode_oid(inode), i,
 		num_pages, result);
 
+	/* this assertion is to make sure get_exclusive_access_careful()
+	   won't fall into deadlock loop */
+	assert("edward-1550", !reiser4_inode_get_flag(inode,
+						      REISER4_PART_IN_CONV));
 	return result;
 }
 
--- linux-2.6.23-mm1/fs/reiser4/plugin/item/internal.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/item/internal.c
@@ -308,15 +308,23 @@
 		       struct carry_kill_data *p UNUSED_ARG)
 {
 	znode *child;
+	int result = 0;
 
 	assert("nikita-1222", item != NULL);
 	assert("nikita-1224", from == 0);
 	assert("nikita-1225", count == 1);
 
 	child = znode_at(item, item->node);
+	if (child == NULL)
+		return 0;
 	if (IS_ERR(child))
 		return PTR_ERR(child);
-	else if (node_is_empty(child)) {
+	result = zload(child);
+	if (result) {
+		zput(child);
+		return result;
+	}
+	if (node_is_empty(child)) {
 		reiser4_tree *tree;
 
 		assert("nikita-1397", znode_is_write_locked(child));
@@ -328,14 +336,14 @@
 		init_parent_coord(&child->in_parent, NULL);
 		--item->node->c_count;
 		write_unlock_tree(tree);
-		zput(child);
-		return 0;
 	} else {
 		warning("nikita-1223",
 			"Cowardly refuse to remove link to non-empty node");
-		zput(child);
-		return RETERR(-EIO);
+		result = RETERR(-EIO);
 	}
+	zrelse(child);
+	zput(child);
+	return result;
 }
 
 /* hook called by ->shift() node plugin method when iternal item was just

--------------000308060509020705030606--
