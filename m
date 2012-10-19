From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH 5/7] clean up compiler flag handling
Date: Fri, 19 Oct 2012 01:49:10 -0400
Message-ID: <1350625752-24944-5-git-send-email-vapier@gentoo.org>
References: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

ENABLE_DEBUG isn't used anywhere, so punt it.

--enable-debug is only used to control whether to enable -W flags by
default.  But there's no harm just always doing that, so drop the
configure flag and enable the -W flags when they're available.

AC_CACHE_CHECK requires cache vars have "_cv_" in their name, so tweak
all the cache var names to include that.

That leaves us with the PRESET_CFLAGS logic which is pointless nowadays
as autoconf largely does the same thing for us.  It'll default to using
'-O2 -g -Wall' if the compiler supports it, so no need to do it.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 configure.ac | 56 +++++++++++++++++---------------------------------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/configure.ac b/configure.ac
index 50e42f3..8f280a6 100644
--- a/configure.ac
+++ b/configure.ac
@@ -4,7 +4,6 @@ AC_CANONICAL_HOST
 AC_PREREQ(2.50)
 
 AH_TEMPLATE([HAVE_LIBUUID], [Define for enable libuuid using.])
-AH_TEMPLATE([ENABLE_DEBUG], [Define for enable debug info.])
 
 AM_INIT_AUTOMAKE([1.11.1 dist-xz silent-rules])
 AM_SILENT_RULES([yes])
@@ -15,10 +14,6 @@ dnl AC_PREFIX(/)
 
 AM_CONFIG_HEADER(include/config.h)
 
-AC_SUBST(sbindir)
-
-PRESET_CFLAGS=$CFLAGS
-
 dnl Checks for programs.
 AC_PROG_CC
 AC_PROG_AWK 
@@ -45,30 +40,25 @@ AC_C_INLINE
 AC_TYPE_SIZE_T
 AC_STRUCT_ST_RDEV
 
-AC_ARG_ENABLE(debug, [  --enable-debug          enable extra checks], 
-	      enable_debug=yes,
-	      enable_debug=no
-)
-
 # Checking for compiler warning options
-AC_CACHE_CHECK([whether -Wuninitialized works], [uninitialized], [
+AC_CACHE_CHECK([whether -Wuninitialized works], [ac_cv_wuninitialized_flag], [
 	saved_CPPFLAGS="$CPPFLAGS"
 	CPPFLAGS="-O1 -Wuninitialized"
-	AC_TRY_COMPILE(, , [uninitialized=yes], [uninitialized=no])
+	AC_TRY_COMPILE(, , [ac_cv_wuninitialized_flag=yes], [ac_cv_wuninitialized_flag=no])
 	CPPFLAGS="$saved_CPPFLAGS"
 ])
 
-AC_CACHE_CHECK([whether -Wno-unused-parameter works], [no_unused_parameter], [
+AC_CACHE_CHECK([whether -Wno-unused-parameter works], [ac_cv_wno_unused_parameter_flag], [
 	saved_CPPFLAGS="$CPPFLAGS"
 	CPPFLAGS="-Wno-unused-parameter"
-	AC_TRY_COMPILE(, , [no_unused_parameter=yes], [no_unused_parameter=no])
+	AC_TRY_COMPILE(, , [ac_cv_wno_unused_parameter_flag=yes], [ac_cv_wno_unused_parameter_flag=no])
 	CPPFLAGS="$saved_CPPFLAGS"
-		])
+])
 
-AC_CACHE_CHECK([whether -Wredundant-decls works], [redundant_decls], [
+AC_CACHE_CHECK([whether -Wredundant-decls works], [ac_cv_wredundant_decls_flag], [
 	saved_CPPFLAGS="$CPPFLAGS"
 	CPPFLAGS="-Wredundant-decls"
-	AC_TRY_COMPILE(, , [redundant_decls=yes], [redundant_decls=no])
+	AC_TRY_COMPILE(, , [ac_cv_wredundant_decls_flag=yes], [ac_cv_wredundant_decls_flag=no])
 	CPPFLAGS="$saved_CPPFLAGS"
 ])
 
@@ -115,30 +105,18 @@ AC_ARG_ENABLE(io-failure-emulation,
   fi
 ])
 
-if test x$enable_debug = xyes; then
-	if test "x" = "x$PRESET_CFLAGS"; then
-		CFLAGS="-g -Wall"
-	fi
-	
-	if test x$no_unused_parameter = xyes; then
-		CFLAGS="$CFLAGS -Wno-unused-parameter"
-	else
-		CFLAGS="$CFLAGS -Wno-unused"
-	fi
+if test "x$ac_cv_wno_unused_parameter_flag" = xyes; then
+	CFLAGS="$CFLAGS -Wno-unused-parameter"
+else
+	CFLAGS="$CFLAGS -Wno-unused"
+fi
 	
-	if test x$redundant_decls = xyes; then
-		CFLAGS="$CFLAGS -Wredundant-decls"
-	fi
+if test "x$ac_cv_wredundant_decls_flag" = xyes; then
+	CFLAGS="$CFLAGS -Wredundant-decls"
+fi
 	
-	if test x$uninitialized = xyes; then
-		CFLAGS="$CFLAGS -Wuninitialized -O1"
-	else
-		CFLAGS="$CFLAGS -O2"
-	fi
-else
-	if test "x" = "x$PRESET_CFLAGS"; then
-		CFLAGS="-g -Wall -O2"
-	fi
+if test "x$ac_cv_wuninitialized_flag" = xyes; then
+	CFLAGS="$CFLAGS -Wuninitialized"
 fi
 
 AC_OUTPUT(
-- 
1.7.12

