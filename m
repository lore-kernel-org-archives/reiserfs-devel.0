From: Michael Buesch <mbuesch@freenet.de>
Subject: Re: Two "maybe" related problems
Date: Wed, 19 May 2004 13:57:27 +0200
Message-ID: <200405191357.37303.mbuesch@freenet.de>
References: <200405181657.48868.mbuesch@freenet.de> <1084892983.1431.112.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18763-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084892983.1431.112.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday 18 May 2004 17:09, you wrote:
> This is probably caused by the fact that system oopsed already.
> I would suggest you to boot of rescue system and change /etc/fstab so
> that /dev/hda13 does not get mounted on booting (noauto in fourth field
> of a /etc/fstab's record)
> Do so for other filesystems underlying deveices of which were
> repartitioned.
> reboot in usual way
> if it does not oops on boot (it should not) - mkreiserfs will not get
> stuck

I rebooted and updated reiserfs tools. Now it works as expected.

But should the kernel (reiser4 driver) be "allowed" to oops,
if someone tries to mount a non-existing partition, just because
there's some old and corrupt data left, from a previous filesystem?
Shouldn't it simply refuse to mount?

=2D --=20
Regards Michael Buesch  [ http://www.tuxsoft.de.vu ]

=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAq0uvFGK1OIvVOP4RAn2YAJ9+AYo29gLPT8jZjFdjV7pLka88cACg0vHQ
tvvzO2HGeT/x73FrTbaBJ5I=3D
=3DYg1o
=2D----END PGP SIGNATURE-----
