From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Wed, 21 Apr 2004 12:55:41 +0400
Message-ID: <200404211255.41388.vitaly@namesys.com>
References: <200404201733.51809.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_NcjhAA2d/hsKqLV"
Return-path: <reiserfs-list-return-18103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404201733.51809.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com

--Boundary-00=_NcjhAA2d/hsKqLV
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello, 

would you try this patch, it should fix the problem,
email me about the result please.

> ***** Semantic Traverse Pass: reiser4 semantic tree checking.
> Error: Node (1444613), item (2): StatData of the file [2a:0:ffff] has the
> wrong bytes (0), Fixed to (188). Plugin (stat40).
>
> Looks good, but when I run "fsck.reiser4 /dev/sys/backup" again, it tells
> me that it has found 1 fixable corruption and that I need to run it with
> the --fix parameter...
> P.S. How about all these spelling errors in fsck's output? ;)

all spelling fixes are appreciated :)

-- 
Thanks,
Vitaly Fertman

--Boundary-00=_NcjhAA2d/hsKqLV
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4progs-0.5.3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4progs-0.5.3.patch"

diff -Nru a/librepair/repair.c b/librepair/repair.c
--- a/librepair/repair.c	Fri Apr  2 17:41:46 2004
+++ b/librepair/repair.c	Fri Apr  2 17:41:46 2004
@@ -617,7 +617,7 @@
 	
 	/* FIXME: This is oid40 specific fix, not correct. To be rewritten when
 	   shared oid handling will be realy. */
-	if (control->oid && control->oid != val) {
+	if (control->oid && control->oid > val) {
 		if (mode != RM_BUILD) {
 			aal_mess("First not used oid %llu is wrong. %s %llu.",
 				 val, mode == RM_CHECK ? "Sould be" : 
diff -Nru a/plugin/key/key_large/key_large.c b/plugin/key/key_large/key_large.c
--- a/plugin/key/key_large/key_large.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/key/key_large/key_large.c	Fri Apr  2 17:41:46 2004
@@ -207,12 +207,12 @@
 	if (key_large_get_type(key1) == KEY_FILENAME_TYPE)
 		return 0;
 
-	ord1 = key_large_get_ordering(key1);
-	ord2 = key_large_get_ordering(key2);
-	
 	/* Checking ordering. */
-	if ((res = aal_memcmp(&ord1, &ord2, sizeof(ord1))))
+	if ((res = kl_comp_el((key_large_t *)key1->body,
+			      (key_large_t *)key2->body, 1)))
+	{
 		return res;
+	}
 	
 	/* Checking objectid  */
 	return kl_comp_el((key_large_t *)key1->body,
@@ -295,9 +295,8 @@
 				   len - INLINE_CHARS);
 	}
 
-	ordering |= ((uint64_t)plug_call(fibre->o.fibre_ops, 
-					 build, name + INLINE_CHARS,
-					 len - INLINE_CHARS) << FIBRE_SHIFT);
+	ordering |= ((uint64_t)plug_call(fibre->o.fibre_ops, build, 
+					 name, len) << FIBRE_SHIFT);
 	
 	/* Setting up objectid and offset */
 	key_large_set_ordering(key, ordering);
diff -Nru a/plugin/key/key_short/key_short.c b/plugin/key/key_short/key_short.c
--- a/plugin/key/key_short/key_short.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/key/key_short/key_short.c	Fri Apr  2 17:41:46 2004
@@ -276,9 +276,8 @@
 				   len - OBJECTID_CHARS);
 	}
 	
-	objectid |= ((uint64_t)plug_call(fibre->o.fibre_ops, 
-					 build, name + OBJECTID_CHARS,
-					 len - OBJECTID_CHARS) << FIBRE_SHIFT);
+	objectid |= ((uint64_t)plug_call(fibre->o.fibre_ops, build, 
+					 name, len) << FIBRE_SHIFT);
 	
 	/* Objectid must occupie 60 bits. If it takes more, then we have broken
 	   key, or objectid allocator reached this value, that impossible in
diff -Nru a/plugin/object/dir40/dir40.c b/plugin/object/dir40/dir40.c
--- a/plugin/object/dir40/dir40.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/dir40/dir40.c	Fri Apr  2 17:41:46 2004
@@ -464,7 +476,6 @@
 {
 	rid_t pid;
 	dir40_t *dir;
-	uint64_t mask;
 	entry_hint_t entry;
 	trans_hint_t body_hint;
 	reiser4_plug_t *body_plug;
@@ -556,9 +567,7 @@
 	}
 
 	/* Create stat data item. */
-	mask = (1 << SDEXT_UNIX_ID | 1 << SDEXT_LW_ID);
-	
-	if (obj40_create_stat(&dir->obj, hint->label.statdata, mask,
+	if (obj40_create_stat(&dir->obj, hint->label.statdata, 
 			      1, body_hint.len, 0, 1, S_IFDIR, NULL))
 	{
 	
diff -Nru a/plugin/object/dir40/dir40_repair.c b/plugin/object/dir40/dir40_repair.c
--- a/plugin/object/dir40/dir40_repair.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/dir40/dir40_repair.c	Fri Apr  2 17:41:46 2004
@@ -7,7 +7,11 @@
 #include "dir40.h"
 #include "repair/plugin.h"
 
-#define dir40_exts ((uint64_t)1 << SDEXT_LW_ID)
+/* Set of extentions that must present. */
+#define DIR40_EXTS_MUST ((uint64_t)1 << SDEXT_LW_ID)
+
+/* Set of unknown extentions. */
+#define DIR40_EXTS_UNKN ((uint64_t)1 << SDEXT_SYMLINK_ID)
 
 static errno_t dir40_extensions(reiser4_place_t *stat) {
 	uint64_t extmask;
@@ -15,12 +19,11 @@
 	extmask = obj40_extmask(stat);
 	
 	/* Check that there is no one unknown extension. */
-	/*
-	if (extmask & ~(dir40_exts | 1 << SDEXT_PLUG_ID))
+	if (extmask & DIR40_EXTS_UNKN)
 		return RE_FATAL;
-	*/
+	
 	/* Check that LW and UNIX extensions exist. */
-	return ((extmask & dir40_exts) == dir40_exts) ? 0 : RE_FATAL;
+	return ((extmask & DIR40_EXTS_MUST) == DIR40_EXTS_MUST) ? 0 : RE_FATAL;
 }
 
 /* Check SD extensions and that mode in LW extension is DIRFILE. */
@@ -153,8 +156,7 @@
 	
 	info = &dir->obj.info;
 	
-	if ((res = obj40_launch_stat(&dir->obj, NULL, dir40_exts, 1, 
-				     S_IFDIR, mode)))
+	if ((res = obj40_launch_stat(&dir->obj, NULL, 1, S_IFDIR, mode)))
 		return res;
 	
 	/* Try to register SD as an item of this file. */
diff -Nru a/plugin/object/obj40/obj40.c b/plugin/object/obj40/obj40.c
--- a/plugin/object/obj40/obj40.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/obj40/obj40.c	Fri Apr  2 17:41:46 2004
@@ -189,9 +189,9 @@
 
 /* Create stat data item basing on passed extensions @mask, @size, @bytes,
    @nlinks, @mode and @path for symlinks. Returns error or zero for success. */
-errno_t obj40_create_stat(obj40_t *obj, rid_t pid, uint64_t mask,
-			  uint64_t size, uint64_t bytes, uint64_t rdev,
-			  uint32_t nlink, uint16_t mode, char *path)
+errno_t obj40_create_stat(obj40_t *obj, rid_t pid, uint64_t size, 
+			  uint64_t bytes, uint64_t rdev, uint32_t nlink, 
+			  uint16_t mode, char *path)
 {
 	int64_t res;
 	lookup_t lookup;
@@ -218,7 +218,7 @@
 		  &hint.offset, &obj->info.object);
     
 	/* Initializing stat data item hint. */
-	stat.extmask = mask;
+	stat.extmask = (1 << SDEXT_UNIX_ID | 1 << SDEXT_LW_ID);
     	
 	/* Light weight hint initializing. */
 	lw_ext.size = size;
@@ -247,8 +247,10 @@
 	stat.ext[SDEXT_LW_ID] = &lw_ext;
 	stat.ext[SDEXT_UNIX_ID] = &unix_ext;
 
-	if ((1 << SDEXT_SYMLINK_ID) & mask)
+	if (path) {
+		stat.extmask |= (1 << SDEXT_SYMLINK_ID);
 		stat.ext[SDEXT_SYMLINK_ID] = path;
+	}
 	
 	hint.specific = &stat;
 
diff -Nru a/plugin/object/obj40/obj40.h b/plugin/object/obj40/obj40.h
--- a/plugin/object/obj40/obj40.h	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/obj40/obj40.h	Fri Apr  2 17:41:46 2004
@@ -130,14 +130,12 @@
 
 #ifndef ENABLE_STAND_ALONE
 extern errno_t obj40_create_stat(obj40_t *obj, rid_t pid,
-				 uint64_t mask, uint64_t size,
-				 uint64_t bytes, uint64_t rdev,
-				 uint32_t nlink, uint16_t mode,
-				 char *path);
+				 uint64_t size, uint64_t bytes, 
+				 uint64_t rdev, uint32_t nlink, 
+				 uint16_t mode, char *path);
 
 extern errno_t obj40_launch_stat(obj40_t *obj, stat_func_t stat_func, 
-				 uint64_t mask, uint32_t nlink, 
-				 uint16_t objmode, uint8_t mode);
+				 uint32_t nlink, uint16_t objmode, uint8_t mode);
 
 extern errno_t obj40_check_stat(obj40_t *obj, nlink_func_t nlink_func,
 				mode_func_t mode_func, size_func_t size_func,
diff -Nru a/plugin/object/obj40/obj40_repair.c b/plugin/object/obj40/obj40_repair.c
--- a/plugin/object/obj40/obj40_repair.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/obj40/obj40_repair.c	Fri Apr  2 17:41:46 2004
@@ -6,6 +6,7 @@
 #ifndef ENABLE_STAND_ALONE
 #include "obj40.h"
 #include <repair/plugin.h>
+#include <sys/stat.h>
 
 /* Obtains the plugin of the type @type from SD if stored there, otherwise
    obtains the default one from the params. This differs from obj40_plug as it
@@ -60,13 +61,10 @@
 	if (info->start.plug->id.group != STATDATA_ITEM)
 		return RE_FATAL;
 	
-	/* Is @info->start SD of the wanted file? If some fields are broken, 
-	   like offset != 0, fix it at check_struct time. */
-	if (info->object.plug->o.key_ops->compshort(&info->object, 
-						    &info->start.key))
-	{
+	/* Compare the correct key with the place key. */
+	if (plug_call(info->object.plug->o.key_ops, compfull,
+		      &info->object, &info->start.key))
 		return RE_FATAL;
-	}
 	
 	/* Some SD is recognized. Check that this is our SD. */
 	return stat_func ? stat_func(&info->start) : 0;
@@ -79,48 +77,28 @@
 	reiser4_key_t key;
 
 	aal_assert("vpf-1121", obj->info.tree != NULL);
-	aal_assert("vpf-1127", obj->info.object.plug || obj->info.start.plug);
+	aal_assert("vpf-1127", obj->info.object.plug != NULL);
 	
 	info = &obj->info;
 	
-	if (info->object.plug) {
-		locality = plug_call(info->object.plug->o.key_ops,
-				     get_locality, &info->object);
-
-		objectid = plug_call(info->object.plug->o.key_ops,
-				     get_objectid, &info->object);
-
-		ordering = plug_call(info->object.plug->o.key_ops,
-				     get_ordering, &info->object);
-
-	
-		plug_call(info->object.plug->o.key_ops, build_generic, &key,
-			  KEY_STATDATA_TYPE, locality, ordering, objectid, 0);
-		
-		/* Realizing on the key: SD is not found. Check if the key 
-		   pointer is correct. */
-		if (plug_call(info->object.plug->o.key_ops, compfull, 
-			      &key, &info->object))
-			return RE_FATAL;
-	} else {
-		/* Realizing on the SD. */
-		aal_assert("vpf-1204",  info->start.plug->id.group == 
-			   		STATDATA_ITEM);
-
-		locality = plug_call(info->object.plug->o.key_ops,
-				     get_locality, &info->start.key);
-
-		objectid = plug_call(info->object.plug->o.key_ops,
-				     get_objectid, &info->start.key);
-
-		ordering = plug_call(info->object.plug->o.key_ops,
-				     get_ordering, &info->start.key);
-
-		/* Build the SD key into @info->object. */
-		plug_call(info->start.key.plug->o.key_ops, build_generic, 
-			  &info->object, KEY_STATDATA_TYPE, locality, 
-			  ordering, objectid, 0);
-	}
+	/* Check if the key pointer is correct and then check the found item 
+	   if it is SD with the proper key. */
+	locality = plug_call(info->object.plug->o.key_ops,
+			     get_locality, &info->object);
+
+	objectid = plug_call(info->object.plug->o.key_ops,
+			     get_objectid, &info->object);
+
+	ordering = plug_call(info->object.plug->o.key_ops,
+			     get_ordering, &info->object);
+
+	plug_call(info->object.plug->o.key_ops, build_generic, &key,
+		  KEY_STATDATA_TYPE, locality, ordering, objectid, 0);
+
+	/* Compare the correct key with the search one. */
+	if (plug_call(info->object.plug->o.key_ops, compfull, 
+		      &key, &info->object))
+		return RE_FATAL;
 	
 	/* @info->object is the key of SD for now and @info->start is the 
 	   result of tree lookup by @info->object -- skip objects w/out SD. */
@@ -255,8 +233,7 @@
 }
 
 errno_t obj40_launch_stat(obj40_t *obj, stat_func_t stat_func, 
-			  uint64_t mask, uint32_t nlink, 
-			  uint16_t objmode, uint8_t mode)
+			  uint32_t nlink, uint16_t objmode, uint8_t mode)
 {
 	reiser4_key_t *key;
 	lookup_t lookup;
@@ -309,8 +286,8 @@
 	if ((pid = obj->core->param_ops.value("statdata") == INVAL_PID))
 		return -EINVAL;
 
-	if ((res = obj40_create_stat(obj, pid, mask, 0, 0,
-				     0, nlink, objmode, NULL)))
+	if ((res = obj40_create_stat(obj, pid, 0, 0, 0, nlink, objmode, 
+				     objmode == S_IFLNK ? "FAKE_LINK" : NULL)))
 	{
 		aal_error("The file [%s] failed to create a "
 			  "StatData item. Plugin %s.", 
diff -Nru a/plugin/object/reg40/reg40.c b/plugin/object/reg40/reg40.c
--- a/plugin/object/reg40/reg40.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/reg40/reg40.c	Fri Apr  2 17:41:46 2004
@@ -195,7 +195,6 @@
 				     object_hint_t *hint)
 {
 	reg40_t *reg;
-	uint64_t mask;
 	
 	aal_assert("umka-1169", info != NULL);
 	aal_assert("umka-1738", hint != NULL);
@@ -229,12 +228,9 @@
 		goto error_free_reg;
 	}
 
-	/* Create stat data item with size, bytes, nlinks equal to zero and mask
-	   equal to @mask. */
-	mask = (1 << SDEXT_UNIX_ID | 1 << SDEXT_LW_ID);
-
+	/* Create stat data item with size, bytes, nlinks equal to zero. */
 	if (obj40_create_stat(&reg->obj, hint->label.statdata,
-			      mask, 0, 0, 0, 0, S_IFREG, NULL))
+			      0, 0, 0, 0, S_IFREG, NULL))
 	{
 		goto error_free_reg;
 	}
diff -Nru a/plugin/object/reg40/reg40_repair.c b/plugin/object/reg40/reg40_repair.c
--- a/plugin/object/reg40/reg40_repair.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/reg40/reg40_repair.c	Fri Apr  2 17:41:46 2004
@@ -7,7 +7,11 @@
 #include "reg40.h"
 #include "repair/plugin.h"
 
-#define reg40_exts ((uint64_t)1 << SDEXT_LW_ID)
+/* Set of extentions that must present. */
+#define REG40_EXTS_MUST ((uint64_t)1 << SDEXT_LW_ID)
+
+/* Set of unknown extentions. */
+#define REG40_EXTS_UNKN ((uint64_t)1 << SDEXT_SYMLINK_ID)
 
 static errno_t reg40_extensions(reiser4_place_t *stat) {
 	uint64_t extmask;
@@ -15,12 +19,12 @@
 	/* Check that there is no one unknown extension. */
 	extmask = obj40_extmask(stat);
 	
-	/*
-	if (extmask & ~(reg40_exts | 1 << SDEXT_PLUG_ID))
+	/* Check that there is no one unknown extension. */
+	if (extmask & REG40_EXTS_UNKN)
 		return RE_FATAL;
-	*/
+
 	/* Check that LW and UNIX extensions exist. */
-	return ((extmask & reg40_exts) == reg40_exts) ? 0 : RE_FATAL;
+	return ((extmask & REG40_EXTS_MUST) == REG40_EXTS_MUST) ? 0 : RE_FATAL;
 }
 
 /* Check SD extensions and that mode in LW extension is REGFILE. */
@@ -389,18 +393,12 @@
 	info = &reg->obj.info;
 	
 	if ((res = obj40_launch_stat(&reg->obj, callback_stat, 
-				     reg40_exts, 1, S_IFREG, mode)))
-	{
+				     1, S_IFREG, mode)))
 		return res;
-	}
 
 	/* Try to register SD as an item of this file. */
 	if (func && func(&info->start, data))
 		return -EINVAL;
-	
-	/* Fix SD's key if differs. */
-	if ((res = obj40_fix_key(&reg->obj, &info->start, &info->object, mode)))
-		return res;
 	
 	/* Get the reg file tail policy. */
 	if (!(reg->policy = obj40_plug(&reg->obj, POLICY_PLUG_TYPE, "policy")))
diff -Nru a/plugin/object/spl40/spl40.c b/plugin/object/spl40/spl40.c
--- a/plugin/object/spl40/spl40.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/spl40/spl40.c	Fri Apr  2 17:41:46 2004
@@ -61,7 +61,6 @@
 				     object_hint_t *hint)
 {
 	spl40_t *spl;
-	uint64_t mask;
 	
 	aal_assert("umka-2531", info != NULL);
 	aal_assert("umka-2533", hint != NULL);
@@ -73,10 +72,8 @@
 	/* Inizializes file handle */
 	obj40_init(&spl->obj, &spl40_plug, spl40_core, info);
 
-	mask = (1 << SDEXT_UNIX_ID | 1 << SDEXT_LW_ID);
-	
 	if (obj40_create_stat(&spl->obj, hint->label.statdata,
-			      mask, 0, 0, hint->body.spl.rdev,
+			      0, 0, hint->body.spl.rdev,
 			      0, hint->label.mode, NULL))
 	{
 		goto error_free_spl;
diff -Nru a/plugin/object/spl40/spl40_repair.c b/plugin/object/spl40/spl40_repair.c
--- a/plugin/object/spl40/spl40_repair.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/spl40/spl40_repair.c	Fri Apr  2 17:41:46 2004
@@ -7,7 +7,11 @@
 #include "spl40.h"
 #include "repair/plugin.h"
 
-#define spl40_exts ((uint64_t)1 << SDEXT_LW_ID)
+/* Set of extentions that must present. */
+#define SPL40_EXTS_MUST ((uint64_t)1 << SDEXT_LW_ID)
+
+/* Set of unknown extentions. */
+#define SPL40_EXTS_UNKN ((uint64_t)1 << SDEXT_SYMLINK_ID)
 
 static errno_t spl40_extensions(reiser4_place_t *stat) {
 	uint64_t extmask;
@@ -15,12 +19,11 @@
 	extmask = obj40_extmask(stat);
 	
 	/* Check that there is no one unknown extension. */
-	/*
-	if (extmask & ~(sym40_exts | 1 << SDEXT_PLUG_ID))
+	if (extmask & SPL40_EXTS_UNKN)
 		return RE_FATAL;
-	*/
+	
 	/* Check that LW and UNIX extensions exist. */
-	return ((extmask & spl40_exts) == spl40_exts) ? 0 : RE_FATAL;
+	return ((extmask & SPL40_EXTS_MUST) == SPL40_EXTS_MUST) ? 0 : RE_FATAL;
 }
 
 /* Check SD extensions and that mode in LW extension is DIRFILE. */
@@ -90,8 +93,7 @@
 	aal_assert("vpf-1358", spl->obj.info.tree != NULL);
 	aal_assert("vpf-1359", spl->obj.info.object.plug != NULL);
 
-	if ((res = obj40_launch_stat(&spl->obj, spl40_extensions, 
-				     0, 1, 0, mode)))
+	if ((res = obj40_launch_stat(&spl->obj, spl40_extensions, 1, 0, mode)))
 		return res;
 	
 	/* Try to register SD as an item of this file. */
diff -Nru a/plugin/object/sym40/sym40.c b/plugin/object/sym40/sym40.c
--- a/plugin/object/sym40/sym40.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/sym40/sym40.c	Fri Apr  2 17:41:46 2004
@@ -89,7 +89,6 @@
 {
 	sym40_t *sym;
 	uint32_t len;
-	uint64_t mask;
 	
 	aal_assert("umka-1741", info != NULL);
 	aal_assert("vpf-1094",  info->tree != NULL);
@@ -101,14 +100,10 @@
 	/* Inizializes symlink file handle. */
 	obj40_init(&sym->obj, &sym40_plug, sym40_core, info);
 
-	/* Initializing stat data extensions mask */
-	mask = (1 << SDEXT_UNIX_ID | 1 << SDEXT_LW_ID |
-		1 << SDEXT_SYMLINK_ID);
-
 	len = aal_strlen(hint->body.sym);
 
 	/* Create symlink sta data item. */
-	if (obj40_create_stat(&sym->obj, hint->label.statdata, mask,
+	if (obj40_create_stat(&sym->obj, hint->label.statdata,
 			      len, len, 0, 0, S_IFLNK, hint->body.sym))
 	{
 		goto error_free_sym;
diff -Nru a/plugin/object/sym40/sym40_repair.c b/plugin/object/sym40/sym40_repair.c
--- a/plugin/object/sym40/sym40_repair.c	Fri Apr  2 17:41:46 2004
+++ b/plugin/object/sym40/sym40_repair.c	Fri Apr  2 17:41:46 2004
@@ -8,20 +8,15 @@
 #include "sym40.h"
 #include "repair/plugin.h"
 
-#define sym40_exts ((uint64_t)1 << SDEXT_LW_ID | 1 << SDEXT_SYMLINK_ID)
+#define SYM40_EXTS_MUST ((uint64_t)1 << SDEXT_LW_ID | 1 << SDEXT_SYMLINK_ID)
 
 static errno_t sym40_extensions(reiser4_place_t *stat) {
 	uint64_t extmask;
 	
 	extmask = obj40_extmask(stat);
 	
-	/* Check that there is no one unknown extension. */
-	/*
-	if (extmask & ~(sym40_exts | 1 << SDEXT_PLUG_ID))
-		return RE_FATAL;
-	*/
 	/* Check that LW, UNIX and SYMLINK extensions exist. */
-	return ((extmask & sym40_exts) == sym40_exts) ? 0 : RE_FATAL;
+	return ((extmask & SYM40_EXTS_MUST) == SYM40_EXTS_MUST) ? 0 : RE_FATAL;
 }
 
 /* Check SD extensions and that mode in LW extension is DIRFILE. */
@@ -92,7 +87,7 @@
 	place = STAT_PLACE(&sym->obj);
 	
 	if ((res = obj40_launch_stat(&sym->obj, sym40_extensions, 
-				     sym40_exts, 1, S_IFLNK, mode)))
+				     1, S_IFLNK, mode)))
 		return res;
 	
 	/* Try to register SD as an item of this file. */

--Boundary-00=_NcjhAA2d/hsKqLV--

