From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: The situation at hand and in the future
Date: Sun, 30 May 2004 13:09:24 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87aczplu4b.fsf@uhoreg.ca>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu>
 <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org>
 <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org>
 <40B919DF.3040408@slaphack.com> <20040530122713.GX4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18916-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

>>>>> "Markus" =3D=3D Markus T=F6rnqvist <mjt@nysv.org> writes:

[...]

Markus> I can't remember how MD5 works. It's a 32-byte 7-bit hash of
Markus> data?  It has also something to do with the length of the data,
Markus> if you know how long the data is, it's easier to do a successful
Markus> birthday attack.

Huh?  A birthday attack isn't related to retrieving the original text
from the hash.  A birthday attack just shows how you can find two
strings that hash to the same value.

If you know how long the data is, it (greatly) reduces the space that
you need to search.  I don't know of any other vulnerabilities related
to known length.

BTW, MD5 has some known vulnerabilities related to hash collisions.  I
don't know the details -- I've only heard it mentioned briefly -- but
extremely paranoid people will probably want to use SHA1 instead.

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

