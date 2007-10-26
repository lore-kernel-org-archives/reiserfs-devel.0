From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 70/8] tail_policy.c cleanup
Date: Fri, 26 Oct 2007 15:26:39 +0200
Message-ID: <1193405199.4615.32.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-b4zb4liWVlXDDwp/XeeO"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-b4zb4liWVlXDDwp/XeeO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 3 errors, 2 warnings, 113 lines checked
patched:total: 0 errors, 1 warnings, 113 lines checked
leftovers:

WARNING: line over 80 characters
#98: FILE: tail_policy.c:98:
+                       .desc = "store files shorter than 4 blocks in
tail items",



--=-b4zb4liWVlXDDwp/XeeO
Content-Disposition: attachment; filename=tail_policy.c.patch
Content-Type: text/x-patch; name=tail_policy.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- tail_policy.c.orig	2007-10-26 15:25:09.000000000 +0200
+++ tail_policy.c	2007-10-26 15:23:43.000000000 +0200
@@ -35,7 +35,7 @@
 /* Audited by: green(2002.06.12) */
 static int have_formatting_never(const struct inode *inode UNUSED_ARG
 		      /* inode to operate on */ ,
-		      loff_t size UNUSED_ARG /* new object size */ )
+		      loff_t size UNUSED_ARG/* new object size */)
 {
 	return 0;
 }
@@ -45,17 +45,17 @@ static int have_formatting_never(const s
 static int
 have_formatting_always(const struct inode *inode UNUSED_ARG
 		       /* inode to operate on */ ,
-		       loff_t size UNUSED_ARG /* new object size */ )
+		       loff_t size UNUSED_ARG/* new object size */)
 {
 	return 1;
 }
 
-/* This function makes test if we should store file denoted @inode as tails only or
-   as extents only. */
+/* This function makes test if we should store file denoted @inode as tails only
+   or as extents only. */
 static int
 have_formatting_default(const struct inode *inode UNUSED_ARG
 			/* inode to operate on */ ,
-			loff_t size /* new object size */ )
+			loff_t size/* new object size */)
 {
 	assert("umka-1253", inode != NULL);
 

--=-b4zb4liWVlXDDwp/XeeO--

