From: Sebastian Held <sebastian.held@gmx.de>
Subject: BUG in reiserfs4 using SuSE-kernel
Date: Fri, 2 Sep 2005 11:15:16 +0200
Message-ID: <200509021115.20718.sebastian.held@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart9389362.u9s9ItvaD2";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart9389362.u9s9ItvaD2
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

The following message appeared in the kernel ring buffer after turning off =
my=20
external hard disk connected by usb2 (note: I forget to umount it, but shou=
ld=20
reiserfs abort this way?)

SuSE kernel version: (uname -a) Linux laptop 2.6.11.4-21.9-default #1 Fri A=
ug=20
19 11:58:59 UTC 2005 i686 i686 i386 GNU/Linux
dmesg output:

usb 4-3: USB disconnect, address 4
scsi2 (0:0): rejecting I/O to device being removed
scsi2 (0:0): rejecting I/O to device being removed
scsi2 (0:0): rejecting I/O to device being removed
scsi2 (0:0): rejecting I/O to device being removed
scsi2 (0:0): rejecting I/O to device being removed
reiser4[khubd(2626)]: reiser4_handle_error (fs/reiser4/vfs_ops.c:1432)
[foobar-42]:
reiser4 panicked cowardly: Filesystem error occured

=2D-----------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:131!
invalid operand: 0000 [#1]
Modules linked in: reiser4 nls_iso8859_1 nls_cp437 vfat fat appletalk ax25 =
ipx=20
subfs usbserial nvram ipv6 snd_pcm_oss ppp_generic snd_mixer_oss slhc=20
michael_mic ieee80211_crypt_tkip af_packet arc4 pcmcia edd joydev sg st=20
sr_mod usb_storage evdev battery ac ieee80211_crypt_wep nls_utf8 ntfs ipw21=
00=20
firmware_class ieee80211 sd_mod scsi_mod ieee80211_crypt ohci1394 ieee1394=
=20
yenta_socket rsrc_nonstatic pcmcia_core snd_intel8x0 8139too snd_ac97_codec=
=20
ehci_hcd mii snd_pcm snd_timer snd uhci_hcd soundcore usbcore snd_page_allo=
c=20
intel_agp hw_random agpgart dm_mod parport_pc lp parport reiserfs ide_cd=20
cdrom ide_disk piix ide_core
CPU:    0
EIP:    0060:[<e147400d>]    Tainted: G     U VLI
EFLAGS: 00010246   (2.6.11.4-21.9-default)
EIP is at reiser4_do_panic+0xd/0xb0 [reiser4]
eax: 00000000   ebx: d38c5000   ecx: 00000000   edx: 00000000
esi: 00000005   edi: 00000000   ebp: d38c5000   esp: deb0fc60
ds: 007b   es: 007b   ss: 0068
Process khubd (pid: 2626, threadinfo=3Ddeb0e000 task=3Ddee39aa0)
Stack: e148c2d3 e14b5344 ca4e4480 e1487c75 cc0595c0 00000000 00000000 e1487=
c9e
       00000005 ca4e4480 e148438c cc0595c0 deb0fd14 cc059638 00000003 c2937=
db0
       c5a75cb0 00000002 042291ea 00000000 00063012 00000000 00073012 00000=
000
Call Trace:
 [<e148c2d3>] reiser4_handle_error+0x93/0xa0 [reiser4]
 [<e1487c75>] finish_all_fq+0x75/0x80 [reiser4]
 [<e1487c9e>] current_atom_finish_all_fq+0x1e/0x50 [reiser4]
 [<e148438c>] reiser4_write_logs+0x16c/0x240 [reiser4]
 [<e147e456>] commit_current_atom+0xe6/0x180 [reiser4]
 [<e147eab4>] try_commit_txnh+0x104/0x180 [reiser4]
 [<e147eb5f>] commit_txnh+0x2f/0xa0 [reiser4]
 [<e147de1e>] txn_end+0x2e/0x40 [reiser4]
 [<e147de38>] txn_restart+0x8/0x20 [reiser4]
 [<e147e508>] force_commit_atom_nolock+0x18/0x20 [reiser4]
 [<e147e5de>] txnmgr_force_commit_all+0x9e/0xb0 [reiser4]
 [<e148b08f>] writeout+0x1f/0xb0 [reiser4]
 [<e148b14c>] reiser4_sync_inodes+0x2c/0x50 [reiser4]
 [<c013e317>] pagevec_lookup+0x17/0x20
 [<e148b120>] reiser4_sync_inodes+0x0/0x50 [reiser4]
 [<c016f8f9>] sync_sb_inodes+0x19/0x20
 [<c016f9f3>] sync_inodes_sb+0x63/0x70
 [<c0167fe6>] iget5_locked+0x76/0xd0
 [<c015235a>] fsync_super+0xa/0xc0
 [<c0152424>] fsync_bdev+0x14/0x30
 [<c0167855>] __invalidate_device+0x45/0x50
 [<c023e766>] invalidate_partition+0x26/0x34
 [<c01820c9>] del_gendisk+0x19/0xc0
 [<e126d10f>] sd_remove+0xf/0x40 [sd_mod]
 [<c02352d7>] device_release_driver+0x57/0x60
 [<c02354e4>] bus_remove_device+0x54/0x90
 [<c0234592>] device_del+0x52/0xa0
 [<e1294838>] scsi_remove_device+0x38/0x80 [scsi_mod]
 [<e1293bcf>] scsi_forget_host+0x1f/0x40 [scsi_mod]
 [<e128d069>] scsi_remove_host+0x9/0x50 [scsi_mod]
 [<e13b76b0>] storage_disconnect+0x70/0x87 [usb_storage]
 [<e11630e4>] usb_unbind_interface+0x64/0x70 [usbcore]
 [<c02352d7>] device_release_driver+0x57/0x60
 [<c02354e4>] bus_remove_device+0x54/0x90
 [<c0234592>] device_del+0x52/0xa0
 [<e1169269>] usb_disable_device+0xe9/0x100 [usbcore]
 [<e1164f6d>] usb_disconnect+0x8d/0x110 [usbcore]
 [<e1165f10>] hub_port_connect_change+0x210/0x330 [usbcore]
 [<e1166195>] hub_events+0x165/0x310 [usbcore]
 [<e1166375>] hub_thread+0x35/0x110 [usbcore]
 [<c012aec0>] autoremove_wake_function+0x0/0x30
 [<c0102b96>] ret_from_fork+0x6/0x20
 [<c012aec0>] autoremove_wake_function+0x0/0x30
 [<e1166340>] hub_thread+0x0/0x110 [usbcore]
 [<c010129d>] kernel_thread_helper+0x5/0x18
Code:  Bad EIP value.


Maybe someone can do something with this report!?

Bye,
Sebastian Held

--nextPart9389362.u9s9ItvaD2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBDGBgoJy9Hpu7sRnoRAvu5AKC/E51+uvGTfa1rxaGN7b3X/0TevwCg5UNJ
w7QmYKLrzw9vQUhgZyHlavo=
=nMEq
-----END PGP SIGNATURE-----

--nextPart9389362.u9s9ItvaD2--
