From: Adrian Bunk <bunk@stusta.de>
Subject: 2.6.23-rc1-mm1: reiser4 <-> lzo compile error
Date: Wed, 25 Jul 2007 20:22:21 +0200
Message-ID: <20070725182221.GG3572@stusta.de>
References: <20070725040304.111550f4.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070725040304.111550f4.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

<--  snip  -->

...
  LD      .tmp_vmlinux1
lib/built-in.o: In function `lzo1x_1_compress':
(.text+0x13eae): multiple definition of `lzo1x_1_compress'
fs/built-in.o:(.text+0x117075): first defined here
make[1]: *** [.tmp_vmlinux1] Error 1

<--  snip  -->

AFAIR, we once had a patch in -mm changing reiser4 to use the
LZO code that is now in the kernel?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

