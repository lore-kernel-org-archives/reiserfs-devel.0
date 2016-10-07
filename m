From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: remove unneeded assertions, make gcc happy.
Date: Fri,  7 Oct 2016 18:42:54 +0200
Message-ID: <1475858574-28363-1-git-send-email-edward.shishkin@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=cLNLTOqeiZK3yAF67Dl1aoHNnm9WYy2fbIlPBqlPliU=;
        b=kW8BC9YM8/PCQfuQo1OOj678W1Gj9KErmthIFQJJ2faG4BCMD894BPNpAG3cw0ZBrK
         wYkTZ7rQdMxM+DFyQ9687b+XtpL7qGVUDuMAZv2wNu2ybxwS1wZTS/BeunYLQXafmjIm
         0DDBO7mZ2y8CXOMa7/IWk42dl4s/1yILqgyNfy/hY2v+AUpch50u9YsTC53QJb72CDmx
         0+VSwvo0cfjvsgiYhgwx/h4G6iDnhJYl8KoqhFZ/obDV61P85DUiKoiK6NLBCDO28T3v
         2x+TVHcDhY5N4jOU80EZdf6zpN2SLKLViisJwb9v5Md2L3Il9aR+sPof+vMS1dNB0TVn
         DqXg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 debug.h        | 10 ++++++----
 jnode.c        | 12 ------------
 plugin/txmod.c |  1 -
 znode.c        |  1 -
 4 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/debug.h b/debug.h
index 060921f..a2a6c67 100644
--- a/debug.h
+++ b/debug.h
@@ -9,10 +9,12 @@
 #include "forward.h"
 #include "reiser4.h"
 
-/* generic function to produce formatted output, decorating it with
-   whatever standard prefixes/postfixes we want. "Fun" is a function
-   that will be actually called, can be printk, panic etc.
-   This is for use by other debugging macros, not by users. */
+/**
+ * generic function to produce formatted output, decorating it with
+ * whatever standard prefixes/postfixes we want. "Fun" is a function
+ * that will be actually called, can be printk, panic etc.
+ * This is for use by other debugging macros, not by users.
+ */
 #define DCALL(lev, fun, reperr, label, format, ...)			\
 ({									\
 	fun(lev "reiser4[%.16s(%i)]: %s (%s:%i)[%s]:\n" format "\n" ,	\
diff --git a/jnode.c b/jnode.c
index 7698200..580ded1 100644
--- a/jnode.c
+++ b/jnode.c
@@ -249,8 +249,6 @@ void done_jnodes(void)
 /* Initialize a jnode. */
 void jnode_init(jnode *node, reiser4_subvol *subv, jnode_type type)
 {
-	assert("umka-175", node != NULL);
-
 	memset(node, 0, sizeof(jnode));
 	ON_DEBUG(node->magic = JMAGIC);
 	jnode_set_type(node, type);
@@ -296,7 +294,6 @@ static void jnode_done(jnode *node)
 /* return already existing jnode of page */
 jnode *jnode_by_page(struct page *pg)
 {
-	assert("nikita-2066", pg != NULL);
 	assert("nikita-2400", PageLocked(pg));
 	assert("nikita-2068", PagePrivate(pg));
 	assert("nikita-2067", jprivate(pg) != NULL);
@@ -313,8 +310,6 @@ jnode *jalloc(void)
 /* return jnode back to the slab allocator */
 inline void jfree(jnode * node)
 {
-	assert("zam-449", node != NULL);
-
 	assert("nikita-2663", (list_empty_careful(&node->capture_link) &&
 			       NODE_LIST(node) == NOT_CAPTURED));
 	assert("nikita-3222", list_empty(&node->jnodes));
@@ -389,8 +384,6 @@ jnode *jlookup(reiser4_tree * tree, oid_t objectid, unsigned long index)
 	struct jnode_key jkey;
 	jnode *node;
 
-	assert("nikita-2353", tree != NULL);
-
 	jkey.objectid = objectid;
 	jkey.index = index;
 
@@ -654,7 +647,6 @@ jnode *jnode_of_page(struct page *pg, int for_io)
 	jnode *result;
 	reiser4_subvol *subv;
 
-	assert("umka-176", pg != NULL);
 	assert("nikita-2394", PageLocked(pg));
 
 	if (for_io)
@@ -710,9 +702,7 @@ void jnode_attach_page(jnode * node, struct page *pg)
 /* Dual to jnode_attach_page: break a binding between page and jnode */
 void page_clear_jnode(struct page *page, jnode * node)
 {
-	assert("nikita-2424", page != NULL);
 	assert("nikita-2425", PageLocked(page));
-	assert("nikita-2426", node != NULL);
 	assert_spin_locked(&(node->guard));
 	assert("nikita-2428", PagePrivate(page));
 
@@ -1156,7 +1146,6 @@ int jwait_io(jnode * node, int rw)
 	struct page *page;
 	int result;
 
-	assert("zam-447", node != NULL);
 	assert("zam-448", jnode_page(node) != NULL);
 
 	page = jnode_page(node);
@@ -1799,7 +1788,6 @@ void unpin_jnode_data(jnode * node)
 
 struct address_space *jnode_get_mapping(const jnode * node)
 {
-	assert("nikita-3162", node != NULL);
 	return jnode_ops(node)->mapping(node);
 }
 
diff --git a/plugin/txmod.c b/plugin/txmod.c
index 028abb2..b675216 100644
--- a/plugin/txmod.c
+++ b/plugin/txmod.c
@@ -107,7 +107,6 @@ void jnode_make_wander_nolock(jnode * node)
 {
 	txn_atom *atom;
 
-	assert("nikita-2431", node != NULL);
 	assert("nikita-2432", !JF_ISSET(node, JNODE_RELOC));
 	assert("nikita-3153", JF_ISSET(node, JNODE_DIRTY));
 	assert("zam-897", !JF_ISSET(node, JNODE_FLUSH_QUEUED));
diff --git a/znode.c b/znode.c
index 58ebc5d..3845d1a 100644
--- a/znode.c
+++ b/znode.c
@@ -787,7 +787,6 @@ static int znode_is_true_root(const znode *node)
 /* check that @node is root */
 int znode_is_root(const znode *node)
 {
-	assert("nikita-1206", node != NULL);
 	assert("edward-1804", znode_get_subvol(node) != NULL);
 
 	return znode_get_level(node) == znode_get_tree(node)->height;
-- 
2.7.4

