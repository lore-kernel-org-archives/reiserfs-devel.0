From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Sat, 28 Aug 2004 23:49:10 +0200
Message-ID: <4130FDD6.1090906@dermichi.com>
References: <412E6EFC.3070600@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21022-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412E6EFC.3070600@dermichi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

> i've already had the exact same problems before, i mean errors like:
> FSCK: Directory [109e8:416c7400000000:109ee] (dir40), node [216782],=20
> item [1],
> unit [22]: entry has wrong offset
> [109ee:0(NAME):142657765726275:6e6746fc72416e77:135160352fe624]. Should be
> [109ee:0(NAME):142657765726275:6e6746fc72416e77:13514d8cfe19f4].
> while doing random other things on reiser4 partitions and fsck'ing=20
> afterwards. using --build-fs created lots of files under lost+found and=20
> i started over. i will leave the fs this time, maybe i can try some=20
> things to find the cause of the problem.
i've investigated this problem further the last days and came to the=20
following conclusions:
- 2.6.9-rc1-mm1 has a bug that affects all filesystems (pointed out=20
earlier today). so don't use if you love your data ;)
- reiser4 is stable for me on 2.6.8.1-mm4 (i compared the directories=20
with diff and there were no differences)
- the problem with fsck.reiser4 mentioned above persists. it does not=20
like some file names on my partition and then thinks that there are=20
fatal corruptions. using "fsck.reiser4 --build-fs" actually destroys=20
some data then by moving some correct files to lost+found. the filenames=20
fsck does not like all contain german umlauts. but otoh there are=20
filenames with umlauts that are ok!

here are some filenames that fail:
BewerbungF=FCrAnwaltsb=FCro.doc
Graphik01Markenidentit=E4t.sxd
SkriptumzumSeminarF=FChren.doc
WieTeamseffizientwerdenk=F6nnen.doc

but otoh these work:
WerbeK=E4rntnerBallonwerbung.sxw
Vo 08 - 29. M=E4rz 2001.pdf
Tsch=F6ranKirche.jpg
V=F6lkermarktKircheGross.jpg

i know that it's never a good idea to use such characters in a file=20
name, but tell this to the users ... hopeless!
as i already mentioned earlier, this is with reiserfsprogs-1.0.1

what i learned: don't trust fsck.reiser4 if it says there is corruption=20
(yes i know, it could have read README before... sigh)

Michael
