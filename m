From: "Sander Sweers" <sandersweers@xs4all.nl>
Subject: Re: http://www.namesys.com/snapshots/2004.06.14-internal.testing/
Date: Wed, 16 Jun 2004 17:44:46 +0200 (CEST)
Message-ID: <24295.212.0.249.130.1087400686.squirrel@webmail.xs4all.nl>
References: <200406150022.34578.vitaly@namesys.com>
    <200406161558.45139.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-19214-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406161558.45139.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


<citaat van="Vitaly Fertman">
> On Tuesday 15 June 2004 00:22, Vitaly Fertman wrote:
>> Hello All,
>>
>> This snapshot includes reiser4progs-0.5.5, libaal-0.5.2 and updated
>> grub patch.
>>
>> stage1_5 reiser4 support in grub does not work (and probably will not
>> anymore) because reiser4_stage1_5 code does not fit 23,5K size limit,
>> even when all not nessesary plugins are disabled (disable-short-keys,
>> disable-X-hash, disable-X_fibre, disable-symlinks, etc) on configuring.
>> Use stage2 instead.
>
> remember that the latest 'stable' reiser4 snapshot (2004.03.26) does not
> support plugin sets, so use this internal progs snapshot with the last
> auto
> reiser4 snapshots only.
>
> --
> Thanks,
> Vitaly Fertman
>
>

I'm trying to build reiser4 support in grub but it ends with the following
error:

gcc -fno-pic -nopie -fno-stack-protector  -g   -o pre_stage2.exec
-nostdlib -Wl,-N -Wl,-Ttext -Wl,8200 pre_stage2_exec-asm.o
pre_stage2_exec-bios.o pre_stage2_exec-boot.o pre_stage2_exec-builtins.o
pre_stage2_exec-char_io.o pre_stage2_exec-cmdline.o
pre_stage2_exec-common.o pre_stage2_exec-console.o
pre_stage2_exec-disk_io.o pre_stage2_exec-fsys_ext2fs.o
pre_stage2_exec-fsys_fat.o pre_stage2_exec-fsys_ffs.o
pre_stage2_exec-fsys_jfs.o pre_stage2_exec-fsys_minix.o
pre_stage2_exec-fsys_reiserfs.o pre_stage2_exec-fsys_reiser4.o
pre_stage2_exec-fsys_vstafs.o pre_stage2_exec-fsys_xfs.o
pre_stage2_exec-gunzip.o pre_stage2_exec-hercules.o pre_stage2_exec-md5.o
pre_stage2_exec-serial.o pre_stage2_exec-smp-imps.o
pre_stage2_exec-stage2.o pre_stage2_exec-terminfo.o
pre_stage2_exec-tparm.o ../netboot/libdrivers.a -lreiser4-alone
-laal-alone
/lib/libaal-alone.a(libaal_alone_la-malloc.o)(.data+0x0): In function
`aal_mem_init':
/var/tmp/portage/libaal-0.5.2/work/libaal-0.5.2/src/malloc.c:189:
undefined reference to `free'
/lib/libaal-alone.a(libaal_alone_la-malloc.o)(.data+0x4): In function
`aal_mem_free':
/var/tmp/portage/libaal-0.5.2/work/libaal-0.5.2/src/malloc.c:196:
undefined reference to `malloc'
collect2: ld returned 1 exit status
make[2]: *** [pre_stage2.exec] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory
`/var/tmp/portage/grub-0.94-r1/work/grub-0.94/stage2'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/var/tmp/portage/grub-0.94-r1/work/grub-0.94'
make: *** [all] Error 2
----------
My system info:
Portage 2.0.50-r8 (default-x86-2004.0, gcc-3.4.0, glibc-2.3.3.20040420-r0,
2.6.7-rc2-Redeeman1)
=================================================================
System uname: 2.6.7-rc2-Redeeman1 i686 AMD Athlon(tm) XP 1600+
Gentoo Base System version 1.4.16
Autoconf: sys-devel/autoconf-2.58-r1
Automake: sys-devel/automake-1.8.3
ACCEPT_KEYWORDS="x86 ~x86"
AUTOCLEAN="yes"
CFLAGS="-march=athlon-xp -mfpmath=sse -msse -mmmx -m3dnow -O3 -pipe"
CHOST="i686-pc-linux-gnu"
CXXFLAGS="-march=athlon-xp -mfpmath=sse -msse -mmmx -m3dnow -O3 -pipe"

I have build reiser4progs and libaal with --enable-stand-alone.

Any ideas?
Thanks
Sander
