From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: PAP-12365: check_after_balance_leaf: S is incorrectkernel BUG at 
 prints.c:334! (Part 4)
Date: Mon, 12 Aug 2002 15:17:21 +0200
Message-ID: <3D57B561.1481B525@baldauf.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------0226EBC968779803B1855B1D"
Return-path: <reiserfs-list-return-11165-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------0226EBC968779803B1855B1D
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I checked the filesystem multiple times with
reiserfsck-3.x.0b (first) and reiserfsck-3.x.0k-pre8 (then).
The first run showed a bitmap error which was fixed then
with "--fix-fixable". All subsequent runs could not find any
error. All logs above were captured aftere these reiserfsck
runs.

The first shown errors

Aug 10 22:15:44 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) =3D 1596; MAX_CHILD_SIZE
(4072) - dc_size( [dc_number=3D-981319276, dc_size=3D53157], 56
) [2472] =3D 1600
Aug 10 21:10:45 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) =3D 1608; MAX_CHILD_SIZE
(4072) - dc_size( [dc_number=3D0, dc_size=3D53157], 97 ) [2460]
=3D 1612
Aug 10 21:21:40 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) =3D 1600; MAX_CHILD_SIZE
(4072) - dc_size( [dc_number=3D0, dc_size=3D53157], 99 ) [2468]
=3D 1604
Aug 10 21:38:57 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) =3D 1600; MAX_CHILD_SIZE
(4072) - dc_size( [dc_number=3D0, dc_size=3D53157], 98 ) [2468]
=3D 1604
Aug 10 22:05:21 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) =3D 8; MAX_CHILD_SIZE (4072) -
dc_size( [dc_number=3D0, dc_size=3D53157], 97 ) [4060] =3D 12


seem to indicate that reiserfs is somehow miscalculating
something by 4 units, where the result of the left
calculation is always 4 less than the result of the right
calculation. Reiserfs detects that something is wrong, but
reiserfsck did not detect this?

I also checked the machine with memcheck and tried to
reproduce the problem with DMA off. Memcheck did not show
errors and switching DMA off did not show differences.
Kernel compilation works so a hardware error of the machine
is unlikely, although the problems appeared after a series
of unscheduled poweroffs.


I always let reiserfs run under REISERFS_CHECK to be sure
that everything is okay (I do not care for CPU time, the
machine is fast), and did not find any problems so far. Now
I'm nervous about not running the machine with
REISERFS_CHECK anymore...

Please help,

Xu=E2n.
--------------0226EBC968779803B1855B1D
Content-Type: text/plain; charset=us-ascii;
 name="linux-2.4.20.showStackOnFailingConntrackListDelete.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="linux-2.4.20.showStackOnFailingConntrackListDelete.patch"

--- linux/include/linux/netfilter_ipv4/listhelp.h.orig	Sun Aug 12 18:29:34 2001
+++ linux/include/linux/netfilter_ipv4/listhelp.h	Tue Aug 21 20:23:28 2001
@@ -49,15 +49,20 @@
 	return LIST_FIND(head, __list_cmp_same, void *, entry) != NULL;
 }
 
+extern void show_stack(unsigned long * esp);
+
 /* Delete from list. */
 #ifdef CONFIG_NETFILTER_DEBUG
 #define LIST_DELETE(head, oldentry)					\
 do {									\
 	ASSERT_WRITE_LOCK(head);					\
-	if (!list_inlist(head, oldentry))				\
+	if (!list_inlist(head, oldentry))	{			\
+		show_stack(NULL);					\
 		printk("LIST_DELETE: %s:%u `%s'(%p) not in %s.\n",	\
-		       __FILE__, __LINE__, #oldentry, oldentry, #head);	\
-        else list_del((struct list_head *)oldentry);			\
+		__FILE__, __LINE__, #oldentry, oldentry, #head);	\
+	} else {							\
+		list_del((struct list_head *)oldentry);			\
+	}								\
 } while(0)
 #else
 #define LIST_DELETE(head, oldentry) list_del((struct list_head *)oldentry)
--- linux/arch/i386/kernel/i386_ksyms.c.orig	Tue Aug 21 20:31:59 2001
+++ linux/arch/i386/kernel/i386_ksyms.c	Tue Aug 21 20:37:54 2001
@@ -161,3 +161,7 @@
 #ifdef CONFIG_X86_PAE
 EXPORT_SYMBOL(empty_zero_page);
 #endif
+
+extern void show_stack(unsigned long * esp);
+
+EXPORT_SYMBOL(show_stack);

--------------0226EBC968779803B1855B1D
Content-Type: text/plain; charset=us-ascii;
 name="linux-2.4.20.reiserfs.PAP-5140.nervous.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="linux-2.4.20.reiserfs.PAP-5140.nervous.patch"

diff --exclude=*.o -Nur linux/fs/reiserfs.orig/prints.c linux/fs/reiserfs/prints.c
--- linux/fs/reiserfs.orig/prints.c	Sat Aug 10 18:42:00 2002
+++ linux/fs/reiserfs/prints.c	Sat Aug 10 20:58:52 2002
@@ -338,6 +338,15 @@
 	 sb ? kdevname(sb->s_dev) : "sb == 0", error_buf);
 }
 
+extern void show_stack(unsigned long * esp);
+
+void reiserfs_nervous (struct super_block * sb, const char * fmt, ...)
+{
+  show_reiserfs_locks() ;
+  do_reiserfs_warning(fmt);
+  printk ( KERN_EMERG "%s", error_buf);
+  show_stack(NULL);
+}
 
 void print_virtual_node (struct virtual_node * vn)
 {
diff --exclude=*.o -Nur linux/fs/reiserfs.orig/stree.c linux/fs/reiserfs/stree.c
--- linux/fs/reiserfs.orig/stree.c	Sat Aug 10 18:42:00 2002
+++ linux/fs/reiserfs/stree.c	Sat Aug 10 20:58:04 2002
@@ -740,7 +740,11 @@
 #ifdef CONFIG_REISERFS_CHECK
 	if ( cur_tb ) {
 	    print_cur_tb ("5140");
-	    reiserfs_panic(p_s_sb, "PAP-5140: search_by_key: schedule occurred in do_balance!");
+	    if (0) {
+	    	reiserfs_panic(p_s_sb, "PAP-5140: search_by_key: schedule occurred in do_balance!");
+	    } else {
+	    	reiserfs_nervous(p_s_sb, "PAP-5140: search_by_key: schedule occurred in do_balance!");
+	    }
 	}
 #endif
 

--------------0226EBC968779803B1855B1D--

