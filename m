From: David Masover <ninja@slaphack.com>
Subject: Re: Again, some bad Reiser4 (ReiserFS) 'reviews'
Date: Fri, 16 Jul 2004 14:52:21 -0500
Message-ID: <40F831F5.5090700@slaphack.com>
References: <200407150025.30908.Dieter.Nuetzel@hamburg.de> <40F6C548.7030805@namesys.com> <20040715182209.GK21140@backtop.namesys.com> <20040716092927.GQ4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19662-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040716092927.GQ4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Alex Zarochentsev <zam@namesys.com>, Hans Reiser <reiser@namesys.com>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, reiserfs-list@namesys.com, rufus@hackish.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Markus T=F6rnqvist wrote:

| This always puzzles me. Would not ext-1-fibre give the same results for
| .o files but also the same bonus with all source code and such with .c
| and .h?

For that matter, what about for generic extensions?  Take this perl
pseudocode:

if ($file->[name} =3D~  /.\.(\w{1,4})$/) {
	$file->fibrate_by($1);
}



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQPgx9HgHNmZLgCUhAQJSKw//cab8Yn/PQYO2NSooVCWAeMlo3MQMx079
R/h0/4sgeKP7vcUNIte0b8KObIL5bC0MPtTkebVb1KPzzrRn4/5eEnTNpz270m0c
Xl9apPfc6K2Hrrx7PviROj2xDtgpwRc+qSfq4x7F0rNThxLidkhqy2AFVU2wDGpu
EWVQYvDL2/ggo/iFkVPUoKimyHR6fynjp/oAYSIkjGEj7xel2rIbNajbf3NlYE/m
4fz6eu3nec/hng7m89fzmsfl6CiD3g+hQhS781L/jadkCSuIVN2KMREeBYFsl9Rg
suH2Y+CoA+Gj7AclWLbVneKJQo9iTNLYIOhx/ONvzbpP1qYgQ1/9a/OtHEStkqOb
wPi66rfACocr3ezAQtU8Q7fThyRcJPucrPKnYeVWILRTmaJhrdWbF6jVn9nCAmZB
QV82DLEAq+yZOVkfA7V3NPimHi1K62hAmbE8aVk75ySEAQyGQV33ZM6RDcKH5aBT
fJlzpyvlF4lcCERqIL9pP2vahvQSwlSR+Q4oumNgt6kvS6Cjh25e4pPu9eUnpDIi
bptYRvk1qd8de/75b+5U7wsEL2WmnVYG1BFj9373y00WOenlyw+XWiAueiLZutU8
UkeOmnw6LRxfPvKMAtlWNUIPAnjzaRdmydcRNhtzuMpuABg583IULN5zjb3cp1ev
KLsoMQ/Bxz8=3D
=3DrSJy
-----END PGP SIGNATURE-----
