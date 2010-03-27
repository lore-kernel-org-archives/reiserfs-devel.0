From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Re: Segfault in fsck.reiser4
Date: Sat, 27 Mar 2010 09:38:37 +0100
Message-ID: <op.u97wx6qfhogzsi@g17b>
References: <7880.2170.3389-28898-1298266740-1269420891@seznam.cz>
 <4BAA0F42.90308@gmail.com>
Reply-To: reiserfs-devel@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BAA0F42.90308@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

Dne Wed, 24 Mar 2010 14:10:26 +0100 Edward Shishkin
<edward.shishkin@gmail.com> napsal(a):

> try to jump several levels up: the function ccreg40_check_cluster
> has an argument ccreg40_hint_t *hint, it shouldn't be optimized.

I'm working on it, but gdb is so slow and it needs constant attention,
so it'll take a while.
I'm not very skilled at this and I don't have much time.

But I've got other news: I found a file that causes an oops when read.
I was just tarring up everything that might still be left on the FS
when it happened. The FS is still readonly, I haven't umounted it yet.

The oops is probably not very useful, but here you are anyway:

Mar 27 01:55:01 [kernel] Kernel BUG at c10e0681 [verbose debug info =20
unavailable]
Mar 27 01:55:01 [kernel] Modules linked in: af_packet sco rfcomm bnep
l2cap crc16 acpi_cpufreq cpufreq_conservative cpufreq_powersave
cpufreq_userspace snd_hda_codec_realtek btusb snd_hda_intel bluetooth
snd_hda_codec snd_hwdep psb ath9k snd_pcm drm_psb uvcvideo snd_timer
mac80211 agpgart snd videodev v4l1_compat video ath rtc_cmos processor
soundcore backlight thermal rtc_core cfg80211 ehci_hcd output evdev
battery button ac rtc_lib uhci_hcd i2c_isch i2c_algo_bit snd_page_alloc
thermal_sys usbcore rfkill i2c_core atl1c hwmon unix
Mar 27 01:55:01 [kernel] Pid: 10097, comm: tar Not tainted =20
(2.6.32-gentoo-r5 #1) 1101HA
Mar 27 01:55:01 [kernel] EIP: 0060:[<c10e0681>] EFLAGS: 00010246 CPU: 0
Mar 27 01:55:01 [kernel] EIP is at do_readpage_ctail+0x2a1/0x367
Mar 27 01:55:01 [kernel] EAX: 00000000 EBX: 00000002 ECX: c1906880 EDX:=
 =20
c00122b4
Mar 27 01:55:01 [kernel] ESI: 00000000 EDI: e573fcf0 EBP: e573fc94 ESP:=
 =20
e573fc74
Mar 27 01:55:01 [kernel]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
Mar 27 01:55:01 [kernel]  00000000 c1906880 c00122b4 0000040f 00000000 =
=20
00000000 e573fcf0 c1906880
Mar 27 01:55:01 [kernel] <0> e573fcbc c10e0890 00000001 c1906880 000000=
00 =20
c00122b4 00000000 c1906880
Mar 27 01:55:01 [kernel] <0> e573fdb0 c0012360 e573fcd8 c105d02f e6febd=
90 =20
c10e0747 00000010 c0012360
Mar 27 01:55:01 [kernel]  [<c10e0890>] ? ctail_readpages_filler+0x149/0=
x195
Mar 27 01:55:01 [kernel]  [<c105d02f>] ? read_cache_pages+0x6d/0xca
Mar 27 01:55:01 [kernel]  [<c10e0747>] ? ctail_readpages_filler+0x0/0x1=
95
Mar 27 01:55:01 [kernel]  [<c10e03d7>] ? readpages_ctail+0x29f/0x2a8
Mar 27 01:55:01 [kernel]  [<c10d4030>] ? readpages_cryptcompress+0x36/0=
x5b
Mar 27 01:55:01 [kernel]  [<c10c82d3>] ? reiser4_readpages+0x26/0x2e
Mar 27 01:55:01 [kernel]  [<c10c82ad>] ? reiser4_readpages+0x0/0x2e
Mar 27 01:55:01 [kernel]  [<c105cc54>] ? =20
__do_page_cache_readahead+0xeb/0x160
Mar 27 01:55:01 [kernel]  [<c105cce0>] ? ra_submit+0x17/0x1c
Mar 27 01:55:01 [kernel]  [<c105cef6>] ? ondemand_readahead+0x161/0x16d
Mar 27 01:55:01 [kernel]  [<c105cf7a>] ? =20
page_cache_sync_readahead+0x16/0x1b
Mar 27 01:55:01 [kernel]  [<c10580c7>] ? generic_file_aio_read+0x1fe/0x=
550
Mar 27 01:55:01 [kernel]  [<c107857b>] ? do_sync_read+0xab/0xe9
Mar 27 01:55:01 [kernel]  [<c10385c3>] ? autoremove_wake_function+0x0/0=
x33
Mar 27 01:55:01 [kernel]  [<c10d3d37>] ? read_cryptcompress+0x5f/0x7e
Mar 27 01:55:01 [kernel]  [<c10d2335>] ? reiser4_read_careful+0xa9/0xf1
Mar 27 01:55:01 [kernel]  [<c10d228c>] ? reiser4_read_careful+0x0/0xf1
Mar 27 01:55:01 [kernel]  [<c1078fa7>] ? vfs_read+0x87/0x118
Mar 27 01:55:01 [kernel]  [<c10790d1>] ? sys_read+0x3b/0x60
Mar 27 01:55:01 [kernel]  [<c1002b0f>] ? sysenter_do_call+0x12/0x26
Mar 27 01:55:01 [kernel] ---[ end trace 26ea3afca4e81c3e ]---


--=20
Jon=C3=A1=C5=A1 Vidra
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
