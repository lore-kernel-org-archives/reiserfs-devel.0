From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: df -i  reports '-' inodes available on reiser4
Date: Thu, 03 Mar 2005 16:56:10 +0300
Message-ID: <1109858169.3504.506.camel@tribesman.namesys.com>
References: <42270700.2010908@noviforum.si>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42270700.2010908@noviforum.si>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "\"Branko F. =?iso-8859-2?Q?Gra=E8nar=22?=" <bfg@noviforum.si>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-03-03 at 15:45, "Branko F. Gra=E8nar" wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hello,
>=20
> We're evaluating reiser4 filesystem for our storage server, which will
> run on linux 2.6.x.
>=20
> However, according to our tests it performs very well. Becouse our
> storage server will be responsible to server very *huge* amount of small
> files, we need to investigate the following issue:
>=20
> Command df -i reports '-' as number of used and total inodes available
> on filesystem.
>=20
> Is this a bug, or a feature?=20

Those numbers are intentionally left to be 0.
There is a following comment in the code:

/* FIXME: Seems that various df implementations are way unhappy by such
big numbers.
   So we will leave those as zeroes.
	statfs->f_files =3D oids_used(super) + oids_free(super);
	statfs->f_ffree =3D oids_free(super);
*/

I think we should just uncomment these lines in
fs/reiser4/vfs_ops.c:reiser4_statfs().

> Or i missed out some documentation which i
> should read before i formatted storage volume?
>=20
>=20
> Best regards,
>=20
> - --
>=20
> Branko F. Gracnar
> Sistemska administracija / razvoj
> Noviforum d.o.o., Stegne 31, SI-1000 Ljubljana
> Tel > 00 386 1 500 8528 ,
> Fax > 00 386 1 519 73 88
> e-mail > bfg@noviforum.si
> www.noviforum.si, www.najdi.si
>=20
> -----BEGIN PGP SIGNATURE-----
>=20
> iD8DBQFCJwcAN7LHXgqRB4IRAvUXAJ4+JsaB3jvFYhHYngSHR9niSowskQCfRG45
> 6dnzCV/hfkFhzI39VGpqKro=3D
> =3D4Dqi
> -----END PGP SIGNATURE-----
>=20

