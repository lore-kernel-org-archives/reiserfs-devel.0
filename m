From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: fixed bug in reiser4_kill_root()
Date: Wed, 8 Nov 2017 21:50:03 +0100
Message-ID: <f5afe7c5-fd0f-d9d1-5f44-7041858f495f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------448550F9022ABAD87D583B8F"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=/mUrHM6ukl09MzGwNcl4zdcz0aQX5zI9z6OPA5mdoyc=;
        b=ITAsqC1TFEGrvF1jMYEEcucq4yvNxYcVIZdMK4q2HKEfqPceMEA099JPqbSXPXffgt
         /hzIC/6MyzEz9wKoK/srbCPFtEsgaCI6DTSZPJulTdo7mgvyggf8SiXxCAZExRQrhePl
         zXVkiQ+o8/xFQ8EGGpcmVfO9B51nbEEgGFTpIUDwjLkAY6bYhpzXaxyxi56kXvnUt68R
         Ql8cYBE+z0BtrSlPOcLdgZCFd6eTup+31lR4+k2QwrqvpJvi0XtN/gmsqArD71d1xI0e
         S/C3Hwi9ZnsdEU3mTHLRMYq/hIddQ/3y3bE2Aai/qdYyA5IbXy1+6oRa+tiDn/ZfPqub
         eDbQ==
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------448550F9022ABAD87D583B8F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Probably, this is the most essential "old sleeping" bug
found for the latest 3 years. It could lead to data corruption
(not proven). Details are in the changeset.
It will go to reiser4-for-4.13.1 and higher. For other
stuff please, apply (backport, etc) by yourself.

Thanks,
Edward.

--------------448550F9022ABAD87D583B8F
Content-Type: text/x-patch;
 name="reiser4-fix-kill-root.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-kill-root.patch"

commit 5e8518e0031c97e21830372721ee7a5fae78d610
Author: Edward Shishkin <edward.shishkin@gmail.com>
Date:   Wed Nov 8 21:27:44 2017 +0100

    Fixed bug in reiser4_kill_root(): wrong function was called
    for reinitialization of the old root. As the result, cached
    number of items remained not updated (i.e. corruption of
    memory data structures). In practice problems could happen
    when removing file sets large enough to reduce storage tree
    height, i.e. when old root is killed and its single child
    becomes a new root.
    
    Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

diff --git a/jnode.c b/jnode.c
index d8b2f8600..0f1594cd6 100644
--- a/jnode.c
+++ b/jnode.c
@@ -1310,7 +1310,7 @@ static int remove_znode(jnode * node, reiser4_tree * tree)
 }
 
 /* ->init() method for formatted nodes */
-static int init_znode(jnode * node)
+int init_znode(jnode * node)
 {
 	znode *z;
 
diff --git a/tree_mod.c b/tree_mod.c
index 26fff5f08..f9687df8f 100644
--- a/tree_mod.c
+++ b/tree_mod.c
@@ -317,7 +317,7 @@ static int reiser4_kill_root(reiser4_tree * tree /* tree from which root is
 		write_unlock_tree(tree);
 
 		/* reinitialise old root. */
-		result = node_plugin_by_node(old_root)->init(old_root);
+		result = init_znode(ZJNODE(old_root));
 		znode_make_dirty(old_root);
 		if (result == 0) {
 			assert("nikita-1279", node_is_empty(old_root));
diff --git a/znode.h b/znode.h
index 164fb985a..613377ef6 100644
--- a/znode.h
+++ b/znode.h
@@ -218,6 +218,7 @@ extern void znode_remove(znode *, reiser4_tree *);
 extern znode *znode_parent(const znode * node);
 extern znode *znode_parent_nolock(const znode * node);
 extern int znode_above_root(const znode * node);
+extern int init_znode(jnode *node);
 extern int init_znodes(void);
 extern void done_znodes(void);
 extern int znodes_tree_init(reiser4_tree * ztree);

--------------448550F9022ABAD87D583B8F--
