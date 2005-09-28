From: Fionn Behrens <fionn@spamfilter.de>
Subject: Re: Full of surprises - A reiser4 story from userland
Date: Wed, 28 Sep 2005 19:57:50 +0200
Message-ID: <1127930269.12894.143.camel@laptop>
References: <1127914812.12894.96.camel@laptop>
	 <200509281825.49873.vitaly@namesys.com> <1127921286.12894.106.camel@laptop>
	 <200509282040.27371.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-JzN1bPEKwyRKr9j5p8iq"
Return-path: <reiserfs-list-return-26308-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509282040.27371.vitaly@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-JzN1bPEKwyRKr9j5p8iq
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mi, 2005-09-28 at 20:40 +0400, Vitaly Fertman wrote:

> remember that reiser4progs-1.0.4 supports both formats, in other words
> having the format updated to the new one, you are able to use new
> kernelonly. If you want to move back to 2.6.10, you have to build-fs
> with 1.0.3 version or reiser4progs.

Do I get this right? I had reiser4progs 1.0.4 and it should already know
the new format? If what you say is right then fsck should have not
complained about an error in the first place AND I still should not be
able to boot with the old kernel any more after --build-fs.=20
But it found an error. And I ran --build-fs with it. And now I am using
the old kernel again and it does NOT complain about errors any more.
(except for that flag we discussed already).=20

Pardon me, I am confused.

best regards,
		Fionn
--=20
 "I feel like God wants me to run for President. I can't explain it,=20
  but I sense my country is going to need me."  *** George W. Bush, 1999
   Quoted from the book "The Faith of George W. Bush" by Steve Mansfield
 =20

--=-JzN1bPEKwyRKr9j5p8iq
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDOtmdjkvYSI4bFywRArr8AJoDdJhMsQd6sAihE4QkP+kj9oRxpACaAnqq
LN0CMJSYlKhA0x8SOUrJ5oI=
=uHHo
-----END PGP SIGNATURE-----

--=-JzN1bPEKwyRKr9j5p8iq--


