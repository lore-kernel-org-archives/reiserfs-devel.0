From: David Masover <ninja@slaphack.com>
Subject: Re: Plugin for corruption resistance?
Date: Fri, 11 Feb 2005 23:19:02 -0600
Message-ID: <420D91C6.2030501@slaphack.com>
References: <e692861c05021110583585f84e@mail.gmail.com> <20050211205350.GA13345@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050211205350.GA13345@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Vier <tmv@comcast.net>
Cc: Gregory Maxwell <gmaxwell@gmail.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

First, let me second the original idea.  So long as the hash isn't
updated until that attribute is read, it should be fine.

Tom Vier wrote:
| On Fri, Feb 11, 2005 at 01:58:59PM -0500, Gregory Maxwell wrote:
|
|>1. Lots of applications today (such a P2P sharing systems) need the
|>hashes of files.. it's inefficient to keep recomputing them.  The file
|>system always knows when a file changes, so it can be setup to always
|>return the correct hash.
|
|
| That should be done in userland, imho. Especially since different apps use
| lots of different hashes.

For no particularly good reason, imho.  md4/md5 are reasonably fast,
sha1 is reasonably secure.  What else do you need?

| I was thinking about this kind of stuff (ECC plugin for r4) not too long
| ago. Hashing the whole file is too slow; if you update a single block, the
| whole file has to be read in to recalculate. Adding, say, one sector
of crc
| for each block would be a lot more feasible.

If it was actually to work like ECC.  But this doesn't sound like it
would be checked at every read, but rather when fsck is run, or when
some app needs it.  If it is supposed to be checked at every read, your
below suggestion is better.

| I think the best way to do this though, would be to write a virtual blk
| driver that works like loop back (ie, uses a backing file/dev), and
shortens
| the overall size by one sector * number of blocks. Actually, you could
| probably copy the raid5 md code and rewrite it to only use one device. I'd
| try that first.

Been done.  Think it's part of dev-mapper or evms or some disk magic
like that.  But it's also useful for individual files, for application
reasons.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQg2RxXgHNmZLgCUhAQKxyhAAkun806f/kI3RmnKX8gV0KZ+ubdMoyNWK
vUF4Ln79jMLAxxe2fxrkBZux7qQhNUpaO69+jIAfYFqPGj/L1RS03lAqhz7bZCDp
2GOiBdoOhB7fBJuv1XKbHBrDJdROE8QTJWLuFMyAvxUC7u+uZZ2yU8EVHlKWTLoH
fA40Vr5t7p77ll/zALG1qpEd9GhSDXAbQ0cbqMvy9cYzo+Wreo9xifH4bT9u8SGk
NgqGTf3iMKhetfFWqxmgg9F34SMVF9IuyRud2mHvqY7NQW1B3k7MFjOax7fgFTRF
xxwUzt2lE77tmEUM87r16sCkK+YSJTNNaTancV4yYhzQ+Oz43NwkUW0nwy0jOOVz
C3sydKjsYoOMiBAVind+arILSrmLwMXpgZ7/6/NV5A7XiUZWy2TeZGYLXjEZbNOV
V5Tg1KsMnJxPS2n/y7FG9HQXx/iFapWG8RWkz3O9Pzg/Zywsi4LbcgI+72iHImLj
5+b5YXxQsv9F415pXEaCSNGmMg7FZ/wURXPXwEruPJrs1aJ1SipoZzUCUXN9OpvJ
efW+IQmbx1tUhQvBfiYmeGj/vscPfkXbwnXlwZOpU7tkkVw8F+t/OJT4jL6Z5wOj
el8FDYz3swRR1W+nUTJK+NOBkkR3RPjtdOqUahXPF7jqK3Wc1EsZ4MGhlBaLwp+l
UqUzpsVgmdc=
=jkeg
-----END PGP SIGNATURE-----
