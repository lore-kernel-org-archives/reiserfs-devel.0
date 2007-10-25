From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 49/8] seal.c
Date: Thu, 25 Oct 2007 16:33:54 +0200
Message-ID: <1193322834.15901.54.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-gYpfOGs1Km1IqlGuv7bb"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-gYpfOGs1Km1IqlGuv7bb
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 17 errors, 0 warnings, 218 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-gYpfOGs1Km1IqlGuv7bb
Content-Disposition: attachment; filename=seal.c.patch
Content-Type: text/x-patch; name=seal.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- seal.c.orig	2007-10-25 16:28:33.000000000 +0200
+++ seal.c	2007-10-25 16:32:04.000000000 +0200
@@ -43,13 +43,13 @@
 #include "znode.h"
 #include "super.h"
 
-static znode *seal_node(const seal_t * seal);
-static int seal_matches(const seal_t * seal, znode * node);
+static znode *seal_node(const seal_t *seal);
+static int seal_matches(const seal_t *seal, znode * node);
 
 /* initialise seal. This can be called several times on the same seal. @coord
    and @key can be NULL.  */
-void reiser4_seal_init(seal_t * seal /* seal to initialise */ ,
-		       const coord_t * coord /* coord @seal will be
+void reiser4_seal_init(seal_t *seal /* seal to initialise */ ,
+		       const coord_t *coord /* coord @seal will be
 					      *	attached to */ ,
 		       const reiser4_key * key UNUSED_ARG /* key @seal will be
 							   * attached to */ )
@@ -75,14 +75,14 @@ void reiser4_seal_init(seal_t * seal /* 
 }
 
 /* finish with seal */
-void reiser4_seal_done(seal_t * seal /* seal to clear */ )
+void reiser4_seal_done(seal_t *seal/* seal to clear */)
 {
 	assert("nikita-1887", seal != NULL);
 	seal->version = 0;
 }
 
 /* true if seal was initialised */
-int reiser4_seal_is_set(const seal_t * seal /* seal to query */ )
+int reiser4_seal_is_set(const seal_t *seal/* seal to query */)
 {
 	assert("nikita-1890", seal != NULL);
 	return seal->version != 0;
@@ -92,8 +92,8 @@ int reiser4_seal_is_set(const seal_t * s
 /* helper function for reiser4_seal_validate(). It checks that item at @coord
  * has expected key. This is to detect cases where node was modified but wasn't
  * marked dirty. */
-static inline int check_seal_match(const coord_t * coord /* coord to check */ ,
-				   const reiser4_key * k /* expected key */ )
+static inline int check_seal_match(const coord_t *coord /* coord to check */ ,
+				   const reiser4_key * k/* expected key */)
 {
 	reiser4_key ukey;
 
@@ -131,12 +131,12 @@ static int should_repeat(int return_code
    case, but this would complicate callers logic.
 
 */
-int reiser4_seal_validate(seal_t * seal /* seal to validate */,
-			  coord_t * coord /* coord to validate against */,
+int reiser4_seal_validate(seal_t *seal /* seal to validate */,
+			  coord_t *coord /* coord to validate against */,
 			  const reiser4_key * key /* key to validate against */,
 			  lock_handle * lh /* resulting lock handle */,
 			  znode_lock_mode mode /* lock node */,
-			  znode_lock_request request /* locking priority */)
+			  znode_lock_request request/* locking priority */)
 {
 	znode *node;
 	int result;
@@ -185,15 +185,15 @@ int reiser4_seal_validate(seal_t * seal 
 /* helpers functions */
 
 /* obtain reference to znode seal points to, if in cache */
-static znode *seal_node(const seal_t * seal /* seal to query */ )
+static znode *seal_node(const seal_t *seal/* seal to query */)
 {
 	assert("nikita-1891", seal != NULL);
 	return zlook(current_tree, &seal->block);
 }
 
 /* true if @seal version and @node version coincide */
-static int seal_matches(const seal_t * seal /* seal to check */ ,
-			znode * node /* node to check */ )
+static int seal_matches(const seal_t *seal /* seal to check */ ,
+			znode * node/* node to check */)
 {
 	int result;
 

--=-gYpfOGs1Km1IqlGuv7bb--

