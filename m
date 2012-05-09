From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 bug with firefox on kernels 2.6.36 and 2.6.39
Date: Wed, 09 May 2012 10:39:47 +0200
Message-ID: <4FAA2D53.4000605@gmail.com>
References: <CADW=+3n3P4X2FjdttYMadCDjFkDko70QM52SKuFZt245Uf29sg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=N1eYaRQeZioiM1XhLYY5Bsl/yo/Cm3+7MX7HKHy87Ek=;
        b=q1QDCWk4daD7DvWkMn4vwBI3h6CpxUkQgZR1G7ts4WAJ6JMmNyKfcPWeBsJJwJPgGM
         I41+YzQeWQtWY2B2U/ooqm6TdT373JHvTrH2T5lyGCV1+UO/cWFhbeC38ILsvh3AA+yX
         /dhAANa/YQscJjf/OUM9ceJCR9CL0QpdF4cBEhQh/BBP5qjsfIwGKpgosxpEPuzvDkP1
         W58EcBz385grhIdL5uJcRWQbZAfQwl+UP7ykRlgM7eEYUDAO3wCRIfNj3YHlzZ4sRNE8
         Nla8tM8bdDH28esuOCxMK0SE9JXRsJlOmQ0AK+gK4esBkXGoZxsBIk2JF7qejhl7MWxV
         y2VA==
In-Reply-To: <CADW=+3n3P4X2FjdttYMadCDjFkDko70QM52SKuFZt245Uf29sg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is an old problem with unexpected fragmentation, when
all reserved blocks are exhausted. There is a dirty fixup
you can apply as a temporal solution:

http://marc.info/?l=3Dreiserfs-devel&m=3D129721907717548&q=3Dp3

Note that this fixup can cause unexpected no-space-on-device
when a lot of parallel processes do something with reiser4.

Edward.

P.S. Cut the part of this patch which produces flooding
warnings with "2222"..



On 05/08/2012 09:32 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> Hello
>
> I am using R4+CC on linux2.6.39 and it started to repeatedly crash th=
e
> system when firefox is started.
> Some parts of the system continue to work (it routs net traffic as I
> use it as a bridge)
> I fsck-ed the filesystem but even after fixing one small error (wrong
> size) system still crashes when I start firefox.
> Tried with older kernel 2.6.36 but it happens too.
> System did not have any software update recently, only major thing I
> remember is few months ago I switched from glibc-2.13 to 2.14
> Partition is on kingston SSD and SMART did not report any errors.
>
> If you need any more info please ask
>
> Thanks
>
> Dushan
>
> My toolchain:
> System uname: Linux-2.6.39-gentoo-r3-x86_64-Intel-R-_Core-TM-2_CPU_64=
00_@_2.13GHz-with-gentoo-2.0.3
> Timestamp of tree: Sun, 22 Apr 2012 16:45:01 +0000
> distcc 3.1 x86_64-pc-linux-gnu [disabled]
> ccache version 3.1.6 [disabled]
> app-shells/bash:          4.2_p20
> dev-lang/python:          2.6.6-r2, 2.7.2-r3, 3.1.4-r3, 3.2.2
> dev-util/ccache:          3.1.6
> dev-util/cmake:           2.8.6-r4
> dev-util/pkgconfig:       0.26
> sys-apps/baselayout:      2.0.3
> sys-apps/openrc:          0.9.8.4
> sys-apps/sandbox:         2.5
> sys-devel/autoconf:       2.13, 2.68
> sys-devel/automake:       1.9.6-r3, 1.10.3, 1.11.1
> sys-devel/binutils:       2.21.1-r1
> sys-devel/gcc:            4.5.3-r2
> sys-devel/gcc-config:     1.5-r2
> sys-devel/libtool:        2.4-r1
> sys-devel/make:           3.82-r1
> sys-kernel/linux-headers: 3.1 (virtual/os-headers)
> sys-libs/glibc:           2.14.1-r3
>
> Error message:
>
> May  8 21:20:17 krshina3 kernel: [ 1194.069531] ------------[ cut her=
e
> ]------------
> May  8 21:20:17 krshina3 kernel: [ 1194.069561] kernel BUG at
> fs/reiser4/block_a  lloc.c:151!
> May  8 21:20:17 krshina3 kernel: [ 1194.069586] invalid opcode: 0000 =
[#1] SMP
> May  8 21:20:17 krshina3 kernel: [ 1194.069612] last sysfs file:
> /sys/devices/pc
> i0000:00/0000:00:1f.2/host1/target1:0:0/1:0:0:0/block/sr0/uevent
> May  8 21:20:17 krshina3 kernel: [ 1194.069656] CPU 1
> May  8 21:20:17 krshina3 kernel: [ 1194.069671] Pid: 5541, comm:
> firefox Not tai  nted 2.6.39-gentoo-r3 #1 MICRO-STAR INTERNATIONAL
> CO., LTD MS-7235/MS-7235
> May  8 21:20:17 krshina3 kernel: [ 1194.069732] RIP:
> 0010:[<ffffffff8110c77b>]    [<ffffffff8110c77b>]
> sub_from_ctx_grabbed.clone.7+0x8/0x11
> May  8 21:20:17 krshina3 kernel: [ 1194.069781] RSP:
> 0018:ffff88013d4a5a30  EFLA  GS: 00010297
> May  8 21:20:17 krshina3 kernel: [ 1194.069807] RAX: 0000000000000000
> RBX: ffff8  8013dde4800 RCX: 0000000000000004
> May  8 21:20:17 krshina3 kernel: [ 1194.069839] RDX: 000000000000f3f2
> RSI: 00000  00000000001 RDI: ffff88013db8a730
> May  8 21:20:17 krshina3 kernel: [ 1194.069872] RBP: 0000000000000001
> R08: ffff8  8013d4a4001 R09: 0000000000000000
> May  8 21:20:17 krshina3 kernel: [ 1194.069904] R10: 00007fff89e84ca0
> R11: 00000  00000000293 R12: ffff8800200738c0
> May  8 21:20:17 krshina3 kernel: [ 1194.069936] R13: 0000000000000002
> R14: ffff8  8013d4a5ac8 R15: ffff88013d4a5b08
> May  8 21:20:17 krshina3 kernel: [ 1194.069969] FS:
> 00007f67588ce720(0000) GS:f  fff88013fd00000(0000)
> knlGS:0000000000000000
> May  8 21:20:17 krshina3 kernel: [ 1194.070006] CS:  0010 DS: 0000 ES=
:
> 0000 CR0:   000000008005003b
> May  8 21:20:17 krshina3 kernel: [ 1194.070032] CR2: 000000000076fd20
> CR3: 00000  0013c2f1000 CR4: 00000000000026e0
> May  8 21:20:17 krshina3 kernel: [ 1194.070065] DR0: 0000000000000045
> DR1: 00000  00000000000 DR2: 0000000000000000
> May  8 21:20:17 krshina3 kernel: [ 1194.070097] DR3: 0000000000000005
> DR6: 00000  000ffff0ff0 DR7: 0000000000000400
> May  8 21:20:17 krshina3 kernel: [ 1194.070129] Process firefox (pid:
> 5541, thre  adinfo ffff88013d4a4000, task ffff8801384d3890)
> May  8 21:20:17 krshina3 kernel: [ 1194.070166] Stack:
> May  8 21:20:17 krshina3 kernel: [ 1194.070177]  ffffffff8110d03a
> ffff88013939f9  80 ffff8800200738c0 ffff8800bb419a48
> May  8 21:20:17 krshina3 kernel: [ 1194.070221]  ffffffff8110ee71
> ffff88013d4a5a  c8 ffff88013939f980 ffff88013d4a5ca8
> May  8 21:20:17 krshina3 kernel: [ 1194.070264]  ffffffff8110ef12
> ffff88013d4a5c  a8 ffff88001480a0c0 ffff88013d4a5ca8
> May  8 21:20:17 krshina3 kernel: [ 1194.070307] Call Trace:
> May  8 21:20:17 krshina3 kernel: [ 1194.070322]  [<ffffffff8110d03a>]
> ? grabbed2  flush_reserved_nolock+0x34/0x6a
> May  8 21:20:17 krshina3 kernel: [ 1194.070355]  [<ffffffff8110ee71>]
> ? jnode_ma  ke_dirty_locked+0xd7/0x156
> May  8 21:20:17 krshina3 kernel: [ 1194.070387]  [<ffffffff8110ef12>]
> ? znode_ma  ke_dirty+0x22/0x97
> May  8 21:20:17 krshina3 kernel: [ 1194.070416]  [<ffffffff8112927a>]
> ? find_dis  k_cluster+0x1f9/0x2f9
> May  8 21:20:17 krshina3 kernel: [ 1194.070445]  [<ffffffff810afb66>]
> ? map_vm_a  rea+0x25/0x36
> May  8 21:20:17 krshina3 kernel: [ 1194.070471]  [<ffffffff81134700>]
> ? do_readp  age_ctail+0x143/0x3f9
> May  8 21:20:17 krshina3 kernel: [ 1194.070500]  [<ffffffff8112986d>]
> ? prepare_  logical_cluster+0x2f5/0x640
> May  8 21:20:17 krshina3 kernel: [ 1194.070531]  [<ffffffff81126f13>]
> ? set_wind  ow+0x59/0x90
> May  8 21:20:17 krshina3 kernel: [ 1194.070557]  [<ffffffff81125ebb>]
> ? write_di  spatch_hook+0x1e/0xf5
> May  8 21:20:17 krshina3 kernel: [ 1194.070586]  [<ffffffff8112aa56>]
> ? do_write  _cryptcompress+0x1d0/0x5b1
> May  8 21:20:17 krshina3 kernel: [ 1194.070617]  [<ffffffff8112b14c>]
> ? write_cr  yptcompress+0x91/0xc2
> May  8 21:20:17 krshina3 kernel: [ 1194.070646]  [<ffffffff81126074>]
> ? reiser4_  write_careful+0xb5/0x450
> May  8 21:20:17 krshina3 kernel: [ 1194.070678]  [<ffffffff81123c17>]
> ? read_uni  x_file+0x43b/0x45c
> May  8 21:20:17 krshina3 kernel: [ 1194.070706]  [<ffffffff810e3448>]
> ? fsnotify  +0x226/0x24f
> May  8 21:20:17 krshina3 kernel: [ 1194.070733]  [<ffffffff810bada5>]
> ? vfs_writ  e+0xaf/0x149
> May  8 21:20:17 krshina3 kernel: [ 1194.070759]  [<ffffffff810baef2>]
> ? sys_writ  e+0x45/0x6e
> May  8 21:20:17 krshina3 kernel: [ 1194.070785]  [<ffffffff814450fb>]
> ? system_c  all_fastpath+0x16/0x1b
> May  8 21:20:17 krshina3 kernel: [ 1194.070813] Code: 6c 00 48 b8 00
> 00 00 00 00   00 00 c0 48 8b 13 48 85 c2 74 02 0f 0b 48 09 d0 48 89 0=
3
> 48 83 c4 08 5b 5d c3 4  8 8b 07 48 39 f0 73 02<0f>  0b 48 29 f0 48 89
> 07 c3 55 53 48 63 df 48 83 ec 08 6  5 48 8b
> May  8 21:20:17 krshina3 kernel: [ 1194.071076] RIP
> [<ffffffff8110c77b>] sub_fr  om_ctx_grabbed.clone.7+0x8/0x11
> May  8 21:20:17 krshina3 kernel: [ 1194.071113]  RSP<ffff88013d4a5a30=
>
> May  8 21:20:17 krshina3 kernel: [ 1194.078058] ---[ end trace
> 66697deb00e48c67   ]---

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
