From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 66/8] plugin.c cleanup
Date: Fri, 26 Oct 2007 13:53:53 +0200
Message-ID: <1193399633.4615.16.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-w/EsJlP0dqnKdw0kUPcW"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-w/EsJlP0dqnKdw0kUPcW
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 3 errors, 2 warnings, 559 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-w/EsJlP0dqnKdw0kUPcW
Content-Disposition: attachment; filename=plugin.c.patch
Content-Type: text/x-patch; name=plugin.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- plugin.c.orig	2007-10-26 13:47:25.000000000 +0200
+++ plugin.c	2007-10-26 13:51:19.000000000 +0200
@@ -189,7 +189,8 @@ int init_plugins(void)
 		assert("nikita-3509", ptype->type_id == type_id);
 
 		INIT_LIST_HEAD(&ptype->plugins_list);
-/* NIKITA-FIXME-HANS: change builtin_num to some other name lacking the term builtin. */
+/* NIKITA-FIXME-HANS: change builtin_num to some other name lacking the term
+ * builtin. */
 		for (i = 0; i < ptype->builtin_num; ++i) {
 			reiser4_plugin *plugin;
 
@@ -266,7 +267,7 @@ reiser4_plugin *plugin_by_unsafe_id(reis
  * Puts id of @plugin in little endian format to address @area.
  */
 int save_plugin_id(reiser4_plugin *plugin /* plugin to convert */ ,
-		   d16 *area /* where to store result */ )
+		   d16 * area/* where to store result */)
 {
 	assert("nikita-1261", plugin != NULL);
 	assert("nikita-1262", area != NULL);
@@ -326,8 +327,7 @@ int grab_plugin_pset(struct inode *self,
 		parent = reiser4_inode_data(ancestor);
 		plug = aset_get(parent->hset, memb) ? :
 			aset_get(parent->pset, memb);
-	}
-	else
+	} else
 		plug = get_default_plugin(memb);
 
 	result = set_plugin(&info->pset, memb, plug);
@@ -374,7 +374,8 @@ int finish_pset(struct inode *inode)
 	return result;
 }
 
-int force_plugin_pset(struct inode *self, pset_member memb, reiser4_plugin * plug)
+int force_plugin_pset(struct inode *self, pset_member memb,
+		      reiser4_plugin * plug)
 {
 	reiser4_inode *info;
 	int result = 0;

--=-w/EsJlP0dqnKdw0kUPcW--

