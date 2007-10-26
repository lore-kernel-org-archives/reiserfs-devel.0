From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 71/8]
Date: Fri, 26 Oct 2007 15:32:20 +0200
Message-ID: <1193405540.4615.37.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-MJU2kRlOslbT/yLkQEpg"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser4 <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward@namesys.com>


--=-MJU2kRlOslbT/yLkQEpg
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 4 errors, 0 warnings, 379 lines checked
patched:total: 2 errors, 0 warnings, 380 lines checked
leftover:

ERROR: Use of SPIN_LOCK_UNLOCKED is deprecated: see
Documentation/spinlocks.txt
#37: FILE: plugin_set.c:37:
+       [0 ... 7] = SPIN_LOCK_UNLOCKED

ERROR: Macros with complex values should be enclosed in parenthesis
#293: FILE: plugin_set.c:293:
+       reiser4_plugin_type PREFIX##_member_to_type_unsafe(pset_member
memb)   \




--=-MJU2kRlOslbT/yLkQEpg
Content-Disposition: attachment; filename=plugin_set.c.patch
Content-Type: text/x-patch; name=plugin_set.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- plugin_set.c.orig	2007-10-26 15:27:20.000000000 +0200
+++ plugin_set.c	2007-10-26 15:30:48.000000000 +0200
@@ -92,7 +92,7 @@ static inline int pseq(const unsigned lo
 
 #define HASH_FIELD(hash, set, field)		\
 ({						\
-        (hash) += (unsigned long)(set)->field >> 2;	\
+	(hash) += (unsigned long)(set)->field >> 2;	\
 })
 
 static inline unsigned long calculate_hash(const plugin_set * set)
@@ -324,7 +324,8 @@ reiser4_plugin *PREFIX##_get(plugin_set 
 
 DEFINE_PSET_OPS(aset);
 
-int set_plugin(plugin_set ** set, pset_member memb, reiser4_plugin * plugin) {
+int set_plugin(plugin_set ** set, pset_member memb, reiser4_plugin * plugin)
+{
 	return plugin_set_field(set,
 		(unsigned long)plugin, pset_descr[memb].offset);
 }

--=-MJU2kRlOslbT/yLkQEpg--

