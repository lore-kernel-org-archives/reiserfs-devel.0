From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 13:46:04 +0200
Message-ID: <20050901134604.31ddd297@SiRiUS.home>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=Signature_Thu__1_Sep_2005_13_46_04_+0200_7F_0pwsCfi4vtlTi;
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-25776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs List <reiserfs-list@namesys.com>

--Signature_Thu__1_Sep_2005_13_46_04_+0200_7F_0pwsCfi4vtlTi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello People!

Just got a new harddrive and as i'm pretty pleased with reiser4 i
thought i'll make it reiser4. But then i realized that it uses almost
1/6 of the hd "for nothing"

mkfs.reiser4 /dev/hde1:
/dev/hde1  reiser4    222G  7,5M  222G   1% /shared

mkfs.reiserfs
/dev/hde1 reiserfs    233G   33M  233G   1% /shared

somehow i had in mind that reiser4 should use much less space than
reiserfs, but it's exactly the other way round. Loosing 17GB of an
250GB disk is hard anyway. but loosing 28GB is simply no go.

Now do i need to pass any special options to mkfs.reiser4 or why is
that? i'm using reiser4progs 1.0.4

Thanks in advance
Tom

--Signature_Thu__1_Sep_2005_13_46_04_+0200_7F_0pwsCfi4vtlTi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFDFuoDaMf8HmTow1YRAlAtAJ4wDQi0kNEy2p72F7CZPsv738lpLQCg1X5+
N0u5lBmS3kJr3BEh0r3yGgE=
=D8g+
-----END PGP SIGNATURE-----

--Signature_Thu__1_Sep_2005_13_46_04_+0200_7F_0pwsCfi4vtlTi--
