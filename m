From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 50/8] seal.h cleanup
Date: Thu, 25 Oct 2007 16:37:58 +0200
Message-ID: <1193323078.15901.59.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-lpAy749VSYE/PAo4L7nv"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-lpAy749VSYE/PAo4L7nv
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 1 errors, 1 warnings, 49 lines checked
patched:total: 0 errors, 1 warnings, 49 lines checked
leftover:

WARNING: do not add new typedefs
#18: FILE: seal.h:18:
+typedef struct seal_s {



--=-lpAy749VSYE/PAo4L7nv
Content-Disposition: attachment; filename=seal.h.patch
Content-Type: text/x-patch; name=seal.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- seal.h.orig	2007-10-25 16:35:16.000000000 +0200
+++ seal.h	2007-10-25 16:35:58.000000000 +0200
@@ -32,7 +32,7 @@ extern void reiser4_seal_init(seal_t *, 
 extern void reiser4_seal_done(seal_t *);
 extern int reiser4_seal_is_set(const seal_t *);
 extern int reiser4_seal_validate(seal_t *, coord_t *,
-			 const reiser4_key *, lock_handle *,
+			 const reiser4_key *, lock_handle * ,
 			 znode_lock_mode mode, znode_lock_request request);
 
 /* __SEAL_H__ */

--=-lpAy749VSYE/PAo4L7nv--

