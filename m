From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 documentation
Date: Wed, 24 Mar 2004 09:22:04 +0300
Message-ID: <4061290C.3030402@namesys.com>
References: <BAY99-F42DjFbUcOV1E00010e2a@hotmail.com>
Reply-To: reiser@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17420-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAY99-F42DjFbUcOV1E00010e2a@hotmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: ionita ioan <ionut0007@hotmail.com>, Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

ionita ioan wrote:

> Hello,
> After looking at some of the benchmarks for the new Reiser4, I was=20
> very excited and decided to try it out. I followed all the steps to=20
> patch the kernel, install libaal 0.5.0 (with stand-alone and=20
> memory-manager both enabled), reiser4progs-0.5.2 (with stand-alone and=20
> symlinks both enabled), made the reiser4 partition, was able to mount=20
> it and use it, then decided to try to boot from it. I got the latest=20
> version of grub (0.94), applied the latest reiser4 patch for grub-0.94=20
> configured with --enable-reiser4, and found out that the reiser4 stage=20
> files had not been built. After a little inquiry, with my limited=20
> knowledge, found out that after the configuration, the generated=20
> config.h had undef for aal-alone and reiser4-alone library and the=20
> makefiles contained no instructions for building the reiser4 files.=20
> Both libaal-alone and libreiser4-alone exist in /usr/lib and i have=20
> issued ldconfig repeatedly. I attempted to build grub-0.93 with the=20
> reiser4 patch from the snapshots page. Again, no reiser4 stage files=20
> were created. I am frustrated with the lack of documentation=20
> concerning reiser4 bootloader support. I believe that the burden lies=20
> on the reiser4 developers at this point, and not the bootloader=20
> coders, as long as reiser4 is not released as stable. It's in the best=20
> interest of the reiser4 coders to add better documentation for this=20
> matter, as this would enable more people to test the product and maybe=20
> report bugs.
> Best wishes
>
> _________________________________________________________________
> MSN Toolbar provides one-click access to Hotmail from any Web page =96=20
> FREE download! http://toolbar.msn.com/go/onm00200413ave/direct/01/
>
>
>
thanks for your patience. Vitaly, why was this so hard for him? Fix it.

--=20
Hans

