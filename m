From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 72/8] plugin/plugin_header.h cleanup
Date: Fri, 26 Oct 2007 15:40:18 +0200
Message-ID: <1193406018.4615.41.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-K22gzeLSn3JNPqFblYAb"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-K22gzeLSn3JNPqFblYAb
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 4 errors, 6 warnings, 155 lines checked
patched:total: 0 errors, 4 warnings, 157 lines checked
leftovers:

WARNING: do not add new typedefs
#22: FILE: plugin_header.h:22:
+typedef enum {

WARNING: do not add new typedefs
#43: FILE: plugin_header.h:43:
+typedef enum {

WARNING: do not add new typedefs
#53: FILE: plugin_header.h:53:
+typedef struct reiser4_plugin_ops reiser4_plugin_ops;

WARNING: do not add new typedefs
#56: FILE: plugin_header.h:56:
+typedef struct plugin_header {




--=-K22gzeLSn3JNPqFblYAb
Content-Disposition: attachment; filename=plugin_header.h.patch
Content-Type: text/x-patch; name=plugin_header.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- plugin_header.h.orig	2007-10-26 15:36:11.000000000 +0200
+++ plugin_header.h	2007-10-26 15:38:05.000000000 +0200
@@ -2,7 +2,7 @@
 
 /* plugin header. Data structures required by all plugin types. */
 
-#if !defined( __PLUGIN_HEADER_H__ )
+#if !defined(__PLUGIN_HEADER_H__)
 #define __PLUGIN_HEADER_H__
 
 /* plugin data-types and constants */
@@ -34,7 +34,7 @@ typedef enum {
 	REISER4_CIPHER_PLUGIN_TYPE,           /* (F) cipher transform algs */
 	REISER4_DIGEST_PLUGIN_TYPE,           /* (F) digest transform algs */
 	REISER4_COMPRESSION_PLUGIN_TYPE,      /* (F) compression tfm algs */
- 	REISER4_COMPRESSION_MODE_PLUGIN_TYPE, /* (F) compression heuristic */
+	REISER4_COMPRESSION_MODE_PLUGIN_TYPE, /* (F) compression heuristic */
 	REISER4_CLUSTER_PLUGIN_TYPE,          /* (F) size of logical cluster */
 	REISER4_PLUGIN_TYPES
 } reiser4_plugin_type;
@@ -62,7 +62,8 @@ typedef struct plugin_header {
 	reiser4_plugin_groups groups;
 	/* plugin operations */
 	reiser4_plugin_ops *pops;
-/* NIKITA-FIXME-HANS: usage of and access to label and desc is not commented and defined. */
+/* NIKITA-FIXME-HANS: usage of and access to label and desc is not commented and
+ * defined. */
 	/* short label of this plugin */
 	const char *label;
 	/* descriptive string.. */
@@ -74,7 +75,8 @@ typedef struct plugin_header {
 #define plugin_of_group(plug, group) (plug->h.groups & (1 << group))
 
 /* PRIVATE INTERFACES */
-/* NIKITA-FIXME-HANS: what is this for and why does it duplicate what is in plugin_header? */
+/* NIKITA-FIXME-HANS: what is this for and why does it duplicate what is in
+ * plugin_header? */
 /* plugin type representation. */
 struct reiser4_plugin_type_data {
 	/* internal plugin type identifier. Should coincide with
@@ -100,7 +102,7 @@ extern struct reiser4_plugin_type_data p
 int is_plugin_type_valid(reiser4_plugin_type type);
 int is_plugin_id_valid(reiser4_plugin_type type, reiser4_plugin_id id);
 
-static inline reiser4_plugin *plugin_at(struct reiser4_plugin_type_data * ptype,
+static inline reiser4_plugin *plugin_at(struct reiser4_plugin_type_data *ptype,
 					int i)
 {
 	char *builtin;

--=-K22gzeLSn3JNPqFblYAb--

