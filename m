From: "daniel.poelzleithner" <poelzi@poelzi.org>
Subject: Re: After `quotacheck` ReiserFS Root Filesystem Won't Mount Read-Write
Date: Fri, 20 Aug 2004 03:28:00 +0200
Message-ID: <412553A0.4050301@poelzi.org>
References: <22c16c22abfc.22abfc22c16c@optonline.net> <200408170303.41737.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20414-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408170303.41737.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bernd Schubert wrote:

| There are a dozens other ways for doing this, e.g. issuing as kernel
parameter
| "init=/bin/bash rw"
|
| Then after booting:
| vi /etc/fstab
| sync; sync;  sync

mount / -o remount,ro

Then you can savely press the reboot button.

regards
~ Daniel

- --
Once the philosopher stone has fallen from the tree,
~  nonsense appeared to fix the courious fear.

.. . .. ... . . .. . ... . .. . ... . . .
pgp key @ http://files.poelzi.org/pgp.txt
ED80 E53D 5269 4BB1 1E73 3A53 CBF9 A421 0A7B 003D
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFBJVOfy/mkIQp7AD0RAhCUAJ9hoqiDg86qeFYVlNvQsHuslZlbOgCfR4ZH
dq10J7IBBkjR0WPVGBc5GHM=
=oFS0
-----END PGP SIGNATURE-----
