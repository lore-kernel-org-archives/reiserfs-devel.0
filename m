From: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Sun, 30 Mar 2003 23:49:57 -0800
Message-ID: <20030331074957.GD22731@cherenkov.orbis-terrarum.net>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net> <20030331113446.A31858@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Return-path: <reiserfs-list-return-13456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331113446.A31858@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: "Robin H. Johnson" <robbat2@orbis-terrarum.net>, reiserfs-list@namesys.com

--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2003 at 11:34:46AM +0400, Oleg Drokin wrote:
> Hello!
>=20
> On Sun, Mar 30, 2003 at 11:22:50PM -0800, Robin H. Johnson wrote:
> > The drive still refused to mount.
> > I dug in fsck.reiserfs --help, and saw '--scan-whole-partition'. Tried
> > --rebuild-tree with that on. It showed a LOT of stuff about StatDatas,
> > and completed successfully.
> Well, this is likely to destroy data, but still it should be mountable at=
 the point of
> completion.
Now I get to prove to my boss why I wanted to spend so much on backups
:-).

> Can you please make a metadata dump for us?
> "debugreiserfs -p /dev/hdb1 | bzip2 -9c >metadata.bz2" and make this file
> available for us to download.
Stderr output of debugreiserfs here:
http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs.run
metadata file:
http://www.orbis-terrarum.net/~robbat2/reiserfs/metadata.bz2

> > I just find that there is something definitely wrong if fsck says the
> > partition is fine, but Linux refuses to mount it. Either this is a bug
> > in Linux, or the reiserfsprogs. Either way, somebody has a bug :-)
> Sure, and we are interested in resolving the problem.
Same here.

> Thank you.
No, most definitely thank you. Now I have more ammunition against my boss
as to why Open Source is better. You guys really rock. I'd never get a
response from any other vendor this quickly (even though we pay some of
them a fair sum).

A question for you, so I can support things. Is there a list somewhere
of features requested, and how much you money you want to be paid to add
them in? Especially the smaller features (hint hint).

--=20
Robin Hugh Johnson
E-Mail     : robbat2@orbis-terrarum.net
Home Page  : http://www.orbis-terrarum.net/?l=3Dpeople.robbat2
ICQ#       : 30269588 or 41961639
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks

iD8DBQE+h/MlsnuUTjSIToURAmFGAKCRZ8kC4E/PFze/QGcDnlCG/IHGbQCdFk4Z
9ctOuj6790ZZSY1cT9U+UwQ=
=+uhp
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
