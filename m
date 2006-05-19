From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [reiser4] can't build as module with
	reiser4-for-2.6.17-rc4-mm1-1.patch
Date: Sat, 20 May 2006 01:37:27 +0400
Message-ID: <1148074647.6390.46.camel@tribesman.namesys.com>
References: <e4lb65$m3n$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e4lb65$m3n$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2006-05-19 at 22:52 +0200, Laurent Riffard wrote:
> Hello,
> 
> I just downloaded reiser4-for-2.6.17-rc4-mm1-1.patch and gave it a try.
> It seems that reiser4 won't build cleanly as a module.
> 
> >   CC [M]  fs/reiser4/plugin/regular.o
> >   LD [M]  fs/reiser4/reiser4.o
> >   CC      drivers/base/class.o
> >   LD      drivers/base/built-in.o
> >   LD      drivers/built-in.o
> >   GEN     .version
> >   CHK     include/linux/compile.h
> >   UPD     include/linux/compile.h
> >   CC      init/version.o
> >   LD      init/built-in.o
> >   LD      .tmp_vmlinux1
> >   KSYM    .tmp_kallsyms1.S
> >   AS      .tmp_kallsyms1.o
> >   LD      .tmp_vmlinux2
> >   KSYM    .tmp_kallsyms2.S
> >   AS      .tmp_kallsyms2.o
> >   LD      vmlinux
> >   SYSMAP  System.map
> >   SYSMAP  .tmp_System.map
> >   AS      arch/i386/boot/setup.o
> >   LD      arch/i386/boot/setup
> >   OBJCOPY arch/i386/boot/compressed/vmlinux.bin
> >   GZIP    arch/i386/boot/compressed/vmlinux.bin.gz
> >   LD      arch/i386/boot/compressed/piggy.o
> >   LD      arch/i386/boot/compressed/vmlinux
> >   OBJCOPY arch/i386/boot/vmlinux.bin
> >   BUILD   arch/i386/boot/bzImage
> > Root device is (254, 4)
> > Boot sector 512 bytes.
> > Setup is 7183 bytes.
> > System is 1309 kB
> > Kernel: arch/i386/boot/bzImage is ready  (#6)
> >   Building modules, stage 2.
> >   MODPOST
> > WARNING: "__copy_from_user_ll_nocache" [fs/reiser4/reiser4.ko] undefined!
> >   LD [M]  fs/reiser4/reiser4.ko
> 
> The attached patch solved it.

Thanks for your help

> ~~
> laurent
> 

