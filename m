From: Garrick Staples <garrick@usc.edu>
Subject: BUG in journal_mark_dirty on 2.6.7/ia64
Date: Tue, 17 Aug 2004 12:14:28 -0700
Message-ID: <20040817191428.GP2136@polop.usc.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="evx3vguvXs42LIaH"
Return-path: <reiserfs-list-return-20357-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--evx3vguvXs42LIaH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,
   I'm currently not subscribed (the list daemon isn't replying to my subsc=
ribe
attempts), so please CC me on replies.

I got a kernel panic on one of my ia64 servers last night.  It's an NFS ser=
ver
for about 1000 clients and ~10 terabytes of data and has been running great
since 2.6.7 was released (Jun 15).  Last week it was rebooted to pull out an
unused scsi raid card.

Last night I got the panic message below, which caused one of my LVM LVs to
lock up.  Please let me know what other info you need.

reiserfsprogs 3.6.11



 REISERFS: panic (device dm-29): journal-1413: journal_mark_dirty: j_len (1=
024)
is too big
                   =20
 kernel BUG at fs/reiserfs/prints.c:362!
 nfsd[1820]: bugcheck! 0 [1]
 Modules linked in: nfs reiserfs dm_mod qla2300 qla2xxx nfsd exportfs lockd
sunrpc ipv6 e1000 e100 tg3 nls_iso885
9_1 nls_cp437 vfat fat nls_base ohci_hcd usbcore
                   =20
 Pid: 1820, CPU 1, comm:                 nfsd
 psr : 0000101008026018 ifs : 800000000000058e ip  : [<a00000020061e110>]
Tainted: GF
 ip is at reiserfs_panic+0xf0/0x100 [reiserfs]
 unat: 0000000000000000 pfs : 000000000000058e rsc : 0000000000000003
 rnat: 0009804c8a70433f bsps: 0000000000000514 pr  : 5a40015000699a55
 ldrs: 0000000000000000 ccv : 0000000000000000 fpsr: 0009804c8a70433f
 csd : 0000000000000000 ssd : 0000000000000000
 b0  : a00000020061e110 b6  : a000000200325330 b7  : a00000010008a8c0
 f6  : 1003e0000000000000002 f7  : 0ffdd8000000000000000
 f8  : 0ffffffffc00000000000 f9  : 100018000000000000000
 f10 : 1003e0000000000000000 f11 : 1003e0000000000000000
 r1  : a0000001009a4970 r2  : 0000000000004000 r3  : 0000000000004000
 r8  : 0000000000000028 r9  : ffffffffffff45b8 r10 : e0000001ff0a8e84
 r11 : a0000001007bc200 r12 : e0000001ff0afa20 r13 : e0000001ff0a8000
 r14 : 0000000000004000 r15 : a0000001006f73e8 r16 : e000004041e58e28
 r17 : e000004041e58e84 r18 : a0000001007bc1f8 r19 : 0000001008022018
 r20 : e0000001ff0af9e0 r21 : 0000000000000000 r22 : 0000000000000001
 r23 : e000004041e58e84 r24 : e000004041e58e70 r25 : a0000001007bc1f8
 r26 : e000004041e58078 r27 : 0000000000000000 r28 : a000000100084c10
 r29 : a000000100801d84 r30 : 0000000000000000 r31 : e0000001000145b8
                   =20
 Call Trace:
  [<a000000100019420>] show_stack+0x80/0xa0
                                 sp=3De0000001ff0af5f0 bsp=3De0000001ff0a95=
d0
  [<a00000010003f810>] die+0x1d0/0x280
                                 sp=3De0000001ff0af7c0 bsp=3De0000001ff0a95=
a8
  [<a00000010003fb50>] ia64_bad_break+0x230/0x340
                                 sp=3De0000001ff0af7c0 bsp=3De0000001ff0a95=
88
  [<a000000100012180>] ia64_leave_kernel+0x0/0x260
                                 sp=3De0000001ff0af850 bsp=3De0000001ff0a95=
88
  [<a00000020061e110>] reiserfs_panic+0xf0/0x100 [reiserfs]
                                 sp=3De0000001ff0afa20 bsp=3De0000001ff0a95=
18
  [<a0000002006468c0>] journal_mark_dirty+0x2e0/0x740 [reiserfs]
                                 sp=3De0000001ff0afa50 bsp=3De0000001ff0a94=
d8
  [<a0000002005e39b0>] _reiserfs_free_block+0x2f0/0x4a0 [reiserfs]
                                 sp=3De0000001ff0afa50 bsp=3De0000001ff0a94=
60
  [<a0000002006303d0>] prepare_for_delete_or_cut+0x970/0x1400 [reiserfs]
                                 sp=3De0000001ff0afa50 bsp=3De0000001ff0a93=
a8
  [<a000000200633110>] reiserfs_cut_from_item+0xd0/0xc20 [reiserfs]
                                 sp=3De0000001ff0afa70 bsp=3De0000001ff0a93=
20
  [<a000000200634610>] reiserfs_do_truncate+0x730/0xc20 [reiserfs]
                                 sp=3De0000001ff0afd20 bsp=3De0000001ff0a92=
58
  [<a0000002006329c0>] reiserfs_delete_object+0x40/0xe0 [reiserfs]
                                 sp=3De0000001ff0afdc0 bsp=3De0000001ff0a92=
20
  [<a0000002005f6210>] reiserfs_delete_inode+0x2f0/0x460 [reiserfs]
                                 sp=3De0000001ff0afdc0 bsp=3De0000001ff0a91=
e8
  [<a000000100165060>] generic_delete_inode+0x1e0/0x3a0
                                 sp=3De0000001ff0afdf0 bsp=3De0000001ff0a91=
b8
  [<a000000100165730>] iput+0x130/0x1e0
                                 sp=3De0000001ff0afdf0 bsp=3De0000001ff0a91=
98
  [<a000000100160760>] d_delete+0x260/0x2c0
                                 sp=3De0000001ff0afdf0 bsp=3De0000001ff0a91=
78
  [<a00000010014c960>] vfs_unlink+0x280/0x5c0
                                 sp=3De0000001ff0afdf0 bsp=3De0000001ff0a91=
40
  [<a000000200370ec0>] nfsd_unlink+0x2a0/0x640 [nfsd]
                                 sp=3De0000001ff0afdf0 bsp=3De0000001ff0a90=
f0
  [<a000000200381010>] nfsd3_proc_remove+0x150/0x1c0 [nfsd]
                                 sp=3De0000001ff0afdf0 bsp=3De0000001ff0a90=
a8
  [<a000000200363030>] nfsd_dispatch+0x290/0x540 [nfsd]
                                 sp=3De0000001ff0afdf0 bsp=3De0000001ff0a90=
58
  [<a00000020031fde0>] svc_process+0x10a0/0x1380 [sunrpc]
                                 sp=3De0000001ff0afdf0 bsp=3De0000001ff0a8f=
e8
  [<a0000002003628e0>] nfsd+0x500/0x9c0 [nfsd]
                                 sp=3De0000001ff0afe00 bsp=3De0000001ff0a8e=
e8
  [<a00000010001b380>] kernel_thread_helper+0xe0/0x100
                                 sp=3De0000001ff0afe30 bsp=3De0000001ff0a8e=
c0
  [<a000000100009080>] start_kernel_thread+0x20/0x40
                                 sp=3De0000001ff0afe30 bsp=3De0000001ff0a8e=
c0

And then at boot, a minor message about dm-29:

kernel: ReiserFS: dm-29: found reiserfs format "3.6" with standard journal
kernel: ReiserFS: dm-29: using ordered data mode
kernel: ReiserFS: dm-29: journal params: device dm-29, size 8192, journal f=
irst block 18, max trans len 1024, max batch 900, max commit age 30, max tr=
ans age 30
kernel: ReiserFS: dm-29: checking transaction log (dm-29)
kernel: ReiserFS: dm-29: replayed 274 transactions in 2 seconds
kernel: ReiserFS: dm-29: Using r5 hash to sort names
kernel: ReiserFS: dm-29: Removing [1795252 1802799 0x0 SD]..done
kernel: ReiserFS: dm-29: There were 1 uncompleted unlinks/truncates. Comple=
ted


--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--evx3vguvXs42LIaH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBIlkU0SBUxJbm9HMRAh+fAKClH5sRwYAQtUqoElGWkZ+w8bbjOwCfSGwS
zVpSRQ3EkEZzI29ehoELXYM=
=pqQw
-----END PGP SIGNATURE-----

--evx3vguvXs42LIaH--
