From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: Some ReiserFS failure situations and questions
Date: Thu, 4 Mar 2004 16:09:46 -0600
Message-ID: <20040304220945.GA23425@dbz.icequake.net>
References: <20040303224848.GF31472@dbz.icequake.net> <4046F8F0.2010204@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <reiserfs-list-return-17081-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4046F8F0.2010204@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Mar 04, 2004 at 12:37:52PM +0300, Hans Reiser wrote:
> You can probably get your data back if you ask Vitaly to do it using=20
> www.namesys.com/support.html, and he can probably explain it as well.;-)

I was tempted, but I don't even have that money really. (I know, neither
do you, but I'm sorry....)  I lost three days of university work while
rebuilding my machine so I could use it again.  I also discovered, at
the end of those three days, an error in my mail-virus scanning script
that had told procmail to happily /dev/null all my mail during those
days. X-(  A bad week-end, all in all...

Anyway, it was just /usr, so not a critical loss (rebuilt mostly
everything using dpkg database and apt) but it took a long time, and I
lost some custom programs/scripts/source in /usr/local since that whole
tree died.  The reason I posted is to find out some general Reiser
recovery strategy.  I had two filesystems corrupted in unusual ways as I
described, and in both cases reiserfsck --rebuild-tree was mostly
useless in recovering the data.  Furthermore the recovered filesystem on
the partition-deleted one ended up in a very strange state, with
"recovered" files being corrupted, and garbage files appearing from
nowhere.  This seemed like something that Reiser guys would want to know
about.

debugreiserfs seems like it should include the option to scan a whole
disk for reiserfs superblocks so that the LBA of a superblock can be
used to recreate a deleted partition.  As it was, I had a perfectly good
copy of the partition "somewhere", but parted could not search it out.

I am also still curious, (back to "normal" problem here) about the
files' contents being "mixed-up" when a unclean shutdown occurs.  Is
this because only metadata is journaled by default?  Should it be fixed
if I change mount options for full journaling?

--=20
Ryan Underwood, <nemesis@icequake.net>

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAR6kpIonHnh+67jkRAhmFAKCDaintnZg+CbFG5gy0bKM1TjaXBQCgidJv
vQKdESpB/qbal5tsUToLG/4=
=ywhO
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
