From: Philipp =?iso-8859-1?q?G=FChring?= <p.guehring@futureware.at>
Subject: Huffman packing Permissions
Date: Mon, 17 Feb 2003 12:22:34 +0100
Message-ID: <200302171122.h1HBMj701370@linux1.futureware.at>
Reply-To: p.guehring@futureware.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12783-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Perhaps it is just a crazy idea,

But what about Huffman-packing all the File/Directory Permission?
They are extremely redundant on normal installations:

0644
0600
0755
0777
0700

are 99% of all files

I think one Huffman Table per Partition should be enough.

Many greetings,
- --=20
~ Philipp G=FChring              p.guehring@futureware.at
~ http://www.livingxml.net/       ICQ UIN: 6588261
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+UMX7lqQ+F+0wB3oRAvbXAJ0bg2vCegr9a39SodBiB31M+0DoAwCeK98D
7jyvYcPqDkPNeDk/66CvpEs=3D
=3DWKMI
-----END PGP SIGNATURE-----
