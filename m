From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH 2/7] configure: update automake invocation
Date: Fri, 19 Oct 2012 01:49:07 -0400
Message-ID: <1350625752-24944-2-git-send-email-vapier@gentoo.org>
References: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

This converts away from the old/deprecated AM_INIT_AUTOMAKE method.

Also enable the nice silent build by default.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 configure.ac | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 54b2271..3822163 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,12 +1,13 @@
 dnl Process this file with autoconf to produce a configure script.
-AC_INIT(version.h)
+AC_INIT([reiserfsprogs], [3.6.22], [reiserfs-devel@vger.kernel.org])
 AC_CANONICAL_HOST
 AC_PREREQ(2.50)
 
 AH_TEMPLATE([HAVE_LIBUUID], [Define for enable libuuid using.])
 AH_TEMPLATE([ENABLE_DEBUG], [Define for enable debug info.])
 
-AM_INIT_AUTOMAKE(reiserfsprogs, 3.6.22)
+AM_INIT_AUTOMAKE([1.11.1 dist-xz silent-rules])
+AM_SILENT_RULES([yes])
 AM_MAINTAINER_MODE
 
 dnl We install in /sbin, the utils are to be available on boot
-- 
1.7.12

