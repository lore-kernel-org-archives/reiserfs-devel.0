From: Milan =?ISO-8859-1?Q?Holz=E4pfel?= - Personal reply info see sig <lists@mjh.name>
Subject: 2004.08.13 Snapshot for 2.6.8[.1]
Date: Sat, 14 Aug 2004 16:56:01 +0200
Sender: news <news@sea.gmane.org>
Message-ID: <20040814165601.79260f07.lists@mjh.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello all,

For those of you who want to use Reiser4 with a vanilla kernel: I have
rediffed the yesterdays "official" snapshot from
<URL:http://namesys.com/snapshots/2004.08.13/> against 2.6.8[.1]:
<URL:http://linux.mjh.name/kernel/patches/reiser4/2004.08.13_2.6.8.1/>

I had one compile error complaining about a missing attribute of the
inode struct in reiser4/plugins/object.c:992, but since this seems to be
sth. only present in the mm series but not used by Reiser4 outcommenting
the line did the job for me. (Well according to the fixme beloning to it
I probably should not have gotten it anyway...)

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

iD8DBQFBHigB2wyvT2WDeWYRAsEEAJ45mWixDe+GKYNXvIhXq2OvOvPs9QCfYVAU
uaXstH17Y3yvjvXCXPmlgNw=3D
=3Du9cm
-----END PGP SIGNATURE-----

