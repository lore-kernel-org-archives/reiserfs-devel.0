From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Testing a custom kernel (2.6.39) with native reiser4 support
Date: Mon, 21 May 2012 02:12:31 +0200
Message-ID: <4FB9886F.9000607@gmail.com>
References: <CANish_kwKO1EUys-QS44oJeD1T7daFMn1QA0LdPC1ZVG6_RtOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090204090707060704010103"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CANish_kwKO1EUys-QS44oJeD1T7daFMn1QA0LdPC1ZVG6_RtOg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Sandro Souza <escovadordebits@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090204090707060704010103
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

Please, try the attached patch: it should help...
I have also fixed a deadlock because of reiser4
lock ordering violation:

do_lo_send_aops() keeps page locked and calls file_update_time()
which calls reiser4_update_sd, which tries to acquire a longterm
lock (bad).

Thanks,
Edward.

On 05/15/2012 12:55 AM, Sandro Souza wrote:
> Hello my friends.
>
> I made a new custom distro based on debian squeeze, but with 2.6.39
> kernel, patched with reiser4

[...]

> Trying to copy a folder from a reiser3 partition to a reiser4
> partition, I got error messages.
>
> Testing my custom kernel with "preemption model" in "Preemptible
> Kernel", I got these messages:
>
> [  286.945598] ------------[ cut here ]------------
> [  286.945609] kernel BUG at fs/reiser4/block_alloc.c:151!
> [  286.945617] invalid opcode: 0000 [#1] PREEMPT SMP
> [  286.945626] last sysfs file:

[...]

> ffffffff8118e00d
> [  286.945808] Call Trace:
> [  286.945817]  [<ffffffff8117b484>] ? jnode_make_dirty_locked+0x112/0x18f
> [  286.945824]  [<ffffffff8117b529>] ? znode_make_dirty+0x28/0x87
> [  286.945831]  [<ffffffff8118e00d>] ? update_sd+0x344/0x3a4
> [  286.945838]  [<ffffffff81387a46>] ? sub_preempt_count+0x83/0x94
> [  286.945845]  [<ffffffff8118e096>] ? write_sd_by_inode_common+0x29/0x92
> [  286.945852]  [<ffffffff8103cb67>] ? get_parent_ip+0x9/0x1b
> [  286.945858]  [<ffffffff8118512b>] ? reiser4_dirty_inode+0x19/0x73
> [  286.945865]  [<ffffffff810edecb>] ? T.1132+0x12/0x2e
> [  286.945872]  [<ffffffff8104b288>] ? current_fs_time+0x1e/0x24
> [  286.945878]  [<ffffffff81112ddb>] ? __mark_inode_dirty+0x28/0x1c8
> [  286.945885]  [<ffffffff81108169>] ? file_update_time+0xf7/0x126
> [  286.945891]  [<ffffffff811924ee>] ? reiser4_write_end_careful+0x147/0x184
> [  286.945897]  [<ffffffff81115083>] ? pipe_to_file+0x152/0x161
> [  286.945903]  [<ffffffff81387af5>] ? add_preempt_count+0x9e/0xa0
> [  286.945909]  [<ffffffff81114f31>] ? generic_file_splice_write+0x133/0x133
> [  286.945914]  [<ffffffff811143cb>] ? splice_from_pipe_feed+0x6d/0xed
> [  286.945920]  [<ffffffff81114eb3>] ? generic_file_splice_write+0xb5/0x133
> [  286.945933]  [<ffffffff811162a6>] ? sys_splice+0x2f8/0x3d2
> [  286.945939]  [<ffffffff8138a7d2>] ? system_call_fastpath+0x16/0x1b
> [  286.945944] Code: 25 80 cc 00 00 53 48 83 ec 08 48 8b 80 38 05 00

--------------090204090707060704010103
Content-Type: text/plain;
 name="reiser4-fix-reservation-and-deadlock.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-reservation-and-deadlock.patch"

Reserve space in reiser4_write_begin() properly:
1) for update_sd() when changing file szie;
2) for update_sd() when updating mtime/ctime

Fix deadlock (reiser4 lock ordering violation):
release page lock in reiser4_dirty_inode()
before aquiring a longterm lock.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/context.h                     |    4 +++
 fs/reiser4/plugin/file/cryptcompress.c   |   29 +++++++++++++++++++--
 fs/reiser4/plugin/file/file.c            |   41 +++++++++++++++++++++----------
 fs/reiser4/plugin/file/file_conversion.c |   11 +++-----
 fs/reiser4/super_ops.c                   |   17 +++++++++---
 5 files changed, 76 insertions(+), 26 deletions(-)

Index: linux-2.6.39/fs/reiser4/plugin/file/cryptcompress.c
===================================================================
--- linux-2.6.39.orig/fs/reiser4/plugin/file/cryptcompress.c
+++ linux-2.6.39/fs/reiser4/plugin/file/cryptcompress.c
@@ -1521,7 +1521,9 @@ static int update_sd_cryptcompress(struc
 					  BA_CAN_COMMIT);
 	if (result)
 		return result;
-	inode->i_ctime = inode->i_mtime = CURRENT_TIME;
+	if (!IS_NOCMTIME(inode))
+		inode->i_ctime = inode->i_mtime = CURRENT_TIME;
+
 	result = reiser4_update_sd(inode);
 
 	if (unlikely(result != 0))
@@ -3755,7 +3757,9 @@ int write_begin_cryptcompress(struct fil
 	struct reiser4_slide *win;
 	struct cluster_handle *clust;
 	struct cryptcompress_info *info;
+	reiser4_context *ctx;
 
+	ctx = get_current_context();
 	inode = page->mapping->host;
 	info = cryptcompress_inode_data(inode);
 
@@ -3789,9 +3793,13 @@ int write_begin_cryptcompress(struct fil
 		ClearPageUptodate(page);
 		goto err0;
 	}
-	/* Success. All resources (including checkin_mutex)
-	   will be released in ->write_end() */
+	/*
+	 * Success. All resources (including checkin_mutex)
+	 * will be released in ->write_end()
+	 */
+	ctx->locked_page = page;
 	*fsdata = (void *)buf;
+
 	return 0;
  err0:
 	put_cluster_handle(clust);
@@ -3812,15 +3820,18 @@ int write_end_cryptcompress(struct file 
 	struct inode *inode;
 	struct cluster_handle *clust;
 	struct cryptcompress_info *info;
+	reiser4_context *ctx;
 
 	assert("edward-1566",
 	       lock_stack_isclean(get_current_lock_stack()));
+	ctx = get_current_context();
 	inode = page->mapping->host;
 	info = cryptcompress_inode_data(inode);
 	clust = (struct cluster_handle *)fsdata;
 	hint = clust->hint;
 
 	unlock_page(page);
+	ctx->locked_page = NULL;
 	set_cluster_pages_dirty(clust, inode);
 	ret = checkin_logical_cluster(clust, inode);
 	if (ret) {
@@ -3831,6 +3842,18 @@ int write_end_cryptcompress(struct file 
 	mutex_unlock(&info->checkin_mutex);
 
 	put_cluster_handle(clust);
+
+	if (pos + copied > inode->i_size) {
+		/*
+		 * i_size has been updated in
+		 * checkin_logical_cluster
+		 */
+		ret = reiser4_update_sd(inode);
+		if (unlikely(ret != 0))
+			warning("edward-1603",
+				"Can not update stat-data: %i. FSCK?",
+				ret);
+	}
 	kfree(fsdata);
 	return ret;
 }
Index: linux-2.6.39/fs/reiser4/plugin/file/file.c
===================================================================
--- linux-2.6.39.orig/fs/reiser4/plugin/file/file.c
+++ linux-2.6.39/fs/reiser4/plugin/file/file.c
@@ -2128,6 +2128,7 @@ ssize_t write_unix_file(struct file *fil
 		new_size = *pos + count;
 
 	while (left) {
+		int update_sd = 0;
 		if (left < to_write)
 			to_write = left;
 
@@ -2239,18 +2240,27 @@ ssize_t write_unix_file(struct file *fil
 		assert("edward-1555",
 		       ergo(uf_info->container == UF_CONTAINER_TAILS,
 			    write_op == reiser4_write_tail));
-		if (*pos + written > inode->i_size)
+		if (*pos + written > inode->i_size) {
 			INODE_SET_FIELD(inode, i_size, *pos + written);
-		file_update_time(file);
-		/* space for update_sd was reserved in write_op */
-		result = reiser4_update_sd(inode);
-		if (result) {
-			warning("edward-1574",
-				"Can not update stat-data: %i. FSCK?",
-				result);
-			drop_access(uf_info);
-			context_set_commit_async(ctx);
-			break;
+			update_sd = 1;
+		}
+		if (!IS_NOCMTIME(inode)) {
+			inode->i_ctime = inode->i_mtime = CURRENT_TIME;
+			update_sd = 1;
+		}
+		if (update_sd) {
+			/*
+			 * space for update_sd was reserved in write_op
+			 */
+			result = reiser4_update_sd(inode);
+			if (result) {
+				warning("edward-1574",
+					"Can not update stat-data: %i. FSCK?",
+					result);
+				drop_access(uf_info);
+				context_set_commit_async(ctx);
+				break;
+			}
 		}
 		drop_access(uf_info);
 		ea = NEITHER_OBTAINED;
@@ -2768,14 +2778,19 @@ int write_end_unix_file(struct file *fil
 		SetPageError(page);
 		goto exit;
 	}
-	if (pos + copied > inode->i_size)
+	if (pos + copied > inode->i_size) {
 		INODE_SET_FIELD(inode, i_size, pos + copied);
+		ret = reiser4_update_sd(inode);
+		if (unlikely(ret != 0))
+			warning("edward-1604",
+				"Can not update stat-data: %i. FSCK?",
+				ret);
+	}
  exit:
 	drop_exclusive_access(info);
 	return ret;
 }
 
-
 /*
  * Local variables:
  * c-indentation-style: "K&R"
Index: linux-2.6.39/fs/reiser4/plugin/file/file_conversion.c
===================================================================
--- linux-2.6.39.orig/fs/reiser4/plugin/file/file_conversion.c
+++ linux-2.6.39/fs/reiser4/plugin/file/file_conversion.c
@@ -671,9 +671,11 @@ int reiser4_write_begin_careful(struct f
 		ret = PTR_ERR(ctx);
 		goto err2;
 	}
-	ret = reiser4_grab_space_force(/* one for stat data update */
-					  estimate_update_common(inode),
-					  BA_CAN_COMMIT);
+	ret = reiser4_grab_space_force(/* for update_sd:
+					* one when updating file size and
+					* one when updating mtime/ctime */
+				       2 * estimate_update_common(inode),
+				       BA_CAN_COMMIT);
 	if (ret)
 		goto err1;
 	ret = PROT_PASSIVE(int, write_begin, (file, page, pos, len, fsdata));
@@ -713,9 +715,6 @@ int reiser4_write_end_careful(struct fil
 	ret = PROT_PASSIVE(int, write_end, (file, page, pos, copied, fsdata));
 	page_cache_release(page);
 
-	file_update_time(file);
-	/* space for update_sd was reserved in reiser4_write_begin */
-	ret = reiser4_update_sd(inode);
 	/* don't commit transaction under inode semaphore */
 	context_set_commit_async(ctx);
 	reiser4_exit_context(ctx);
Index: linux-2.6.39/fs/reiser4/context.h
===================================================================
--- linux-2.6.39.orig/fs/reiser4/context.h
+++ linux-2.6.39/fs/reiser4/context.h
@@ -87,6 +87,10 @@ struct reiser4_context {
 	 * flushed */
 	int nr_captured;
 	int nr_children;	/* number of child contexts */
+	struct page *locked_page; /* page that should be unlocked in
+				   * reiser4_dirty_inode() before taking
+				   * a longterm lock (to not violate
+				   * reiser4 lock ordering) */
 #if REISER4_DEBUG
 	/* debugging information about reiser4 locks held by the current
 	 * thread */
Index: linux-2.6.39/fs/reiser4/super_ops.c
===================================================================
--- linux-2.6.39.orig/fs/reiser4/super_ops.c
+++ linux-2.6.39/fs/reiser4/super_ops.c
@@ -166,16 +166,25 @@ static void reiser4_destroy_inode(struct
 static void reiser4_dirty_inode(struct inode *inode)
 {
 	int result;
+	reiser4_context *ctx;
 
 	if (!is_in_reiser4_context())
 		return;
-	assert("", !IS_RDONLY(inode));
-	assert("", (inode_file_plugin(inode)->estimate.update(inode) <=
-		    get_current_context()->grabbed_blocks));
+	assert("edward-1606", !IS_RDONLY(inode));
+	assert("edward-1607",
+	       (inode_file_plugin(inode)->estimate.update(inode) <=
+		get_current_context()->grabbed_blocks));
+
+	ctx = get_current_context();
+	if (ctx->locked_page)
+		unlock_page(ctx->locked_page);
 
 	result = reiser4_update_sd(inode);
+
+	if (ctx->locked_page)
+		lock_page(ctx->locked_page);
 	if (result)
-		warning("", "failed to dirty inode for %llu: %d",
+		warning("edward-1605", "failed to dirty inode for %llu: %d",
 			get_inode_oid(inode), result);
 }
 

--------------090204090707060704010103--
