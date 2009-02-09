From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] dont run ldconfig when installing with DESTDIR
Date: Mon,  9 Feb 2009 13:20:24 -0500
Message-ID: <1234203624-19238-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 run-ldconfig |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/run-ldconfig b/run-ldconfig
index 227f126..e4b1b93 100755
--- a/run-ldconfig
+++ b/run-ldconfig
@@ -1,5 +1,10 @@
 #!/bin/bash
 
+if [ -n "$DESTDIR" ] ; then
+	echo "Skipping ldconfig due to installing into temp root (DESTDIR)"
+	exit 0
+fi
+
 ldc="";
 if [ -x /sbin/ldconfig ]; then 
 	ldc="/sbin/ldconfig"; 
-- 
1.6.1.2

