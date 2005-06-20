From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: hard hang with reiser4-for-2.6.11-5 and VMware Workstation 5.0
Date: Mon, 20 Jun 2005 15:36:53 +0400
Message-ID: <1119267412.4394.84.camel@tribesman.namesys.com>
References: <20050617170514.23193.qmail@web53908.mail.yahoo.com>
	 <42B308C0.4050807@namesys.com> <20050618102940.GP11013@nysv.org>
	 <200506181756.49623.vitaly@namesys.com>  <20050618143630.GR11013@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-sxhtEr3hpKIePvIfuB5J"
Return-path: <reiserfs-list-return-24421-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050618143630.GR11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>, scott <scottfk@yahoo.com>

--=-sxhtEr3hpKIePvIfuB5J
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: base64

SGVsbG8KCk9uIFNhdCwgMjAwNS0wNi0xOCBhdCAxODozNiwgTWFya3VzIFT2cm5xdmlzdCB3cm90
ZToKPiBPbiBTYXQsIEp1biAxOCwgMjAwNSBhdCAwNTo1Njo0OVBNICswNDAwLCBWaXRhbHkgRmVy
dG1hbiB3cm90ZToKPiA+PiBTbywgZXJobSwgY2FuIHdlIGV4cGVjdCBhIHNtb290aCB0cmFuc2l0
aW9uIGhlcmU/Cj4gPnllcywgdGhlIHBhdGNoIGlzIGJlaW5nIHRlc3RlZC4KPiAKPiBmc2NrIHBh
dGNoPwo+IAp5ZXMsIGhlcmUgaXMgaXQgYWdhaW5zdCByZWlzZXI0cHJvZ3MtMS4wLjQuCg==

--=-sxhtEr3hpKIePvIfuB5J
Content-Disposition: attachment; filename=reiser4progs.pset.patch
Content-Type: text/plain; name=reiser4progs.pset.patch; charset=koi8-r
Content-Transfer-Encoding: 7bit

===== include/reiser4/plugin.h 1.739 vs edited =====
--- 1.739/include/reiser4/plugin.h	2005-01-30 15:57:02 +03:00
+++ edited/include/reiser4/plugin.h	2005-06-18 16:53:14 +04:00
@@ -285,20 +285,23 @@ enum reiser4_opset_id {
 	OPSET_DIRITEM		= 0x7,
 	OPSET_CRYPTO		= 0x8,
 	OPSET_DIGEST		= 0x9,
-	OPSET_COMPRES		= 0xa,
+	OPSET_CPRESS		= 0xa,
+	OPSET_CPRESS_MODE	= 0xb,
+	OPSET_CLUSTER		= 0xc,
+	OPSET_REGULAR		= 0xd,
 	
-	OPSET_STORE_LAST        = (OPSET_COMPRES + 1),
+	OPSET_STORE_LAST,
 	
 	/* These are not stored on disk in the current implementation. */
-	OPSET_CREATE		= 0xb,
-	OPSET_MKDIR		= 0xc,
-	OPSET_SYMLINK		= 0xd,
-	OPSET_MKNODE		= 0xe,
+	OPSET_CREATE		= OPSET_STORE_LAST + 1,
+	OPSET_MKDIR		= OPSET_STORE_LAST + 2,
+	OPSET_SYMLINK		= OPSET_STORE_LAST + 3,
+	OPSET_MKNODE		= OPSET_STORE_LAST + 4,
 	
 #ifndef ENABLE_MINIMAL
-	OPSET_TAIL		= 0xf,
-	OPSET_EXTENT		= 0x10,
-	OPSET_ACL		= 0x11,
+	OPSET_TAIL		= OPSET_STORE_LAST + 5,
+	OPSET_EXTENT		= OPSET_STORE_LAST + 6,
+	OPSET_ACL		= OPSET_STORE_LAST + 7,
 #endif
 	OPSET_LAST
 };
===== libreiser4/pset.c 1.19 vs edited =====
--- 1.19/libreiser4/pset.c	2004-11-24 12:09:22 +03:00
+++ edited/libreiser4/pset.c	2005-06-18 17:00:27 +04:00
@@ -111,7 +111,7 @@ opset_member_t opset_prof[OPSET_LAST] = 
 		.ess = 1,
 #endif
 	},
-	[OPSET_COMPRES] = {
+	[OPSET_CPRESS] = {
 		.type = INVAL_TYPE,
 #ifndef ENABLE_MINIMAL
 		.group = INVAL_PID,
@@ -119,7 +119,31 @@ opset_member_t opset_prof[OPSET_LAST] = 
 		.ess = 1,
 #endif
 	},
-	
+	[OPSET_CPRESS_MODE] = {
+		.type = INVAL_TYPE,
+#ifndef ENABLE_MINIMAL
+		.group = INVAL_PID,
+		.prof = INVAL_PID,
+		.ess = 1,
+#endif
+	},
+	[OPSET_CLUSTER] = {
+		.type = INVAL_TYPE,
+#ifndef ENABLE_MINIMAL
+		.group = INVAL_PID,
+		.prof = INVAL_PID,
+		.ess = 1,
+#endif
+	},
+	[OPSET_REGULAR] = {
+		.type = INVAL_TYPE,
+#ifndef ENABLE_MINIMAL
+		.group = INVAL_PID,
+		.prof = INVAL_PID,
+		.ess = 1,
+#endif
+	},
+
 	/* Note, plugins below are not stored on-disk. */
 
 	/* The 4 plugins below needs to be splited -- for now they are used for
===== plugin/sdext/sdext_plug/sdext_plug_repair.c 1.10 vs edited =====
--- 1.10/plugin/sdext/sdext_plug/sdext_plug_repair.c	2004-09-22 18:21:08 +04:00
+++ edited/plugin/sdext/sdext_plug/sdext_plug_repair.c	2005-06-18 17:00:16 +04:00
@@ -22,7 +22,10 @@ char *opset_name[OPSET_STORE_LAST] = {
 	[OPSET_DIRITEM] = "diritem",
 	[OPSET_CRYPTO] =  "crypto",
 	[OPSET_DIGEST] =  "digest",
-	[OPSET_COMPRES] = "compress"
+	[OPSET_CPRESS] =  "compress",
+	[OPSET_CPRESS_MODE] = "compress mode",
+	[OPSET_CLUSTER] = "cluster",
+	[OPSET_REGULAR] =  "regular"
 };
 
 errno_t sdext_plug_check_struct(stat_entity_t *stat, repair_hint_t *hint) {

--=-sxhtEr3hpKIePvIfuB5J--

