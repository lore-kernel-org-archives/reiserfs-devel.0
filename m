From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: The situation at hand and in the future
Date: Mon, 31 May 2004 11:38:35 +0300
Message-ID: <20040531083835.GB4990@nysv.org>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org> <40B919DF.3040408@slaphack.com> <20040530122713.GX4990@nysv.org> <40BA802C.5070907@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18927-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40BA802C.5070907@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

On Sun, May 30, 2004 at 07:45:32PM -0500, David Masover wrote:

>Well, what does writing a plugin look like?  I'm thinking making it
>possible to write a userspace plugin in pretty much the same syntax as
>you'd use for the kernel-based one, only you have a lot more toys in
>userland (say, libpcre).  Then the next step would be perl/python/etc
>bindings.

This would be a good idea. I would also like to see some python
module that uses ..metas/ as the interface.

>This works, but is annoying, because then if we are encrypting a large
>file, we can't use it until we're done encrypting.  Either that, or our
>changes can't be committed until the encryption is done, which has the
>problem of what I'm describing above -- first we encrypt the '78', then
>we encrypt the '00'.  All while possibly wasting disk space -- suppose
>it's a 9 gig file on a 10 gig partition?

Let's see what the Namesys guys have to say about this, but somehow
this must be reasonably solved.

Maybe they're sitting on some spec and just haven't had the time
to tell us.

>| I would tend to bite the bullet and split compression and encryption
>| into separate plugins.
>
>As long as they share a lot of code.  The initialization would have to
>be different for each one, but during operation, I believe they could
>literally be the exact same code, only one of them uses zlib and another
>uses blowfish (or something).  I mean, reiser makes no assumptions about
>eventual size until a flush to disk anyway, so what difference does
>compression make?

This was another case of me not thinking things through, that happens.

Have you, by any chance, had time to look at the code?
I (probably the entire list, too ;) would be interested in hearing
about the inner workings of the code, and it seems the main devs don't
have time to explain.

Maybe I should take a vacation and learn C really well and read all
the Reiser4 code :)

>| Maybe there is some way of doing the compression after and before
>| encryption and decryption, yes.
>Compress before encryption, decompress after decryption.  But here's a

This was addressed before, but I was under the impression that the other
way around was easier/better. Oh well, you live, you learn.

But it seems possible that you can't do both with the same plugin.
If it's echo zlib or echo blowfish, unless there's echo zlib+blowfish,
which would actually be much cooler with symlinks.

I heard once that using many encryptions may reduce the level of security.
I don't know if there's any real truth behind this. But if there is,
maybe it should be impossible to support two cryptos, only a crypto
and a compression.

>question -- can we as users choose what order plugins of the same layer
>are run?  You'd have to be an idiot to want to encrypt before you
>compress -- an idiot, or someone who's thought of something we haven't.

I'd probably vote for myself being an idiot, but I prefer the terms
inexperienced and ignorant ;)

But people have a tendency of think of stuff that other people haven't
so nothing should be discarded straight away.

-- 
mjt

