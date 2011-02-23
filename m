From: higuita <higuita@GMX.net>
Subject: Re: reiserfsck (v3): out of disk space
Date: Wed, 23 Feb 2011 23:31:43 +0000
Message-ID: <20110223233143.453edb42@Couracado.homelinux.net>
References: <20110222030056.3379d223@Couracado.homelinux.net>
	<4D638E2F.9030305@gmail.com>
	<20110222230803.6c1fccce@Couracado.homelinux.net>
	<4D644E50.7020801@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/a_p+9D.+TjBhpj_==mIV4oM"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D644E50.7020801@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

--Sig_/a_p+9D.+TjBhpj_==mIV4oM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi again!

On Wed, 23 Feb 2011 01:01:20 +0100, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Could you try the following troubleshooting?
> http://www.mail-archive.com/reiserfs-list@namesys.com/msg21596.html

	THANKS! it worked fine, i manage to recover the partition.

	As i already had expanded the partition the, the --rebuild-sb
detected the new space and after the rebuild-tree i could finally access
again to the partition... next step, update my backup and then clean old
trash to free up some space!  :)

	Thank you Edward, you saved my data and teach me about a new
interesting reiserfsck option.

	Thank you all for reiserfs
higuita
--=20
Naturally the common people don't want war... but after all it is the
leaders of a country who determine the policy, and it is always a=20
simple matter to drag the people along, whether it is a democracy, or
a fascist dictatorship, or a parliament, or a communist dictatorship.
Voice or no voice, the people can always be brought to the bidding of
the leaders. That is easy. All you have to do is tell them they are=20
being attacked, and denounce the pacifists for lack of patriotism and
exposing the country to danger.  It works the same in every country.
           -- Hermann Goering, Nazi and war criminal, 1883-1946

--Sig_/a_p+9D.+TjBhpj_==mIV4oM
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk1lmOAACgkQrv1jazsMcrPryQCeMlO2I5IuwUitF7yTLcDiOWCJ
SEUAoKT6hhT4F/b6jWYw079n5MBN8Lco
=8hfG
-----END PGP SIGNATURE-----

--Sig_/a_p+9D.+TjBhpj_==mIV4oM--
