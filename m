From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: status of grub reiser4 support ?
Date: Tue, 16 Mar 2004 16:55:38 +0300
Message-ID: <200403161654.48374.vitaly@namesys.com>
References: <405597B6.1000906@free.fr> <4056DD84.2010107@free.fr> <4056E32D.5010405@free.fr>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_adwVAshepn/SpeV"
Return-path: <reiserfs-list-return-17245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4056E32D.5010405@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vince <fuzzy77@free.fr>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--Boundary-00=_adwVAshepn/SpeV
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 16 March 2004 14:21, Vince wrote:
> More information follows:
> > Hi,
> >
> > with your latest patches, grub can now read reiser4 partitions (both
> > from linux and from the bios) but:
> > 1) any attempt to load a kernel image sitting on a reiser4 partition
> > just hangs
>
> grub> kernel (hd1,0)/boot/vmlinuz-2.6.4-bk5
> Program received signal SIGSEGV, Segmentation fault.
> 0x0806408f in extent40_offset (place=0x4007aba0, pos=4294967295) at
> extent40.c:41
> 41                      blocks += et40_get_width(extent);
> (gdb) bt
> #0  0x0806408f in extent40_offset (place=0x4007aba0, pos=4294967295) at
> extent40.c:41
> #1  0x0806922d in body40_get_key (place=0x4007aba0, pos=4294967295,
> key=0x4007aac0, trans_func=0x8064062 <extent40_offset>)
>      at body40.c:20
> #2  0x080640e9 in extent40_fetch_key (place=0x4007aba0, key=0x4007aac0)

thank you for hitting this, I have attached the updated patch for reiser4progs.
it should cure for the problem, email me about your results please.



--Boundary-00=_adwVAshepn/SpeV
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4_alone1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="reiser4_alone1.patch"

diff -Nru a/libreiser4/tree.c b/libreiser4/tree.c
--- a/libreiser4/tree.c	Tue Mar 16 16:50:54 2004
+++ b/libreiser4/tree.c	Tue Mar 16 16:50:54 2004
@@ -271,6 +271,9 @@
 	return -EINVAL;
 
 out_correct_place:
+#else
+	if (reiser4_place_fetch(place))
+		return -EINVAL;
 #endif
 	if (reiser4_item_units(place) == 1)
 		place->pos.unit = MAX_UINT32;
diff -Nru a/plugin/item/extent40/extent40.c b/plugin/item/extent40/extent40.c
--- a/plugin/item/extent40/extent40.c	Tue Mar 16 16:50:54 2004
+++ b/plugin/item/extent40/extent40.c	Tue Mar 16 16:50:54 2004
@@ -112,6 +112,10 @@
 
 	pos = place->pos.unit;
 	units = extent40_units(place);
+	
+	/* Check for unit pos. */
+	if (pos == MAX_UINT32)
+		pos = 0;
 
 	aal_assert("umka-3026",
 		   pos + hint->count <= units);
@@ -181,7 +185,6 @@
 	aal_assert("umka-2458", place != NULL);
 	aal_assert("umka-2461", hint != NULL);
 
-
 	hint->len = 0;
 	hint->bytes = 0;
 	hint->overhead = 0;
@@ -507,13 +510,14 @@
 	buff = hint->specific;
 	count = (uint32_t)hint->count;
 	
+	if (place->pos.unit == MAX_UINT32)
+		place->pos.unit = 0;
+	
 	extent40_fetch_key(place, &key);
 	
 	blksize = extent40_blksize(place);
 	secsize = extent40_secsize(place);
 
-	if (place->pos.unit == MAX_UINT32)
-		place->pos.unit = 0;
 
 	read_offset = plug_call(hint->offset.plug->o.key_ops,
 				get_offset, &hint->offset);
@@ -600,7 +604,8 @@
 	aal_assert("umka-2435", hint != NULL);
 	aal_assert("umka-2434", place != NULL);
 	
-	pos = place->pos.unit;
+	pos = place->pos.unit == MAX_UINT32 ? 0 : place->pos.unit;
+
 	extent = extent40_body(place) + pos;
 	ptr_hint = (ptr_hint_t *)hint->specific;
 
@@ -698,8 +703,7 @@
 	aal_assert("umka-2431", hint != NULL);
 	aal_assert("umka-2430", place != NULL);
 	
-	if ((pos = place->pos.unit) == MAX_UINT32)
-		pos = 0;
+	pos = place->pos.unit == MAX_UINT32 ? 0 : place->pos.unit;
 	
 	extent = extent40_body(place) + pos;
 	ptr_hint = (ptr_hint_t *)hint->specific;
diff -Nru a/plugin/key/key_large/key_large.c b/plugin/key/key_large/key_large.c
--- a/plugin/key/key_large/key_large.c	Tue Mar 16 16:50:54 2004
+++ b/plugin/key/key_large/key_large.c	Tue Mar 16 16:50:54 2004
@@ -186,7 +186,6 @@
 	aal_memset(key->body, 0, sizeof(key->body));
 }
 
-#ifndef ENABLE_STAND_ALONE
 /* Figures out if items are of one file or not. */
 static int key_large_compshort(reiser4_key_t *key1, 
 			       reiser4_key_t *key2) 
@@ -219,7 +218,6 @@
 	return kl_comp_el((key_large_t *)key1->body,
 			  (key_large_t *)key2->body, 2);
 }
-#endif
 
 static int key_large_compraw(void *key1, void *key2) {
 	int res;
@@ -386,11 +384,8 @@
 	.bodysize	= key_lage_bodysize,
 	.compraw	= key_large_compraw,
 	.compfull	= key_large_compfull,
-
-#ifndef ENABLE_STAND_ALONE
 	.compshort	= key_large_compshort,
-#endif
-		
+
 	.build_hashed   = key_large_build_hashed,
 	.build_generic  = key_large_build_generic,
 	
diff -Nru a/plugin/key/key_short/key_short.c b/plugin/key/key_short/key_short.c
--- a/plugin/key/key_short/key_short.c	Tue Mar 16 16:50:54 2004
+++ b/plugin/key/key_short/key_short.c	Tue Mar 16 16:50:54 2004
@@ -179,7 +179,6 @@
 	aal_memset(key->body, 0, sizeof(key->body));
 }
 
-#ifndef ENABLE_STAND_ALONE
 /* Compares two first components of the pased keys (locality and objectid) */
 static int key_short_compshort(reiser4_key_t *key1, 
 			       reiser4_key_t *key2) 
@@ -206,7 +205,6 @@
 	/* Checking object id */
 	return aal_memcmp(&oid1, &oid2, sizeof(oid1));
 }
-#endif
 
 /* Compares two passed key bodies. */
 static int key_short_compraw(void *key1, void *key2) {
@@ -368,10 +366,7 @@
 	.bodysize	= key_short_bodysize,
 	.compfull	= key_short_compfull,
 	.compraw	= key_short_compraw,
-
-#ifndef ENABLE_STAND_ALONE
 	.compshort	= key_short_compshort,
-#endif
 		
 	.build_hashed   = key_short_build_hashed,
 	.build_generic  = key_short_build_generic,
diff -Nru a/plugin/object/obj40/obj40.c b/plugin/object/obj40/obj40.c
--- a/plugin/object/obj40/obj40.c	Tue Mar 16 16:50:54 2004
+++ b/plugin/object/obj40/obj40.c	Tue Mar 16 16:50:54 2004
@@ -598,6 +598,9 @@
 #else
 		if (type == HASH_PLUG_TYPE)
 			pid = HASH_R5_ID;
+		
+		if (type == FIBRE_PLUG_TYPE)
+			pid = FIBRE_DOT_O_ID;
 #endif
 	}
 	

--Boundary-00=_adwVAshepn/SpeV--

