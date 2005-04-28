From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: grub reiser4 won't compile
Date: Thu, 28 Apr 2005 16:06:41 +0400
Message-ID: <200504281606.42243.vitaly@namesys.com>
References: <200504272226.48234.c_wakefield@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200504272226.48234.c_wakefield@shaw.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Chris Wakefield <c_wakefield@shaw.ca>

On Thursday 28 April 2005 09:26, Chris Wakefield wrote:
> Greetings all.
> 
> I'm attempting to setup Reiser4 on a partition and I've got as far as trying 
> to compiling grub and I've run into a wall.
> 
> It's a Reiser4 patched grub source from:
> ftp://ftp.namesys.com/pub/reiser4progs/grub/LATEST_PATCH

so is it reiser4 patched grub from LATEST_GRUB or 
the reiser4 grub patch from LATEST_PATCH?

> anyways, I run configure and I get:
> 
> "....checking build system type... x86_64-unknown-linux-gnu
> checking host system type... x86_64-unknown-linux-gnu...
> 
> .........................
> 
> ........"checking for C compiler default output file name... configure: error: 
> C compiler cannot create executables".
> 
> config log error is:
> ......."configure:2416: $? = 1
> configure: failed program was: | /* confdefs.h.  */" ......
> 
> This is happening only with reiser4 grub, as I'm able to compile kernels and 
> who knows what else .. it's just this source only.
> Do I require a different source or do I have to compile reiser4 grub in a 32 
> bit chroot environment?

what does the plain grub-0.96 without reiser4 patch say?

-- 
Thanks,
Vitaly Fertman
