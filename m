From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: Problems with reiserfs when start OpenAFS 1.2.11-fc1 Segmentation fault with kernel 2.4.22-1.2174.nptl
Date: Thu, 4 Mar 2004 01:18:46 -0600
Message-ID: <20040304071846.GB324@dbz.icequake.net>
References: <20040304005117.M99283@soltis.cc> <20040304005913.M1858@soltis.cc> <20040304002804.GA5722@dbz.icequake.net> <20040304014303.M64769@soltis.cc> <4046A6A8.2000609@matchmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Return-path: <reiserfs-list-return-17071-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4046A6A8.2000609@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: jds <jds@soltis.cc>, Ryan Underwood <nemesis-lists@icequake.net>, reiserfs-list@namesys.com, openafs-info@openafs.org

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2004 at 07:46:48PM -0800, Mike Fedyk wrote:
> jds wrote:
> >Hi Ryan:
> >
> >   Thanks for your help, the client openafs working again.
> >
> >loop: loaded (max 8 devices)
> >Journalled Block Device driver loaded
> >kjournald starting.  Commit interval 5 seconds
> >EXT3 FS 2.4-0.9.19, 19 August 2002 on loop(7,0), internal journal
> >EXT3-fs: mounted filesystem with ordered data mode.
>=20
> No, if you're going to be stacking filesystems, use ext2, not ext3.  You=
=20
> will get better performance, and there's no use in having two levels of=
=20
> journaling in this case.

You might also think about bigger than 100MB cache file.  A big cache
helps out AFS client performance tremendously.  But definitely use ext2
and not ext3 as others have said.

--=20
Ryan Underwood, <nemesis@icequake.net>

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFARthWIonHnh+67jkRAs00AJ47zXHzxuU1PGEA00jfABvlrZzhhACfaTyz
DYTjd3+VHSf8k+AkjcIMz/8=
=MYcl
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
