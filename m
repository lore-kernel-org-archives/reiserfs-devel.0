From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Quicker alternative to "find /"?
Date: Fri, 27 Aug 2004 14:19:08 -0600
Message-ID: <20040827201908.GC4654@schnapps.adilger.int>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net> <411FF929.7040405@slaphack.com> <20040816140420.11dc210c.felix.klee.reiserfs@gmx.net> <200408161429.27131.christian.mayrhuber@gmx.net> <1093634500.2851.225.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Return-path: <reiserfs-list-return-20939-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093634500.2851.225.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Lamont R. Peterson" <lamont@gurulabs.com>
Cc: reiserfs-list@namesys.com

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 27, 2004  13:21 -0600, Lamont R. Peterson wrote:
> On Mon, 2004-08-16 at 06:29, Christian Mayrhuber wrote:
> > On Monday 16 August 2004 14:04, Felix E. Klee wrote:
> > > Thanks for the hints. I did some benchmarks:
> > >
> > > find / >/tmp/find.dirtree:
> > >     3:44 (1st run)
> > >     3:47 (repeated run)
> > > updatedb -u --output=3D/tmp/updatedb.dirtree:
> > >     8:51
> > >     8:47
> > > ls -R / >/tmp/ls.dirtree:
> > >     6:16
> > >     6:55
> > >
> > > With less than 4 minutes find is by far the fastest of these
> > > methods.
>=20
> Interesting.  I wonder what ls is doing that find is not.  The updatedb
> result does not surprise me in the least.

Have a look at "strace ls" and you will see that "ls" is doing a stat of
all the files.  I know this because it is a slowdown on a network filesystem
when you do an "ls" in a gigantic directory and you have to stat all of the
files instead of just dumping the directory contents.

Try something like "\ls -fR" so that you don't get colorization (which needs
the stat data) and it doesn't do sorting (which requires that you read in
the whole directory before displaying any part of it).  I think GNU ls will
still only show the directory contents after reading the whole thing even
when it isn't sorting, but that isn't a big deal unless you have large
directories.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/


--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBL5c8pIg59Q01vtYRAnF/AKCkmbiNgE3BobXhanednNJsEf220QCfXJ1v
/RWvjqQ/OTXrve8PJm1R1AM=
=OucS
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
