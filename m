From: Todd Lyons <todd@mrball.net>
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Fri, 8 Nov 2002 12:39:19 -0800
Message-ID: <20021108203919.GF1750@mrball.net>
References: <9918235451.20021106132043@kgpa.ru> <20021107090256.GC11974@mrball.net> <15818.17585.789642.675479@laputa.namesys.com> <20021108162743.GA21976@mrball.net> <15819.62364.997716.421729@laputa.namesys.com> <20021108194948.GA1750@mrball.net> <200211082004.gA8K4kC8008480@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Return-path: <reiserfs-list-return-11953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200211082004.gA8K4kC8008480@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Valdis.Kletnieks@vt.edu
Cc: Nikita Danilov <Nikita@namesys.com>, ReiserFS-List <reiserfs-list@namesys.com>


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Valdis.Kletnieks@vt.edu wanted us to know:
>> Todd Lyons wrote:
>> Maybe my understanding is a little off, but I thought that I could
>> just rebuild the modules and install them and run depmod and the new
>> module symbols would be in effect.  But that didn't work (same
>> error).
>> So then I tried also a make bzImage and make install (which updates the
>> System.map, something that didn't get done with make modules_install).
>> It still would not load (same error).
>> Finally, I rebooted loading the new kernel and that fixed it.  No
>> comments needed, unless they are "what you did should have worked."
>I've seen similar issues when the /boot/System.map file doesn't match
>the kernel in use (this is particularly an issue for 'depmod' - the
>standard 'make modules_install' target passes a -F flag to depmod to
>use the just-created System.map file.

That I get.  You're saying that my make install step which updated the
System.map in /boot was nullfied because it didn't exactly match the
running kernel version.  And you're also saying that -F makes it ignore
what /proc/ksyms has.

But then that leads to the next problem.  That System.map doesn't match
the /proc/ksyms, so I'm still left with a reboot as my only option. =20

Thinking out loud.  But I didn't change the way that the kernel was
compiled.  Reiser4 is _still_ a module.  What am I missing?

Blue skies...			Todd

P.S. Valdis, I think this sig originally came from somebody's NANOG
post.  :)
--=20
A: No
Q: Should I quote at the end of the message?
   Linux kernel 2.5.45-3   load average: 0.00, 0.00, 0.00

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9zCD3IBT1264ScBURAvn9AJ936Dg4e+wEWtq/mpw7O8lFgJJ8tQCglM5x
RS3mJ+nZlosT3MPxIqF/Fgs=
=X6bz
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
