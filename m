From: michael chang <thenewme91@gmail.com>
Subject: Re: Building Reiser4 - Symbol problem
Date: Fri, 7 Oct 2005 20:36:53 -0400
Message-ID: <b14e81f00510071736k43d58100ia80bfd0fadbd6ad7@mail.gmail.com>
References: <4347094A.3090801@sourcelabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26427-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4347094A.3090801@sourcelabs.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Jacobson <steve@sourcelabs.com>
Cc: reiserfs-list@namesys.com

On 10/7/05, Steve Jacobson <steve@sourcelabs.com> wrote:
> 1) Start with clean install of centOS 4.1 x86_64 version
> 2) Install kernel sources from centOS distro
> 3) Patch sources:
>    a) in /usr/src/linux-2.6.9-11.EL
>    b) run: patch -p0 < reiser4-for-2.6.9-4
> NOTE - is this my complete problem right here?   Are the differences
> between 2.6.9-11 and 2.6.9-4 significant enough to account for this?

In theory, they shouldn't be... but are all the hunks applying
correctly?  If any fail, they must be applied by hand, or something
breaks.

> 4) make menuconfig - enabling reiser4 as a module

What happens when done builtin?  Also, do you have something like 4k
stacks built in that weren't supported in the 2.6.9 patch?

> 5) make
> 6) make binrpm-pkg
> 7) Install the resultant RPM
> 8) run mkinitrd /boot/initrd-2.6.9-11.ELcustom.img 2.6.9011.ELcustom
> 9) Update grub.conf:
>    title CentOS-4 x86_64 Resier (2.6.9-11.ELcustom)
>         root (hd0,0)
>         kernel /vmlinuz-2.6.9-11.ELcustom ro root=3DLABEL=3D/1
>         initrd /initrd-2.6.9-11.ELcustom.img
> 10) reboot, and select the custom kernel
> 11) Run mkfs.reiser4

Where the heck does this come from?  I didn't see you install any resier4 t=
ools.

What version of resier4 tools are you using?

> 12) run modprobe reiser4, or just try to mount the new file system

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
