From: jose@metztli-it.com (Metztli Information Technology)
Subject: Re: Reiser4 for Linux-4.14, Reiser4progs-1.2.0, Libaal-1.0.7, Format 4.0.2
Date: Tue, 28 Nov 2017 19:05:54 -0800 (PST)
Message-ID: <20171129030554.16DD612BEB61@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1511924755; h=From: Date: Message-Id: To: Subject: Sender;
 bh=ML3+mqIcOERNqwOdpTNYpiq52yucQPO3Zfd535PKF/M=; b=Qr9CJgA3JbvN2pLPeKFZvk7OpA7qpyN6AfXFiQ0ZgD78rOe9p1Axsm5OwURKMskRFHAgYJbT
 /RKPJAzjcomTNFCx6fq1nfBYgZuX30QZzcPjM4jKx7C70293UpMKc62m+dLFtgA5qo2QQ5ef
 U59GdNjkMdG6sz40yX7WVhLPzZs=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: edward.shishkin@gmail.com, reiserfs-devel@vger.kernel.org, debian-kernel@lists.debian.org


On Tue, Nov 28, 2017 at 9:08 AM, Edward Shishkin <edward.shishkin@gmail.com> wrote:
> On 11/28/2017 04:21 PM, Metztli Information Technology wrote:
>>
>> Appreciated Ed.
>>
>>> Hello,
>>>
>>> Please, download reiser4-for-4.14.1.patch which contains the fixup.
>>>
>> Updated patch works but had a rough time during the build procedure
>> because zstd is used by btrfs as well:
>
>
> This is something curious. Squashfs also uses zstd, as far as I know..

Well, ignore-dups was 'quick hack' -- and it took me several build attempts to figure out
at *which* package directory root it had to be touch'ed -- until I forced
/usr/share/kernel-wedge/commands/find-dups
to spit it out in the build log via its $configdir variable.

Notwithstanding, except for Ben, we don't get much constructive feedback from Debian but I assume
 Squashfs and btrfs 'harmonious' zstd coexistence has to do with:
"When you have duplicates, you need to find (or make) a package that both packages depend on, and move
the duplicate modules to it."
< https://github.com/pexip/os-kernel-wedge >

As I have time, I will attempt to figure out which package Squashfs and btrfs depend on so as to
potentianlly implement a patch to include reiser4 (SFRN) 4.0.2.

>
>
>> ...
>> some modules are in more than one package
>> debian/reiser4-modules-4.14.0-1+reiser4.0.2-amd64-di
>> lib/modules/4.14.0-1+reiser4.0.2-amd64/kernel/lib/xxhash.ko
>> debian/btrfs-modules-4.14.0-1+reiser4.0.2-amd64-di
>> lib/modules/4.14.0-1+reiser4.0.2-amd64/kernel/lib/xxhash.ko
>> debian/reiser4-modules-4.14.0-1+reiser4.0.2-amd64-di
>> lib/modules/4.14.0-1+reiser4.0.2-amd64/kernel/lib/zstd/zstd_compress.ko
>> debian/btrfs-modules-4.14.0-1+reiser4.0.2-amd64-di
>> lib/modules/4.14.0-1+reiser4.0.2-amd64/kernel/lib/zstd/zstd_compress.ko
>> debian/reiser4-modules-4.14.0-1+reiser4.0.2-amd64-di
>> lib/modules/4.14.0-1+reiser4.0.2-amd64/kernel/lib/zstd/zstd_decompress.ko
>> debian/btrfs-modules-4.14.0-1+reiser4.0.2-amd64-di
>> lib/modules/4.14.0-1+reiser4.0.2-amd64/kernel/lib/zstd/zstd_decompress.ko
>> command exited with status 1
>> make[2]: *** [install-udeb_amd64] Error 2
>> debian/rules.real:498: recipe for target 'install-udeb_amd64' failed
>> make[2]: Leaving directory '/usr/tzinti/build/kernel/tekitl-4.14.2/linux'
>> make[1]: *** [binary-arch_amd64] Error 2
>> debian/rules.gen:18: recipe for target 'binary-arch_amd64' failed
>> make[1]: Leaving directory '/usr/tzinti/build/kernel/tekitl-4.14.2/linux'
>> make: *** [binary-arch] Error 2
>> debian/rules:50: recipe for target 'binary-arch' failed
>> dpkg-buildpackage: error: fakeroot debian/rules binary-arch gave error
>> exit status 2
>>
>> < https://pbs.twimg.com/media/DPuO9nKU8AEMTgx.jpg:large >
>>
>> Accordingly, in order for the build to proceed past the kernel-wedge show
>> stopper, I had to
>>
>> touch debian/installer/amd64/ignore-dups
>> < https://github.com/pexip/os-kernel-wedge >
>> i.e.,
>> --------------------------------
>> % kernel-wedge help find-dups
>> find-dups kernel-name
>>
>> Find duplicate modules. Pass the kernel name.
>>
>> Return 1 if any duplicates are found, unless $KW_CHECK_NONFATAL is
>> non-empty or the configuration file 'ignore-dups' exists.
>> --------------------------------------
>>
>> And the build procedure completed successfully at long last.
>>
>>> On 11/27/2017 03:37 PM, Metztli Information Technology wrote:
>>>>
>>>> Niltze, Ed-
>>>>
>>>>
>>>> I've built libaal-1.0.7 and Reiser4progs-1.2.0 Debian packages for AMD64
>>>> successfully and currently testing in a virtual machine.
>>>>
>>>> I've applied reiser4-for-4.14.0 patch to upstream kernel 4.14.2; Debian
>>>> packaging for 4.14.2-xyz required GCC-7 for kernel build
>>>>
>>>>    -- which I installed including relevant dependencies. Yet I have
>>>> experienced (twice) the appended tail show stopper error:
>>>> ...
>>>>
>>>>     CC      arch/x86/boot/compressed/pagetable.o
>>>>     CC      arch/x86/boot/compressed/eboot.o
>>>>     AS      arch/x86/boot/compressed/efi_stub_64.o
>>>>     AS      arch/x86/boot/compressed/efi_thunk_64.o
>>>>     CC      arch/x86/boot/compressed/misc.o
>>>>     XZKERN  arch/x86/boot/compressed/vmlinux.bin.xz
>>>> ERROR: "find_get_pages_range" [fs/reiser4/reiser4.ko] undefined!
>>>> make[6]: *** [__modpost] Error 1
>>>>
>>>> /usr/tzinti/build/kernel/tekitl-4.14.2/linux/scripts/Makefile.modpost:92:
>>>> recipe for target '__modpost' failed
>>>> make[5]: *** [modules] Error 2
>>>> /usr/tzinti/build/kernel/tekitl-4.14.2/linux/Makefile:1228: recipe for
>>>> target 'modules' failed
>>>> make[5]: *** Waiting for unfinished jobs....
>>>>     MKPIGGY arch/x86/boot/compressed/piggy.S
>>>>     AS      arch/x86/boot/compressed/piggy.o
>>>>     DATAREL arch/x86/boot/compressed/vmlinux
>>>>     LD      arch/x86/boot/compressed/vmlinux
>>>>     ZOFFSET arch/x86/boot/zoffset.h
>>>>     OBJCOPY arch/x86/boot/vmlinux.bin
>>>>     AS      arch/x86/boot/header.o
>>>>     LD      arch/x86/boot/setup.elf
>>>>     OBJCOPY arch/x86/boot/setup.bin
>>>>     BUILD   arch/x86/boot/bzImage
>>>> Setup is 17212 bytes (padded to 17408 bytes).
>>>> System is 4433 kB
>>>> CRC 231e180a
>>>> Kernel: arch/x86/boot/bzImage is ready  (#1)
>>>> make[4]: *** [sub-make] Error 2
>>>> Makefile:146: recipe for target 'sub-make' failed
>>>> make[3]: *** [__sub-make] Error 2
>>>> Makefile:24: recipe for target '__sub-make' failed
>>>> make[3]: Leaving directory
>>>> '/usr/tzinti/build/kernel/tekitl-4.14.2/linux/debian/build/build_amd64_none_amd64'
>>>> make[2]: *** [debian/stamps/build_amd64_none_amd64] Error 2
>>>> debian/rules.real:190: recipe for target
>>>> 'debian/stamps/build_amd64_none_amd64' failed
>>>> make[2]: Leaving directory
>>>> '/usr/tzinti/build/kernel/tekitl-4.14.2/linux'
>>>> make[1]: *** [binary-arch_amd64_none_amd64_real] Error 2
>>>> debian/rules.gen:24: recipe for target
>>>> 'binary-arch_amd64_none_amd64_real' failed
>>>> make[1]: Leaving directory
>>>> '/usr/tzinti/build/kernel/tekitl-4.14.2/linux'
>>>> make: *** [binary-arch] Error 2
>>>> debian/rules:50: recipe for target 'binary-arch' failed
>>>> dpkg-buildpackage: error: fakeroot debian/rules binary-arch gave error
>>>> exit status 2
>>>>


Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch with Linux 4.13
---------------------------------------------------------------------------------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
