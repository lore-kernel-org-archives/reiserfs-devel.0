From: Bennett Todd <bet@rahul.net>
Subject: Re: getting UUID and label of a filesystem
Date: Mon, 10 Nov 2003 16:05:13 -0500
Message-ID: <20031110210513.GA20463@rahul.net>
References: <3FAAB330.5040503@nrao.edu> <1068152041.2327.34.camel@dragonball> <3FAFF00C.1000404@ysu.edu> <20031110201432.GB2014@mis-mike-wstn.matchmail.com> <3FAFF7B3.5030306@nrao.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <reiserfs-list-return-16044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3FAFF7B3.5030306@nrao.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Boyd Waters <bwaters+moz@nrao.edu>
Cc: reiserfs-list@namesys.com

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2003-11-10T15:40:19 Boyd Waters:
> Mike Fedyk wrote:
> > On Mon, Nov 10, 2003 at 03:07:40PM -0500, John Dalbec wrote:
> > > I've added myself to the "disk" group and it works for me as
> > > non-root.  You just need read access to the raw device, no?
> >
> > Yes.
> > But how many need access to the UUID information?  That can be a
> > big security hole...
>
> Um, can you point me to info regarding security holes in exposing
> the UUID of a filesystem?

Interesting. I read Mike's response to be talking about the security
consequences of having lots of users able to read the raw disk
device, and thereby bypass any access control mechanisms the
filesystem might implement (including even normal Unix file
permissions).

-Bennett

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/r/2JHZWg9mCTffwRAvhFAJ9lueX4e9ylubWp20+opC49wTR0WgCgz8cO
QBmTMKrYBpGqSP4hmP4VLtU=
=DDur
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
