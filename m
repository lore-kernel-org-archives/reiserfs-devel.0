From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Reiser4 oops on cat ./..plugin/..readdir
Date: Fri, 27 Feb 2004 09:59:54 -0700
Message-ID: <1077901194.6423.2.camel@localhost.localdomain>
References: <1077845680.6801.4.camel@localhost.localdomain>
	 <16447.10782.595624.815422@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zAS7gj2bqzLW0JhvlkFn"
Return-path: <reiserfs-list-return-16964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16447.10782.595624.815422@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--=-zAS7gj2bqzLW0JhvlkFn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-02-27 at 04:29, Nikita Danilov wrote:
> Jonathan Briggs writes:
>  > Filesystem is on a RAID 0 MD device.
>  > Config is attached.
>  > Kernel compiled with:
>  >=20
>  > # gcc34 --version
>  > gcc34 (GCC) 3.4.0 20040129 (Red Hat Linux 3.4.0-0.3)
>  > Copyright (C) 2004 Free Software Foundation, Inc.
>  > This is free software; see the source for copying conditions.  There i=
s NO
>  > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR=
POSE.
>  >=20
>  > Problem Description:
>  > A clean, fresh boot into single user mode, no tainted modules:
>  > # cd /home
>  > # cat ./..plugin/..readdir
>=20
> Please try the following patch:
> ----------------------------------------------------------------------
> =3D=3D=3D=3D=3D plugin/pseudo/pseudo.c 1.41 vs edited =3D=3D=3D=3D=3D
> --- 1.41/plugin/pseudo/pseudo.c	Tue Jan 27 18:40:13 2004
> +++ edited/plugin/pseudo/pseudo.c	Fri Feb 27 14:27:54 2004
> @@ -533,7 +533,7 @@
>  	dotname.len  =3D 1;
> =20
>  	down(&host->i_sem);
> -	if (dplug =3D=3D NULL) {
> +	if (dplug =3D=3D NULL || dplug->build_entry_key =3D=3D NULL) {
>  		finish(NULL);
>  		return NULL;
>  	}
> ----------------------------------------------------------------------

Yes, this fixed the Oops.  Thanks.

That gives me another question.  Why do I not see any plugins listed
when I do either ls ./..plugin/ or cat ./..plugin/..readdir?

Shouldn't there be at least a few default plugins?  I seem to remember
seeing some when I was using a previous snapshot in January.
--=20
Jonathan Briggs
jbriggs@esoft.com

--=-zAS7gj2bqzLW0JhvlkFn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAP3eJG8fHaOLTWwgRAsykAKCRCn3R/m5exU46a7Y/kkiZuT+CTACgp/eR
xjs64jYnaCSOnfzb4MJJ1CI=
=aedL
-----END PGP SIGNATURE-----

--=-zAS7gj2bqzLW0JhvlkFn--

