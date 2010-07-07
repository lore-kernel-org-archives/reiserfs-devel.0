From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 6/6] reiser4: enable
Date: Wed, 07 Jul 2010 02:21:38 +0200
Message-ID: <4C33C892.8030609@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070802080205080604060408"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070802080205080604060408
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------070802080205080604060408
Content-Type: text/plain;
 name="reiser4-enable.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-enable.patch"

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
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

--------------070802080205080604060408--
