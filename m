From: Valdis.Kletnieks@vt.edu
Subject: Re: The situation at hand and in the future
Date: Mon, 31 May 2004 14:31:01 -0400
Message-ID: <200405311831.i4VIV1H7031045@turing-police.cc.vt.edu>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org>
            <40B919DF.3040408@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1304117522P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 29 May 2004 18:16:47 CDT."
             <40B919DF.3040408@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, reiserfs-list@namesys.com

--==_Exmh_1304117522P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, 29 May 2004 18:16:47 CDT, David Masover said:

> $ ln -s /tmp/foobar cipher
> =

> Of course, the nice thing here is that at least 'ln' refuses to create =
a
> broken symlink, not sure about more low-level things.

Odd.  At least my 'ln' is perfectly happy creating a dangling symlink:

[~]2 ls /tmp/foo
ls: /tmp/foo: No such file or directory
[~]2 ln -s /tmp/foo frobozz
[~]2 ls -l frobozz
lrwxrwxrwx  1 valdis valdis 8 May 31 14:28 frobozz -> /tmp/foo
[~]2 ls -lL frobozz
ls: frobozz: No such file or directory
[~]2 rpm -qf /bin/ln
coreutils-5.2.1-10

What did you mean by "broken" in that context?



--==_Exmh_1304117522P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAu3nlcC3lWbTT17ARAjnOAKC2Jl9HXrSJK3uFKMiXI3fF9WbTgACg8Nqg
31720PFIG4/OCbiHKlsApQw=
=GYrN
-----END PGP SIGNATURE-----

--==_Exmh_1304117522P--
