From: Todd Lyons <todd@mrball.net>
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Fri, 8 Nov 2002 08:27:43 -0800
Message-ID: <20021108162743.GA21976@mrball.net>
References: <9918235451.20021106132043@kgpa.ru> <20021107090256.GC11974@mrball.net> <15818.17585.789642.675479@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <reiserfs-list-return-11949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15818.17585.789642.675479@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: ReiserFS-List <reiserfs-list@Namesys.COM>


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Nikita Danilov wanted us to know:

> > Still compiling.  In the reiser4 code right now....well, it built and
> > linked.  That's a good sign.

It compiled and installed, but it doesn't load:

[root@trip ~]# modprobe reiser4
/lib/modules/2.5.45-3/kernel/fs/reiser4/reiser4.o: unresolved symbol
page_states__per_cpu
modprobe: insmod /lib/modules/2.5.45-3/kernel/fs/reiser4/reiser4.o failed
modprobe: insmod reiser4 failed

> > Curious if anybody feels that I should have chosen different values for
> > any of the options.
>Reasonable options for debugging. Will result in dead-slow reiser4 though.

Ok, will remove the debugging options.  In the meantime, gotta figure
out why it's got that unresolved symbol.
--=20
Blue skies...	Todd                   http://www.mrball.net
       Public key:  http://www.mrball.net/todd.asc
 Development is like evolution and there is no turning back.
   Linux kernel 2.5.45-3   1 user,  load average: 0.00, 0.00, 0.00

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9y+X/IBT1264ScBURAiJQAJsFQXvkL7VTIOY8tkTwiBpj8xix7gCePKze
X9QNw2iyyPJpNoSaQcTyoAI=
=TFG9
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
