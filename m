From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Bug report: Reiser4 freezes during file copy
Date: Wed, 18 Feb 2004 11:13:14 -0700
Message-ID: <1077127993.7063.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-LXa01nwFDVu+bKD6sjs8"
Return-path: <reiserfs-list-return-16834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>
Cc: Nikita Danilov <Nikita@Namesys.COM>

--=-LXa01nwFDVu+bKD6sjs8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The software:
Linux kernel 2.6.3 with Reiser4 patch dated February 6th.
Compiled with gcc 3.4.0 20040129
(I know the GCC is still in testing, but Reiser3 works fine with it,
so...)

After I'd created a new Reiser4 filesystem, I was copying my backup
files onto it.  While I was doing that, it just stopped.

Here is the cp process from a process dump:
cp            D C83F583C     0 20232  20159                     (NOTLB)
c83f57b4 00200082 dd505014 c83f583c c83f58ec 00000002 00000000 00000002
       00000002 00000002 00072f8f 972dc381 000021ec d0ffad00 d0ffaec0 c83f5=
f0c
       00200292 c83f4000 d0ffad00 c010714b c83f5f14 00000001 d0ffad00 c011c=
620
Call Trace:
 [<c010714b>] __down+0x7b/0x110
 [<c011c620>] default_wake_function+0x0/0x20
 [<c01f6356>] extent_size+0x96/0xa0
 [<c0107088>] __down_failed+0x8/0xc
 [<c01c2f9b>] .text.lock.lock+0xf/0x14
 [<c01c90e7>] atom_wait_event+0x57/0x80
 [<c01ea84f>] plugin_by_coord_node40+0x2f/0x40
 [<c01d5dd8>] write_fq+0x18/0x1d0
 [<c01c2487>] longterm_unlock_znode+0xa7/0x140
 [<c01cc720>] write_prepped_nodes+0x50/0x60
 [<c01cfb27>] flush_current_atom+0x757/0xbc0
 [<c01de320>] reiser4_writepages+0x0/0xc0
 [<c01c9d14>] flush_some_atom+0x174/0x290
 [<c01da903>] reiser4_sync_inodes+0xb3/0x120
 [<c0177d26>] sync_sb_inodes+0x16/0x30
 [<c0177ed9>] writeback_inodes+0x49/0x92
 [<c013db8e>] balance_dirty_pages_ratelimited+0x8e/0x190
 [<c01f3e7d>] item_balance_dirty_pages+0xbd/0x190
 [<c01f9bdd>] write_extent+0x89d/0xf10
 [<c0206fcb>] hint_validate+0xab/0xd0
 [<c0206739>] equal_to_rdk+0x29/0x60
 [<c01ea84f>] plugin_by_coord_node40+0x2f/0x40
 [<c0207d13>] write_flow+0x253/0x460
 [<c01f9340>] write_extent+0x0/0xf10
 [<c01c8396>] all_grabbed2free+0x36/0x40
 [<c0208148>] write_unix_file+0x178/0x2a0
 [<c01dd72f>] reiser4_write+0x8f/0x100
 [<c01dd6a0>] reiser4_write+0x0/0x100
 [<c015642a>] vfs_write+0x10a/0x150
 [<c0156522>] sys_write+0x42/0x70
 [<c0108249>] sysenter_past_esp+0x52/0x71


--=20
Jonathan Briggs
jbriggs@esoft.com

--=-LXa01nwFDVu+bKD6sjs8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAM6s4G8fHaOLTWwgRAtJJAJ9uX7WEfP+nPOs5sZRoRxrXHFea3ACdEqBB
J93syMTNi3ziRNMcNMm7Nrk=
=48pI
-----END PGP SIGNATURE-----

--=-LXa01nwFDVu+bKD6sjs8--

