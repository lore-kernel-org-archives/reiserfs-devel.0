From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: bad_unaligned_access_length in compiling reiserfsck for mips
Date: Wed, 2 Feb 2005 18:43:14 +0300
Message-ID: <200502021843.14873.vitaly@namesys.com>
References: <1107053632.4059.241.camel@troglodyte.asianpear>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107053632.4059.241.camel@troglodyte.asianpear>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kevin Turner <acapnotic@foobox.net>, ReiserFS list <reiserfs-list@namesys.com>

On Sunday 30 January 2005 05:53, Kevin Turner wrote:
> My cross-compile dies when it tries to link reiserfsck:
> check_tree.o(.text+0x3a80): In function `__put_unaligned':
> check_tree.c: undefined reference to `bad_unaligned_access_length'
>
> That error is from asm/unaligned.h, and is supposed to mean that someone
> tried to put_unaligned something that wasn't 1, 2, 4, or 8 bytes, but
> the code in check_tree.c looks to me like its using it with __u32, so
> I'm stumped.
>
> reiserfsprogs version: 3.6.19
> linux-libc-headers version: 2.6.8.1
>
> Host: linux-i686
> Target: linux-mipsel
> Compiler: gcc 3.3.4
> compilation flags:
>  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2

trying to reproduce it. 
what packages for mipsel cross compiling have you installed? 
probably some cross headers are needed also...

-- 
Thanks,
Vitaly Fertman

