From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: reiser4 metas/bmap problem
Date: Thu, 29 Jul 2004 22:42:02 -0400
Message-ID: <20040730024202.GO1439@schnapps.adilger.int>
References: <Pine.GSO.4.44L.0407281754290.11129-100000@unix2.cc.ksu.edu> <20040729012549.GE1439@schnapps.adilger.int> <4108B029.4030008@namesys.com> <4109B2BC.4040600@poelzi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ECfFjUQjeBf+wxqf"
Return-path: <reiserfs-list-return-19864-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4109B2BC.4040600@poelzi.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "daniel.poelzleithner" <poelzi@poelzi.org>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Matt Stegman <matts@ksu.edu>, reiserfs-list@namesys.com

--ECfFjUQjeBf+wxqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 30, 2004  04:30 +0200, daniel.poelzleithner wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Vladimir V. Saveliev wrote:
> | reiser4 should do the same, i agree. However, reiser4 has another
> | feature we call relocation (flush may allocate another disk blocks for a
> | file if it finds it more optimal) which is undesirable for bmapped file=
s.
> | We will probably have to invent some woraround for that.
>=20
> Whats about a flag that can be set through metas, that will prevent the
> relocation ?  That would be no workaround, that would be a feature :)

Lilo knows to set "notail" on files that it is bmapping so that the tail
is unpacked into a real block that won't move.  That attribute could be
re-used for this purpose and all would be well.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/


--ECfFjUQjeBf+wxqf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBCbV6pIg59Q01vtYRApjoAJ9k6VW63AV3NmlR9Z7DR0wwgIJcYQCgqBxw
74aLCxtfCH8OLW4nsiBWEig=
=V7vs
-----END PGP SIGNATURE-----

--ECfFjUQjeBf+wxqf--
