From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfsprogs: remove dependency on asm/unaligned.h
Date: Fri, 25 Jan 2008 11:00:27 -0500
Message-ID: <479A079B.5000309@suse.com>
References: <20080124200226.606635000@suse.com> <4799C193.8010502@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4799C193.8010502@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

 We probably shouldn't have ever been including asm/unaligned.h, though I
 think I'm the one who might've added it there in the first place.

 This patch borrows the unaligned accessor functions from the 3.6.20 code.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 include/reiserfs_fs.h |   20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

--- a/include/reiserfs_fs.h	2008-01-25 10:49:50.000000000 -0500
+++ b/include/reiserfs_fs.h	2008-01-25 10:54:05.000000000 -0500
@@ -38,14 +38,22 @@
 # define extern_inline
 #endif
 
-#include <asm/unaligned.h>
-
 #ifndef get_unaligned
-#if defined(__ppc__) || defined(ppc) || defined(__ppc) || \
-    defined(__PPC) || defined(powerpc) || defined(__powerpc__)
-#	define get_unaligned(ptr)	(*(ptr))
-#	define put_unaligned(val,ptr)	((void)(*(ptr) = (val)))
+#define get_unaligned(ptr)				\
+({							\
+        __typeof__(*(ptr)) __tmp;			\
+        memcpy(&__tmp, (ptr), sizeof(*(ptr)));		\
+        __tmp;						\
+})
 #endif
+
+#ifndef put_unaligned
+#define put_unaligned(val, ptr)				\
+({							\
+        __typeof__(*(ptr)) __tmp = (val);		\
+        memcpy((ptr), &__tmp, sizeof(*(ptr)));		\
+        (void)0;					\
+})
 #endif
 
 #define get_leXX(xx,p,field)	(le##xx##_to_cpu ((p)->field))

-- 
Jeff Mahoney
SUSE Labs

