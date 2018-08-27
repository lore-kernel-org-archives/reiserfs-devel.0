From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] reiserfs: remove workaround code for GCC 3.x
Date: Mon, 27 Aug 2018 11:33:50 +0900
Message-ID: <1535337230-13222-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com w7R2YWB9016286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1535337273;
        bh=sd2nww59g4iiI+YHeknbbkbjmb8vxLHOPeYSzpWtCtk=;
        h=From:To:Cc:Subject:Date:From;
        b=JSMj8KGwKXG79dbeBnw+45Aev4/IJW5Qve4++gLwLnyYeHObeTerfmMUi07fmXWQt
         vEt0bqO5c+Aw8MP1mWaX3OLL0v8Ih/0mPiQmF5MZtyChXczGKz6/f3BwBdxRKvGl4k
         A//LiBn6/hUZYR4hd0HZHqnkOGcKGw6Bw/Ry1rwNXS63ae/hXko0PdtxAGNdhFHYrw
         4wTRJzch/5GxhP2LfLRPM1/EebJ+OyzW4X4QxgEiKy1m3vQvOXzid2hSFrvBsDFOTU
         FyAWYTRr+IjfyIwLY0WOlZRsQqx0uwGox4iwpFZ3WgxYCcwvxUjfiHZD6oWg0tDg3y
         fikq9HkIXzL9w==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
bumped the minimum GCC version to 4.6 for all architectures.

The workaround code in fs/reiserfs/Makefile is obsolete now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 fs/reiserfs/Makefile | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/fs/reiserfs/Makefile b/fs/reiserfs/Makefile
index a39a562..bd29c58 100644
--- a/fs/reiserfs/Makefile
+++ b/fs/reiserfs/Makefile
@@ -26,14 +26,5 @@ ifeq ($(CONFIG_REISERFS_FS_POSIX_ACL),y)
 reiserfs-objs += xattr_acl.o
 endif
 
-# gcc -O2 (the kernel default)  is overaggressive on ppc32 when many inline
-# functions are used.  This causes the compiler to advance the stack
-# pointer out of the available stack space, corrupting kernel space,
-# and causing a panic. Since this behavior only affects ppc32, this ifeq
-# will work around it. If any other architecture displays this behavior,
-# add it here.
-ccflags-$(CONFIG_PPC32) := $(call cc-ifversion, -lt, 0400, -O1)
-
 TAGS:
 	etags *.c
-
-- 
2.7.4

