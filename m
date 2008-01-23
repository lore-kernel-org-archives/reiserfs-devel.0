From: Zan Lynx <zlynx@acm.org>
Subject: 2.6.24-rc8-mm1 NULL deref in reiser4_tree_by_page
Date: Wed, 23 Jan 2008 10:33:47 -0700
Message-ID: <1201109628.84799.1.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-nHm/ehA5yfoPnVJZ8QRA"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758352AbYAWRg1@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Linux Kernel <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>


--=-nHm/ehA5yfoPnVJZ8QRA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Unable to handle kernel NULL pointer dereference at 0000000000000000 RIP:=20
 [<ffffffff803495d4>] reiser4_tree_by_page+0x4/0x20
PGD 12d76067 PUD 12cc7067 PMD 0=20
Oops: 0000 [1] SMP=20
last sysfs file: /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
CPU 0=20
Modules linked in: isofs nls_iso8859_1 nls_cp437 vfat fat nls_base snd_pcm_=
oss snd_mixer_oss snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq snd_=
seq_device netconsole configfs joydev usb_storage usbhid hid libusual psmou=
se serio_raw evdev nvidiafb fb fb_ddc i2c_algo_bit cfbcopyarea vgastate i2c=
_core cfbimgblt snd_intel8x0m ohci_hcd snd_intel8x0 ehci_hcd cfbfillrect sn=
d_ac97_codec ac97_bus snd_pcm snd_timer usbcore snd snd_page_alloc sg
Pid: 393133, comm: beagled-helper Not tainted 2.6.24-rc8-mm1 #3
RIP: 0010:[<ffffffff803495d4>]  [<ffffffff803495d4>] reiser4_tree_by_page+0=
x4/0x20
RSP: 0018:ffff8100185d5cd0  EFLAGS: 00010296
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000000000c
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffe200014beda0
RBP: ffffe200014beda0 R08: 0000000000000002 R09: 0000000000000000
R10: ffffffff80332a3c R11: ffffffff80366910 R12: ffffe200014beda0
R13: ffff8100185d5de8 R14: ffff81000ff4b474 R15: ffff81000ff4b474
FS:  000000004319d950(0063) GS:ffffffff80721000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 0000000000000000 CR3: 0000000012da9000 CR4: 00000000000006e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff4ff0 DR7: 0000000000000400
Process beagled-helper (pid: 393133, threadinfo ffff8100185d4000, task ffff=
81001d25c000)
Stack:  ffffffff8033217a ffff8100185d5de8 0000000000000000 ffffe200014beda0
 ffff8100185d5e20 ffff8100185d5de8 ffff81000ff4b474 ffff81000ff4b474
 ffffffff80359d5a ffff810000000002 ffffe20000000002 ffff810000000002
Call Trace:
 [<ffffffff8033217a>] ? jnode_of_page+0x2a/0x2a0
 [<ffffffff80359d5a>] ? uf_readpages_filler+0x24a/0x300
 [<ffffffff80359b10>] ? uf_readpages_filler+0x0/0x300
 [<ffffffff80293086>] ? read_cache_pages+0x96/0xc0
 [<ffffffff80359e66>] ? readpages_unix_file+0x56/0xc0
 [<ffffffff80292e78>] ? __do_page_cache_readahead+0x1c8/0x2b0
 [<ffffffff80292fc1>] ? force_page_cache_readahead+0x61/0x90
 [<ffffffff8028e313>] ? sys_fadvise64_64+0x103/0x1e0
 [<ffffffff8020c37b>] ? system_call_after_swapgs+0x7b/0x80


Code: 00 66 0f 1f 44 00 00 e8 cb 99 fe ff e9 e2 fe ff ff 48 8b 7d 00 bb fe =
ff ff ff e8 b8 99 fe ff e9 cf fe ff ff 90 90 90 48 8b 47 18 <48> 8b 00 48 8=
b 80 d0 01 00 00 48 8b 80 30 04 00 00 48 83 c0 48=20
RIP  [<ffffffff803495d4>] reiser4_tree_by_page+0x4/0x20
 RSP <ffff8100185d5cd0>
CR2: 0000000000000000
---[ end trace aaa0c2da658acfd6 ]---


$ /usr/src/linux/scripts/ver_linux=20
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.
=20
Linux zephyr 2.6.24-rc8-mm1 #3 SMP Fri Jan 18 14:36:24 MST 2008 x86_64 AMD =
Athlon(tm) 64 Processor 3400+ AuthenticAMD GNU/Linux
=20
Gnu C                  4.2.2
Gnu make               3.81
binutils               2.18.50.0.1.20070908
util-linux             2.13.1
mount                  2.13.1
module-init-tools      3.4
e2fsprogs              1.40.4
reiserfsprogs          3.6.19
reiser4progs           1.0.6
pcmciautils            014
pcmcia-cs              3.2.9
PPP                    2.4.4
nfs-utils              1.0.7
Linux C Library        Dynamic linker (ldd)   2.7
Procps                 3.2.7
Net-tools              1.60
Kbd                    1.13
oprofile               0.9.3
Sh-utils               6.9
udev                   118
wireless-tools         29
Modules Loaded         isofs nls_iso8859_1 nls_cp437 vfat fat nls_base snd_=
pcm_oss snd_mixer_oss snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq =
snd_seq_device netconsole configfs usb_storage usbhid hid libusual joydev p=
smouse serio_raw evdev nvidiafb fb fb_ddc i2c_algo_bit cfbcopyarea vgastate=
 i2c_core cfbimgblt cfbfillrect snd_intel8x0 snd_intel8x0m snd_ac97_codec e=
hci_hcd ohci_hcd ac97_bus snd_pcm usbcore snd_timer snd sg snd_page_alloc


--=20
Zan Lynx <zlynx@acm.org>=20


--=-nHm/ehA5yfoPnVJZ8QRA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQBHl3p7G8fHaOLTWwgRAkAxAJ93SqSzXnmAKtBAqnAZQJv+j3BcbwCfTJuQ
Bs/YvLCiefvW/aa3NqdOGg0=
=2SOe
-----END PGP SIGNATURE-----

--=-nHm/ehA5yfoPnVJZ8QRA--
