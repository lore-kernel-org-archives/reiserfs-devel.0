From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 518] Reiserfs: Add missing #include <linux/sched.h>
Date: Sun, 31 Oct 2004 11:03:41 +0100
Message-ID: <200410311003.i9VA3fGx009709@anakin.of.borg>
Return-path: <reiserfs-list-return-22229-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>, Andrew Morton <akpm@osdl.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com, Geert Uytterhoeven <geert@linux-m68k.org>

Reiserfs: Add missing #include <linux/sched.h>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

--- linux-2.6.10-rc1/include/linux/reiserfs_fs.h	2004-10-23 10:33:38.000000000 +0200
+++ linux-m68k-2.6.10-rc1/include/linux/reiserfs_fs.h	2004-10-24 16:42:45.000000000 +0200
@@ -16,6 +16,7 @@
 #ifdef __KERNEL__
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/sched.h>
 #include <linux/workqueue.h>
 #include <asm/unaligned.h>
 #include <linux/bitops.h>

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
