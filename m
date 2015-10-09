From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Fri, 09 Oct 2015 19:13:38 +0300
Message-ID: <1444407218.4546.3.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
	 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
	 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
	 <5617D55D.2040908@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1ylDpXwBW9t2wFDUowjI"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=p0f+TvznO3jV9n/+zEEBqbxuHMLq4a2SlMjWjIe27jE=;
        b=tl04kWya/Ixg2rOQidfNogfVCu12uqga8hmAuoUAzPlzmerybMXfK08F0jhjcrNeUe
         rFDF+i44WuWy1lL8Y2eBvxQPe8U/5IRDL6CoQSvdbK2lHLlG9iUe+TenWUHlUak4BYqn
         R1Jag4V6scm9z6JMy47oFLRyYa76BLf8OxOMFEGHE0rj0GTtprUQ2x9gDcHjJtm7Zb6s
         Nrd2fNe8Qye7VBQkdgNcwaMOS+N+eCnmjWWFFsBY+Q4j+fEsmy61zC0xzZh6HY0SV3jB
         QiySihYNxSctDE5NLvpMHjtS6DzBiRTPVPZP0KClkbdsmkwi/18ORf3po2paME7s7yiy
         3cYQ==
In-Reply-To: <5617D55D.2040908@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: Oleg Drokin <green@linuxhacker.ru>


--=-1ylDpXwBW9t2wFDUowjI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-09 at 16:55 +0200, Edward Shishkin wrote:

>=20
> On 10/09/2015 03:50 PM, Ivan Shapovalov wrote:

> > On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:

> > > Hi Ivan,
> > >=20
> > > On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:

> > > > Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sou
> > > > rcef
> > > > orge.net/msg02745.html
> > > Do you have a stack trace for reiser4?
> > > How to reproduce it?
> > I'll rebuild the kernel without the fix and provide you with the
> > oops'
> > stacktrace asap.
> >=20
> > I guess that it's tied to the config. In my case, it is
> > reproducible on
> > each boot, just as the DE starts up and something issues the first
> > fsync().
>=20
>=20
> Yes, let's try to find the culprit who doesn't set i_wb...

So, here is the oops:

=3D=3D=3D=3D cut here =3D=3D=3D=3D

<1>[=C2=A0=C2=A0=C2=A0=C2=A08.653781] BUG: unable to handle kernel NULL poi=
nter dereference at 00000000000000a8
<1>[=C2=A0=C2=A0=C2=A0=C2=A08.653808] IP: [<ffffffff8124ba3a>] __percpu_cou=
nter_add+0x1a/0x90
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.653828] PGD 0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.653836] Oops: 0000 [#1] PREEMPT SMP
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.653849] Modules linked in: fuse ctr ccm bnep =
joydev arc4 snd_hda_codec_realtek snd_hda_codec_generic snd_hda_codec_hdmi =
iwlmvm btusb btintel mac80211 bluetooth uvcvideo iTCO_wdt iTCO_vendor_suppo=
rt videobuf2_vmalloc videobuf2_memops videobuf2_core mousedev v4l2_common v=
ideodev x86_pkg_temp_thermal intel_powerclamp coretemp intel_rapl crc32_pcl=
mul sha256_ssse3 crc16 sha256_generic hmac drbg snd_hda_intel iwlwifi snd_h=
da_codec aesni_intel aes_x86_64 ablk_helper snd_hwdep cfg80211 e1000e psmou=
se snd_hda_core cryptd lrw input_leds gf128mul glue_helper i2c_i801 snd_pcm=
 thinkpad_acpi serio_raw pcspkr rtsx_pci_ms memstick mei_me lpc_ich mei snd=
_timer ptp snd pps_core thermal soundcore wmi nvram tpm_tis led_class rfkil=
l tpm battery ac intel_smartconnect evdev processor sch_fq_codel tcp_yeah t=
cp_vegas=C2=A0vboxpci(O) vboxnetflt(O) vboxnetadp(O) vboxdrv(O) nfs fscache=
 lockd grace sunrpc bbswitch(O) efivarfs ip_tables x_tables reiser4 sr_mod =
cdrom sd_mod hid_logitech_hidpp hid_logitech_dj usbhid hid rtsx_pci_sdmmc m=
mc_core i915 ahci libahci crc32c_intel i2c_algo_bit intel_gtt libata ehci_p=
ci xhci_pci drm_kms_helper ehci_hcd xhci_hcd scsi_mod rtsx_pci mfd_core drm=
 usbcore usb_common i2c_core video thermal_sys hwmon button
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654235] CPU: 1 PID: 141 Comm: kworker/u16:3 T=
ainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
O=C2=A0=C2=A0=C2=A0=C2=A04.2.0-pf2-intelfx-00190-gc800b69 #1
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654258] Hardware name: LENOVO 20BEA008RT/20BE=
A008RT, BIOS GMET70WW (2.18 ) 03/05/2015
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654279] Workqueue: writeback wb_workfn (flush=
-8:0)
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654294] task: ffff8800b736c380 ti: ffff88007f=
804000 task.ti: ffff88007f804000
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654311] RIP: 0010:[<ffffffff8124ba3a>]=C2=A0=
=C2=A0[<ffffffff8124ba3a>] __percpu_counter_add+0x1a/0x90
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654333] RSP: 0018:ffff88007f807848=C2=A0=C2=
=A0EFLAGS: 00010082
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654351] RAX: 0000000000000003 RBX: ffffea0008=
9d91c0 RCX: 0000000000000001
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654368] RDX: 0000000000000020 RSI: 0000000000=
000001 RDI: 0000000000000088
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654384] RBP: ffff88007f807868 R08: 0000000000=
000000 R09: ffff88022aeb86b8
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654401] R10: 00000000fffffffa R11: 0000000000=
000000 R12: 0000000000000088
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654417] R13: 0000000000000001 R14: ffff88022c=
b04800 R15: ffff8800bad084a0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654435] FS:=C2=A0=C2=A00000000000000000(0000)=
 GS:ffff88023e240000(0000) knlGS:0000000000000000
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654454] CS:=C2=A0=C2=A00010 DS: 0000 ES: 0000=
 CR0: 0000000080050033
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654467] CR2: 00000000000000a8 CR3: 0000000001=
80b000 CR4: 00000000001406e0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654484] Stack:
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654490]=C2=A0=C2=A0ffff880234938000 ffffea000=
89d91c0 ffff8800bad08600 ffff8800bad08618
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654511]=C2=A0=C2=A0ffff88007f8078c8 ffffffff8=
10f3e59 ffff88007f807908 0000000000000292
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654532]=C2=A0=C2=A00000000000000000 ffff88007=
f908198 ffff8800b5ec23c0 ffff8800b5ec23c0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654554] Call Trace:
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654563]=C2=A0=C2=A0[<ffffffff810f3e59>] __tes=
t_set_page_writeback+0xd9/0x1c0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654586]=C2=A0=C2=A0[<ffffffffc03a5ad0>] write=
_jnodes_to_disk_extent+0x1b0/0x460 [reiser4]
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654606]=C2=A0=C2=A0[<ffffffffc03a6003>] write=
_jnode_list+0x83/0xc0 [reiser4]
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654626]=C2=A0=C2=A0[<ffffffffc03aabf8>] reise=
r4_write_fq+0x78/0x1c0 [reiser4]
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654644]=C2=A0=C2=A0[<ffffffffc03a540a>] flush=
_current_atom+0x3ba/0x850 [reiser4]
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654663]=C2=A0=C2=A0[<ffffffffc039f53a>] ? txn=
h_get_atom+0x2a/0x90 [reiser4]
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654682]=C2=A0=C2=A0[<ffffffffc03a0e1c>] flush=
_some_atom+0x10c/0x4d0 [reiser4]
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654700]=C2=A0=C2=A0[<ffffffffc03afc9e>] reise=
r4_writeout+0x14e/0x240 [reiser4]
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654719]=C2=A0=C2=A0[<ffffffffc03abeec>] reise=
r4_writeback_inodes+0x9c/0x130 [reiser4]
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654738]=C2=A0=C2=A0[<ffffffff81226c53>] ? fpr=
op_fraction_percpu+0x33/0x90
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654754]=C2=A0=C2=A0[<ffffffff8117a999>] write=
back_sb_inodes+0x99/0xc0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654769]=C2=A0=C2=A0[<ffffffff8117aa47>] __wri=
teback_inodes_wb+0x87/0xb0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654784]=C2=A0=C2=A0[<ffffffff8117ac1b>] wb_wr=
iteback+0x1ab/0x1d0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654797]=C2=A0=C2=A0[<ffffffff8117ad3a>] wb_wo=
rkfn+0xfa/0x380
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654811]=C2=A0=C2=A0[<ffffffff8106eaa8>] ? try=
_to_wake_up+0x268/0x420
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654827]=C2=A0=C2=A0[<ffffffff81063366>] proce=
ss_one_work+0x126/0x3c0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654841]=C2=A0=C2=A0[<ffffffff81063643>] worke=
r_thread+0x43/0x4a0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654855]=C2=A0=C2=A0[<ffffffff81063600>] ? pro=
cess_one_work+0x3c0/0x3c0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654871]=C2=A0=C2=A0[<ffffffff81068ea3>] kthre=
ad+0xd3/0xf0
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654884]=C2=A0=C2=A0[<ffffffff81068dd0>] ? kth=
read_worker_fn+0x160/0x160
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654901]=C2=A0=C2=A0[<ffffffff814641df>] ret_f=
rom_fork+0x3f/0x70
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654916]=C2=A0=C2=A0[<ffffffff81068dd0>] ? kth=
read_worker_fn+0x160/0x160
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.654930] Code: c3 b8 ff ff ff ff c3 66 2e 0f 1=
f 84 00 00 00 00 00 55 48 89 e5 41 55 49 89 f5 41 54 49 89 fc 53 48 83 ec 0=
8 65 ff 05 d6 ee db 7e <48> 8b 47 20 48 63 ca 65 8b 18 48 63 db 48 01 f3 48=
 39 cb 7d 0a
<1>[=C2=A0=C2=A0=C2=A0=C2=A08.655040] RIP=C2=A0=C2=A0[<ffffffff8124ba3a>] _=
_percpu_counter_add+0x1a/0x90
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.655058]=C2=A0=C2=A0RSP <ffff88007f807848>
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.655067] CR2: 00000000000000a8
<4>[=C2=A0=C2=A0=C2=A0=C2=A08.655077] ---[ end trace 3db0fa7adb9580c7 ]---

=3D=3D=3D=3D cut here =3D=3D=3D=3D

--=20
Ivan Shapovalov / intelfx /


--=-1ylDpXwBW9t2wFDUowjI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYX57IACgkQxUKljSIMAnD37AD+JovaRj9pA2IQ+b+t3hXM4C/N
IsM++oT89HyjjIY3gPIA/RH5cn6pyjTOWmimO3fqXzxOfD9xk8WPboOsNtNqrE4M
=hbzu
-----END PGP SIGNATURE-----

--=-1ylDpXwBW9t2wFDUowjI--

