From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 4/4] reiser4: unbroken
Date: Fri, 13 Feb 2009 14:57:02 +0300
Message-ID: <18837.24590.462070.797648@edward.zelnet.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
---
 fs/reiser4/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- mmotm.orig/fs/reiser4/Kconfig
+++ mmotm/fs/reiser4/Kconfig
@@ -1,7 +1,6 @@
 config REISER4_FS
 	tristate "Reiser4 (EXPERIMENTAL)"
 	depends on EXPERIMENTAL
-	depends on BROKEN
 	select ZLIB_INFLATE
 	select ZLIB_DEFLATE
 	select LZO_COMPRESS
