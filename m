From: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 02:17:14 -0800
Message-ID: <20030331101714.GA23949@cherenkov.orbis-terrarum.net>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net> <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net> <20030331120014.C25533@namesys.com> <20030331083758.GA23518@cherenkov.orbis-terrarum.net> <20030331125652.H25533@namesys.com> <20030331091621.GA23666@cherenkov.orbis-terrarum.net> <20030331132454.L25533@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <reiserfs-list-return-13471-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331132454.L25533@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: "Robin H. Johnson" <robbat2@orbis-terrarum.net>, reiserfs-list@namesys.com

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2003 at 01:24:54PM +0400, Oleg Drokin wrote:
> > No change in the output of debugreiserfs.
> Ok, plase run it under strace, kind of like this:
> "strace -o /tmp/out debugreiserfs -p /dev/hdb1 >/dev/null" and
> send me this /tmp/out file.
http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs.strace.bz2

> Hmm, I also wonder what happens if you dd the whole partition (/dev/hdb1)=
 to
> some file and then run debugreiserfs on that file will it succeed?
Same output from debugreiserfs.=20
http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs.run.fromfile
I did an strace as well on this (it IS different somewhere, didn't look
at the output myself tho, just the md5sum):
http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs-fromfile.stra=
ce.bz2

MD5SUMS for everything:
http://www.orbis-terrarum.net/~robbat2/reiserfs/MD5SUMS

You can just browse that directory to grab things again.

> If not, then probably you can compress the file and somehow make it avail=
able for
> download?
> If it will succeed, then there is certainly some interaction between harw=
are and
> debugreiserfs is going on.
Ok, I think we can rule out hardware since it still happens anyway.

Next step is getting that data to you. I'm running bzip2 -9vvkz on the
dd'd contents of the drive now, I expect that to take a few hours.

Depending on the size of the output, I'll either see about getting the
data up on a relatively high speed site somewhere, or splitting it into
two parts and sending them to you on DVD-R if you can accept those?

--=20
Robin Hugh Johnson
E-Mail     : robbat2@orbis-terrarum.net
Home Page  : http://www.orbis-terrarum.net/?l=3Dpeople.robbat2
ICQ#       : 30269588 or 41961639
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks

iD8DBQE+iBWqsnuUTjSIToURAoMcAKCx+o8yV8HhnZZ9Qs0MBoWibnl9JQCbBGQL
z1Un8btous38WteJpWbAxS0=
=lAD6
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
