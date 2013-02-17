From: Jan Engelhardt <jengelh@inai.de>
Subject: [PATCH] build: resolve compile error in reiser4progs
Date: Sun, 17 Feb 2013 14:59:33 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1302171458580.24860@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

[   13s] node40.c: In function 'node40_lookup':
[   13s] node40.c:999:6: error: #elif with no expression

From: Jan Engelhardt <jengelh@inai.de>
Date: 2013-02-17 09:10:08.840707256 +0100
---
 plugin/node/node40/node40.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: reiser4progs-1.0.7/plugin/node/node40/node40.c
===================================================================
--- reiser4progs-1.0.7.orig/plugin/node/node40/node40.c
+++ reiser4progs-1.0.7/plugin/node/node40/node40.c
@@ -996,7 +996,7 @@ static lookup_t node40_lookup(reiser4_no
 	func = cb_comp_key3;
 #elif defined(ENABLE_LARGE_KEYS)
 	func = cb_comp_key4;
-#elif
+#else
 	func = NULL;
 #endif
 	
