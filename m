From: Milan =?ISO-8859-1?Q?Holz=E4pfel?= <lists@mjh.name>
Subject: Re: ReiserFS V3 and linux-kernel-2.6
Date: Thu, 17 Feb 2005 15:03:37 +0100
Message-ID: <20050217150337.767e320e.lists@mjh.name>
References: <139119350.20050209110514@kgpa.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 9 Feb 2005 11:05:14 +0200
"Oleg O. Ossovitskii" <oleg@kgpa.ru> wrote:

> # CONFIG_DEVFS_MOUNT is not set

Your kernel won't probably mount the devfs filesystem without this
option.  I am however not sure whether this will have any influence on
the kernel mounting its root fs or not (since DEVFS is mounted under
/dev, and when there's no /, where to mount it?).  But you could try it
anyway.

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



                    http://www.deppenleerzeichen.de/                       =
=20


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFCFKQ52wyvT2WDeWYRAt0HAKC7xSkMzDQhjYTntEOqGEig00CRUACgsH58
u/eQeSCpmy8sQDeSBv22aXg=3D
=3D0cZL
-----END PGP SIGNATURE-----

