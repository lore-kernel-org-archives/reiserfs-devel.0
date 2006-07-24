From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
	regarding reiser4 inclusion
Date: Mon, 24 Jul 2006 15:51:18 -0700
Message-ID: <1153781478.5735.148.camel@ipso.snappymail.ca>
References: <200607242151.k6OLpDZu009297@laptop13.inf.utfsm.cl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-9CrBioZMkQ/D5p2Ap5Gz"
Return-path: <reiserfs-list-return-29189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607242151.k6OLpDZu009297@laptop13.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Cc: reiserfs-list@namesys.com

--=-9CrBioZMkQ/D5p2Ap5Gz
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-07-24 at 17:51 -0400, Horst H. von Brand wrote:
> > It all boils down to using the right tool for the job, ReiserFS was the
> > right tool for this job.=20
>=20
> /One/ tool that did the job. Not "the" right one, perhaps not even the be=
st
> one.

Please, enlighten me as to what "the best" tool for the job would be in
your opinion. Keep in mind this was around 2002-2003, which if I recall
was before dir_index for EXT3 was around and stable too.

> >           If I recall correctly the database went from about 2million
> > files to over 40 million in the span of just a few months. No one could
> > have predicted that. I believe this database was on an 18GB SCSI drive,
> > so even using 1K blocks wouldn't have worked. According to the mke2fs
> > man page:
>=20
> > "-i bytes-per-inode
> > This value generally shouldn't be smaller than the blocksize  of
> > the filesystem,  since  then  too many inodes will be made."
>=20
> 18GiB =3D 18 million KiB, you do have a point there. But 40 million files=
 on
> that, with some space to spare, just doesn't add up.
>=20
> > The only other option at that time was to purchase Veritas backup
>=20
> ... or a larger disk...

Why would we waste money purchasing larger disks just to _temporarily_
work around an EXT3 limitation? Even if we doubled the size of the disks
(36gb) we would have run in to the same problem within months. I
wouldn't consider this to be smart "planning ahead" as you put it.=20

Its not just an inode issue either, its a performance issue. Benchmarks
we ran with just 100,000 files making up 1GB of data, ReiserFS blew EXT3
out of the water where EXT3 was over 50% slower. If I recall the
"database" was about 5GB at 25million files. When you have a limited
window of time to do the backups in, performance is critical.=20

http://fsbench.netnation.com/new_hardware/2.6.0-test9/scsi/bonnie.html
(4th table down)


--=20
Mike Benoit <ipso@snappymail.ca>

--=-9CrBioZMkQ/D5p2Ap5Gz
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBExU7mMhKjsejwBhgRAuSEAJ9RwEDKWE6RDOECKtau14JngWjvoACePO49
tFQJkOal6TbE7LG4bxcKXb4=
=Fw3H
-----END PGP SIGNATURE-----

--=-9CrBioZMkQ/D5p2Ap5Gz--

