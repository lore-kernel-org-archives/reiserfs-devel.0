From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Reiser4 oops on cat ./..plugin/..readdir
Date: Thu, 26 Feb 2004 18:34:41 -0700
Message-ID: <1077845680.6801.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-plgDQbAkxhHzMFuQQC5q"
Return-path: <reiserfs-list-return-16949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--=-plgDQbAkxhHzMFuQQC5q
Content-Type: multipart/mixed; boundary="=-JHd/w/i1KIyRoWcZU/A0"


--=-JHd/w/i1KIyRoWcZU/A0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Filesystem is on a RAID 0 MD device.
Config is attached.
Kernel compiled with:

# gcc34 --version
gcc34 (GCC) 3.4.0 20040129 (Red Hat Linux 3.4.0-0.3)
Copyright (C) 2004 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Problem Description:
A clean, fresh boot into single user mode, no tainted modules:
# cd /home
# cat ./..plugin/..readdir
Oops: 0000 [#1]
CPU:    0
EIP:    0060:[<00000000>]    Not tainted
EFLAGS: 00010286
EIP is at 0x0
eax: df2dfe58   ebx: 00000000   ecx: df287140   edx: c03967f0
esi: c1720280   edi: df2dfe68   ebp: df2dfee4   esp: df2dfe28
ds: 007b   es: 007b   ss: 0068
Process cat (pid: 5389, threadinfo=3Ddf2de000 task=3Ddfd3a0c0)
Stack: c02031f4 df287140 df2dfe58 df2dfe68 00000000 00000001 df2de000 00000=
296
       00000000 df2de000 c013f934 df287140 c036eefd 00000001 dffec150 dffef=
80c
       00000001 000000d0 dffef814 000000d0 dffef800 dffef800 00000286 df4ed=
300
Call Trace:
 [<c02031f4>] readdir_start+0x64/0x1a0
 [<c013f934>] cache_alloc_refill+0x4e4/0x560
 [<c01753b8>] seq_read+0x178/0x310
 [<c01ddb0f>] reiser4_read+0x8f/0xf0
 [<c01562ca>] vfs_read+0x10a/0x150
 [<c0156582>] sys_read+0x42/0x70
 [<c0108249>] sysenter_past_esp+0x52/0x71
                                                                           =
    =20
Code:  Bad EIP value.

Another one, while in GUI running Nvidia drivers and VMware modules:
# cat ./..plugin/..readdir
Segmentation fault

Oops: 0000 [#1]
CPU:    0
EIP:    0060:[<00000000>]    Tainted: PF
EFLAGS: 00010286
EIP is at 0x0
eax: c375de58   ebx: 00000000   ecx: cc6d3e00   edx: c03967f0
esi: d3611c40   edi: c375de68   ebp: c375dee4   esp: c375de28
ds: 007b   es: 007b   ss: 0068
Process cat (pid: 9365, threadinfo=3Dc375c000 task=3Dc907a080)
Stack: c02031f4 cc6d3e00 c375de58 c375de68 00000000 00000202 00000000 c0390=
e74
       c0390e74 0000015f d5693174 cc6d3e00 c036eefd 00000001 c375de5c c375d=
ef0
       00000000 00000000 c907a080 00000010 c03910bc 00000000 000000d2 00000=
000
Call Trace:
 [<c02031f4>] readdir_start+0x64/0x1a0
 [<c01753b8>] seq_read+0x178/0x310
 [<c01ddb0f>] reiser4_read+0x8f/0xf0
 [<c01562ca>] vfs_read+0x10a/0x150
 [<c0156582>] sys_read+0x42/0x70
 [<c0108249>] sysenter_past_esp+0x52/0x71
=20
Code:  Bad EIP value.

# lsmod
Module                  Size  Used by
vmnet                  26768  -
vmmon                  88245  -
usbnet                 26824  -
snd_pcm_oss            47460  -
snd_mixer_oss          16096  -
nfs                   100848  -
lockd                  57608  -
sunrpc                119048  -
ide_cd                 35172  -
cdrom                  34464  -
agpgart                23720  -
via_rhine              17512  -
mii                     4032  -
nvidia               2070312  -
it87                   19592  -
i2c_sensor              2080  -
i2c_isa                 1472  -
i2c_core               17764  -
parport_pc             29372  -
lp                      9384  -
parport                36136  -
snd_intel8x0           26372  -
snd_ac97_codec         58788  -
snd_pcm                86084  -
snd_timer              20580  -
snd_page_alloc          8580  -
snd_mpu401_uart         5824  -
snd_rawmidi            19488  -
snd                    43172  -
soundcore               6400  -
md5                     3584  -
ipv6                  228288  -
autofs4                12896  -
sis900                 17060  -
crc32                   3680  -
iptable_filter          1856  -
ip_tables              16640  -
hid                    23296  -
ehci_hcd               32068  -
uhci_hcd               28076  -
usbcore                96284  -


--=20
Jonathan Briggs
jbriggs@esoft.com

--=-JHd/w/i1KIyRoWcZU/A0
Content-Disposition: attachment; filename=config.gz
Content-Type: application/x-gzip; name=config.gz
Content-Transfer-Encoding: base64

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
0Z95+x8I12B2C3EAAA==

--=-JHd/w/i1KIyRoWcZU/A0--

--=-plgDQbAkxhHzMFuQQC5q
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAPp6wG8fHaOLTWwgRAkMMAJ41CPrRlm2krQ2rQmF7M/djBSUQlACgp0iC
sh47VEzpFitKXJhOD/Cv8Lg=
=x5lG
-----END PGP SIGNATURE-----

--=-plgDQbAkxhHzMFuQQC5q--

