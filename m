From: Pat Double <pat@patdouble.com>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Mon, 14 Nov 2005 11:48:15 -0600
Message-ID: <200511141148.18466.pat@patdouble.com>
References: <200511111359.39715.jgilmore@glycou.com> <20051113141213.07be2e71@SiRiUS.home> <43774823.2090201@ursynow.2a.pl>
Reply-To: pat@patdouble.com
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart17712764.3e760lIWLF";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26931-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43774823.2090201@ursynow.2a.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart17712764.3e760lIWLF
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 13 November 2005 08:05, Artur Mak=F3wka wrote:
> Thomas Kuther wrote:
>
> i was using anticipatory I/O as default in debian. i just did echo cfq >
>   /sys/block/hda/queue/scheduler. Hope its enough to change it.
>
> no noticed effects yet, i will give report, if anything changes.

I tried changing the scheduler like this and it worked the first time with =
low=20
load and my X session was not started. I tried it again and it locked up th=
e=20
filesystem I had to reboot and rebuild the filesystem. I was changing from=
=20
cfq to anticipatory. Be careful!

=2D-=20
Pat Double, pat@patdouble.com
"In the beginning God created the heaven and the earth."

--nextPart17712764.3e760lIWLF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDeM3i7AY1KcVLrSYRArceAJ4l3O3pv+QY4MIMy5gqretaZBWvWACeLpLj
yNtn78d+Q5ja34vwYq8+NzM=
=Wzzb
-----END PGP SIGNATURE-----

--nextPart17712764.3e760lIWLF--
