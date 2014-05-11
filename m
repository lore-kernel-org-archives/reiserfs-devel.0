From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 1/2] configure.in: check for fallocate() and related headers.
Date: Sun, 11 May 2014 13:33:27 +0400
Message-ID: <1399800808-4855-2-git-send-email-intelfx100@gmail.com>
References: <1399800808-4855-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LQ+wIFpA6bC3DoqeJWvelq0LVNZMkTRhFasT1TIk9gA=;
        b=njnf9Eq8G0uXrRAEE+bXGOgh0iQJFRbfmPboRwKemS5b5IdVVGdqa9CYkmQihGD8Gg
         KTRmXLeXtKZVec2hzkRJGNc6k3CMsO8x0XGbtNepBkdF/h0h4BFbC7CGFz/70QjX2wPm
         YiXKXxJhcW8r6jVxMkhJZBB0yBwluQE6q6KVvOmojbqW3xldr72CCNiixSsx6kCHHuGC
         D7prAiWXgN1nPfegSbaQzx0mb2qieylo9va53sNWPrd95i8lYljqDDlbmlhGsSfpZLwJ
         6JFgALpljv7SDqgy6C5QJEeeYFq++sWpxJiW3KFVrCJNL68ZPJOWCPGDP+cSapXbxHV7
         5WLQ==
In-Reply-To: <1399800808-4855-1-git-send-email-intelfx100@gmail.com>
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

