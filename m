From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: The situation at hand and in the future
Date: Sat, 29 May 2004 20:41:48 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87k6yuzqyb.fsf@uhoreg.ca>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu>
 <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org>
 <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org>
 <40B919DF.3040408@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18908-reiserfs=m.gmane.org@namesys.com>
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

David> Don't know about md5, but how hard is it to brute-force the file
David> itself?  ~ How about some strong magic at the beginning of the
David> file (perhaps a checksum of the filename?) which can be used to
David> verify (within reason) that the passphrase worked?  How
David> vulnerable are modern ciphers to known-plaintext attacks?

Modern ciphers should be fairly resistant to know-plaintext attacks, I
think.  When you put a filesystem on a loopback, you've essentially got
a known-plaintext, because filesystems typically start with a magic
number.  (Assuming the attacker knows what filesystem you're using.)
It's best to avoid known plaintexts if possible, of course, if you're
worried about security.

One thing that can be done is to take just the first couple of bytes
from a hash to be used as your check.  That will catch the user from
common entry errors, and won't reduce the keyspace by that much
(hopefully).

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

