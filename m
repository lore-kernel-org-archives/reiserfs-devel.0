From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: reiser4 metas/bmap problem
Date: Fri, 30 Jul 2004 15:26:17 -0400
Message-ID: <20040730192617.GQ1439@schnapps.adilger.int>
References: <Pine.GSO.4.44L.0407281754290.11129-100000@unix2.cc.ksu.edu> <20040729012549.GE1439@schnapps.adilger.int> <4108AA34.70202@namesys.com> <4108ABDD.9010803@namesys.com> <410A955D.3030101@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bxyj5TNvuouCjAp1"
Return-path: <reiserfs-list-return-19877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <410A955D.3030101@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Matt Stegman <matts@ksu.edu>, reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>

--bxyj5TNvuouCjAp1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 30, 2004  11:37 -0700, Hans Reiser wrote:
> Vladimir V. Saveliev wrote:
> >Hans Reiser wrote:
> >>Andreas Dilger wrote:
> >>>The ext3_bmap() function flushes all file data to disk when called,=20
> >>>and it would be prudent to do the same with reiser4, since bmap users
> >>>tend to be important and not speed critical (e.g. lilo) and failing
> >>>to do so can mean not booting later.
> >>>=20
> >>Interesting point.  vs, please comment.
> >>
> >Yes, reiser4 might do something like that too. However, i am not sure=20
> >how we can prevent relocation for files which were bmap-ed.
>
> fsync first and then bmap?

You could mark any file that had been bmapped as non-relocatable, and the
fsync too of course.  That may also be necessary for some kinds of crypto,
which use the block number as part of the key (not totally positive about
that but I recall something to this effect).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/


--bxyj5TNvuouCjAp1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBCqDZpIg59Q01vtYRAjADAKCs37j8ESUjiAutyQB/6f85255mDQCfQNkk
2qhdkIxOF5IRP2/nayDzCFM=
=xpyd
-----END PGP SIGNATURE-----

--bxyj5TNvuouCjAp1--
