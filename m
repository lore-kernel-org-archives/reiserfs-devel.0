From: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Subject: Re: Reiserfs concurrent write problems
Date: Thu, 29 Apr 2004 14:08:32 -0600
Message-ID: <20040429200832.GA7399@em.ca>
References: <20040426172648.GA22918@em.ca> <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca> <1083088841.30344.131.camel@watt.suse.com> <20040427201559.GA17186@em.ca> <1083196101.30344.222.camel@watt.suse.com> <20040429190403.GA4015@em.ca> <1083266365.30344.309.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Return-path: <reiserfs-list-return-18295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1083266365.30344.309.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2004 at 03:19:25PM -0400, Chris Mason wrote:
> On Thu, 2004-04-29 at 15:04, Bruce Guenter wrote:
> > > In reiserfs data=3Djournal mode, you get strict ordering of all the
> > > transactions.
> >=20
> > What about in data=3Dordered mode?
>
> It won't work in the face of io errors.

What kind of I/O errors would cause what kind of problems?
--=20
Bruce Guenter <bruceg@em.ca> http://em.ca/~bruceg/ http://untroubled.org/
OpenPGP key: 699980E8 / D0B7 C8DD 365D A395 29DA  2E2A E96F B2DC 6999 80E8

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAkWDA6W+y3GmZgOgRApz9AJwJnofhPz6tazd1j6FjmGTHdxZ2DgCfZjJv
geC4y+Qhp9yAJmCqAmByWss=
=M+//
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
