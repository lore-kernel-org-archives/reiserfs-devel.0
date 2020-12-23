From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: port for Linux-5.10
Date: Wed, 23 Dec 2020 01:35:07 +0100
Message-ID: <4e8963df-33e4-8c8f-5eae-afa1bdcb44ed@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------139F299A316E52C3DA9F5182"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=KC1hZ/GVZw+uqoGYbe+l4o8l/kdsCISh0crtDONigD8=;
        b=Ntd7PFL3tuCu9TO7xnVCjHXxMyXnVzrhFqYXqzCT7q6y7rco34SDU3OzgaIrcKiJ19
         WvoAUiqcROCZGbtD0lAvErHE5DXxhyfQWhjP+BC/0r/V7qWPqWNVk8eVw5ePn+rv4McL
         CI2POaK7FTagNvxOAIX9EF6J/pa1j6BU/CDHaCT8ZIatkTYBNiN0WDIvZKhT1LUxDL8+
         bZ9y6cKxWAUBiECgoM4413PmvFVT46Ueu7HTiR4IToziRKsUU1G3ROcVaVCCBHVnrQfX
         TTm7GCXz0mnxrciAu/yvU1/N+6Bfz0zyF7+PfG3zq4brKe3qSarawIy/7z9iJI6A56gO
         ib0A==
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------139F299A316E52C3DA9F5182
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Don't add/use PF_FLUSHER per task flag.
Instead add/use per reiser4_context flag flush_bd_task to indicate
that it is bd flushing task.

--------------139F299A316E52C3DA9F5182
Content-Type: text/x-patch;
 name="reiser4-get-rid-of-pf_flusher_flag.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-get-rid-of-pf_flusher_flag.patch"

diff -urN linux-5.8.10-reiser4/fs/fs-writeback.c linux-5.8.10/fs/fs-writeback.c
--- linux-5.8.10-reiser4/fs/fs-writeback.c	2020-10-11 21:00:01.000000000 +0200
+++ linux-5.8.10/fs/fs-writeback.c	2020-12-12 15:33:16.000000000 +0100
@@ -2090,7 +2090,7 @@
 	long pages_written;
 
 	set_worker_desc("flush-%s", bdi_dev_name(wb->bdi));
-	current->flags |= PF_FLUSHER | PF_SWAPWRITE;
+	current->flags |= PF_SWAPWRITE;
 
 	if (likely(!current_is_workqueue_rescuer() ||
 		   !test_bit(WB_registered, &wb->state))) {
diff -urN linux-5.8.10-reiser4/fs/reiser4/context.c linux-5.8.10/fs/reiser4/context.c
--- linux-5.8.10-reiser4/fs/reiser4/context.c	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/fs/reiser4/context.c	2020-12-12 15:56:05.000000000 +0100
@@ -153,7 +153,7 @@
 	if (sbinfo != NULL && sbinfo->fake != NULL &&
 	    context->nr_marked_dirty != 0 &&
 	    !(current->flags & PF_MEMALLOC) &&
-	    !current_is_flush_bd_task())
+	    !context->flush_bd_task)
  		reiser4_throttle_write(sbinfo->fake);
 }
 
diff -urN linux-5.8.10-reiser4/fs/reiser4/context.h linux-5.8.10/fs/reiser4/context.h
--- linux-5.8.10-reiser4/fs/reiser4/context.h	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/fs/reiser4/context.h	2020-12-12 16:46:39.000000000 +0100
@@ -64,6 +64,8 @@
 	unsigned int on_stack:1;
 	/* file system is read-only */
 	unsigned int ro:1;
+	/* replacement of PF_FLUSHER */
+	unsigned int flush_bd_task:1;
 
 	/* count non-trivial jnode_set_dirty() calls */
 	unsigned long nr_marked_dirty;
diff -urN linux-5.8.10-reiser4/fs/reiser4/super_ops.c linux-5.8.10/fs/reiser4/super_ops.c
--- linux-5.8.10-reiser4/fs/reiser4/super_ops.c	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/fs/reiser4/super_ops.c	2020-12-12 15:49:06.000000000 +0100
@@ -383,6 +383,7 @@
 		spin_lock(&wb->list_lock);
 		goto skip;
 	}
+	ctx->flush_bd_task = 1;
 	/*
 	 * call reiser4_writepages for each of dirty inodes to turn
 	 * dirty pages into transactions if they were not yet.
diff -urN linux-5.8.10-reiser4/fs/reiser4/txnmgr.c linux-5.8.10/fs/reiser4/txnmgr.c
--- linux-5.8.10-reiser4/fs/reiser4/txnmgr.c	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/fs/reiser4/txnmgr.c	2020-12-12 15:55:04.000000000 +0100
@@ -1413,7 +1413,7 @@
 		 * Write throttling is case of no one atom can be
 		 * flushed/committed.
 		 */
-		if (!current_is_flush_bd_task()) {
+		if (!ctx->flush_bd_task) {
 			list_for_each_entry(atom, &tmgr->atoms_list, atom_link) {
 				spin_lock_atom(atom);
 				/* Repeat the check from the above. */
diff -urN linux-5.8.10-reiser4/include/linux/sched.h linux-5.8.10/include/linux/sched.h
--- linux-5.8.10-reiser4/include/linux/sched.h	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/include/linux/sched.h	2020-12-12 15:58:22.000000000 +0100
@@ -1483,7 +1483,6 @@
 /*
  * Per process flags
  */
-#define PF_FLUSHER              0x00000001      /* responsible for disk writeback */
 #define PF_IDLE			0x00000002	/* I am an IDLE thread */
 #define PF_EXITING		0x00000004	/* Getting shut down */
 #define PF_VCPU			0x00000010	/* I'm a virtual CPU */
diff -urN linux-5.8.10-reiser4/include/linux/writeback.h linux-5.8.10/include/linux/writeback.h
--- linux-5.8.10-reiser4/include/linux/writeback.h	2020-10-11 20:59:43.000000000 +0200
+++ linux-5.8.10/include/linux/writeback.h	2020-12-12 15:30:43.000000000 +0100
@@ -17,12 +17,6 @@
 
 DECLARE_PER_CPU(int, dirty_throttle_leaks);
 
-static inline int is_flush_bd_task(struct task_struct *task)
-{
-       return task->flags & PF_FLUSHER;
-}
-#define current_is_flush_bd_task()  is_flush_bd_task(current)
-
 /*
  * The 1/4 region under the global dirty thresh is for smooth dirty throttling:
  *

--------------139F299A316E52C3DA9F5182--
