From: Oleg Drokin <green@namesys.com>
Subject: Re: r5 hash detected, unable to force r5 hash
Date: Sun, 21 Apr 2002 13:48:01 +0400
Message-ID: <20020421134801.A2257@namesys.com>
References: <20020419185715.GA3936@thebetteros.oche.de> <20020420150339.A28989@namesys.com> <20020420190025.GA6982@thebetteros.oche.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10096-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020420190025.GA6982@thebetteros.oche.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com, fpage@thebetteros.oche.de

Hello!

On Sat, Apr 20, 2002 at 09:00:25PM +0200, Frederick Page wrote:
> >   Because it is clearly stated that if you want to convert to new hash,
> >   you need to backup your data, reformat FS with new hash and put all the
> >   data back.
> I am still unable to find this in the docs. Could you please tell me,
> which FM I obviously did not read?

http://www.namesys.com/download.html lists linux kernel v2.4.18 as the
recommended one.
Also I remember it was mentioned somewhere that you cannot change hash that
lightly (because I have learnt this info from somewhere ;) ), but
I cannot find exact document right now.
I will look deeply at Monday though.
Man page certainly needs to clearly state you cannot change hash that easy.
We will deal with it.

> >   User errors are dealt with based on http://namesys.com/support.html
> >   terms.
> Feature: you can change the hash once, but then are stuck with it, you
> cannot change it back (unless you rebuild the tree).

Nope. You hit the kernel error that was fixed already.
Fix went into 2.4.19-pre3 kernel, or thereabout. Though it was
available as separate patch long before that.

> Feature: mount does not give you any hint, that you are doing
> something potentially harmful, which cannot be undone (reiserfsck does).

Mount have nothing to do with it, it does not know anything about mount
options.
That was a kernel bug that allowed you to change a hash.

> Feature: the documented mount-option "hash=r5" does not work, instead
> gives message "error, r5 hash detected, unable to force r5 hash" (what
> the message mean?). It even does this, when r5 is already in the
> superblock.

This is kernel error that is already fixed.

> Feature: this "r5 detected, unable ..." persists since at least
> September 2001.

Obviously because nobody tried to used that before, I presume?

> I really do appreciate your feedback, but at least I see a possibility
> for the developer-team to improve reiserfs further. Please don't get

Sure. There is always space to improve.
Thank you very much for your feedback.

> At least the mount-option "hash=r5" definately does *not* work as
> documented. I'm still a little bit puzzled, why you did not even

It did not work, I'd say.

> acknowledge that, but put the blame entirely on me.

If we won't do that, how can we collect our support money then? (joke).

Seriously, you run old kernel, went into problems, and instead of upgrading
to recommended kernel with recommended patches you just wrote your original
letter.
I think Linux is mostly "do/figure out it yourself" thing, you are either able
to solve your problems based on information located elsewhere, or just
do not touch anything without consulting with knowledgeable person.
If you touched something you was not sure about and it broke - bah, bad luck.

Times are changing, of course, no wonder about that.

Bye,
    Oleg
