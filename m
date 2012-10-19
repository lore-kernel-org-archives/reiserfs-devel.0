From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH 4/7] drop -fPIC usage
Date: Fri, 19 Oct 2012 01:49:09 -0400
Message-ID: <1350625752-24944-4-git-send-email-vapier@gentoo.org>
References: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

We don't create any libraries so there's no need to build with -fPIC.
Drop it all.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 configure.ac | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/configure.ac b/configure.ac
index 3822163..50e42f3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -50,14 +50,6 @@ AC_ARG_ENABLE(debug, [  --enable-debug          enable extra checks],
 	      enable_debug=no
 )
 
-dnl Check for the compiler pic option.
-AC_CACHE_CHECK([whether -fPIC works], [pic], [
-	saved_CPPFLAGS="$CPPFLAGS"
-	CPPFLAGS="-fPIC -DPIC"
-	AC_TRY_COMPILE(, , [pic=yes], [pic=no])
-	CPPFLAGS="$saved_CPPFLAGS"
-])
-
 # Checking for compiler warning options
 AC_CACHE_CHECK([whether -Wuninitialized works], [uninitialized], [
 	saved_CPPFLAGS="$CPPFLAGS"
@@ -149,10 +141,6 @@ else
 	fi
 fi
 
-if test x$pic = xyes; then
-	CFLAGS="$CFLAGS -fPIC -DPIC"
-fi
-
 AC_OUTPUT(
     include/Makefile 
     mkreiserfs/Makefile 
-- 
1.7.12

