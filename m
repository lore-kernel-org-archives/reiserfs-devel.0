From: Fionn Behrens <fionn@spamfilter.de>
Subject: reiser4 in 2.6.14 - lockups with mmapped files
Date: Tue, 01 Nov 2005 16:50:21 +0100
Message-ID: <1130860221.12859.23.camel@laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-4ssAS4quDM6tn88XCBjj"
Return-path: <reiserfs-list-return-26756-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-4ssAS4quDM6tn88XCBjj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi all,

you may remember my recent "story from userland". Stubborn as I am, I
decided to give 2.6.14 another shot for it. Following a recommendation
found in the above mentioned thread, I tried the patch from=20
http://iphitus.loudas.com/archck.php this time, which includes the
latest reiser4 from mm.

Unfortunately I once more hit the wall and was forced to go back to
2.6.11 (including another --build-fs run to regain compatibility with
the old but working reiser4 drivers). I wish there was a mount option to
exclude the new extensions so I can test new kernels without losing half
a day for fscking when things get whacky.

This time suspend seemingly works without reiser4 processes freaking
out.
But now it looks like any time any mmapped file is synced to a reiser4
partition, the process who tries to do that will freeze forever. In
addition, any process trying to access the open mmapped file afterwards
will freeze forever as well. I created a screenshot of an strace running
while this happened. Find it at http://fionn.de/reiser4again.jpg

Of course, tests on files on other file systems than reiser4 did not
show this behaviour. I tested on two different Systems, one Pentium M
and one Athlon, same result.

I wish I knew what I am doing wrong. I'd bet you guys all have reiser4
up and running with 2.6.14 and no problems at all. Or what?=20

best regards,
		Fionn
--=20
 Taking away civil rights to protect a free democracy is like taking off
 the tires of a car to protect it from flats.=20

--=-4ssAS4quDM6tn88XCBjj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDZ469jkvYSI4bFywRAmfyAJ0Unm0lnZ1/AiUKa5M6MpN7yeFH1QCfRJjj
BM2rAuaXsI9Ycz4jrcQ5OPY=
=/dTd
-----END PGP SIGNATURE-----

--=-4ssAS4quDM6tn88XCBjj--


