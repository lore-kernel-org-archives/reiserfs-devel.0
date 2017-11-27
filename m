From: jose@metztli.com (Metztli Information Technology)
Subject: Re: Reiser4 for Linux-4.14, Reiser4progs-1.2.0, Libaal-1.0.7, Format 4.0.2
Date: Mon, 27 Nov 2017 06:37:41 -0800 (PST)
Message-ID: <20171127143741.C5276113CF17@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1511793638; h=From: Date: Message-Id: To: Subject: Sender;
 bh=+mCuDwFBqMhno4HriGNRzZrkVu9Q9/Fen+5PHoU70MI=; b=FiK/lb+hmpAQx1zwno5pA2kCDh+0CffUee+rKKZSJa3HEXYeKAmtAo4gVxoCC+FukNRk2vYL
 7DkwXC7sbpaqulcahJ6HBmbIMGPf3DWaZ7xv2Wmc2y8Yrb4ErKLF6k6221MQn0GcwKLj20ur
 fltAMQl4l3gRVqUg99oI7mERGLo=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, debian-kernel@lists.debian.org

Niltze, Ed-


I've built libaal-1.0.7 and Reiser4progs-1.2.0 Debian packages for AMD64 successfully and currently testing in a virtual machine.

I've applied reiser4-for-4.14.0 patch to upstream kernel 4.14.2; Debian packaging for 4.14.2-xyz required GCC-7 for kernel build 

 -- which I installed including relevant dependencies. Yet I have experienced (twice) the appended tail show stopper error: 
...

  CC      arch/x86/boot/compressed/pagetable.o
  CC      arch/x86/boot/compressed/eboot.o
  AS      arch/x86/boot/compressed/efi_stub_64.o
  AS      arch/x86/boot/compressed/efi_thunk_64.o
  CC      arch/x86/boot/compressed/misc.o
  XZKERN  arch/x86/boot/compressed/vmlinux.bin.xz
ERROR: "find_get_pages_range" [fs/reiser4/reiser4.ko] undefined!
make[6]: *** [__modpost] Error 1
/usr/tzinti/build/kernel/tekitl-4.14.2/linux/scripts/Makefile.modpost:92: recipe for target '__modpost' failed
make[5]: *** [modules] Error 2
/usr/tzinti/build/kernel/tekitl-4.14.2/linux/Makefile:1228: recipe for target 'modules' failed
make[5]: *** Waiting for unfinished jobs....
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  DATAREL arch/x86/boot/compressed/vmlinux
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Setup is 17212 bytes (padded to 17408 bytes).
System is 4433 kB
CRC 231e180a
Kernel: arch/x86/boot/bzImage is ready  (#1)
make[4]: *** [sub-make] Error 2
Makefile:146: recipe for target 'sub-make' failed
make[3]: *** [__sub-make] Error 2
Makefile:24: recipe for target '__sub-make' failed
make[3]: Leaving directory '/usr/tzinti/build/kernel/tekitl-4.14.2/linux/debian/build/build_amd64_none_amd64'
make[2]: *** [debian/stamps/build_amd64_none_amd64] Error 2
debian/rules.real:190: recipe for target 'debian/stamps/build_amd64_none_amd64' failed
make[2]: Leaving directory '/usr/tzinti/build/kernel/tekitl-4.14.2/linux'
make[1]: *** [binary-arch_amd64_none_amd64_real] Error 2
debian/rules.gen:24: recipe for target 'binary-arch_amd64_none_amd64_real' failed
make[1]: Leaving directory '/usr/tzinti/build/kernel/tekitl-4.14.2/linux'
make: *** [binary-arch] Error 2
debian/rules:50: recipe for target 'binary-arch' failed
dpkg-buildpackage: error: fakeroot debian/rules binary-arch gave error exit status 2


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch with Linux 4.13
---------------------------------------------------------------------------------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
