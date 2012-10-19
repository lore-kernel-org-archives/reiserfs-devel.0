From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH 1/7] fix version number
Date: Fri, 19 Oct 2012 01:49:06 -0400
Message-ID: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

We're at 3.6.22 now, not 3.6.21.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 0473be1..54b2271 100644
--- a/configure.ac
+++ b/configure.ac
@@ -6,7 +6,7 @@ AC_PREREQ(2.50)
 AH_TEMPLATE([HAVE_LIBUUID], [Define for enable libuuid using.])
 AH_TEMPLATE([ENABLE_DEBUG], [Define for enable debug info.])
 
-AM_INIT_AUTOMAKE(reiserfsprogs, 3.6.21)
+AM_INIT_AUTOMAKE(reiserfsprogs, 3.6.22)
 AM_MAINTAINER_MODE
 
 dnl We install in /sbin, the utils are to be available on boot
-- 
1.7.12

