From: Debian User <mtoseland@blueyonder.co.uk>
Subject: Re: duplicate files and recent changes
Date: Sat, 8 Jun 2002 13:50:53 +0100
Message-ID: <20020608125053.GA11270@blueyonder.co.uk>
References: <Pine.WNT.4.43.0206060127230.1296-100000@fanatic> <1023440037.971.6.camel@kakapo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Return-path: <reiserfs-list-return-10684-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1023440037.971.6.camel@kakapo>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: reiserfs-list@namesys.com

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2002 at 10:53:57AM +0200, Heinz-Josef Claes wrote:
> Am Don, 2002-06-06 um 07.30 schrieb S. Alexander Jacobson:
> > I just joined this list.  Two question:
> >=20
> > 1. Can reiserfs detect that I have two copies of
> > the same file on disk and store tham as one file
> > (doing a lazy copy) if someone writes to one of
> > them?
> >=20
> > 2. Is there a fast way to get access to the file
> > change list?  It would be nice to be able to do
> > fast backup of changed files without having to
> > traverse entire directory trees.
> >=20
> > -Alex-
> >=20
> > ___________________________________________________________________
> > S. Alexander Jacobson                   i2x Media
> > 1-212-787-1914 voice                    1-603-288-1280 fax
> >=20
> >=20
> Hi,
>=20
> I don't know why you want this feature.
> But I've written a well tested tool for backing up directories on
> another disk which uses md5 sums to recognize same files (even in one
> backup) and hard links them. By this way, it combines the advantages of
> full and incremental backup. It also uses compression and has a lot of
> other options and optimisations. It runs best with reiserfs, because
> reiserfs has no preconfigured number of inodes and is fast with hard
> linking.
> So, if you need to backup, try
> http://sourceforge.net/projects/storebackup
Because hard links are not the same as COW links. If you hardlink two
files, they stay hardlinked, unless you remove one of them. If you COW
link two files, then write to one of them, they split off and copy. The
feature being asked for is just a COW link - the rest can be implemented
in userspace.
>=20
>=20
> Regards,
> Heinz-Josef Claes
>=20
> PS: Licence is GPL.
>=20
>=20
>=20
>=20

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9Af2tmlVGrEH/+qIRAoI9AJ9158y+af7XXERk23iyBSOdYP9c6QCeNpG4
y7vgDy0Kdl4mF8SNdhLflfE=
=0s2/
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
