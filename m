From: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 03:13:32 -0800
Message-ID: <20030331111332.GC23949@cherenkov.orbis-terrarum.net>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net> <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net> <20030331120014.C25533@namesys.com> <20030331083758.GA23518@cherenkov.orbis-terrarum.net> <20030331125652.H25533@namesys.com> <20030331091621.GA23666@cherenkov.orbis-terrarum.net> <20030331132454.L25533@namesys.com> <20030331101714.GA23949@cherenkov.orbis-terrarum.net> <20030331143623.R25533@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Return-path: <reiserfs-list-return-13480-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331143623.R25533@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: "Robin H. Johnson" <robbat2@orbis-terrarum.net>, reiserfs-list@namesys.com

--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2003 at 02:36:23PM +0400, Oleg Drokin wrote:
> > http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs.strace.bz2
> _llseek(0, 73728, 0xbffff450, SEEK_SET) =3D -1 ESPIPE (Illegal seek)
> Hm, seeking on stdin instead of file? That's strange.
Very.

> > Next step is getting that data to you. I'm running bzip2 -9vvkz on the
> > dd'd contents of the drive now, I expect that to take a few hours.
> > Depending on the size of the output, I'll either see about getting the
> > data up on a relatively high speed site somewhere, or splitting it into
> > two parts and sending them to you on DVD-R if you can accept those?
> Also you can just give me a shell on your box, so that I can tweak and
> recompile reiserfsprogs (btw, you are not using debugreiserfs from
> reiserfsprogs v3.6.5), also I need r/w access to the file containing
> copy of partition data.
> In order for me to be able to verify mountability of partition I need
> a way to mount/umount it).
I'm afraid I can't do that Dave. Shells are out of the question. It
opens up too many possible security holes. Paranoid I am.

At the present rate, it looks like it will be at least 50% compression,
I'm thinking more since the drive was about 60% full.

~5gb would be an acceptable download I think, split into 10x512Mb parts,
using MD5SUMS.=20

I was going to upgrade to it, but it seems Gentoo currently has some
issues with it, so I'm holding off on it.

--=20
Robin Hugh Johnson
E-Mail     : robbat2@orbis-terrarum.net
Home Page  : http://www.orbis-terrarum.net/?l=3Dpeople.robbat2
ICQ#       : 30269588 or 41961639
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks

iD8DBQE+iCLcsnuUTjSIToURAkzRAKCSAulfj7dxtSTfHxGHo8ZcK2NLnwCgsXQS
ooxXNIALPFZTJOVeCmMy+HE=
=3Ww0
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
