From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: What did I do wrong?  Oopses with 7-30 auto-snapshot
Date: Sat, 31 Jul 2004 17:13:00 +0400
Message-ID: <410B9ADC.906@namesys.com>
References: <1091226640.3426.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080601040900000008060505"
Return-path: <reiserfs-list-return-19889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1091226640.3426.10.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--------------080601040900000008060505
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello

Jonathan Briggs wrote:
> I wanted to try out the latest even though I know it may not work.
> Either it doesn't work, or I did it wrong.  I was hoping someone would
> know which.
> 
> I've got a raid-0 device with a Reiser4 FS from March.  When I tried to
> mount that after booting 2.6.8-rc2-mm1-reiser4 I got an Oops.  I thought
> it might be a change in the disk structure so I got the latest (I think)
> reiser4 tools and tried creating a new FS and loop mounting it.  That
> got me another, identical Oops.
> 
> Here it is if anyone wants to look:
> Unable to handle kernel NULL pointer dereference at virtual address 00000004
>  printing eip:
> c01b0df4
> *pde = 00000000
> Oops: 0000 [#1]
> Modules linked in: joydev evdev usbhid dm_mod ehci_hcd uhci_hcd usbcore
> CPU:    0
> EIP:    0060:[<c01b0df4>]    Not tainted VLI
> EFLAGS: 00010286   (2.6.8-rc2-mm1)
> EIP is at clog_link_object+0x64/0xe0
> eax: 00000000   ebx: 00000000   ecx: c046d964   edx: c16e9dec

Oops, yes, sorry, it did not work when CONFIG_FRAME_POINTER is not set
The attached patch should fix that

--------------080601040900000008060505
Content-Type: text/plain;
 name="cleanup-patch.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cleanup-patch.diff"

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/07/31 17:02:21+04:00 reiser4@tribesman.namesys.com 
#   append_and_or_overwrite: no page fault holding longterm lock
# 
# plugin/item/extent_file_ops.c
#   2004/07/31 17:02:18+04:00 reiser4@tribesman.namesys.com +0 -14
#   append_and_or_overwrite: no page fault holding longterm lock
# 
# ChangeSet
#   2004/07/31 16:51:02+04:00 reiser4@tribesman.namesys.com 
#   cleanup
# 
# txnmgr.c
#   2004/07/31 16:50:59+04:00 reiser4@tribesman.namesys.com +0 -22
#   cleanup
# 
# plugin/item/extent_file_ops.c
#   2004/07/31 16:50:58+04:00 reiser4@tribesman.namesys.com +0 -5
#   cleanup
# 
# plugin/file/file.c
#   2004/07/31 16:50:58+04:00 reiser4@tribesman.namesys.com +0 -4
#   cleanup
# 
# lock.c
#   2004/07/31 16:50:58+04:00 reiser4@tribesman.namesys.com +0 -2
#   cleanup
# 
# debug.h
#   2004/07/31 16:50:58+04:00 reiser4@tribesman.namesys.com +0 -2
#   cleanup
# 
# debug.c
#   2004/07/31 16:50:58+04:00 reiser4@tribesman.namesys.com +5 -44
#   cleanup
# 
# context.h
#   2004/07/31 16:50:58+04:00 reiser4@tribesman.namesys.com +1 -3
#   cleanup
# 
diff -Nru a/context.h b/context.h
--- a/context.h	2004-07-31 17:10:22 +04:00
+++ b/context.h	2004-07-31 17:10:22 +04:00
@@ -146,10 +146,8 @@
 	err_site err;
 	/* information about delayed stat data updates. See above. */
 	dirty_inode_info dirty;
-
-	void *mjd_bt[6]; /* last mark jnode dirty backtrace */
-	int count;
 #endif
+
 #if REISER4_TRACE
 	/* per-thread tracing flags. Use reiser4_trace_flags enum to set
 	   bits in it. */
diff -Nru a/debug.c b/debug.c
--- a/debug.c	2004-07-31 17:10:22 +04:00
+++ b/debug.c	2004-07-31 17:10:22 +04:00
@@ -637,7 +637,6 @@
 	int op;
 	void *data1;
 	void *data2;
-	unsigned long data[6];
 } clog_t;
 
 clog_t clog[CLOG_LENGTH];
@@ -672,39 +671,6 @@
 	spin_unlock(&clog_lock);
 }
 
-/* this is to log lock/unlock */
-void
-clog_link_object(int op, void *data1, void *data2)
-{
-	int idx;
-
-	spin_lock(&clog_lock);
-	
-	if (clog_length == CLOG_LENGTH) {
-		idx = clog_start;
-		clog_start ++;
-		clog_start %= CLOG_LENGTH;
-	} else {
-		idx = clog_length;
-		assert("vs-1672", clog_start == 0);
-		clog_length ++;		
-	}
-		
-	clog[idx].id = clog_id ++;
-	clog[idx].op = op;
-	clog[idx].pid = current->pid;
-	clog[idx].data[0] = (unsigned long)__builtin_return_address(1);
-	clog[idx].data[1] = (unsigned long)__builtin_return_address(2);
-	clog[idx].data[2] = (unsigned long)__builtin_return_address(3);
-	clog[idx].data[3] = (unsigned long)__builtin_return_address(4);
-	clog[idx].data[4] = (unsigned long)__builtin_return_address(5);
-	clog[idx].data[5] = (unsigned long)__builtin_return_address(6);
-	clog[idx].data1 = data1;
-	clog[idx].data2 = data2;
-	spin_unlock(&clog_lock);
-}
-
-
 static const char *
 op2str(int op)
 {
@@ -727,25 +693,19 @@
 void
 print_clog(void)
 {
-	int i, j, k;
+	int i, j;
 
 	j = clog_start;
 	for (i = 0; i < clog_length; i ++) {
-		if (clog[j].op == LINK_OBJECT || clog[j].op == UNLINK_OBJECT) {
-			printk("%d(%d): id %d: pid %d, op %s, locks %p [",
-			       i, j, clog[j].id, clog[j].pid, op2str(clog[j].op), clog[j].data1);
-			for (k = 0; k < 6; k ++)
-				print_symname(clog[j].data[k]);
-			printk("]\n");
-		} else
-			printk("%d(%d): id %d: pid %d, op %s, data1 %p, data2 %p\n",
-			       i, j, clog[j].id, clog[j].pid, op2str(clog[j].op), clog[j].data1, clog[j].data2);
+		printk("%d(%d): id %d: pid %d, op %s, data1 %p, data2 %p\n",
+		       i, j, clog[j].id, clog[j].pid, op2str(clog[j].op), clog[j].data1, clog[j].data2);
 		j ++;
 		j %= CLOG_LENGTH;
 	}
 	printk("clog length %d\n", clog_length);
 }
 
+#if 0
 void
 print_symname(unsigned long address)
 {
@@ -759,6 +719,7 @@
 	if (name != NULL)
 		printk("  %s[%lx/%lx]", name, offset, size);
 }
+#endif
 
 /* Make Linus happy.
    Local variables:
diff -Nru a/debug.h b/debug.h
--- a/debug.h	2004-07-31 17:10:22 +04:00
+++ b/debug.h	2004-07-31 17:10:22 +04:00
@@ -543,9 +543,7 @@
 #define OP_NUM 10
 
 void clog_op(int op, void *, void *);
-void clog_link_object(int op, void *, void *);
 void print_clog(void);
-void print_symname(unsigned long address);
 
 /* __FS_REISER4_DEBUG_H__ */
 #endif
diff -Nru a/lock.c b/lock.c
--- a/lock.c	2004-07-31 17:10:22 +04:00
+++ b/lock.c	2004-07-31 17:10:22 +04:00
@@ -273,7 +273,6 @@
 	assert("reiser4-4", ergo(locks_list_empty(&owner->locks), owner->nr_locks == 0));
 	locks_list_push_back(&owner->locks, handle);
 	owner->nr_locks ++;
-	clog_link_object(LINK_OBJECT, node, (void *)owner->nr_locks);
 
 	owners_list_push_front(&node->lock.owners, handle);
 	handle->signaled = 0;
@@ -292,7 +291,6 @@
 	locks_list_remove_clean(handle);
 	handle->owner->nr_locks --;
 	assert("reiser4-6", ergo(locks_list_empty(&handle->owner->locks), handle->owner->nr_locks == 0));
-	clog_link_object(UNLINK_OBJECT, handle->node, (void *)handle->owner->nr_locks);
 
 	owners_list_remove_clean(handle);
 
diff -Nru a/plugin/file/file.c b/plugin/file/file.c
--- a/plugin/file/file.c	2004-07-31 17:10:22 +04:00
+++ b/plugin/file/file.c	2004-07-31 17:10:22 +04:00
@@ -1472,8 +1472,6 @@
 	if (result)
 		return result;
 
-	clog_op(READPAGE_IN, (void *)(unsigned long)get_inode_oid(inode), (void *)page->index);
-
 	/* get key of first byte of the page */
 	key_by_inode_unix_file(inode, (loff_t) page->index << PAGE_CACHE_SHIFT, &key);
 
@@ -1490,7 +1488,6 @@
 	if (PageUptodate(page)) {
 		done_lh(&lh);
 		unlock_page(page);
-		clog_op(READPAGE_OUT, (void *)(unsigned long)get_inode_oid(inode), (void *)page->index);
 		return 0;
 	}
 	
@@ -1535,7 +1532,6 @@
 	save_file_hint(file, &hint);
 
 	assert("vs-979", ergo(result == 0, (PageLocked(page) || PageUptodate(page))));
-	clog_op(READPAGE_OUT, (void *)(unsigned long)get_inode_oid(inode), (void *)page->index);
 
 	return result;
 }
diff -Nru a/plugin/item/extent_file_ops.c b/plugin/item/extent_file_ops.c
--- a/plugin/item/extent_file_ops.c	2004-07-31 17:10:22 +04:00
+++ b/plugin/item/extent_file_ops.c	2004-07-31 17:10:22 +04:00
@@ -626,8 +626,6 @@
 	/* offset within the page */
 	page_off = (unsigned long)(file_off & (PAGE_CACHE_SIZE - 1));
 
-	clog_op(EXTENT_WRITE_IN, (void *)(unsigned long)oid, (void *)(unsigned long)file_off);
-
 	/* key of first byte of page */
 	page_key = flow->key;
 	set_key_offset(&page_key, (loff_t)page_nr << PAGE_CACHE_SHIFT);
@@ -644,7 +642,6 @@
 
 		write_page_log(inode->i_mapping, page_nr);
 
-		clog_op(EXTENT_WRITE_IN2, (void *)get_current_lock_stack()->nr_locks, 0);
 		result = make_extent(&page_key, uf_coord, mode, &blocknr, &created, inode/* check quota */);
 		if (result) {
 			goto exit1;
@@ -720,7 +717,6 @@
 		assert("nikita-2104", lock_stack_isclean(get_current_lock_stack()));
 
 		/* copy user data into page */
-		clog_op(EXTENT_WRITE_OUT2, (void *)get_current_lock_stack()->nr_locks, 0);
 		result = __copy_from_user((char *)kmap(page) + page_off, flow->data - count, count);
 		kunmap(page);
 		if (unlikely(result)) {
@@ -764,15 +760,6 @@
 		file_off += count;
 		set_key_offset(&page_key, (loff_t)page_nr << PAGE_CACHE_SHIFT);
 
-		if (flow->length) {
-			/* read in next portion of user buffer */
-			size_t bytes;
-
-			bytes = PAGE_CACHE_SIZE;
-			if (bytes > flow->length)
-				bytes = flow->length;
-			fault_in_pages_readable(flow->data, bytes);
-		}
 		continue;
 
 	exit3:
@@ -794,12 +781,6 @@
 		*/
 	} while (flow->length && uf_coord->valid == 1);
 
-/*
-	if (flow->length)
-		DQUOT_FREE_SPACE_NODIRTY(inode, flow->length);
-*/
-
-	clog_op(EXTENT_WRITE_OUT, (void *)(unsigned long)oid, (void *)result);
 	return result;
 }
 
diff -Nru a/txnmgr.c b/txnmgr.c
--- a/txnmgr.c	2004-07-31 17:10:22 +04:00
+++ b/txnmgr.c	2004-07-31 17:10:22 +04:00
@@ -2570,29 +2570,7 @@
 	JF_SET(node, JNODE_DIRTY);
 
 	get_current_context()->nr_marked_dirty ++;
-#if REISER4_DEBUG
-	{
-		reiser4_context *ctx;
 
-		ctx = get_current_context();
-		if (__builtin_return_address(0) == ctx->mjd_bt[0] &&
-		    __builtin_return_address(1) == ctx->mjd_bt[1] &&
-		    __builtin_return_address(2) == ctx->mjd_bt[2] &&
-		    __builtin_return_address(3) == ctx->mjd_bt[3] &&
-		    __builtin_return_address(4) == ctx->mjd_bt[4] &&
-		    __builtin_return_address(5) == ctx->mjd_bt[5]) {
-			ctx->count ++;
-		} else {
-			ctx->mjd_bt[0] = __builtin_return_address(0);
-			ctx->mjd_bt[1] = __builtin_return_address(1);
-			ctx->mjd_bt[2] = __builtin_return_address(2);
-			ctx->mjd_bt[3] = __builtin_return_address(3);
-			ctx->mjd_bt[4] = __builtin_return_address(4);
-			ctx->mjd_bt[5] = __builtin_return_address(5);
-			ctx->count = 1;
-		}
-	}
-#endif
 	/* We grab2flush_reserve one additional block only if node was
 	   not CREATED and jnode_flush did not sort it into neither
 	   relocate set nor overwrite one. If node is in overwrite or

--------------080601040900000008060505--

