From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 09/10] reiserfscore: add support for
 register_printf_specifier
Date: Thu, 11 Oct 2012 14:29:47 -0400
Message-ID: <20121011200116.115CD200AB@oldboy.suse.de>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

register_printf_modifier is causing build warnings complaining that
it is deprecated. This patch adds support for register_printf_specifier
and uses it if it's present. Otherwise, it will fall back to
register_printf_modifier.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 configure.in          |    9 +++++--
 reiserfscore/prints.c |   70 ++++++++++++++++---------------------------------
 2 files changed, 30 insertions(+), 49 deletions(-)

diff --git a/configure.in b/configure.in
index dd3e353..5f172c2 100644
--- a/configure.in
+++ b/configure.in
@@ -104,8 +104,13 @@ AC_PROG_GCC_TRADITIONAL
 AC_FUNC_MEMCMP
 AC_FUNC_STRFTIME
 AC_FUNC_VPRINTF
-AC_CHECK_FUNCS(strerror strstr strtol register_printf_function statfs getmntent\
-	       hasmntopt memset time uname strptime ctime_r)
+AC_CHECK_FUNCS(strerror strstr strtol statfs getmntent hasmntopt memset time \
+	       uname strptime ctime_r register_printf_modifier \
+	       register_printf_specifier)
+
+if test -z "${ac_cv_func_register_printf_function}" -a -z "${ac_cv_func_register_printf_specifier}"; then
+	AC_MSG_ERROR(reiserfsprogs requires a method to add printf modifiers)
+fi
 
 
 dnl Never enable this. It is for debugging only
diff --git a/reiserfscore/prints.c b/reiserfscore/prints.c
index 95e3014..89dc26c 100644
--- a/reiserfscore/prints.c
+++ b/reiserfscore/prints.c
@@ -16,46 +16,22 @@
 #  include <uuid/uuid.h>
 #endif
 
-#define PA_KEY		(PA_LAST)
-#define PA_BUFFER_HEAD	(PA_LAST + 1)
-#define PA_ITEM_HEAD	(PA_LAST + 2)
-#define PA_DISK_CHILD	(PA_LAST + 3)
-
-
-static int _arginfo_b (const struct printf_info *info, size_t n, int *argtypes) {
-    if (n > 0)
-	argtypes[0] = PA_BUFFER_HEAD | PA_FLAG_PTR;
-    return 1;
-}
-
-static int _arginfo_K (const struct printf_info *info, size_t n, int *argtypes) {
-    if (n > 0)
-	argtypes[0] = PA_KEY | PA_FLAG_PTR;
-    return 1;
-}
-
-static int _arginfo_H (const struct printf_info *info, size_t n, int *argtypes) {
-    if (n > 0)
-	argtypes[0] = PA_ITEM_HEAD | PA_FLAG_PTR;
-    return 1;
-}
-
-static int _arginfo_y (const struct printf_info *info, size_t n, int *argtypes) {
-    if (n > 0)
-	argtypes[0] = PA_DISK_CHILD | PA_FLAG_PTR;
-    return 1;
-}
-
-static int _arginfo_M (const struct printf_info *info, size_t n, int *argtypes) {
-    if (n > 0)
-	argtypes[0] = PA_INT | PA_FLAG_SHORT | PA_FLAG_PTR;
-    return 1;
-}
-
-static int _arginfo_U (const struct printf_info *info, size_t n, int *argtypes) {
-    if (n > 0)
-	argtypes[0] = (PA_CHAR|PA_FLAG_PTR);
-    return 1;
+#ifndef HAVE_REGISTER_PRINTF_SPECIFIER
+#define register_printf_specifier(x, y, z) register_printf_function(x, y, z)
+static int arginfo_ptr (const struct printf_info *info, size_t n,
+			int *argtypes)
+#else
+static int arginfo_ptr (const struct printf_info *info, size_t n,
+			int *argtypes, int *size)
+#endif
+{
+	if (n > 0) {
+		argtypes[0] = PA_FLAG_PTR;
+#ifdef HAVE_REGISTER_PRINTF_SPECIFIER
+		size[0] = sizeof (void *);
+#endif
+	}
+	return 1;
 }
 
 #define FPRINTF \
@@ -224,13 +200,13 @@ void reiserfs_warning (FILE * fp, const char * fmt, ...)
     if (!registered) {
 	registered = 1;
 	
-	register_printf_function ('K', print_short_key, _arginfo_K);
-	register_printf_function ('k', print_key, _arginfo_K);
-	register_printf_function ('H', print_item_head, _arginfo_H);
-	register_printf_function ('b', print_block_head, _arginfo_b);
-	register_printf_function ('y', print_disk_child, _arginfo_y);
-	register_printf_function ('M', print_sd_mode, _arginfo_M);
-	register_printf_function ('U', print_sd_uuid, _arginfo_U);
+	register_printf_specifier ('K', print_short_key, arginfo_ptr);
+	register_printf_specifier ('k', print_key, arginfo_ptr);
+	register_printf_specifier ('H', print_item_head, arginfo_ptr);
+	register_printf_specifier ('b', print_block_head, arginfo_ptr);
+	register_printf_specifier ('y', print_disk_child, arginfo_ptr);
+	register_printf_specifier ('M', print_sd_mode, arginfo_ptr);
+	register_printf_specifier ('U', print_sd_uuid, arginfo_ptr);
     }
 
     va_start (args, fmt);
-- 
1.7.10.4


