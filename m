From: David Masover <ninja@slaphack.com>
Subject: Re: The situation at hand and in the future
Date: Thu, 27 May 2004 17:09:17 -0500
Message-ID: <40B6670D.9060408@slaphack.com>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: =?ISO-8859-1?Q?Markus_=3F?= <mjt@nysv.org>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valdis.Kletnieks@vt.edu wrote:
| On Thu, 27 May 2004 23:01:27 +0300, mjt@nysv.org (Markus
=?UNKNOWN?Q?T=F6rnqvist?=)  said:
|
|
|>So, the Reiser4 API is good for providing passphrases for encrypted files
|>and directories, right? Because using echo to unlock them from the file
|>system is hazardous?
|>
|>Why not add user-space programs which basically do what echo does, but
|>with the terminal echo turned off? They would probably size at around
|>0k and would use the pseudo file API.
|>
|>Maybe this would be a use case:
|>1. Joe wants to encrypt the files he l33ch3d from kazaa at work.
|>2. Joe chdirs to the pseudo directory under ~/Work/Warez/
|>3. Joe says echo 3DES\0 > plugin/crypto
|>4. Now the directory knows it must be 3DES-encrypted, but it needs
|>   a passphrase.
|>5. Joe says echo TOPSECRETPASSWORD\0 > plugin/cryptokey
|
|
| Remember that English has an entropy of only 2.5 bits/byte or so - as
a result,
| you *REALLY*, *REALLY* want to use a program that reads a much longer
| passphrase and computes a hash to use as the actual key.

Could this be a plugin/pseudo?  Maybe I'm being obsessive, but here's
what I want:

$ cd ~/.secret/..metas/crypto
$ ln -s ciphers/blowfish cipher
$ echo 256 > bitsize
$ echo 0 > block	# deny access rather than block if dir is accessed
before passphrase is entered
$ echo sha1 > hash
$ echo think you a h4x0r?  break this > passphrase
$ cat passphrase
cat: passphrase: Permission denied
$ cat key
e786498ac12eb276badf570ddfb4eb50de07f2b2
$ echo think you a h4x0r?  break this | sha1sum | cut -f 1 -d ' ' > key
$ cat key
e786498ac12eb276badf570ddfb4eb50de07f2b2
$ echo 5m > timeout		# a setting of 0 is no timeout
$ sleep 5m			# on an otherwise inactive system
$ ls ~/.secret/
ls: ~/.secret/: Permission denied
$ cat key
cat: key: Permission denied
$ echo lame attempt > passphrase	# can we die now? probably not
$ ls ~/.secret/
ls: ~/.secret/: Permission denied      # fails because of bad passphrase
$ echo think you a h4x0r?  break this > passphrase
$ ls ~/.secret/
bios  hacking  pgp  more stuff


I do want it to verify for itself somehow whether my passphrase/key
worked.  This is important because if we just do the cryptoloop thing,
either the directory is corrupt or (worse) the files inside are corrupt.
~ Worse, someone might create a new file with the different key...

I don't even want to _think_ about what this would do to Mozilla if I
applied it to my home.

If it's possible, I'd like a bad passphrase to make 'echo' get an "acess
denied" error (or maybe block for one second first), but I don't see how
that's possible -- how do we know when the write is done and the
passphrase is entered until the file is closed?

I'd like all settings but passphrase and key to be persistant.

I've heard that there will be an api to allow multiple files to be
accessed with a single filehandle -- also, there's sort of vague concept
of other possibilities -- SQL access?  If so, any app wanting
performance (setting individual crypto settings for thousands of dirs)
would not do the steps I outlined from a shell script.  If a pseudo file
which contains such a tiny bit of information as a passphrase or a
boolean value is written to individually, we can assume it's either a
human or a shell script, and in either case, I think we can waste the
time to check for things like newlines and a lack of \0 at the end of a
line -- in general, we can do some simple parsing.  Even having
"true/false" instead of "1/0" might be nice.

However, I'm not all _that_ picky.  I'd really be happy with any crypto
plugin at all, as cryptoloop causes problems.  I see
'metas/plugin/crypto', but it seems to have some information only, and
no real way to turn it on.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQLZnDHgHNmZLgCUhAQJYuQ/+J5A+TwndTEcCkdeG0SZ/w3mPgGAx24UH
Oy23H6d+pkasRtM6f9mHlTVcp7ow19rzmRcCeBmcRaIXHEzpKYRIcFOmBqE2+2yY
+T1dLaMcwDP7S3kYOdhduf1eoZlp7zFd0ahcTpGhY0wywKowS4f3UxQnWsGXaaAU
E4z64rKEtXXeTGe53RA3rTTZDS18/FgqCWF4TrK/AE1jAAxrSvHOxUpWxL4J1e4M
KGUeNszjICb7DX1WVVzARE3kqlaryBH8PGGCywkcP9FvTYJ+mldJ+d6ZGoAooyLA
OXTMvg40n8qASlvzeMvs9LffufKp/46YYRhlyWKxMBo0xwqpRPFFtaYzwzzh9auo
ERG3D4J+pYJdDvWuK7V+w+7Y2ljTSxApuwUxlPAhw9IXtXm1GHLnT+W7SdKsxmAu
KpBnqiLRayGx7va1rsNMEPjf6s0GbldBdEpVWNLZ2PdwtTw/8PFY4RlXrUA/f2db
8tugn3dlp7/jj5wl1F1HL7ByFOPc7/DUQurLG2dAsBm+XQlTO3T2MNH6v+ZNmOkQ
7psTkSZmJrha5FQprIGqnnkIM+XR0o6YHmEMayxu1Q70e5DTzpTB1WVSTNxu0xjr
BiVoFMa22Zovr9XKmQFz8eBKVgfO5CEaw1iX0xiL8+siRIfnhQhPHybsbdY9SXVn
p7QG2CIv7c0=
=Tmom
-----END PGP SIGNATURE-----
