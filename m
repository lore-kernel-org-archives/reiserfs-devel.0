From: Stewart Smith <stewart@flamingspork.com>
Subject: RE: How to set a reiserfs partition to get an occasional fsck?
Date: Sat, 31 Jan 2004 15:09:37 +1100
Message-ID: <1075522177.27938.71.camel@faith>
References: <3DF9165145FACB4C96977FF650C1E904096336DD@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-TVGgRLw5oJE7biuh8ePf"
Return-path: <reiserfs-list-return-16666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E904096336DD@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Burnes, James" <james.burnes@gwl.com>
Cc: Michael.James@csiro.au, reiserfs-list@namesys.com

--=-TVGgRLw5oJE7biuh8ePf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-01-31 at 03:31, Burnes, James wrote:
> If this is a production machine (and it sounds like it), it would be
> much easier to test your RAM before putting it into production.  In

or buy ERROR CORRECTING RAM!!!! The trend in more recent years towards a
lack of error correction is just biting people *real* hard.

The corruption you see could purely be cosmic rays going through your
ram banks and flipping bits - people used to see this happening over 20
years ago, and ram densities have kind of increased since then.

The probability of this happening with 2GB ram these days is actually
quite high. Just hope it isn't a bit you care about.

but yeah, anywhere important - use ECC ram, or you may end up with such
strangeness - well, at least you'll be able to detect such strangeness!

--=-TVGgRLw5oJE7biuh8ePf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAGyqB3tgLgERgy8oRAtd6AJ4z5Smfke/uG+W7xuVKIr+jOGm53QCfc1Ni
wh9f36D/WjyL3a+Wzm7O4Mw=
=8VwX
-----END PGP SIGNATURE-----

--=-TVGgRLw5oJE7biuh8ePf--

