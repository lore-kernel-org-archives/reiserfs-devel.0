From: Todd Lyons <todd@mrball.net>
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Fri, 8 Nov 2002 11:49:48 -0800
Message-ID: <20021108194948.GA1750@mrball.net>
References: <9918235451.20021106132043@kgpa.ru> <20021107090256.GC11974@mrball.net> <15818.17585.789642.675479@laputa.namesys.com> <20021108162743.GA21976@mrball.net> <15819.62364.997716.421729@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Return-path: <reiserfs-list-return-11951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15819.62364.997716.421729@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@namesys.com>
Cc: ReiserFS-List <reiserfs-list@namesys.com>


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Nikita Danilov wanted us to know:

> > [root@trip ~]# modprobe reiser4
> > /lib/modules/2.5.45-3/kernel/fs/reiser4/reiser4.o: unresolved symbol
> > page_states__per_cpu
>This is bug in the handling of per-cpu variables. Andrew Morton and
>Rusty Russell posted patches to fix it. Here is one:
>Please let me know whether this helps.

Yes, it fixed it. =20

Maybe my understanding is a little off, but I thought that I could just
rebuild the modules and install them and run depmod and the new module
symbols would be in effect.  But that didn't work (same error).

So then I tried also a make bzImage and make install (which updates the
System.map, something that didn't get done with make modules_install).
It still would not load (same error).

Finally, I rebooted loading the new kernel and that fixed it.  No
comments needed, unless they are "what you did should have worked."

>Alternatively, you can compile reiser4 as built-in (not module), or

Much prefer modules for everything.  Kinda spoiled by the ability to
change configurations on the fly.

>disable module versioning.

Something to think about...
--=20
Blue skies...		Todd
| Get a bigger hammer!   |  ...file transfer by email is evil.    |
| http://www.mrball.net  |                              NANOG     |
| http://faq.mrball.net  |                                        |
   Linux kernel 2.5.45-3   load average: 0.24, 0.21, 0.09

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9zBVcIBT1264ScBURAuAEAKDbqi6PYEx7s5F09VgZjNG5eOOCZQCfV30I
W464vTglxm82g6/cqzJAvYI=
=er4S
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
