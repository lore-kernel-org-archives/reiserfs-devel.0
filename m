From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] configure: use AC_MSG_NOTICE rather than `echo`
Date: Sat, 17 Jan 2009 11:25:51 -0500
Message-ID: <1232209551-5088-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 configure.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure.in b/configure.in
index a3cc867..dd3e353 100644
--- a/configure.in
+++ b/configure.in
@@ -193,5 +193,6 @@ AC_OUTPUT(
     debugreiserfs/Makefile 
     tune/Makefile)
 
-echo
-echo Type \'make\' to compile reiserfsprogs
+AC_MSG_NOTICE([
+
+Type 'make' to compile reiserfsprogs])
-- 
1.6.1

