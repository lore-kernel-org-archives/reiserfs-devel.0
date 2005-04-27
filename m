From: Domenico Andreoli <cavok@tiscali.it>
Subject: Fwd: Bug#306199: reiserfsprogs: please use SI units
Date: Wed, 27 Apr 2005 10:51:48 +0200
Message-ID: <20050427085148.GA11485@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

hi,

  i'm forwarding this message because you staff of reiser filesystem
might be interested in the following wish.

cheers
domenico

----- Forwarded message from Beno=EEt Dejean <TazForEver@dlfp.org> -----

Date: Mon, 25 Apr 2005 00:36:42 +0200
From: Beno=EEt Dejean <TazForEver@dlfp.org>
Subject: Bug#306199: reiserfsprogs: please use SI units

the man says

"The size parameter may have one of the optional modifiers K, M, G,
which means the size parameter is given in kilo-, mega-, gigabytes respecti=
vely."

it's unclear if K, M, G mean
a) 2^10B, 2^20B, 2^30B=20
b) 10^3B, 10^6B, 10^9B

if (a), then the manpage should use SI units KiB, MiB and GiB.


The BIPM brochure says:

"These SI prefixes refer strictly to powers of 10. They should not be used =
to
indicate powers of 2 (for example, one kilobit represents 1000 bits and not=
 1024
bits)"

http://www1.bipm.org/utils/en/pdf/si-brochure.pdf =A73.1

Please consider using [KMG]iB instead of [kMG]B

http://physics.nist.gov/cuu/Units/binary.html


Thanks.

----- End forwarded message -----


-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
