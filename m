From: David Masover <ninja@slaphack.com>
Subject: Re: The situation at hand and in the future
Date: Sun, 30 May 2004 19:45:32 -0500
Message-ID: <40BA802C.5070907@slaphack.com>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org> <40B919DF.3040408@slaphack.com> <20040530122713.GX4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040530122713.GX4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Markus T=F6rnqvist wrote:
|>actual operation.  The setup doesn't need to be in the kernel at all,
|>and in fact, I think it'd be nice to have a meta-plugin which exports
|>the plugin interface to userland, to make this sort of thing easier.
|
|
| The pseudo file system is kernel-space.
| Having something completely user-space creates yet another knob
| to worry about?
|
| What do you propose this will look like?

Well, what does writing a plugin look like?  I'm thinking making it
possible to write a userspace plugin in pretty much the same syntax as
you'd use for the kernel-based one, only you have a lot more toys in
userland (say, libpcre).  Then the next step would be perl/python/etc
bindings.

| Could there be a compromise?
| Like with the policy=3Dsmart mount option.
|
| Take the easy way where it's more efficient, the right way when it's
| more efficient.

Maybe.  But the only inefficient thing I see happening to the ultimate
"right way" of doing this is that in order to make sure that we don't
encrypt more than we have to, we have to keep track of whether each
individual block has been encrypted or not.  I don't know if that's
easily possible, though.  The place where that is inefficient is when
encrypting a huge file that doesn't change much, but I can't imagine it
being so inefficient that you'd prefer to encrypt some blocks twice.
Say this is your file:

12345678

You start to encrypt it, but when you're here:

1234|5678

someone changes something:

1234|5600

Ideally, you want to just keep going from here, but what if they changed
something towards the beginning of the file, instead?  Obviously then
the change must be encrypted, even though the original was also
encrytped.  But towards the end, we should be able to forget the '78'
and just encrypt the '00'.

| If the journal is updated atomically on writes of complete files,
| we would either have completely encrypted or completely unencrypted
| files?

This works, but is annoying, because then if we are encrypting a large
file, we can't use it until we're done encrypting.  Either that, or our
changes can't be committed until the encryption is done, which has the
problem of what I'm describing above -- first we encrypt the '78', then
we encrypt the '00'.  All while possibly wasting disk space -- suppose
it's a 9 gig file on a 10 gig partition?

| But this would require root privileges. If you can't trust your root,
| who can you trust?
|
| Isn't some memory always accessible by root solo? Or at least owned
| by the user, you, so no-one else can access it? If a bug that circumvents
| this gets into the kernel, certain sysadmins will start farting blood.
|
| But that's assuming I remember the initial conditions correctly.

Yeah, you're right, I was overestimating your level of paranoia.
Because sometimes people actually do lock things down so hard that there
are places you can't get to.  But in doing so, they cripple root so
badly that I'd never want to 0wn those systems (in either sense of the
word).

| I would tend to bite the bullet and split compression and encryption
| into separate plugins.

As long as they share a lot of code.  The initialization would have to
be different for each one, but during operation, I believe they could
literally be the exact same code, only one of them uses zlib and another
uses blowfish (or something).  I mean, reiser makes no assumptions about
eventual size until a flush to disk anyway, so what difference does
compression make?

| Maybe there is some way of doing the compression after and before
| encryption and decryption, yes.

Compress before encryption, decompress after decryption.  But here's a
question -- can we as users choose what order plugins of the same layer
are run?  You'd have to be an idiot to want to encrypt before you
compress -- an idiot, or someone who's thought of something we haven't.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQLqAK3gHNmZLgCUhAQKeJg/+IMg1ezLOFMa/sjg/rNkOVLNglvZzNowy
dkZ2xu48AbjiIIl1ipll6pTz59RYgVk6hk9OMQE6xcABorFRVEAOsJ9+CwyPPWZ8
37GfhxqDlprmjuOpIysl+fIKzaFwJolu5QAi4aRkUlXMjsh/Tg8LLB94Kot3Unwu
qyBuCppm6HlLtO+1KJZYEN3qTbMt395BdqFd7SxX2rcpu+npkEanDi9LcQuE8AAw
Jd6SM5Q2j2iiXPSwGKvp9Jm0WGrvfU09stAeQYK7LRB7iAw0b/S/jAH4q1PoCP6U
G6Ujq0RhliwkQSV6X2w3KUc5cQLVaOtXRzKLG+fomvgFvTi9YWzYuyH3ZzIis1zX
CNh2ZsUs4xpHlHnNKg/s/KjU1zHhD3qTYPa1xqsaFGl2woOqoxbMR/PuEMUfj4y0
tA7OSjQ3gwL4bGBv3+9ULdqhTkbnnXj2bRRF+iRGmib/pstb32SM6DeD+KIBsUDE
1NK+AVksJlqhJIt+1M0iVpLr8Lap+ltxUapWtkAgV0syDGF3+yPaKxrABdvWFm0C
b5NbqtUzXlklNi5dcTiX2qWR8ucMLwjtS1UexkEMkuYOAPr+j/dvtLTtTs4Q0PoZ
grs16zmcJY5YW4MaJ8diZX6tQVxzK0NtNroq6niyQlsWI41Aa/2ro2vvF6mKgADg
d9vUzjwdNzE=3D
=3DCIEZ
-----END PGP SIGNATURE-----
