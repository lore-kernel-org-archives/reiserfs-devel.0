From: Zan Lynx <zlynx@acm.org>
Subject: Another odd sort of Reiser4 freeze
Date: Fri, 27 Jul 2007 18:07:47 -0600
Message-ID: <1185581267.12557.6.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-gPiAaQIh2OkM+gqLUCpG"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>


--=-gPiAaQIh2OkM+gqLUCpG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I was running "top" and it stopped updating.  At the end of this message
is top's trace out of a sysrq-t.

I don't understand why a file *read* resulted in waiting for a write to
complete. At a guess, the read attached itself to a transaction that was
in the process of write-out?

Would it be possible for a read to return the data without waiting for
the writes to actually reach disk?

top           D ffff810003dfd580     0 12032  12013
 ffff810013c2d988 0000000000000092 0000000000000292 ffffffff803c2b09
 ffff81001044b7c8 ffffffff80918160 0000000000000002 ffffffff807ff700
 ffffffff807ff700 ffffffff807ff700 ffffffff807ff700 ffffffff807ff700
Call Trace:
 [<ffffffff803c2b09>] cfq_set_request+0xe9/0x3d0
 [<ffffffff80258f36>] getnstimeofday+0x36/0xb0
 [<ffffffff8053433d>] io_schedule+0x5d/0xa0
 [<ffffffff803b84b9>] get_request_wait+0xe9/0x190
 [<ffffffff80254060>] autoremove_wake_function+0x0/0x30
 [<ffffffff803b9a90>] __make_request+0x90/0x660
 [<ffffffff802a0000>] add_to_swap+0x70/0x90
 [<ffffffff803b68f3>] generic_make_request+0x163/0x320
 [<ffffffff8025d847>] mark_held_locks+0x57/0xa0
 [<ffffffff80291cc5>] inc_zone_page_state+0x65/0x80
 [<ffffffff803b94cc>] submit_bio+0x8c/0x130
 [<ffffffff8033d08d>] write_jnodes_to_disk_extent+0x40d/0x440
 [<ffffffff8033d175>] write_jnode_list+0xb5/0xf0
 [<ffffffff8033e3d3>] reiser4_write_logs+0x733/0xda0
 [<ffffffff803378bd>] reiser4_txn_end+0x3ad/0x570
 [<ffffffff8025da01>] trace_hardirqs_on+0xc1/0x160
 [<ffffffff80337a89>] reiser4_txn_restart+0x9/0x20
 [<ffffffff803509b5>] read_unix_file+0x345/0x4c0
 [<ffffffff8053717f>] _spin_unlock_irq+0x2f/0x50
 [<ffffffff802b0085>] vfs_read+0xc5/0x180
 [<ffffffff802b0583>] sys_read+0x53/0x90
 [<ffffffff8020c1de>] system_call+0x7e/0x83


--=20
Zan Lynx <zlynx@acm.org>

--=-gPiAaQIh2OkM+gqLUCpG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)

iD8DBQBGqojTG8fHaOLTWwgRAv+AAJ0S806YtCDSmlQk6tpEHdCOqTNflQCeN9b8
saALqg/u3W7eL+vS7ezjuas=
=eK8x
-----END PGP SIGNATURE-----

--=-gPiAaQIh2OkM+gqLUCpG--

