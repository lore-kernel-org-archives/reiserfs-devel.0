From: Edward Shishkin <edward@namesys.com>
Subject: Re: 2.6.23-rc1-mm1: reiser4 <-> lzo compile error
Date: Wed, 25 Jul 2007 22:44:09 +0400
Message-ID: <46A799F9.5050806@namesys.com>
References: <20070725040304.111550f4.akpm@linux-foundation.org> <20070725182221.GG3572@stusta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20070725182221.GG3572@stusta.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Bunk <bunk@stusta.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Adrian Bunk wrote:

><--  snip  -->
>
>...
>  LD      .tmp_vmlinux1
>lib/built-in.o: In function `lzo1x_1_compress':
>(.text+0x13eae): multiple definition of `lzo1x_1_compress'
>fs/built-in.o:(.text+0x117075): first defined here
>make[1]: *** [.tmp_vmlinux1] Error 1
>
><--  snip  -->
>
>AFAIR, we once had a patch in -mm changing reiser4 to use the
>LZO code that is now in the kernel?
>  
>

Yup, I'll take a look..

>cu
>Adrian
>
>  
>

