From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH 6/7] clean up io-failure-emulation logic a bit
Date: Fri, 19 Oct 2012 01:49:11 -0400
Message-ID: <1350625752-24944-6-git-send-email-vapier@gentoo.org>
References: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Use standard autoconf macros rather than open coding the logic.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 configure.ac | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/configure.ac b/configure.ac
index 8f280a6..14d7563 100644
--- a/configure.ac
+++ b/configure.ac
@@ -98,12 +98,11 @@ fi
 
 dnl Never enable this. It is for debugging only
 AC_ARG_ENABLE(io-failure-emulation,
-[  --enable-io-failure-emulation      Never use that. It is for debugging only],
-[ if test "$enableval" = "yes" ; then
-    echo -e "\nCarefull! IO failure emulation is ON\n"
-    AC_DEFINE(IO_FAILURE_EMULATION, 1, [gets set when configure --enable-io-failure-emulation])
-  fi
-])
+	[AS_HELP_STRING([--enable-io-failure-emulation], [Never use this. It is for debugging only])])
+if test "$enable_io_failure_emulation" = "yes" ; then
+	AC_MSG_WARN([Careful! IO failure emulation is ON])
+	AC_DEFINE(IO_FAILURE_EMULATION, 1, [gets set when configure --enable-io-failure-emulation])
+fi
 
 if test "x$ac_cv_wno_unused_parameter_flag" = xyes; then
 	CFLAGS="$CFLAGS -Wno-unused-parameter"
-- 
1.7.12

