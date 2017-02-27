From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: reiser4: BUG during a backup (sequentially reading the whole fs) on
 4.9
Date: Mon, 27 Feb 2017 19:01:36 +0300
Message-ID: <1488211296.5395.2.camel@intelfx.name>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-Iblg7pjwA/d4A2K5PnHJ"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:mime-version;
        bh=shKcLXMIUvaN838g7TtM/FfHUe3PtjMJcLlgKZNVPqc=;
        b=TdcDFhXeCv5SlhO3LvbEc5ZN+/ofStnw3DICRUccl8/LYefkUqm9TqAOcZCXiX2kS/
         41goowsNcva9RM6m1K1y1ixB5ra/dWAqvsI2jO3Cum3YzWpqpdG0JP5r+cW89BsihEXQ
         WlbHq4oKjnomnVVJ31TSzNCJCCkVNNwpNWjZA=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-Iblg7pjwA/d4A2K5PnHJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I've just encountered this crash when I was doing a full-fs backup
(linux 4.9):

[ 3125.760693] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000010
[ 3125.760722] IP: [<ffffffffc075cf91>] internal_at+0x1/0x30 [reiser4]
[ 3125.760749] PGD 1dc4d8067
[ 3125.760756] PUD 119275067
[ 3125.760764] PMD 0

[ 3125.760772] Oops: 0000 [#1] PREEMPT SMP
[ 3125.760782] Modules linked in: ext4 jbd2 mbcache ctr ccm fuse cmac arc4 =
acpi_call(O) bnep ipheth btusb uvcvideo btintel bluetooth videobuf2_vmalloc=
 videobuf2_memops videobuf2_v4l2 videobuf2_core videodev uas crc16 bbswitch=
(O) coretemp i
ntel_rapl x86_pkg_temp_thermal intel_powerclamp snd_hda_codec_realtek kvm_i=
ntel snd_hda_codec_generic mei_wdt snd_hda_codec_hdmi kvm irqbypass crc32_p=
clmul ghash_clmulni_intel iTCO_wdt aesni_intel iTCO_vendor_support aes_x86_=
64 lrw gf128mul ath10k_pci snd_hda_intel glue_helper ath10k_core snd_hda_co=
dec ablk_helper cryptd ath mac80211 cfg80211 psmouse snd_hwdep snd_hda_core=
 thinkpad_acpi input_leds pcspkr e1000e i2c_i801 snd_pcm i2c_smbus nvram me=
i_me snd_timer mei rtsx_pci_ms lpc_ich snd memstick ptp led_class pps_core =
tpm_tis hwmon tpm_tis_core rfkill wmi soundcore
[ 3125.761006]  thermal ac tpm evdev battery sch_fq_codel vboxnetflt(O) vbo=
xnetadp(O) vboxpci(O) vboxdrv(O) usbserial usbip_host usbip_core sg efivarf=
s ip_tables x_tables autofs4 reiser4 sd_mod hid_logitech_hidpp hid_logitech=
_dj usbhid hid usb_storage rtsx_pci_sdmmc mmc_core crc32c_intel ahci libahc=
i libata xhci_pci serio_raw ehci_pci scsi_mod xhci_hcd ehci_hcd rtsx_pci mf=
d_core usbcore usb_common i915 video backlight button intel_gtt i2c_algo_bi=
t drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
[ 3125.761152] CPU: 2 PID: 8033 Comm: borg Tainted: G           O    4.9.0-=
pf5-intelfx-00118-g3ef102e15022 #1
[ 3125.761173] Hardware name: LENOVO 20BEA008RT/20BEA008RT, BIOS GMET75WW (=
2.23 ) 03/16/2016
[ 3125.761191] task: ffff9a35d33aa4c0 task.stack: ffffaf93c3fac000
[ 3125.761205] RIP: 0010:[<ffffffffc075cf91>]  [<ffffffffc075cf91>] interna=
l_at+0x1/0x30 [reiser4]
[ 3125.761231] RSP: 0018:ffffaf93c3faf978  EFLAGS: 00010202
[ 3125.761243] RAX: 00000000000003a8 RBX: ffffaf93c3faf9d8 RCX: ffffffffc07=
74980
[ 3125.761259] RDX: ffff9a3601130000 RSI: ffffaf93c3faf9d8 RDI: 00000000000=
00000
[ 3125.761275] RBP: ffff9a35886035a0 R08: 0000000000000000 R09: 00000000000=
00000
[ 3125.761291] R10: ffffffffc0750300 R11: 0000000000000000 R12: ffffaf93c3f=
afb40
[ 3125.761308] R13: 0000000000000001 R14: ffffaf93c3faf9d8 R15: 00000000000=
00000
[ 3125.761324] FS:  00007f71f7e82400(0000) GS:ffff9a373e280000(0000) knlGS:=
0000000000000000
[ 3125.761342] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3125.761355] CR2: 0000000000000010 CR3: 0000000215878000 CR4: 00000000001=
406e0
[ 3125.761371] Stack:
[ 3125.761377]  ffffaf93c3faf9d8 ffffffffc075d149 ffff9a3601130000 ffffffff=
c07519b0
[ 3125.761397]  ffffaf93c3faf9d8 000000000000000f ffff9a3601130010 ffffd790=
00000001
[ 3125.761417]  00000000006f7534 0043616e6f6e2057 000000000006f75f ffffffff=
ffffffff
[ 3125.761437] Call Trace:
[ 3125.761449]  [<ffffffffc075d149>] ? has_pointer_to_internal+0x9/0x20 [re=
iser4]
[ 3125.761471]  [<ffffffffc07519b0>] ? find_disk_cluster+0x190/0x3a0 [reise=
r4]
[ 3125.761492]  [<ffffffffc075f265>] ? do_readpage_ctail+0x235/0x490 [reise=
r4]
[ 3125.761511]  [<ffffffffc0751dd8>] ? prepare_page_cluster+0x178/0x270 [re=
iser4]
[ 3125.761531]  [<ffffffffc075f5a5>] ? ctail_readpages_filler+0xe5/0x250 [r=
eiser4]
[ 3125.761549]  [<ffffffffa1123153>] ? read_cache_pages+0xb3/0x180
[ 3125.761567]  [<ffffffffc075f4c0>] ? do_readpage_ctail+0x490/0x490 [reise=
r4]
[ 3125.761584]  [<ffffffffa1174657>] ? __kmalloc+0x167/0x1d0
[ 3125.761602]  [<ffffffffc075f963>] ? readpages_ctail+0x133/0x340 [reiser4=
]
[ 3125.761621]  [<ffffffffc0753e44>] ? readpages_cryptcompress+0x34/0x60 [r=
eiser4]
[ 3125.761638]  [<ffffffffa11233d7>] ? __do_page_cache_readahead+0x1b7/0x2a=
0
[ 3125.761655]  [<ffffffffa1123588>] ? ondemand_readahead+0xc8/0x240
[ 3125.761670]  [<ffffffffa1113a0b>] ? pagecache_get_page+0x2b/0x2a0
[ 3125.761685]  [<ffffffffa1116729>] ? generic_file_read_iter+0x619/0x880
[ 3125.761701]  [<ffffffffa11959d2>] ? new_sync_read+0xd2/0x120
[ 3125.761718]  [<ffffffffc0753ecc>] ? read_cryptcompress+0x5c/0xa0 [reiser=
4]
[ 3125.761738]  [<ffffffffc074e784>] ? reiser4_read_dispatch+0x54/0x130 [re=
iser4]
[ 3125.761755]  [<ffffffffa1195d15>] ? vfs_read+0x85/0x150
[ 3125.761768]  [<ffffffffa1197c2d>] ? SyS_read+0x4d/0xc0
[ 3125.761782]  [<ffffffffa11a8b76>] ? SyS_ioctl+0x36/0x70
[ 3125.761795]  [<ffffffffa1519560>] ? entry_SYSCALL_64_fastpath+0x13/0x94
[ 3125.761810] Code: 76 c0 48 c7 04 24 65 fb 76 c0 bb fb ff ff ff e8 7d 55 =
9b e0 eb 96 0f 1f 40 00 41 b8 01 00 00 00 31 c9 48 89 f2 e9 b0 e7 fc ff 53 =
<83> 7f 10 ff 48 89 fb 74 09 48 89 df 5b e9 fd 7d 00 00 e8 d8 7d
[ 3125.761910] RIP  [<ffffffffc075cf91>] internal_at+0x1/0x30 [reiser4]
[ 3125.761930]  RSP <ffffaf93c3faf978>
[ 3125.761939] CR2: 0000000000000010
[ 3125.774256] ---[ end trace b060c22fa881072e ]---


Is this something known to you? I'll try to reproduce, but not yet.

--=20
Ivan Shapovalov / intelfx /
--=-Iblg7pjwA/d4A2K5PnHJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE5N8nvImcx2nJlFGce94XyOTjDp0FAli0TWAACgkQe94XyOTj
Dp0W+g//aWpuegOYLncRl+RxJpYIZwOO9O4i4hmRFKyjDmxEK8MF3QYsB3fzcd2K
snbuak7AwXR2cfSR7lLt3ss/U7SKs0Qb3Yg/Hi+tubBWtN2+9UX/IwJTqpb23kQk
klqUGiSpM9dvxxgNAE/l/O52gwJo0kc7sl4xZk1LTyihAJObXm583OhKGrcz1wqX
O/8KXig7xb/PSd8mt7yzppD2/oreOhzXytz7fiLl16Iw/f9l3PS3JFYulW1wk3RQ
ehD1zthNwfd39GLIa0UZACXvcVdU3JR2P5UUmBirvxywZ1tPQo/yWUulwQuwISfE
mL9JxeLiY3faqWPk7bNnBVArej2U5JBftjOO8AOgSxYAnk5Fp2TiFuOV2OQsM9W8
qXlAx+dy/LuWEUPkuawXepJjsSyzCxfxFizxME2hTshOH9ey8vBxbRQA7kN56kXY
97K/xTcXlKhi8hWNNp61/lEDMYU8vnE6UvUlXbBZ773DaAM4KbY/GwhExs6W4CLS
5wAvvXtcuC5g8krwXnJkd7o6hoPwF7J1lgxLpO+FRL7nFN8cXEus9rDus7Krf9Pz
ICuf5i9R+assZ4PtL0/zbKpDrTSGQJMJM66javdAcPtAgeNnPTyA8XvD6lfOuMqI
wee7pjT1zudJoPktGRBqgDPK6ycvocxgGAL2OozcTyuzUzCzkrM=
=ebc6
-----END PGP SIGNATURE-----

--=-Iblg7pjwA/d4A2K5PnHJ--

