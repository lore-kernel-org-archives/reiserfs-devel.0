From: Kevin Turner <kevin.m.turner@pobox.com>
Subject: Re: bad_unaligned_access_length in compiling reiserfsck for mips
Date: Tue, 01 Feb 2005 19:34:45 -0800
Message-ID: <1107315285.4059.449.camel@troglodyte.asianpear>
References: <1107053632.4059.241.camel@troglodyte.asianpear>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107053632.4059.241.camel@troglodyte.asianpear>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS list <reiserfs-list@namesys.com>

Just did another build with gcc 3.4.3, and it links without complaint.

> check_tree.o(.text+0x3a80): In function `__put_unaligned':
> check_tree.c: undefined reference to `bad_unaligned_access_length'
[...]
> reiserfsprogs version: 3.6.19
> linux-libc-headers version: 2.6.8.1

> Target: linux-mipsel
> Compiler: gcc 3.3.4
> compilation flags: 
>  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2

-- 
The moon is last quarter, 55.3% illuminated, 21.7 days old.

