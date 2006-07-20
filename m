From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: create very large file system
Date: Thu, 20 Jul 2006 10:22:55 -0600
Message-ID: <1153412575.9802.7.camel@localhost>
References: <e9l7bh$134$1@sea.gmane.org>
	 <200607191657.38644.zam@namesys.com>
	 <20060720062646.GA6174@schatzie.adilger.int>
	 <200607201317.54566.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-pXa3QdGhUPSS2VnqIHVI"
Return-path: <reiserfs-list-return-29088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607201317.54566.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, Mark F <mfaine@knology.net>, Ext3-users@redhat.com

--=-pXa3QdGhUPSS2VnqIHVI
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2006-07-20 at 13:17 +0200, Christian Iversen wrote:
> On Thursday 20 July 2006 08:26, Andreas Dilger wrote:
> > On Jul 19, 2006  16:57 +0400, Alexander Zarochentsev wrote:
> > > On Wednesday 19 July 2006 16:10, Mark F wrote:
> > > > I've tried to create a large 5TB file system using both reiserfs an=
d
> > > > ext3 and both have failed.
> > >
> > > you might need to convert the partition table to GPT format for
> > > supporting 2TB+ partitions.  it can be done by the gnu parted tool.
> >
> > Or, for that matter, don't use a partition table at all, since this
> > adds an unhelpful offset to all the filesystem structures and can
> > hurt performance on RAID where the filesystem is trying to align IO
> > to RAID stripe boundaries.
>=20
> Can linux still auto-detect raid volumes if there's no partition table?

You're not supposed to be doing it that way these days.  RAID autodetect
is getting tossed out of the kernel in the future (probably still many
versions away though), and RAID, DM, LVM, and maybe even regular
partition setup is going to be done in initramfs / initrd.

At least, that is what I read.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-pXa3QdGhUPSS2VnqIHVI
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQBEv63fG8fHaOLTWwgRAugjAJ97ef/UNyphyTYkgPDN3tIysyavjgCcDbb3
GIVYQiOfxpAu/DyJeBX1Bm8=
=Gr9l
-----END PGP SIGNATURE-----

--=-pXa3QdGhUPSS2VnqIHVI--

