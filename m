From: Milan =?ISO-8859-1?Q?Holz=E4pfel?= <lists@mjh.name>
Subject: Re: Vanilla kernel patch
Date: Fri, 8 Oct 2004 16:29:25 +0200
Sender: news <news@sea.gmane.org>
Message-ID: <20041008162925.3e0e03c4.lists@mjh.name>
References: <200410071402.33421.biscani@pd.astro.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 7 Oct 2004 14:02:27 +0200
Francesco Biscani <biscani@pd.astro.it> wrote:

> Hi,
>=20
> yesterday I threw together a patchset to enable reiser4 for the vanilla=20
> 2.6.9-rc3 kernel.  [...]

I did the same some time ago with the last official snapshot, which has
worked fine for me so far.  reiser4 is used for my gentoo portage tree,
my /var filesystem, for a partition where portage compiles the packages
on and for Squid's cache (Squid is a http and ftp proxy).

> What are the pitfalls I'm falling in, doing this? Is this safe or is ther=
e=20
> stuff in -mm that is absolutely needed by reiser4?

Well I'd make the guess that if there is something in the mm kernel
which is absolutely needed by reiser4 then the thing won't link or you
will be unable to load the module if you chose to compile it as a
module.

> Thanks!

Regards,
Milan


- --=20

                   Milan Holz=E4pfel alias jagdfalke alias jag

Antworten direkt an mich                             Answers directly to me
gehen bitte an eine Addresse,                        go to an address one
die man hier finden kann:                            can find here, please:

Kontaktinfos sowie                                   Contact infos as well =
as
=D6ff GnuPG-Schl=FCssel    <URL:http://con.mjh.name/>    GnuPG Public Key
GnuPG Fingerabdruck     4C8A 5FAF 5D32 6125 89D1     GnuPG Fingerprint
                        0CE5 DB0C AF4F 6583 7966


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBZqRF2wyvT2WDeWYRAvvvAKDjc0RjCJoA9UdcJvSk7+gtWJFJ/ACeO29S
FPoE3gdyY49VyNt/y57KLj4=3D
=3DMs9R
-----END PGP SIGNATURE-----

