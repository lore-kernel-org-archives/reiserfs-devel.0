From: Gianni Tedesco <gianni@scaramanga.co.uk>
Subject: Re: new reiser4 snapshot is available
Date: Fri, 14 Nov 2003 12:04:25 +0100
Message-ID: <1068807864.2883.1520.camel@lemsip>
References: <20031113143438.GD1278@backtop.namesys.com>
	 <20031114094217.GH1278@backtop.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-kRPWt8rLtbFPsi701d2I"
Return-path: <reiserfs-list-return-16086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031114094217.GH1278@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alex Zarochentsev <zam@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--=-kRPWt8rLtbFPsi701d2I
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-11-14 at 10:42, Alex Zarochentsev wrote:
> > fetch it
> > http://namesys.com/snapshots/2003.11.12/linux-2.6.0-test9-reiser4.diff.=
gz

Seems to be combined with the UML patch...

zcat linux-2.6.0-test9-reiser4.diff.gz | diffstat
 Makefile                                                     |    2
 arch/i386/kernel/entry.S                                     |    4
 arch/i386/kernel/sys_i386.c                                  |    2
 arch/um/Kconfig                                              |   48
 arch/um/Kconfig_block                                        |   14
 arch/um/Kconfig_net                                          |   70
 arch/um/Makefile                                             |   49
 arch/um/Makefile-i386                                        |   20
 arch/um/Makefile-skas                                        |    6
 arch/um/config.release                                       |    1
 arch/um/defconfig                                            |  203
 arch/um/drivers/Makefile                                     |    6
 arch/um/drivers/chan_kern.c                                  |    1
 arch/um/drivers/chan_user.c                                  |    4

etc....

--=20
// Gianni Tedesco (gianni at scaramanga dot co dot uk)
lynx --source www.scaramanga.co.uk/scaramanga.asc | gpg --import
8646BE7D: 6D9F 2287 870E A2C9 8F60 3A3C 91B5 7669 8646 BE7D

--=-kRPWt8rLtbFPsi701d2I
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/tLa4kbV2aYZGvn0RAkYmAJsG2zhLRo6yjTCbgV/+8O5/fkCJxwCfaEbk
0yWKj63zohmPJagRa8QU9Iw=
=oj+h
-----END PGP SIGNATURE-----

--=-kRPWt8rLtbFPsi701d2I--

