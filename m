From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiser4 documentation
Date: Wed, 24 Mar 2004 17:14:38 +0300
Message-ID: <200403241713.36112.vitaly@namesys.com>
References: <BAY99-F42DjFbUcOV1E00010e2a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAY99-F42DjFbUcOV1E00010e2a@hotmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ionita ioan <ionut0007@hotmail.com>, reiserfs-list@namesys.com

Hello,

On Wednesday 24 March 2004 08:39, ionita ioan wrote:
> Hello,
> After looking at some of the benchmarks for the new Reiser4, I was very
> excited and decided to try it out. I followed all the steps to patch the
> kernel, install libaal 0.5.0 (with stand-alone and memory-manager both
> enabled), reiser4progs-0.5.2 (with stand-alone and symlinks both enabled),
> made the reiser4 partition, was able to mount it and use it,  then decided
> to try to boot from it.  I got the latest version of grub (0.94), applied
> the latest reiser4 patch for grub-0.94 configured with --enable-reiser4,
> and found out that the reiser4 stage files had not been built.  After a
> little inquiry, with my limited knowledge, found out that after the
> configuration, the generated config.h had undef for aal-alone and
> reiser4-alone library and the makefiles contained no instructions for
> building the reiser4 files. Both libaal-alone and libreiser4-alone exist in
> /usr/lib and i have issued ldconfig repeatedly. I attempted to build
> grub-0.93 with the reiser4 patch from the snapshots page. Again, no reiser4
> stage files were created. I am frustrated with the lack of documentation
> concerning reiser4 bootloader support. I believe that the burden lies on
> the reiser4 developers at this point, and not the bootloader coders, as
> long as reiser4 is not released as stable. It's in the best interest of the
> reiser4  coders to add better documentation for this matter, as this would
> enable more people to test the product and maybe report bugs.
> Best wishes

there were some fixes in the reiser4 support in grub and in stand-alone 
mode of reiser4progs recently. all patches were sent in the list actually. 
but you can just obtain the current grub patch + reiser4progs from:
http://www.namesys.com/snapshots/2004.03.24-internal.testing.

-- 
Thanks,
Vitaly Fertman
