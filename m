From: Bennett Todd <bet@rahul.net>
Subject: Re: Status of fsync() wrt mail servers
Date: Wed, 10 Sep 2003 07:41:03 -0400
Message-ID: <20030910114103.GA26767@rahul.net>
References: <20030910002953.C14172@unbeatenpath.net> <20030910105102.GA535@rahul.net> <1063192474.18154.355.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <reiserfs-list-return-15619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1063192474.18154.355.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

2003-09-10T07:14:34 Chris Mason:
> On Wed, 2003-09-10 at 06:51, Bennett Todd wrote:
> > What postfix demands (if you wish to adhere strictly to some
> > peoples' interpretations of RFCs) is that when fsync returns, the
> > filesystem guarantees that even if there's a crash an instant after,
> > the file, data as well as metadata, will be intact when the machine
> > comes up again. This is in support of a desire to positively commit
> > to the sender that the receiving MTA has accepted receipt for a
> > message.
>=20
> This is what reiserfs does, the metadata is on disk after an fsync,
> including any renames.

Metadata, yes, I've got that. How about the data? Does return from
fsync guarantee that the data will be intact as well?

-Bennett

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/Xw3OHZWg9mCTffwRAuUhAJ4hDoSqmOOAyocbRC0Xl1kKd1tqpgCfRzNp
m3/UM1jET1pepgF5oGtqZ78=
=1vPS
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
