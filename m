From: Michael Buesch <mbuesch@freenet.de>
Subject: Re: Reiser4 DOS
Date: Sun, 2 May 2004 16:12:45 +0200
Message-ID: <200405021612.54073.mbuesch@freenet.de>
References: <200405021539.05907.mbuesch@freenet.de> <20040502.155419.607957586.rene@rocklinux-consulting.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18363-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040502.155419.607957586.rene@rocklinux-consulting.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: Rene Rebe <rene@rocklinux-consulting.de>
Cc: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sunday 02 May 2004 15:54, you wrote:
> Are you sure this does not happen on other filesystem? This loop

No, I don't know another filesystem with some kind of these
meta-files and directories.

> mainly creates process creation pressure and is more likely some
> scheduler thing than Reiser4.
>=20
> Maybe you can cure this using:
>=20
> while : ; do
> ...

Same thing. Memory usage grows and grows until the
system is dead.

>=20
> Sincerely yours,
>   Ren=E9 Rebe
>     - ROCK Linux stable release maintainer

=2D --=20
Regards Michael Buesch  [ http://www.tuxsoft.de.vu ]


=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAlQHkFGK1OIvVOP4RAogNAJ4x4OsLwitzzkz0wHkISY6ifmE1+wCfZ6GY
cONDV0t989B5RuCWiDh65ZM=3D
=3DBfys
=2D----END PGP SIGNATURE-----
