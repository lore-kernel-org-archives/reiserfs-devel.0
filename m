From: Kevin Turner <acapnotic@foobox.net>
Subject: Re: bad_unaligned_access_length in compiling reiserfsck for mips
Date: Wed, 02 Feb 2005 13:55:49 -0800
Message-ID: <1107381349.4059.553.camel@troglodyte.asianpear>
References: <1107053632.4059.241.camel@troglodyte.asianpear>
	 <200502021843.14873.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502021843.14873.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS list <reiserfs-list@namesys.com>

On Wed, 2005-02-02 at 18:43 +0300, Vitaly Fertman wrote:
> > reiserfsprogs version: 3.6.19
> > linux-libc-headers version: 2.6.8.1
> >
> > Host: linux-i686
> > Target: linux-mipsel
> > Compiler: gcc 3.3.4
> > compilation flags:
> >  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
> 
> trying to reproduce it. 
> what packages for mipsel cross compiling have you installed?
> probably some cross headers are needed also...

My cross-compile toolchain was built with OpenEmbedded.  gcc 3.3.4,
binutils 2.14.90.0.7, uclibc 0.9.27, linux-libc-headers 2.6.8.1.  And as
I mentioned yesterday, it seems to not happen when using gcc 3.4.3
instead.

Thank you for looking in to it.

-- 
The moon is last quarter, 48.2% illuminated, 22.3 days old.

