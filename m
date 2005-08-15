From: Vanuxem =?ISO-8859-1?Q?Gr=E9gory?= <g.vanuxem@wanadoo.fr>
Subject: Re: reiser4progs 1.0.5 configure script and libaal 1.0.5
Date: Mon, 15 Aug 2005 22:25:01 +0200
Message-ID: <1124137501.3917.6.camel@localhost.localdomain>
References: <1123947554.11989.ezmlm@namesys.com>
	 <1124116832.24528.13.camel@localhost.localdomain>
	 <1124116956.24528.15.camel@localhost.localdomain>
	 <200508151921.08622.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25497-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508151921.08622.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,

Le lundi 15 ao=FBt 2005 =E0 19:21 +0400, Vitaly Fertman a =E9crit :
> ok, as we can see in config.log the problem is:
>=20
> /usr/bin/ld: __libc_errno: TLS definition in=20
> /usr/lib/gcc-lib/x86_64-linux-gnu/3.3.6/../../../../lib64/libc.a(errno.o)=
=20
> section .tbss mismatches non-TLS reference in=20
> /usr/lib/gcc-lib/x86_64-linux-gnu/3.3.6/../../../../lib64/libc.a(check_fd=
s.o)
>=20
> /usr/lib/gcc-lib/x86_64-linux-gnu/3.3.6/../../../../lib64/libc.a:=20
> ne peut lire les symboles: Mauvaise valeur
>=20
> when we try to compile the test program.=20
> this message points to a problem in libc, not in libaal.
>=20
>=20
> there is a test program : /home/greg/temp/conftest.c
> I try to compile it with the same command as from the config.log,
> but not linking it to libaal:
> # gcc -o conftest -O2 -march=3Dathlon-xp -mcpu=3Dathlon-xp -mmmx=20
> -msse -msse2 -mfpmath=3Dsse -static   conftest.c
>=20
> and get the same error message.
>=20
> but if I remove -static, it gets compiled successfully.
> even if I also link it to libaal -- there is a program conftest2.c, the s=
ame as
> the one that fails from the config.log, I run the same command as mention=
ed=20
> in config.log:
> # gcc -o conftest2  -march=3Dathlon-xp -mcpu=3Dathlon-xp -mmmx=20
> -msse -msse2 -mfpmath=3Dsse    conftest2.c -laal
> # <- success
>=20
> so the problem is related to installed libc, not to libaal.
>=20

This is a known bug in glibc 2.3.2.

I've upgraded to the glibc version 2.3.5 and
that works.

Thanks,


Cheers,

Greg



