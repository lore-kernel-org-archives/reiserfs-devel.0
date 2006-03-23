From: Alexander Gran <alex@zodiac.dnsalias.org>
Subject: Re: 2.6.16-rc6-mm2: reiser4 BUG when unmounting fs
Date: Thu, 23 Mar 2006 18:32:14 +0100
Message-ID: <200603231832.21706@zodiac.zodiac.dnsalias.org>
References: <20060318044056.350a2931.akpm@osdl.org> <44206428.1080005@free.fr> <1143013406.6245.46.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5040566.CfzM4MkytI";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751349AbWCWRcd@vger.kernel.org>
In-Reply-To: <1143013406.6245.46.camel@tribesman.namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Laurent Riffard <laurent.riffard@free.fr>, Andrew Morton <akpm@osdl.org>, Kernel development list <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

--nextPart5040566.CfzM4MkytI
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Mittwoch, 22. M=E4rz 2006 08:43 schrieb Vladimir V. Saveliev:
> The attached patch fixes the problem.

confirmed, works in 2.6.16-mm1.

regards
Alex

=2D-=20
Encrypted Mails welcome.
PGP-Key at http://zodiac.dnsalias.org/misc/pgpkey.asc | Key-ID: 0x6D7DD291

--nextPart5040566.CfzM4MkytI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEItul/aHb+2190pERAsVnAJ495P2/pmSqdqsemDJSDOMvJ9optQCfdQze
2j8Strj/UpKrbU/r3nbNqeo=
=PGPy
-----END PGP SIGNATURE-----

--nextPart5040566.CfzM4MkytI--
