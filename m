From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 39/8] oid.c cleanup
Date: Thu, 25 Oct 2007 12:05:29 +0200
Message-ID: <1193306729.15901.13.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-rEjpUMXT0OE4cDDDpXgr"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-rEjpUMXT0OE4cDDDpXgr
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 2 errors, 0 warnings, 141 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-rEjpUMXT0OE4cDDDpXgr
Content-Disposition: attachment; filename=oid.c.patch
Content-Type: text/x-patch; name=oid.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- oid.c.orig	2007-10-25 12:03:10.000000000 +0200
+++ oid.c	2007-10-25 12:04:23.000000000 +0200
@@ -29,7 +29,7 @@ int oid_init_allocator(struct super_bloc
  * allocate oid and return it. ABSOLUTE_MAX_OID is returned when allocator
  * runs out of oids.
  */
-oid_t oid_allocate(struct super_block * super)
+oid_t oid_allocate(struct super_block *super)
 {
 	reiser4_super_info_data *sbinfo;
 	oid_t oid;
@@ -66,7 +66,7 @@ int oid_release(struct super_block *supe
  * without actually allocating it. This is used by disk format plugin to save
  * oid allocator state on the disk.
  */
-oid_t oid_next(const struct super_block * super)
+oid_t oid_next(const struct super_block *super)
 {
 	reiser4_super_info_data *sbinfo;
 	oid_t oid;

--=-rEjpUMXT0OE4cDDDpXgr--

