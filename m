From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Reiser4 oops on cat ./..plugin/..readdir
Date: Fri, 27 Feb 2004 10:20:25 -0700
Message-ID: <1077902424.7100.2.camel@localhost.localdomain>
References: <1077845680.6801.4.camel@localhost.localdomain>
	 <16447.10782.595624.815422@laputa.namesys.com>
	 <1077901194.6423.2.camel@localhost.localdomain>
	 <16447.31451.279097.181894@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-dHozO33OkX2nokJheWxh"
Return-path: <reiserfs-list-return-16968-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16447.31451.279097.181894@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--=-dHozO33OkX2nokJheWxh
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-02-27 at 10:14, Nikita Danilov wrote:
> Jonathan Briggs writes:
>  > On Fri, 2004-02-27 at 04:29, Nikita Danilov wrote:
>  > > Jonathan Briggs writes:
>  > >  > Filesystem is on a RAID 0 MD device.
>  > >  > Config is attached.
>  > >  > Kernel compiled with:
>  > >  >=20
>  > >  > # gcc34 --version
>  > >  > gcc34 (GCC) 3.4.0 20040129 (Red Hat Linux 3.4.0-0.3)
>  > >  > Copyright (C) 2004 Free Software Foundation, Inc.
>  > >  > This is free software; see the source for copying conditions.  Th=
ere is NO
>  > >  > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULA=
R PURPOSE.
>  > >  >=20
>  > >  > Problem Description:
>  > >  > A clean, fresh boot into single user mode, no tainted modules:
>  > >  > # cd /home
>  > >  > # cat ./..plugin/..readdir
>  > >=20
>  > > Please try the following patch:
>  > > --------------------------------------------------------------------=
--
>  > > =3D=3D=3D=3D=3D plugin/pseudo/pseudo.c 1.41 vs edited =3D=3D=3D=3D=
=3D
>  > > --- 1.41/plugin/pseudo/pseudo.c	Tue Jan 27 18:40:13 2004
>  > > +++ edited/plugin/pseudo/pseudo.c	Fri Feb 27 14:27:54 2004
>  > > @@ -533,7 +533,7 @@
>  > >  	dotname.len  =3D 1;
>  > > =20
>  > >  	down(&host->i_sem);
>  > > -	if (dplug =3D=3D NULL) {
>  > > +	if (dplug =3D=3D NULL || dplug->build_entry_key =3D=3D NULL) {
>  > >  		finish(NULL);
>  > >  		return NULL;
>  > >  	}
>  > > --------------------------------------------------------------------=
--
>  >=20
>  > Yes, this fixed the Oops.  Thanks.
>  >=20
>  > That gives me another question.  Why do I not see any plugins listed
>  > when I do either ls ./..plugin/ or cat ./..plugin/..readdir?
>=20
> /data1/tests> cat ./..pseudo # list of pseudo file accessible under "."
> ..uid
> ..gid
> ..rwx
> ..oid
> ..key
> ..size
> ..nlink
> ..locality
> ..pagecache
> ..pseudo
> ..bmap
> ..readdir
> ..plugin
> ..items
> ..new
> /data1/tests> cd ./..plugin # pseudo directory representing plugins of ".=
"
> /mnt/b1/tests/..plugin> ls
> compression  crypto  digest  dir  dir_item  file  formatting  hash  perm =
 sd
>=20
>  >=20
>  > Shouldn't there be at least a few default plugins?  I seem to remember
>  > seeing some when I was using a previous snapshot in January.
>=20
> See http://namesys.com/v4/pseudo.html for details.

Oh yes, I have read everything about v4 that I could find.  I am very
excited about it! :-)

I see the difference now.  Try just doing ls ./..plugin/.  No output.=20
But cd ./..plugin; ls does produce a list just like yours.  Strange!  Is
this a bug?
--=20
Jonathan Briggs
jbriggs@esoft.com

--=-dHozO33OkX2nokJheWxh
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAP3xYG8fHaOLTWwgRApEoAJ4nzvsE5IBMdPrS+KOqpJgXxhXk4gCfXx6Y
bgI8jGLNBVX42aZmPFcRgV8=
=Bz5C
-----END PGP SIGNATURE-----

--=-dHozO33OkX2nokJheWxh--

