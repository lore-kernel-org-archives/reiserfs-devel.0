From: rvalles <rvalles@es.gnu.org>
Subject: Re: reiser4 in 2.6.14 - lockups with mmapped files
Date: Sat, 12 Nov 2005 02:58:40 +0100
Message-ID: <16343.0844237611$1131761368@news.gmane.org>
References: <1130860221.12859.23.camel@laptop> <436796F6.10603@namesys.com> <1131028204.13284.29.camel@laptop> <436A706E.2010001@free.fr> <436B8A10.3000400@namesys.com> <436BB8AF.9020103@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <reiserfs-list-return-26872-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <436BB8AF.9020103@free.fr>
Sender: <tux@148.Red-217-126-33.pooles.rima-tde.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Still having the same problem, with 2.6.14.2 patched with 2.6.14-1
reiser4 patch.

It's easy to trigger it while editing a file with vim, and it does take
a hell of a long wait (while it hits the disk for a minute or so,
sometimes) for it to unlock.

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDdUxQrD81VR3MDtoRAohEAJ9nVJKuTZ7tPrho2pS7pkNMGJe2rwCff0FE
AnA/StJT9GvXpqsuIHEWHl4=
=BHUU
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
