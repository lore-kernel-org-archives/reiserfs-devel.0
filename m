From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-4.14, Reiser4progs-1.2.0, Libaal-1.0.7, Format
 4.0.2
Date: Tue, 28 Nov 2017 00:08:22 +0100
Message-ID: <31bf3fc5-4499-1a59-4e20-2af839c79342@gmail.com>
References: <20171127143741.C5276113CF17@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=fid22F5ZzuPZeU8TY6J34Tn/NjD8K9g2DP4M1VevIdM=;
        b=Kl8JN+2AAz1f3Wev4mM4P/ddVGHDp5Ty7brv06VhP66U0utjoTtG91AtMXvm3OsoNI
         qcW7vzgc1yLfWCA6sOZcs0pi6uLsRTWJrNrMewBDMDcM2cWwoMDBkJVHTc9C6Gqvt8QJ
         F4aTo8nkI6eu3cHKwHIE2bfWWw2gs33G3D82wg5vg4BWmY6BhGasF3NZIYOJBZg2nMe+
         VbbctVaKRcovh3nmm7qfbtd0lO0Xot4wR7lWhqv+AvpuQ3ceLte9ucbfxkK4I0o53RLa
         8OU7YPaL66SY1qoJlQAKfFT1HLViICWLwcfvMYB2NlZmyNLym3Ds+QpntfcS161flycE
         vveA==
In-Reply-To: <20171127143741.C5276113CF17@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose@metztli.com>, reiserfs-devel@vger.kernel.org, debian-kernel@lists.debian.org

Hello,

Please, download reiser4-for-4.14.1.patch which contains the fixup.

Thanks,
Edward.

On 11/27/2017 03:37 PM, Metztli Information Technology wrote:
> Niltze, Ed-
>
>
> I've built libaal-1.0.7 and Reiser4progs-1.2.0 Debian packages for AMD64 successfully and currently testing in a virtual machine.
>
> I've applied reiser4-for-4.14.0 patch to upstream kernel 4.14.2; Debian packaging for 4.14.2-xyz required GCC-7 for kernel build
>
>   -- which I installed including relevant dependencies. Yet I have experienced (twice) the appended tail show stopper error:
> ...
>
>    CC      arch/x86/boot/compressed/pagetable.o
>    CC      arch/x86/boot/compressed/eboot.o
>    AS      arch/x86/boot/compressed/efi_stub_64.o
>    AS      arch/x86/boot/compressed/efi_thunk_64.o
>    CC      arch/x86/boot/compressed/misc.o
>    XZKERN  arch/x86/boot/compressed/vmlinux.bin.xz
> ERROR: "find_get_pages_range" [fs/reiser4/reiser4.ko] undefined!
> make[6]: *** [__modpost] Error 1
> /usr/tzinti/build/kernel/tekitl-4.14.2/linux/scripts/Makefile.modpost:92: recipe for target '__modpost' failed
> make[5]: *** [modules] Error 2
> /usr/tzinti/build/kernel/tekitl-4.14.2/linux/Makefile:1228: recipe for target 'modules' failed
> make[5]: *** Waiting for unfinished jobs....
>    MKPIGGY arch/x86/boot/compressed/piggy.S
>    AS      arch/x86/boot/compressed/piggy.o
>    DATAREL arch/x86/boot/compressed/vmlinux
>    LD      arch/x86/boot/compressed/vmlinux
>    ZOFFSET arch/x86/boot/zoffset.h
>    OBJCOPY arch/x86/boot/vmlinux.bin
>    AS      arch/x86/boot/header.o
>    LD      arch/x86/boot/setup.elf
>    OBJCOPY arch/x86/boot/setup.bin
>    BUILD   arch/x86/boot/bzImage
> Setup is 17212 bytes (padded to 17408 bytes).
> System is 4433 kB
> CRC 231e180a
> Kernel: arch/x86/boot/bzImage is ready  (#1)
> make[4]: *** [sub-make] Error 2
> Makefile:146: recipe for target 'sub-make' failed
> make[3]: *** [__sub-make] Error 2
> Makefile:24: recipe for target '__sub-make' failed
> make[3]: Leaving directory '/usr/tzinti/build/kernel/tekitl-4.14.2/linux/debian/build/build_amd64_none_amd64'
> make[2]: *** [debian/stamps/build_amd64_none_amd64] Error 2
> debian/rules.real:190: recipe for target 'debian/stamps/build_amd64_none_amd64' failed
> make[2]: Leaving directory '/usr/tzinti/build/kernel/tekitl-4.14.2/linux'
> make[1]: *** [binary-arch_amd64_none_amd64_real] Error 2
> debian/rules.gen:24: recipe for target 'binary-arch_amd64_none_amd64_real' failed
> make[1]: Leaving directory '/usr/tzinti/build/kernel/tekitl-4.14.2/linux'
> make: *** [binary-arch] Error 2
> debian/rules:50: recipe for target 'binary-arch' failed
> dpkg-buildpackage: error: fakeroot debian/rules binary-arch gave error exit status 2
>
>
> Best Professional Regards.
>

