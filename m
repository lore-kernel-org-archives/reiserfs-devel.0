From: Jonathan Briggs <jbriggs@esoft.com>
Subject: What did I do wrong?  Oopses with 7-30 auto-snapshot
Date: Fri, 30 Jul 2004 16:30:40 -0600
Message-ID: <1091226640.3426.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-kdCDO79K6eDIxmLyPioK"
Return-path: <reiserfs-list-return-19881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--=-kdCDO79K6eDIxmLyPioK
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I wanted to try out the latest even though I know it may not work.
Either it doesn't work, or I did it wrong.  I was hoping someone would
know which.

I've got a raid-0 device with a Reiser4 FS from March.  When I tried to
mount that after booting 2.6.8-rc2-mm1-reiser4 I got an Oops.  I thought
it might be a change in the disk structure so I got the latest (I think)
reiser4 tools and tried creating a new FS and loop mounting it.  That
got me another, identical Oops.

Here it is if anyone wants to look:
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
4
 printing eip:
c01b0df4
*pde =3D 00000000
Oops: 0000 [#1]
Modules linked in: joydev evdev usbhid dm_mod ehci_hcd uhci_hcd usbcore
CPU:    0
EIP:    0060:[<c01b0df4>]    Not tainted VLI
EFLAGS: 00010286   (2.6.8-rc2-mm1)
EIP is at clog_link_object+0x64/0xe0
eax: 00000000   ebx: 00000000   ecx: c046d964   edx: c16e9dec
esi: defa8d60   edi: c16e9dec   ebp: c16e9b08   esp: c16e9b04
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 1523, threadinfo=3Dc16e8000 task=3Ddf936bf0)
Stack: c16e9c08 c16e9dec c01b7450 00000008 defa8d60 00000001 00000000 00000=
000
       defa8d60 c01b7789 c16e9dec defa8d60 c16e9dec 00000000 defa8d60 c01b7=
81a
       c16e9dec 00000000 00000000 00000001 00000000 c16e9dec defa8dc0 c01b7=
a9d
Call Trace:
 [<c01b7450>] lock_object+0x50/0x90
 [<c01b7789>] lock_tail+0x59/0x70
 [<c01b781a>] longterm_lock_tryfast+0x7a/0xa0
 [<c01b7a9d>] longterm_lock_znode+0x25d/0x280
 [<c01f6081>] try_init_format40+0x311/0x3a0
 [<c01c66de>] traverse_tree+0x22e/0x290
 [<c01c5de7>] coord_by_key+0xb7/0xd0
 [<c01d5cf6>] lookup_sd+0x76/0xb0
 [<c01cc035>] read_inode+0x55/0x130
 [<c01cc320>] reiser4_iget+0xf0/0x150
 [<c01cc110>] init_locked_inode+0x0/0x60
 [<c01d4683>] _init_fs_root+0x33/0x110
 [<c01f1b32>] d_cursor_init_at+0x52/0xa0
 [<c01d485b>] reiser4_fill_super+0x3b/0xa0
 [<c015509e>] sb_set_blocksize+0x2e/0x60
 [<c0154abd>] get_sb_bdev+0x11d/0x150
 [<c01aca50>] journal_end+0xa0/0xc0
 [<c01cdf7f>] reiser4_get_sb+0x2f/0x40
 [<c01d4820>] reiser4_fill_super+0x0/0xa0
 [<c0154d07>] do_kern_mount+0x57/0xe0
 [<c0168c7c>] do_new_mount+0x9c/0xf0
 [<c0169207>] do_mount+0x147/0x1a0
 [<c0169063>] copy_mount_options+0x63/0xc0
 [<c01695c0>] sys_mount+0xa0/0x100
 [<c0103fa9>] sysenter_past_esp+0x52/0x71
Code: 8b 64 d9 46 c0 8b 55 00 89 83 68 d9 46 c0 b8 00 e0 ff ff 21 e0 8b 00 =
8b 80 88 00 00 00 89 83 64 d9 46 c0 8b 42 04 89 41 10 8b 02 <8b> 40 04 89 4=
1 14 8b 02 8b 00 8b 40 04 89 41 18 8b 02 8b
00 8b


--=20
Jonathan Briggs
jbriggs@esoft.com


--=-kdCDO79K6eDIxmLyPioK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBCswPG8fHaOLTWwgRAiLDAJsEnQgKHkiarxf6s9ZVvc8XyOmr6gCgoW6y
y+S+LlGD4flQSE4iCRV366s=
=3h5Q
-----END PGP SIGNATURE-----

--=-kdCDO79K6eDIxmLyPioK--

