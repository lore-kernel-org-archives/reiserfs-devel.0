From: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Subject: [PATCH] make fs/reiser4/search.c compile with gcc 4.0
Date: Wed, 22 Sep 2004 20:45:55 +0200
Message-ID: <2f4958ff0409221145524aed7b@mail.gmail.com>
Reply-To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Here's full message, this is linux 2.6.9-rc2-mm1
 gcc -Wp,-MD,fs/reiser4/.search.o.d -nostdinc -iwithprefix include
-D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -O2 -fomit-frame-pointer
-Wdeclaration-after-statement -pipe -msoft-float
-mpreferred-stack-boundary=2 -fno-unit-at-a-time -march=pentium3
-Iinclude/asm-i386/mach-default -Wformat -Wundef -Wunused -Wcomment
-Wno-nested-externs -Wno-write-strings -Wno-sign-compare
-Wuninitialized   -DKBUILD_BASENAME=search -DKBUILD_MODNAME=reiser4 -c
-o fs/reiser4/.tmp_search.o fs/reiser4/search.c
fs/reiser4/search.c: In function 'cbk_node_lookup':
fs/reiser4/search.c:1111: error: invalid storage class for function 'key_is_ld'

gcc --version
gcc (GCC) 4.0.0 20040922 (experimental)
Copyright (C) 2004 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

I know gcc 4.0 is still in it's alphas.
Obvious solution is to move function declared in other function
up-wards. Since it's static anyway, it won't make any diffrence.
Please consider applying to repo.
Thanks.

-----

--- fs/reiser4/search.c    2004-09-22 20:38:04 +0200
+++ fs/reiser4/search.new.c        2004-09-22 20:37:26 +0200
@@ -1088,6 +1088,20 @@
 }
 #endif

+/* true if @key is left delimiting key of @node */
+static int key_is_ld(znode * node, const reiser4_key * key) {
+       int ld;
+
+        assert("nikita-1716", node != NULL);
+        assert("nikita-1758", key != NULL);
+
+        RLOCK_DK(znode_get_tree(node));
+        assert("nikita-1759", znode_contains_key(node, key));
+        ld = keyeq(znode_get_ld_key(node), key);
+        RUNLOCK_DK(znode_get_tree(node));
+        return ld;
+}
+
 /* Process one node during tree traversal.

    This is called by cbk_level_lookup(). */
@@ -1107,19 +1121,6 @@
        /* result */
        int result;

-       /* true if @key is left delimiting key of @node */
-       static int key_is_ld(znode * node, const reiser4_key * key) {
-               int ld;
-
-                assert("nikita-1716", node != NULL);
-                assert("nikita-1758", key != NULL);
-
-                RLOCK_DK(znode_get_tree(node));
-                assert("nikita-1759", znode_contains_key(node, key));
-                ld = keyeq(znode_get_ld_key(node), key);
-                RUNLOCK_DK(znode_get_tree(node));
-                return ld;
-       }
        assert("nikita-379", h != NULL);

        active = h->active_lh->node;


-- 
GJ
