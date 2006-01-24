From: Roman I Khimov <rik@osrc.info>
Subject: Re: Reiser4 corruption (fsck.reiser4 broken?)
Date: Wed, 25 Jan 2006 00:28:10 +0300
Message-ID: <200601250028.13857.rik@osrc.info>
References: <200601242257.43836.rik@osrc.info> <1138135840.29441.124.camel@gentoo>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8625170.FDQ91slxJg";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27855-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1138135840.29441.124.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Jake Maciejewski <maciejej@msoe.edu>

--nextPart8625170.FDQ91slxJg
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

24 =D1=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2006 23:50 | Jake Maciejewski:
> Someone correct me if I'm wrong, but kernels since 2.6.11-5 have the new
> plugin set which isn't supported by reiser4progs 1.0.4, so fscking with
> 1.0.4 was probably a big mistake.

I'm looking at Reiser4progs Changelog, this line:

	Handle new (crc related) fields in plugin set correctly.

from 2005-06-28 (post 1.0.4 changes) looks interesting. Seems that I'm not=
=20
so good at following reiserfs-list, because I knew about changes, but=20
somehow forgot to upgrade to 1.0.5 (and I can even remember why - at the=20
time it was released I wasn't using Reiser4, only looking at it from safe=20
Reiser3 /home, that was converted to Reiser4 in November). Cool... When=20
will I finally learn to be careful? ;-)

Sorry for the noise...

=2D-=20
                            Roman
 ,---------------------------. ,--------------------------.
/     http://www.3os.ru/      V    http://www.osrc.info/   \         .o.
\    mailto: rik@3os.ru       ^   mailto: rik@osrc.info    /         ..o
 `---------------------------' `--------------------------'          ooo
gpg --recv-keys 0xE5E055C3 --keyserver hkp://subkeys.pgp.net

--nextPart8625170.FDQ91slxJg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBD1pvtXJ70z+XgVcMRAkrlAKDCl0OZXVltHs7A+x+UB7iQpvbw/QCbBOTc
aFLrBUSIhRuGd2jg2OukX6c=
=AOAv
-----END PGP SIGNATURE-----

--nextPart8625170.FDQ91slxJg--
