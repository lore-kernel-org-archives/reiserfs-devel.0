From: Serkan Kaba <serkan@gentoo.org>
Subject: Reiser4 and mount times
Date: Tue, 11 Jan 2011 06:44:30 +0200
Message-ID: <4D2BE02E.6040207@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Compared to other fileystems (including reiserfs) mount times of reiser4
is *huge* and mounting takes most of my boot time.

Here's a simple time output of reiser4 and ext4 fs, nearly identical in
size.

# df- h
/dev/sdb2             428G  339G   89G  80% /film
/dev/sdb4             429G  262G  145G  65% /film2

# time mount /film

real	0m23.238s
user	0m0.000s
sys	0m0.096s

# time mount /film2

real	0m0.069s
user	0m0.000s
sys	0m0.012s

# mount
/dev/sdb2 on /film type reiser4 (rw,noatime)
/dev/sdb4 on /film2 type ext4 (rw,noatime)

Can I improve the situation with tweaks, or help you to investigate it?

- -- 
Sincerely,
Serkan KABA
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk0r4C4ACgkQRh6X64ivZaL+KgCdGrgY+Tu5NLQOIamrPT4B1D+e
+OcAnAn3Pvr2RF8JGtRaMgGg/OzcBbFc
=Vc6Q
-----END PGP SIGNATURE-----
