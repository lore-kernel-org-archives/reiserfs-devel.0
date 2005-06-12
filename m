From: evilninja <evilninja@gmx.net>
Subject: Re: Corrupt reiser3 fs
Date: Sun, 12 Jun 2005 19:35:32 +0200
Message-ID: <42AC7264.8000503@gmx.net>
References: <42AB68F2.8030904@gear.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24368-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42AB68F2.8030904@gear.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Paul Gear <paul@gear.dyndns.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Gear schrieb:
> The problem has occurred looks like a hardware problem (perhaps
> memory). Send us the bug report only if the second run dies at
> the same place with the same block number.

so....does it? is it reproduceable on a 2nd run? also with a different
(maybe vanilla) kernel?

before trashing the fs, you could do

  debugreiserfs -p /dev/HDD | bzip2 -c > HDD-meta.bz2

then some reiserfs-guru could use it for debugging.

- --
BOFH excuse #316:

Elves on strike. (Why do they call EMAG Elf Magic)

- --
BOFH excuse #316:

Elves on strike. (Why do they call EMAG Elf Magic)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCrHJkC/PVm5+NVoYRAms/AKC3Nhrq8iRUxjU+PQzI9IXpGVtNOgCfcZ0F
gQBaoD9ga8lKfr1qgB24T7U=
=V18Z
-----END PGP SIGNATURE-----
