From: Milan =?ISO-8859-1?Q?Holz=E4pfel?= <lists@mjh.name>
Subject: Re: kernel 2.4.27 reiserfs quotas patch
Date: Tue, 24 Aug 2004 00:19:23 +0200
Sender: news <news@sea.gmane.org>
Message-ID: <20040824001923.0b9b282f.lists@mjh.name>
References: <cgd0l9$6o0$1@sea.gmane.org>
	<200408231731.52174.christian.mayrhuber@gmx.net>
	<cgd735$pgm$1@sea.gmane.org>
	<20040823171337.GB29452@atrey.karlin.mff.cuni.cz>
	<cgddnf$btk$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 23 Aug 2004 13:39:27 -0500
"Jeff Meyer" <jeffm@andersonlabs.com> wrote:

> Problem fixed!!! You need to enable loadable module support selected in t=
he
> kernel.  Sorry!!!

I'd rather say that it's a bug that these patches require kernel modules
enabled... you just need to remove a #include line and it compiles fine
without modules enabled.  (At least the time I came to it, but I think
it were these 2.4.25 patches.  I also think I mailed the maintainer,
probably Jeff, about it but I never got a reply IIRC, and I didn't care
about it any more because I rarely use kernels without modules.)

Regards,
Milan


- --=20

                   Milan Holz=E4pfel alias jagdfalke alias jag

Meine eMail-Adresse ist hier zu              You can find my eMail-address
                      finden:                here:
Kontaktinfos sowie                                   Contact infos as well =
as
=D6ff GnuPG-Schl=FCssel    <URL:http://con.mjh.name/>    GnuPG Public Key
GnuPG Fingerabdruck     4C8A 5FAF 5D32 6125 89D1     GnuPG Fingerprint
                        0CE5 DB0C AF4F 6583 7966


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBKm1r2wyvT2WDeWYRAvpFAKDnqPsdY33jT4IQpV2MjPJOzP7WowCfT5A9
nqQMIpJdewJnWG5iKHKwdNs=3D
=3DaJV2
-----END PGP SIGNATURE-----

