From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: The situation at hand and in the future
Date: Sun, 30 May 2004 12:54:57 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87ekp1luse.fsf@uhoreg.ca>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu>
 <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org>
 <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org>
 <40B919DF.3040408@slaphack.com> <87k6yuzqyb.fsf@uhoreg.ca>
 <20040530122948.GY4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18915-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

>>>>> "Markus" =3D=3D Markus T=F6rnqvist <mjt@nysv.org> writes:

Markus> On Sat, May 29, 2004 at 08:41:48PM -0400, Hubert Chan wrote:

Markus> This is a lame question, but what does a known-plaintext attack
Markus> imply?

Markus> The cracker wants to know the plaintext passphrase instead of
Markus> some random string whose hash matches the original passphrase's
Markus> hash?

Known plaintext mostly applies to encryption -- I don't know about any
version that applies to hashes.  In known plaintext, the attacker has a
plaintext, and the encrypted data, and is able to retrieve the key from
that.

e.g. if the attacker knows the first several bytes of your file, they
may be able to retrieve the key and decrypt the rest of the file.

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

