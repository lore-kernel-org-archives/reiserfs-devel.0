From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: The situation at hand and in the future
Date: Mon, 31 May 2004 11:16:48 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87r7t0iq3j.fsf@uhoreg.ca>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu>
 <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org>
 <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org>
 <40B919DF.3040408@slaphack.com> <20040530122713.GX4990@nysv.org>
 <40BA802C.5070907@slaphack.com> <20040531083835.GB4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18930-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

>>>>> "Markus" =3D=3D Markus T=F6rnqvist <mjt@nysv.org> writes:

[...]

Markus> I heard once that using many encryptions may reduce the level of
Markus> security.  I don't know if there's any real truth behind
Markus> this. But if there is, maybe it should be impossible to support
Markus> two cryptos, only a crypto and a compression.

I would have a hard time believing that double encryption would weaken
anything (unless you're using ROT13).  Double encryption might not make
anything stronger, or might not strengthen more than you would expect
(e.g. double DES is not "twice" as strong as single DES), though.  3-DES
is basically just DES three times.

I would also imagine that encrypting twice, each time with different
ciphers, has a very good chance of being stronger than just a single
encryption.

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

