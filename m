From: Todd Lyons <todd@mrball.net>
Subject: Re: ReiserFS Bug - Big Problem
Date: Mon, 17 Jun 2002 09:16:47 -0700
Message-ID: <20020617161647.GD4009@mrball.net>
References: <000001c215e1$df905c00$b44f5ec2@Schleppi> <20020617134357.A29338@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a2FkP9tdjPU2nyhF"
Return-path: <reiserfs-list-return-10760-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020617134357.A29338@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--a2FkP9tdjPU2nyhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Oleg Drokin wanted us to know:

>> I was unpacking a big file (700 MB) and in this operation the system
>> crashed.=20
>What is the kernel version you are using?

If he's on a default install of Mandrake 8.2, the kernel is 2.4.18.
Mandrake's kernel is patched with quite a few additions, but I believe
in regards to reiserfs, it's relatively pure.

>> To prevent errors I did a reiserfsck, but this stops with:
>> get_next_directory_item: 41005 275370 0x1 DIR is not found
>What reiserfsck version do you use?

If he's on a default install of Mandrake 8.2:
[todd@todd todd]$ rpm -qa | grep reiserfs
reiserfsprogs-3.x.0j-5mdk

To the original poster, I suggest that you download the
reiserfsprogs-3.x.1b source rpm from Cooker and recompile it.  You
cannot download the binary rpm because Cooker has shifted to gcc 3.1 and
you would have to install a few new libs.  Not necessary.  Just download
the reiserfsprogs-3.x.1b source rpm and do 'rpm --rebuild reiserfs*'
--=20
Blue skies...	Todd 	Public key: http://www.mrball.net/todd.asc
=2E..and I will strike down upon thee with great vengeance and furious
 anger, those who attempt to poison and destroy my binaries, and you=20
    will know my name is root, when I lay my vengeance upon you.

--a2FkP9tdjPU2nyhF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9DgtvIBT1264ScBURAjslAKDXe1n5f/tzpHchqw8OrwEoATP0nQCgu9m2
BYCv2dyQyVr6Q0tNNSJiD5A=
=H8ZU
-----END PGP SIGNATURE-----

--a2FkP9tdjPU2nyhF--
