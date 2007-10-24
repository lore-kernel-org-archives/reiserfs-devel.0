From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 34/8] key.c cleanup
Date: Thu, 25 Oct 2007 01:31:07 +0200
Message-ID: <1193268667.24225.64.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-GkVBxbP2SNh7fcMH19JX"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-GkVBxbP2SNh7fcMH19JX
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 7 errors, 5 warnings, 137 lines checked
patched:total: 2 errors, 4 warnings, 138 lines checked
leftover:

I think that these two errors are false:

ERROR: need space after that ',' (ctx:VxB)
#18: FILE: key.c:18:
+               ON_LARGE_KEY(0ull,)
                                 ^

ERROR: need space after that ',' (ctx:VxB)
#29: FILE: key.c:29:
+               ON_LARGE_KEY(__constant_cpu_to_le64(~0ull),)
                                                          ^

WARNING: printk() should include KERN_ facility level
#81: FILE: key.c:81:
+               printk("%s: null key\n", prefix);

WARNING: printk() should include KERN_ facility level
#84: FILE: key.c:84:
+                       printk("%s: (%Lx:%x:%Lx:%Lx:%Lx:%Lx)", prefix,

WARNING: printk() should include KERN_ facility level
#118: FILE: key.c:118:
+                               printk("%s]\n", buf);

WARNING: printk() should include KERN_ facility level
#121: FILE: key.c:121:
+                       printk("[%s]\n", type_name(get_key_type(key)));



--=-GkVBxbP2SNh7fcMH19JX
Content-Disposition: attachment; filename=key.c.patch
Content-Type: text/x-patch; name=key.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- key.c.orig	2007-10-25 01:25:27.000000000 +0200
+++ key.c	2007-10-25 01:28:52.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
 
 /* Key manipulations. */
 
@@ -32,27 +33,27 @@ static const reiser4_key MAXIMAL_KEY = {
 };
 
 /* Initialize key. */
-void reiser4_key_init(reiser4_key * key /* key to init */ )
+void reiser4_key_init(reiser4_key * key/* key to init */)
 {
 	assert("nikita-1169", key != NULL);
 	memset(key, 0, sizeof *key);
 }
 
 /* minimal possible key in the tree. Return pointer to the static storage. */
-const reiser4_key *reiser4_min_key(void)
+const reiser4_key * reiser4_min_key(void)
 {
 	return &MINIMAL_KEY;
 }
 
 /* maximum possible key in the tree. Return pointer to the static storage. */
-const reiser4_key *reiser4_max_key(void)
+const reiser4_key * reiser4_max_key(void)
 {
 	return &MAXIMAL_KEY;
 }
 
 #if REISER4_DEBUG
 /* debugging aid: print symbolic name of key type */
-static const char *type_name(unsigned int key_type /* key type */ )
+static const char *type_name(unsigned int key_type/* key type */)
 {
 	switch (key_type) {
 	case KEY_FILE_NAME_MINOR:
@@ -72,7 +73,7 @@ static const char *type_name(unsigned in
 
 /* debugging aid: print human readable information about key */
 void reiser4_print_key(const char *prefix /* prefix to print */ ,
-	       const reiser4_key * key /* key to print */ )
+	       const reiser4_key * key/* key to print */)
 {
 	/* turn bold on */
 	/* printf ("\033[1m"); */

--=-GkVBxbP2SNh7fcMH19JX--

