From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCH 1/2] configure.in: check for fallocate() and related headers.
Date: Thu,  8 May 2014 23:13:23 +0400
Message-ID: <1399576404-5527-2-git-send-email-intelfx100@gmail.com>
References: <1399576404-5527-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LQ+wIFpA6bC3DoqeJWvelq0LVNZMkTRhFasT1TIk9gA=;
        b=zjAmvFk+cydZU3++RwzgLE+JwyaZIsIjVCb2GO8UMl+BTYjhXpvfusfFEnENj2+6O2
         w/QQoG9/WKRnfKwxkeflC5Oc8a79s29oFOl4M7RnAxWeAKqE8O28IVmk67heFwCL6/bA
         BnBp7cSCxrfyRq24dIW8MShdVj6/MDGsNXMfhWDVmMXH5+wX80k4fKRnIcKygeT48m2i
         d2hdoEf+C2kZqodfWdfqvl7ts/cvLNSTGy9HKLAT7TCqT/3uikV1WQiaz8Vg5g7OpmD5
         786yOvmOP/LaZU+6HWAOmaTuiOo+DLU1KP4qn7FsFgz+3W0PvnG/IHwpzHqaGyIngaA8
         jT4A==
In-Reply-To: <1399576404-5527-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 configure.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.in b/configure.in
index 69bc954..470c728 100644
--- a/configure.in
+++ b/configure.in
@@ -72,7 +72,7 @@ AC_PROG_CC
 
 # Checks for header files.
 AC_HEADER_STDC
-AC_CHECK_HEADERS([errno.h fcntl.h stdlib.h string.h sys/ioctl.h unistd.h])
+AC_CHECK_HEADERS([errno.h fcntl.h stdlib.h string.h sys/ioctl.h unistd.h linux/falloc.h linux/types.h])
 
 AC_C_BIGENDIAN
 
@@ -86,7 +86,7 @@ AC_STRUCT_TM
 AC_PROG_GCC_TRADITIONAL
 AC_FUNC_MEMCMP
 AC_HEADER_STDC
-AC_CHECK_FUNCS([memmove memset strchr strerror strpbrk strrchr])
+AC_CHECK_FUNCS([memmove memset strchr strerror strpbrk strrchr fallocate])
 
 # The options -falign-* are supported by gcc 3.0 or later.
 # Probably it is sufficient to only check for -falign-loops.
-- 
1.9.2

