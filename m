From: Will Smith <will@willsmith.org>
Subject: Reiser4 repacker - auto switch direction and minor cosmetics.
Date: Sat, 25 Sep 2004 17:23:13 +0800
Message-ID: <41553901.3030407@willsmith.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080107050105090901050605"
Return-path: <reiserfs-list-return-21914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: zam@namesys.com

--------------080107050105090901050605
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Attached, a small patch to the repacker in-kernel code with the
following functionality:


1) automatically switch direction for the next run of the
    repacker if this run went successfully (the flag does not
    survive a remount though).

    this allows for a trivial cron script to do auto repacking, e.g. :

    #!/bin/sh
    for filesystem in /sys/fs/reiser4/* ; do
        echo '1' > ${filesystem}/repacker/start
    done


2) [minor] - more explanatory kernel message when the repacker
    starts and stops (includes the repacker direction)

3) [minor] - add newline after printing each attribute in
    /sys/fs/reiser4/*/repacker/ , in line with sysfs standard

4) [cosmetic] - more consistent variable name when storing
    values loaded into /sys/fs/reiser4/*/repacker/direction

5) [cosmetic] - add comments in the code to make clearer which of the
    /sys/fs/reiser4/*/repacker/* values are implemented.




Patch is to 2.6.8.1-mm4.


Will Smith


--------------080107050105090901050605
Content-Type: text/plain;
 name="repacker_auto_reverse_and_better_logging.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="repacker_auto_reverse_and_better_logging.patch"

--- linux-2.6.8.1-mm4/fs/reiser4/repacker.c	2004-09-25 16:56:49.790332424 +0800
+++ linux-2.6.8.1-mm4-wos2/fs/reiser4/repacker.c	2004-09-25 00:46:16.000000000 +0800
@@ -109,6 +109,23 @@ static void repacker_cursor_done (struct
 	blocknr_hint_done(&cursor->hint);
 }
 
+/* If we completed a repack successfully, switch the direction for 
+ * next time.  Toggling in kernelspace will not survive an unmount and remount, 
+ * so ideally userland tools will control the direction themselves 
+ * and store the previous direction ready for the next time. */
+static void repacker_reverse_direction (struct repacker *repacker)
+{
+
+	int backward = check_repacker_state_bit(repacker, REPACKER_GOES_BACKWARD);
+	spin_lock(&repacker->guard);
+		if (backward)
+			repacker->state &= ~REPACKER_GOES_BACKWARD;
+		else
+			repacker->state |= REPACKER_GOES_BACKWARD;
+	spin_unlock(&repacker->guard);
+}
+
+
 /* routines for closing current transaction and beginning new one */
 
 static int end_work (void)
@@ -346,6 +363,7 @@ reiser4_internal int reiser4_repacker (s
 	struct repacker_cursor cursor;
 	int backward;
 	struct tree_walk_actor * actor;
+	struct task_struct * me = current;
 	int ret;
 
 	repacker_cursor_init(&cursor, repacker);
@@ -353,14 +371,19 @@ reiser4_internal int reiser4_repacker (s
 	backward = check_repacker_state_bit(repacker, REPACKER_GOES_BACKWARD);
 	actor = backward ? &backward_actor : &forward_actor;
 	ret = tree_walk(NULL, backward, actor, &cursor);
-	printk(KERN_INFO "reiser4 repacker: "
+	printk(KERN_INFO "reiser4 repacker: completed, direction = %s, pid = %u, "
 	       "%lu formatted node(s) processed, %lu unformatted node(s) processed, ret = %d\n",
+	       check_repacker_state_bit(repacker, REPACKER_GOES_BACKWARD) ? "backward" : "forward", me->pid,
 	       cursor.stats.znodes_dirtied, cursor.stats.jnodes_dirtied, ret);
 
+	if (!ret) 
+		repacker_reverse_direction(repacker);
+
 	repacker_cursor_done(&cursor);
 	return ret;
 }
 
+
 /* The repacker kernel thread code. */
 reiser4_internal int repacker_d(void *arg)
 {
@@ -381,7 +404,8 @@ reiser4_internal int repacker_d(void *ar
 	/* zeroing the fs_context copied form parent process' task struct. */
 	me->journal_info = NULL;
 
-	printk(KERN_INFO "Repacker: I am alive, pid = %u\n", me->pid);
+	printk(KERN_INFO "reiser4 repacker: alive, direction = %s, pid = %u\n", 
+		check_repacker_state_bit(repacker, REPACKER_GOES_BACKWARD) ? "backward" : "forward", me->pid);
 	ret = init_context(&ctx, repacker->super);
 	if (!ret) {
 		ret = reiser4_repacker(repacker);
@@ -437,7 +461,7 @@ struct repacker_attr {
 
 static ssize_t start_attr_show (struct repacker * repacker, char * buf)
 {
-	return snprintf(buf, PAGE_SIZE , "%d", check_repacker_state_bit(repacker, REPACKER_RUNNING));
+	return snprintf(buf, PAGE_SIZE , "%d\n", check_repacker_state_bit(repacker, REPACKER_RUNNING));
 }
 
 static ssize_t start_attr_store (struct repacker * repacker,  const char *buf, size_t size)
@@ -455,18 +479,18 @@ static ssize_t start_attr_store (struct 
 
 static ssize_t direction_attr_show (struct repacker * repacker, char * buf)
 {
-	return snprintf(buf, PAGE_SIZE , "%d", check_repacker_state_bit(repacker, REPACKER_GOES_BACKWARD));
+	return snprintf(buf, PAGE_SIZE , "%d\n", check_repacker_state_bit(repacker, REPACKER_GOES_BACKWARD));
 }
 
 static ssize_t direction_attr_store (struct repacker * repacker,  const char *buf, size_t size)
 {
-	int go_left = 0;
+	int go_backward = 0;
 
-	sscanf(buf, "%d", &go_left);
+	sscanf(buf, "%d", &go_backward);
 
 	spin_lock(&repacker->guard);
 	if (!(repacker->state & REPACKER_RUNNING)) {
-		if (go_left)
+		if (go_backward)
 			repacker->state |= REPACKER_GOES_BACKWARD;
 		else
 			repacker->state &= ~REPACKER_GOES_BACKWARD;
@@ -478,6 +502,7 @@ static ssize_t direction_attr_store (str
 static ssize_t start_key_attr_show (struct repacker * repacker, char * buf)
 {
 	spin_lock(&repacker->guard);
+	/* Not yet implemented */
 	spin_unlock(&repacker->guard);
 
 	return 0;
@@ -486,6 +511,7 @@ static ssize_t start_key_attr_show (stru
 static ssize_t start_key_attr_store (struct repacker * repacker,  const char *buf, size_t size)
 {
 	spin_lock(&repacker->guard);
+	/* Not yet implemented */
 	spin_unlock(&repacker->guard);
 
 	return (ssize_t)size;
@@ -499,7 +525,7 @@ static ssize_t count_attr_show (struct r
 	count = repacker->params.count;
 	spin_unlock(&repacker->guard);
 
-	return snprintf(buf, PAGE_SIZE, "%llu", (unsigned long long)count);
+	return snprintf(buf, PAGE_SIZE, "%llu\n", (unsigned long long)count);
 }
 
 static ssize_t count_attr_store (struct repacker * repacker,  const char *buf, size_t size)
@@ -523,7 +549,7 @@ static ssize_t chunk_size_attr_show (str
 	chunk_size = repacker->params.chunk_size;
 	spin_unlock(&repacker->guard);
 
-	return snprintf(buf, PAGE_SIZE, "%Lu", (unsigned long long)chunk_size);
+	return snprintf(buf, PAGE_SIZE, "%Lu\n", (unsigned long long)chunk_size);
 }
 
 static ssize_t chunk_size_attr_store (struct repacker * repacker,  const char *buf, size_t size)

--------------080107050105090901050605--

