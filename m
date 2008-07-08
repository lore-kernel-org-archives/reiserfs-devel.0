From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: PROBLEM: "BUG" and hang with reiserfs, ACLs
Date: Tue, 08 Jul 2008 15:47:36 -0400
Message-ID: <4873C458.9070305@suse.com>
References: <1215544656.2307.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1215544656.2307.23.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Matt McCutchen <matt@mattmccutchen.net>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matt McCutchen wrote:
> When I run the rsync 3.0.3 test suite on a newly created reiserfs
> filesystem mounted with ACLs enabled, I get a kernel BUG (stack trace
> below) and all processes accessing the filesystem hang.  This happens
> often but not on every single run of the test suite.  When I reboot,
> reiserfsck reports no corruption on the filesystem after replaying th=
e
> journal.
>=20
> The filesystem is in an LVM logical volume where the physical volume =
is
> LUKS-encrypted, in case that matters.  The problem does not occur if
> ACLs are disabled, in which case the test suite skips some ACL-relate=
d
> tests.
>=20
> I don't know what the rsync test suite is doing to trigger the proble=
m.
> Nothing else that I do on my computer does.  I tried running the test
> suite under strace but could not reproduce the problem; possibly it i=
s
> timing-dependent.
>=20
> =EF=BB=BFI can reproduce the problem with the recent vanilla kernel
> v2.6.26-rc9-29-gb2798bf but not with 2.6.24.  Bisection points to
> 3227e14c as the commit that introduced the problem.  I used
> Fedora-derived kernel configurations for all tests.

Hi Matt -

Can you try to reproduce with the patch I posted this afternoon? The
subject is "[PATCH] reiserfs: discard prealloc in
reiserfs_delete_inode." I have another one, but I'm not sure if it's
actually needed.

- -Jeff

> To reproduce the problem, run the following on a newly created reiser=
fs
> filesystem with ACLs enabled:
>=20
> git clone git://git.samba.org/rsync.git
> cd rsync && ./configure && make test
>=20
> The stack trace:
>=20
> BUG: unable to handle kernel paging request at f3f40378
> IP: [<c05091b1>] __list_add+0x6/0x4a
> *pde =3D 347f2163 *pte =3D 33f40160=20
> Oops: 0000 [#1] SMP DEBUG_PAGEALLOC
> Modules linked in: ipv6 cpufreq_ondemand acpi_cpufreq nls_utf8 fuse e=
xt2 mbcache loop arc4 ecb iwl3945 snd_hda_intel mac80211 snd_seq_dummy =
sr_mod snd_seq_oss dcdbas i2c_i801 joydev snd_seq_midi_event cdrom i2c_=
core iTCO_wdt tg3 snd_seq iTCO_vendor_support cfg80211 video snd_seq_de=
vice snd_pcm_oss output snd_mixer_oss snd_pcm snd_timer snd_page_alloc =
snd_hwdep snd soundcore wmi battery ac usb_storage pata_acpi ata_generi=
c ata_piix xts gf128mul aes_i586 aes_generic dm_crypt crypto_blkcipher =
dm_snapshot dm_zero dm_mirror dm_log dm_mod reiserfs uhci_hcd ohci_hcd =
ehci_hcd
>=20
> Pid: 15276, comm: sh Not tainted (2.6.26-rc9 #1)
> EIP: 0060:[<c05091b1>] EFLAGS: 00010286 CPU: 0
> EIP is at __list_add+0x6/0x4a
> EAX: f3fc0374 EBX: f3fc0374 ECX: f3f40374 EDX: f8c33180
> ESI: f4bebc10 EDI: 00008fd8 EBP: f4beba80 ESP: f4beba7c
>  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
> Process sh (pid: 15276, ti=3Df4beb000 task=3Df7a017e0 task.ti=3Df4beb=
000)
> Stack: 00000006 f4beba88 c05091ff f4bebb40 f88a26d8 00008000 00001000=
 00000000=20
>        00000000 00000000 00000000 f8c23044 f8c23044 00000286 00000001=
 f4bebc84=20
>        f6fb94f0 f3fc0403 f4bebb44 f4bebb44 f88b8935 00000001 00000011=
 f53e9000=20
> Call Trace:
>  [<c05091ff>] ? list_add+0xa/0xf
>  [<f88a26d8>] ? reiserfs_allocate_blocknrs+0x998/0xa90 [reiserfs]
>  [<f88b8935>] ? search_for_position_by_key+0x14f/0x2bf [reiserfs]
>  [<f88aaac8>] ? reiserfs_get_block+0x480/0x1104 [reiserfs]
>  [<c06680ed>] ? _spin_unlock+0x1d/0x20
>  [<c04ac128>] ? __block_prepare_write+0x147/0x344
>  [<c04ac49d>] ? block_write_begin+0x72/0xca
>  [<f88aa648>] ? reiserfs_get_block+0x0/0x1104 [reiserfs]
>  [<f88a85b6>] ? reiserfs_write_begin+0x115/0x188 [reiserfs]
>  [<f88aa648>] ? reiserfs_get_block+0x0/0x1104 [reiserfs]
>  [<c046c06e>] ? generic_file_buffered_write+0xd9/0x50b
>  [<c04a1275>] ? mnt_drop_write+0x1e/0xc2
>  [<c046ca99>] ? __generic_file_aio_write_nolock+0x3e6/0x41e
>  [<c0666bf7>] ? mutex_lock_nested+0x269/0x271
>  [<c046cb3a>] ? generic_file_aio_write+0x69/0xbd
>  [<c048cd18>] ? do_sync_write+0xab/0xe9
>  [<c043ba77>] ? autoremove_wake_function+0x0/0x33
>  [<f88ac867>] ? reiserfs_file_write+0x6e/0x77 [reiserfs]
>  [<f88ac7f9>] ? reiserfs_file_write+0x0/0x77 [reiserfs]
>  [<c048d59b>] ? vfs_write+0x8a/0x12e
>  [<c048d6d8>] ? sys_write+0x3b/0x60
>  [<c0404a4b>] ? sysenter_past_esp+0x78/0xd1
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Code: 72 c0 e8 ef 2f 16 00 0f 0b 83 c4 0c eb fe 89 58 04 89 03 c7 42 =
04 00 02 20 00 c7 02 00 01 10 00 8b 5d fc c9 c3 55 89 e5 53 89 c3 <8b> =
41 04 39 d0 74 14 51 50 52 68 04 c0 72 c0 e8 b7 2f 16 00 0f=20
> EIP: [<c05091b1>] __list_add+0x6/0x4a SS:ESP 0068:f4beba7c
> ---[ end trace eb0099a3ced003a3 ]---
>=20
> =EF=BB=BFI have posted all the files mentioned in linux/REPORTING-BUG=
S,
> including full dmesg output, at:
>=20
> http://mattmccutchen.net/private/reiserfs-bug/
>=20
> =EF=BB=BFI previously opened a Fedora bug for this problem at:
>=20
> https://bugzilla.redhat.com/show_bug.cgi?id=3D453699
>=20
> Keywords: reiserfs, ACLs
>=20
> Regards,
> Matt


- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkhzxFgACgkQLPWxlyuTD7JrfACgjXR3B5T9beOpU9EmMtm9VN4q
nN4An1QB4vuUDC5x/ja0omJ0HixPhK+f
=3D0h0z
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
