From: Michael Buesch <mbuesch@freenet.de>
Subject: Reiser4 DOS
Date: Sun, 2 May 2004 15:38:47 +0200
Message-ID: <200405021539.05907.mbuesch@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18361-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I'm running linux-2.6.5 with latest reiser4 snapshot patch.
The following script makes my system completely
unresponsive in a short time.

#!/bin/sh
mount -treiser4 /dev/hdX /mnt/reiser4
cd /mnt/reiser4
while `/bin/true`; do
	cd metas
done

=2D --=20
Regards Michael Buesch  [ http://www.tuxsoft.de.vu ]

=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAlPn4FGK1OIvVOP4RApOgAJ9JRZIll4hLLIL2Ml0ve7Xb3qagYQCeP9xp
puYCi/4tQPJfrffz0VatWck=3D
=3D6bBp
=2D----END PGP SIGNATURE-----
