From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: The situation at hand and in the future
Date: Sat, 29 May 2004 16:04:04 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <873c5j0zm3.fsf@uhoreg.ca>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu>
 <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org>
 <40B89C9C.5050307@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18905-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "David" == David Masover <ninja@slaphack.com> writes:

[...]

David> Reading ahead in my mail, I see this has already been answered.
David> Note that cryptoloop does exactly what you're describing, only it
David> allows an incorrect passphrase to be entered, because it can't
David> tell the difference between correct or incorrect -- only you can,
David> because incorrect will yield gibberish.  We would want something
David> to persist that allows a passphrase to be checked.

Note that allowing a passphrase to be checked may decrease security
(slightly).  If an attacker has a way to check if the passphrase is
correct, it allows him/her to bruteforce the passphrase.  Otherwise,
when the attacker enters a passphrase and reads gibberish, he/she
doesn't know if that really is the data that's encrypted, or if he/she
entered the wrong passphrase.

Of course, in practice, it won't be too bad, because known file formats
are fairly easily recognizable.  But one could obtain "gibberish" to
encrypt by encrypting multiple times.  (So the attacker would need to
also know the number of encryption layers before he/she would be able
to bruteforce.)

[...]

David> | Ever since having read about Reiser4's implementation,
David> | cryptoloop has seemed like a terrible kludge, so I'm really
David> | looking forward to this better solution.

David> dm_crypt is a better solution than cryptoloop, but this is better
David> still.

dm_crypt is basically the same idea as cryptoloop, but implemented using
Device Mapper instead of loopback.  It's an implementation improvement,
which allows it to be more flexible, but is basically the same model of
use.

Of course, Reiser4 crypto won't make dm_crypt obsolete.  e.g. Reiser4
crypto won't be able to do swapfile encryption (which everyone who has
encrypted files should be doing).  For standard file encryption,
Reiser4 crypto is probably the way to go.  But dm_crypt/cryptoloop
still has its uses.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

