From: Tonnerre <tonnerre@thundrix.ch>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 21:10:44 +0200
Message-ID: <20040829191044.GA10090@thundrix.ch>
References: <1453776111.20040826131547@tnonline.net> <200408272358.i7RNweGh002703@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <reiserfs-list-return-21080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408272358.i7RNweGh002703@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Salut,

On Fri, Aug 27, 2004 at 07:58:40PM -0400, Horst von Brand wrote:
> >   Also,  you  are thinking _very_ narrowly now. There are thousands of
> >   file  formats.  Implementing  the  support  for  meta-data/ streams/
> >   attributes  in  the  kernel  will  make  it  possible  to  use  this
> >   generically for all files.
>=20
> So the _kernel_ has to know about thousands of formats, just in case it
> some blue day it comes across a strange file? Better leave that to the
> applications.

I'd  do  that  quite  differently:  Collect metadata  about  files  in
extended attributes (which are  rather universally useable), and do it
=66rom  an userspace daemon/application/file  manager plugin  which uses
dynamically   loadable   plugins   for   the  different   file   types
differentiated by libmagic.

This has nothing to do in the kernel.

			    Tonnerre


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.2 (GNU/Linux)

iD8DBQFBMio0/4bL7ovhw40RApOOAJ47ZDBdx50JTQ01PLD/kyxc53UacwCgmDxF
GjOjLO50MeUI0HKv9T/biWw=
=pwyS
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
