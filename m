From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 21:47:26 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87oeqdvikh.fsf@uhoreg.ca>
References: <1080620527.31924.117.camel@localhost.localdomain> <20040330123546.GA5229@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17605-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

>>>>> "Markus" =3D=3D Markus T=F6rnqvist <mjt@nysv.org> writes:

[...]

Markus> It's not good to think about lexicographic ordering, btw,
Markus> because readdir must not find this directory. Consider the
Markus> following times a million when taking a backup:
Markus> mjt@shrike:~/..metas/plugin/crypto/..metas/plugin/crypto/..metas$

pseudofiles shouldn't have metadata, so
~/..metas/plugin/crypto/..metas/plugin/crypto/... shouldn't exist
anyways.  But readdir shouldn't return that directory, because it's
just duplicated data.

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

