From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: copying partition to partition, sector by
	sector, live
Date: 22 Apr 2002 11:58:33 -0600
Message-ID: <1019498313.1299.3.camel@oberon.rnd.esoft.com>
References: <20020421181614.GA11239@vega.ipal.net>
	<20020422010733.GA2379@amphibian.dyndns.org> 
	<20020422013955.GB8407@vega.ipal.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-+CDknedQKfDEQLs/LeYg"
Return-path: <reiserfs-list-return-10126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020422013955.GB8407@vega.ipal.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: reiserfs-list@namesys.com

--=-+CDknedQKfDEQLs/LeYg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2002-04-21 at 19:39, Phil Howard wrote:
> On Mon, Apr 22, 2002 at 02:07:33AM +0100, Matthew Toseland wrote:
>=20
> | Ummm, LVM snapshots? (man lvcreate).
>=20
> No.  Nothing to do with LVM.

In order to do what you are talking about (doing a raw copy of a file
system), you should use a LVM snapshot.  This will prevent the time skew
you were worried about.  The snapshot will not change over time as you
copy it.

When you mount the new copy of the filesystem, it should act as if the
power failed when you took the snapshot, and rerun the journal.
--=20
Jonathan Briggs
jbriggs@esoft.com

--=-+CDknedQKfDEQLs/LeYg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8xE9IG8fHaOLTWwgRAs9AAKCSAElGH32eSpTOeZN1WYyyflmf+wCgh9qh
UvE17jywQYtoYkSNlMYYOmI=
=4Lil
-----END PGP SIGNATURE-----

--=-+CDknedQKfDEQLs/LeYg--

