From: Christophe Saout <christophe@saout.de>
Subject: Re: reiser4 metas/bmap problem
Date: Sat, 31 Jul 2004 19:08:44 +0200
Message-ID: <1091293724.9886.18.camel@leto.cs.pocnet.net>
References: <Pine.GSO.4.44L.0407281754290.11129-100000@unix2.cc.ksu.edu>
	 <20040729012549.GE1439@schnapps.adilger.int> <4108AA34.70202@namesys.com>
	 <4108ABDD.9010803@namesys.com> <410A955D.3030101@namesys.com>
	 <410B85F6.8010107@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Ch637cfh4Rx3T84aRMxR"
Return-path: <reiserfs-list-return-19899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410B85F6.8010107@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Andreas Dilger <adilger@clusterfs.com>, Matt Stegman <matts@ksu.edu>, reiserfs-list@namesys.com

--=-Ch637cfh4Rx3T84aRMxR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 31.07.2004, 15:43 +0400 schrieb Vladimir V. Saveliev:

> >>>> The ext3_bmap() function flushes all file data to disk when called,=20
> >>>> and it
> >>>> would be prudent to do the same with reiser4, since bmap users tend=20
> >>>> to be
> >>>> important and not speed critical (e.g. lilo) and failing to do so=20
> >>>> can mean
> >>>> not booting later.
> >>>>
> >>> Interesting point.  vs, please comment.
> >>>
> >> Yes, reiser4 might do something like that too. However, i am not sure=20
> >> how we can prevent relocation for files which were bmap-ed.
> >>
> > fsync first and then bmap?
>
> It file will be later overwritten - flush may decide to relocate it.
> So, if application which bmapped it will not re-bmap - there will be a co=
nfusion.

Are there any applications which write into a file and expect the blocks
to stay at the same position? In case of lilo you have to rerun lilo
after writing a kernel because it might have changed in size. Usually
the old kernel has been moved any and not been overwritten anyway. My
personal opinion is that a filesystem sync (or implicit flusing when
bmap is called) should be enough.


--=-Ch637cfh4Rx3T84aRMxR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBC9IbZCYBcts5dM0RAtBvAJ43rcM+irjfxhuLSXjjiBVSd1CYfQCgpQGY
1cmQFNWi+HzD+uIovavZQgw=
=zRCu
-----END PGP SIGNATURE-----

--=-Ch637cfh4Rx3T84aRMxR--

