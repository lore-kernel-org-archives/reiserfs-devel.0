From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: The situation at hand and in the future
Date: Fri, 28 May 2004 09:33:24 +0300
Message-ID: <20040528063324.GT4990@nysv.org>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18884-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40B6670D.9060408@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

On Thu, May 27, 2004 at 05:09:17PM -0500, David Masover wrote:
>Could this be a plugin/pseudo?  Maybe I'm being obsessive, but here's
>what I want:

Much more detailed a use case than my initial example, very good
and very much to the point.

>$ cd ~/.secret/..metas/crypto

This step would make life easier.

>$ ln -s ciphers/blowfish cipher

Isn't the idea with Reiser4's crypto system that it uses cryptoalgos
compiled into the kernel?

Of course these could be represented under ciphers. Actually, I'd
be surprised if they're not under /proc/ or /sys/

The idea is still good and remains.

>$ echo 256 > bitsize
>$ echo 0 > block	# deny access rather than block if dir is accessed
>before passphrase is entered

What is the difference between blocking and denying access?

[snip]

>If it's possible, I'd like a bad passphrase to make 'echo' get an "acess
>denied" error (or maybe block for one second first), but I don't see how
>that's possible -- how do we know when the write is done and the
>passphrase is entered until the file is closed?

Adding a passphrase retroactively? The write is done, the file
is closed, and only then is the file encrypted.

>I'd like all settings but passphrase and key to be persistant.

Persistent over boots? I'd like the passphrase and key to survive
a boot...

>I've heard that there will be an api to allow multiple files to be
>accessed with a single filehandle -- also, there's sort of vague concept
>of other possibilities -- SQL access?  If so, any app wanting

That's the Reiser4 syscalls api, I gather.

I hope Namesys doesn't put too much effort into that yet.
I don't mean to be pretentious, or teaching my grandmother to suck
eggs (is that really the English-language saying?) but there should
be more pressing matters.

>performance (setting individual crypto settings for thousands of dirs)
>would not do the steps I outlined from a shell script.  If a pseudo file

Naturally. But if the crypto settings propagate automatically to new
children, it may not be such a performance loss.

>which contains such a tiny bit of information as a passphrase or a
>boolean value is written to individually, we can assume it's either a
>human or a shell script, and in either case, I think we can waste the
>time to check for things like newlines and a lack of \0 at the end of a
>line -- in general, we can do some simple parsing.  Even having
>"true/false" instead of "1/0" might be nice.

I have lived in the belief that \0 is there to make things faster.
I'm afraid I have to disagree here, but that's trivial semantics.

Besides, shell scripts take about the same time to write, I mean,
it takes the same time for the human to write the script, has it
the strict \0 1/0 syntax or not. Maybe even one script or user-space
reiser4prog would suffice for general cryptohandling.

r4_encrypt ~/.secret/ -c sha1 -s 256 # and so on and so forth.

>However, I'm not all _that_ picky.  I'd really be happy with any crypto
>plugin at all, as cryptoloop causes problems.  I see

Ever since having read about Reiser4's implementation, cryptoloop has
seemed like a terrible kludge, so I'm really looking forward to this
better solution.

GIMME GIMME GIMME! ;)

>'metas/plugin/crypto', but it seems to have some information only, and
>no real way to turn it on.

Does the code exist?

Well, I'd like to hear Namesys' opinion on these matters :)

-- 
mjt

