From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: duplicate files and recent changes
Date: Thu, 06 Jun 2002 13:51:46 -0400
Sender: news <news@main.gmane.org>
Message-ID: <87ofeo70st.fsf@labatt.uhoreg.ca>
References: <20020606094504.A851@namesys.com> <Pine.WNT.4.43.0206060328570.1296-100000@fanatic>
 <20020606132505.A2647@namesys.com>
 <200206061358.g56DwF0H001550@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <reiserfs-list-return-10583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com


>>>>> "Valdis" =3D=3D Valdis Kletnieks <Valdis.Kletnieks@vt.edu> writes:

Valdis> On Thu, 06 Jun 2002 13:25:05 +0400, Oleg Drokin said:
>> But MD5 may be identical for different files.

Valdis> Only a 2**128 chance of that.  If you know a way to force a hash
Valdis> collision more frequently than that, the crypto world wants to
Valdis> hear from you.. ;)

You probably wanted to say "one in 2**128 chance".  2**128 is a pretty
big probability that it would happen! :-)

Technically, the probability is actually somewhere between one in 2**128
and one in 2**127 (depending on how many files you have), due to the
birthday attack.  But one in 2**127 is still pretty small.

=2D-=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE8/6E3rynHGRJLYfoRAgvQAJ4vkiSf7PDSinXZ1hRR9CtskUzFNgCfcOtp
PLDlN1JAgb9Bbyapl+oRjNM=
=Irwx
-----END PGP SIGNATURE-----
--=-=-=--


