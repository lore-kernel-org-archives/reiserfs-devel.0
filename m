From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: duplicate files and recent changes
Date: Fri, 07 Jun 2002 11:55:56 -0400
Sender: news <news@main.gmane.org>
Message-ID: <87r8jjaxrn.fsf@labatt.uhoreg.ca>
References: <87ofeo70st.fsf@labatt.uhoreg.ca> <200206070811.g578BUtA008730@sirius.cs.pdx.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <reiserfs-list-return-10672-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com


>>>>> "Elliot" =3D=3D The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.ed=
u> writes:

[...]

Elliot> Wrong. I'm not going to claim I've got the right factor for how
Elliot> badly the birthday attack mangles the probability, but I believe
Elliot> 2**64 gives you around a 50% chance of finding a matching
Elliot> pair.

Sorry, you're right.  I misremembered it -- square root instead of
half.  It's been a while since I've done any reasonable amount of crypto
reading.  Of course, I could have just looked it up:
http://mathworld.wolfram.com/BirthdayAttack.html
where it says that the expected value for the number of files needed
would be 1.2*sqrt(2**128) (about 2E19 if you want to think in base 10).

=2D-=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9ANeRrynHGRJLYfoRAlkuAJ0a8jbG5mJZhIbzSpBO96aPQ2WoGgCcDaX9
8YN0+/YinhHRhkhKKk3Qt9A=
=O/XU
-----END PGP SIGNATURE-----
--=-=-=--


