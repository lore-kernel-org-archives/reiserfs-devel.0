From: Christian Kujau <lists@nerdbynature.de>
Subject: [PATCH 2/2] libaal: Fix compilation warnings
Date: Mon, 10 Oct 2016 19:46:46 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.16.1610101945280.17634@trent.utfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Fixes the following compilation warnings (seen with gcc 4.9.2-10 from 
Debian/stable):

* cc1: warning: -malign-functions is obsolete, use -falign-functions
* cc1: warning: -malign-jumps is obsolete, use -falign-jumps
* cc1: warning: -malign-loops is obsolete, use -falign-loops

The following warnings were not fixed, but may require attention:

 debug.c:44:8: warning: unused parameter ‘hint’ [-Wunused-parameter]
 debug.c:45:8: warning: unused parameter ‘file’ [-Wunused-parameter]
 debug.c:46:6: warning: unused parameter ‘line’ [-Wunused-parameter]
 debug.c:47:8: warning: unused parameter ‘func’ [-Wunused-parameter]
 debug.c:48:8: warning: unused parameter ‘text’ [-Wunused-parameter]
 debug.c:70:8: warning: unused parameter ‘hint’ [-Wunused-parameter]
 debug.c:71:6: warning: unused parameter ‘cond’ [-Wunused-parameter]
 debug.c:72:8: warning: unused parameter ‘text’ [-Wunused-parameter]
 debug.c:73:8: warning: unused parameter ‘file’ [-Wunused-parameter]
 debug.c:74:6: warning: unused parameter ‘line’ [-Wunused-parameter]
 debug.c:75:8: warning: unused parameter ‘func’ [-Wunused-parameter]
 file.c:61:11: warning: unused parameter ‘blksize’ [-Wunused-parameter]
 malloc.c:160:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 malloc.c:201:25: warning: unused parameter ‘start’ [-Wunused-parameter]
 malloc.c:201:41: warning: unused parameter ‘len’ [-Wunused-parameter]

Signed-off-by: Christian Kujau <lists@nerdbynature.de>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 5d7a7a2..f1ea67c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -124,7 +124,7 @@ AC_CACHE_CHECK([whether -Wredundant-decls works], [redundant_decls_cv_], [
 if test "x$falign_loop_flag" = xyes; then
   ALIGN_FLAGS="-falign-jumps=1 -falign-loops=1 -falign-functions=1 -falign-labels=1 -fomit-frame-pointer -fno-inline -fstrength-reduce"
 else
-  ALIGN_FLAGS="-malign-jumps=1 -malign-loops=1 -malign-functions=1"
+  ALIGN_FLAGS="-falign-jumps=1 -falign-loops=1 -falign-functions=1"
 fi
 
 CFLAGS=""
-- 
2.1.4

