From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/2] reiser4: unbroke
Date: Sat, 22 Nov 2008 13:14:54 +0300
Message-ID: <4927DB9E.1070904@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070006060308010009020706"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070006060308010009020706
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------070006060308010009020706
Content-Type: text/x-patch;
 name="reiser4-unbroke.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-unbroke.patch"

Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
---
 linux-2.6.28-rc2-mm1/fs/reiser4/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-2.6.28-rc2-mm1/fs/reiser4/Kconfig.orig
+++ linux-2.6.28-rc2-mm1/fs/reiser4/Kconfig
@@ -1,7 +1,6 @@
 config REISER4_FS
 	tristate "Reiser4 (EXPERIMENTAL)"
 	depends on EXPERIMENTAL
-	depends on BROKEN
 	select ZLIB_INFLATE
 	select ZLIB_DEFLATE
 	select LZO_COMPRESS

--------------070006060308010009020706--
