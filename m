From: "David Dabbs" <david@dabbs.net>
Subject: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Mon, 30 Aug 2004 21:07:41 -0000
Message-ID: <20040830210735.6104715C98@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Michael Weissenbacher wrote:=0D
=0D
>i've investigated this problem further the last days and came to the =0D
>following conclusions:=0D
>[...]=0D
>fsck does not like all contain german umlauts. but otoh there are =0D
>filenames with umlauts that are ok!=0D
>=0D
>here are some filenames that fail:=0D
 0123456789012345=0D
>BewerbungF=FCrAnw   altsb=FCro.doc=0D
>Graphik01Marken     identit=E4t.sxd=0D
>SkriptumzumSemi   narF=FChren.doc=0D
>WieTeamseffizie       ntwerdenk=F6nnen.doc=0D
=0D
 0123456789012345=0D
>but otoh these work:=0D
>WerbeK=E4rntnerBa     llonwerbung.sxw=0D
>Vo 08 - 29. M=E4r        z 2001.pdf=0D
>Tsch=F6ranKirche.        jpg=0D
>V=F6lkermarktKirc        heGross.jpg=0D
>=0D
=0D
Even though both file sets contain umlauts, or perhaps more accurately exte=
nded ASCII chartacters, there is something distinctive in the "failure" set=
: the umlauts/extended characters appear after the 15th character. If you a=
re using REISER4_LARGE_KEYS, the first fifteen characters will be shifted i=
nto the second and third key elements with the final key el containing the =
hash of the remaining characters =0D
=0D
key =3D { [dirhash], [hash_bit+fibre_bits+1st 7 chars], [next 8 chars], [ha=
sh] }=0D
=0D
Code in fs/reiser4/kassign.c assembles the key and uses your chosen hash, R=
5 being the default. If you created the files without failure, could read/o=
pened them okay but then FSCK reported problems, could this point to a diff=
erence in the hash code (w.r.t. extended ASCII)? I'm on holiday now, so can=
not check to see if this suspicion holds any water. =0D
=0D
David=0D
=0D
p.s. One other possibility is that there is some extended ASCII variance in=
 the the fibration code, but this seems unlikely. =0D
=0D

