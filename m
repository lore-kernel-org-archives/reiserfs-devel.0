From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 OOPSes and panics when out of memory
Date: Mon, 17 Jul 2006 21:38:11 +0400
Message-ID: <1153157891.6311.71.camel@tribesman.namesys.com>
References: <63591.70.224.221.228.1153071893.squirrel@people.msoe.edu>
	 <1153145428.6311.43.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-hYj1yO+dXKuqhMn1DYbA"
Return-path: <reiserfs-list-return-29035-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153145428.6311.43.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: maciejej@msoe.edu
Cc: reiserfs-list@namesys.com

--=-hYj1yO+dXKuqhMn1DYbA
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Mon, 2006-07-17 at 18:10 +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> On Sun, 2006-07-16 at 12:44 -0500, maciejej@msoe.edu wrote:
> > Has my previous post
> > (http://marc.theaimsgroup.com/?l=reiserfs&m=115259665831650&w=2) been
> > overlooked, or have I not provided enough information? Do I need to
> > reproduce these issues on 2.6.18-rc1-mm2? Should I be trying any patches?
> > 
> 

please try the attached patch.

> your test crashes reiser4 on my test box. I hope to get a patch ready
> later today. Not sure that I got the same problem as you, though. We
> will see. 
> 
> > The bottom line is with 2.6.17-mm6, I've always been able to OOPs or panic
> > reiser4 on my amd64 machine (haven't tried x86 yet) by using all available
> > physical memory.
> > 
> > 
> 
> 

--=-hYj1yO+dXKuqhMn1DYbA
Content-Description: 
Content-Disposition: inline; filename=reiser4-fix-readdir.patch
Content-Type: text/x-patch; charset=utf-8
Content-Transfer-Encoding: 7bit


diff -puN fs/reiser4/plugin/file_ops_readdir.c~reiser4-fix-readdir fs/reiser4/plugin/file_ops_readdir.c
--- linux-2.6.17-mm6/fs/reiser4/plugin/file_ops_readdir.c~reiser4-fix-readdir	2006-07-17 18:43:50.000000000 +0400
+++ linux-2.6.17-mm6-vs/fs/reiser4/plugin/file_ops_readdir.c	2006-07-17 19:02:38.000000000 +0400
@@ -349,6 +349,7 @@ feed_entry(struct file *f,
 	 */
 	assert("nikita-3436", lock_stack_isclean(get_current_lock_stack()));
 
+	txn_restart_current();
 	result = filldir(dirent, name, (int)strlen(name),
 			 /* offset of this entry */
 			 f->f_pos,
diff -puN fs/reiser4/plugin/file/file.c~reiser4-fix-readdir fs/reiser4/plugin/file/file.c
--- linux-2.6.17-mm6/fs/reiser4/plugin/file/file.c~reiser4-fix-readdir	2006-07-17 20:39:11.000000000 +0400
+++ linux-2.6.17-mm6-vs/fs/reiser4/plugin/file/file.c	2006-07-17 21:35:31.000000000 +0400
@@ -781,9 +781,12 @@ int find_or_create_extent(struct page *p
 
 	lock_page(page);
 	node = jnode_of_page(page);
-	unlock_page(page);
-	if (IS_ERR(node))
+	if (IS_ERR(node)) {
+		unlock_page(page);
 		return PTR_ERR(node);
+	}
+	JF_SET(node, JNODE_WRITE_PREPARED);
+	unlock_page(page);
 
 	if (node->blocknr == 0) {
 		plugged_hole = 0;
@@ -791,6 +794,7 @@ int find_or_create_extent(struct page *p
 				       (loff_t)page->index << PAGE_CACHE_SHIFT,
 				       &plugged_hole);
 		if (result) {
+			JF_CLR(node, JNODE_WRITE_PREPARED);
 			jput(node);
 			warning("", "update_extent failed: %d", result);
 			return result;
@@ -806,6 +810,7 @@ int find_or_create_extent(struct page *p
 	}
 
 	BUG_ON(node->atom == NULL);
+	JF_CLR(node, JNODE_WRITE_PREPARED);
 	jput(node);
 
 	if (get_current_context()->entd) {
@@ -1729,7 +1734,9 @@ ssize_t read_unix_file(struct file *file
 			return RETERR(-EFAULT);
 		}
 
-		read = read_file(hint, file, buf, left, off);
+		read = read_file(hint, file, buf,
+				 left > PAGE_CACHE_SIZE ? PAGE_CACHE_SIZE : left,
+				 off);
 
  		drop_nonexclusive_access(uf_info);
 

_

--=-hYj1yO+dXKuqhMn1DYbA--

