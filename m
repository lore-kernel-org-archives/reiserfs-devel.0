From: Tonnerre <tonnerre@thundrix.ch>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 8 Sep 2004 17:25:12 +0200
Message-ID: <20040908152512.GA2726@thundrix.ch>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <200408290004.i7T04DEO003646@localhost.localdomain> <20040901224513.GM31934@mail.shareable.org> <20040903082256.GA17629@kroah.com> <2f4958ff04090301326e7302c1@mail.gmail.com> <41383142.4080201@hist.no> <2f4958ff04090302141bc222e5@mail.gmail.com> <413ECC32.8070509@hist.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <reiserfs-list-return-21634-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <413ECC32.8070509@hist.no>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Helge Hafting <helge.hafting@hist.no>
Cc: Grzegorz Ja??kiewicz <gryzman@gmail.com>, Greg KH <greg@kroah.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Salut,

On Wed, Sep 08, 2004 at 11:09:06AM +0200, Helge Hafting wrote:
> >udef is a one big mistake, having need for userspace tool to use FS is
> >at least silly.
>=20
> Well, devfs had devfsd - a userspace tool . . .

devfsd was not a requirement, it was only a tool for people who wanted
their old device names for devfs devices. I was once doing a miniature
environment for  a package installation  system which used  pure devfs
(i.e.   no  old  dev names),  and  it  was  doing super  well  without
devfs. sysinstall  was the only  process running, and I  could install
Linux on any writeable device without using devfsd.

			   Tonnerre

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.2 (GNU/Linux)

iD8DBQFBPyRX/4bL7ovhw40RAvlnAJ9Fkrv0fPp+PIRH/e9ZDCBBhudX4wCgodJ0
Y7sxldd8kDTHKVKKX9gZEPI=
=iXdQ
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
