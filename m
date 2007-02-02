From: Zan Lynx <zlynx@acm.org>
Subject: Re: linux-2.6.20-rc4-mm1 Reiser4 filesystem freeze and corruption
Date: Thu, 01 Feb 2007 17:21:30 -0700
Message-ID: <1170375690.7233.4.camel@localhost>
References: <1169229490.6266.11.camel@oberon>
	 <200701200334.07690.vs@namesys.com> <1170267238.22971.1.camel@oberon>
	 <45C20D41.6040608@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PqEpXL51OoWhcd1uJGG7"
Return-path: <reiserfs-list-return-30512-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45C20D41.6040608@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com, Linux kernel mailing list <linux-kernel@vger.kernel.org>, Reiserfs-dev <reiserfs-dev@namesys.com>

--=-PqEpXL51OoWhcd1uJGG7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2007-02-01 at 18:54 +0300, Edward Shishkin wrote:
[snip]
> Thanks for the dump.
>=20
> >[ 3138.456588]  [<ffffffff8033f5de>] current_atom_finish_all_fq+0x12e/0x=
280
> >[ 3138.456661]  [<ffffffff80296510>] autoremove_wake_function+0x0/0x30
> >[ 3138.456674]  [<ffffffff803350ac>] submit_wb_list+0x11c/0x130
> >[ 3138.456690]  [<ffffffff80335409>] reiser4_txn_end+0x349/0x530
> >[ 3138.456710]  [<ffffffff803355f9>] reiser4_txn_restart+0x9/0x20
> >[ 3138.456781]  [<ffffffff80335680>] force_commit_atom+0x50/0x60
> >[ 3138.456793]  [<ffffffff8034cfb1>] writepages_unix_file+0x671/0x780
> >[ 3138.456824]  [<ffffffff802590b3>] do_writepages+0x43/0x80
> >[ 3138.456838]  [<ffffffff8024dbf8>] __filemap_fdatawrite_range+0x58/0x7=
0
> >[ 3138.456914]  [<ffffffff8024e19d>] do_fsync+0x3d/0xe0
> >[ 3138.456930]  [<ffffffff802c2473>] sys_msync+0x143/0x1f0
> >[ 3138.456945]  [<ffffffff8025c11e>] system_call+0x7e/0x83
> > =20
> >
>=20
> This is waiting for IO completion, and no success because of new plugging
> policy introduced by block layer folks. The attached patch should help.
> Andrew, please apply.

OK, I have been using it with your patch for many hours and it has not
frozen up yet.  I believe that the patch did indeed fix it.

Thank you.
--=20
Zan Lynx <zlynx@acm.org>

--=-PqEpXL51OoWhcd1uJGG7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.1 (GNU/Linux)

iD8DBQBFwoQKG8fHaOLTWwgRAg3cAJ9g7hzU7LjWvl8qTET69YiFAmPalgCeM0Kx
IqqP+J+EzVCgPmI+a/Uynbg=
=U21v
-----END PGP SIGNATURE-----

--=-PqEpXL51OoWhcd1uJGG7--

