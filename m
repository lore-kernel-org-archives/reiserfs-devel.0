From: Frederick Page <fpage@thebetteros.oche.de>
Subject: Re: r5 hash detected, unable to force r5 hash
Date: Sun, 21 Apr 2002 22:13:41 +0200
Message-ID: <20020421201341.GA9840@thebetteros.oche.de>
References: <20020419185715.GA3936@thebetteros.oche.de> <20020420150339.A28989@namesys.com> <20020420190025.GA6982@thebetteros.oche.de> <20020421134801.A2257@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10100-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020421134801.A2257@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Oleg,

Oleg Drokin wrote on Sun, Apr 21 2002:

>You hit the kernel error that was fixed already.

Thank you for the info. Although super.c says:

        } else if (reiserfs_r5_hash(s) && code != R5_HASH) {
            printk("REISERFS: Error, r5 hash detected, "
                   "unable to force r5 hash\n") ;
            code = UNSET_HASH ;
        }

>Seriously, you run old kernel, went into problems, and instead of
>upgrading to recommended kernel with recommended patches you just
>wrote your original letter.

Please take a look at the original mail. As soon as I ran into
problems, I followed the advice on the home-page and upgraded to
2.4.18, it's near the bottom of my original mail. I also stated, that
nothing changed, I did not run any buggy "official" kernel, but an
Alan Cox one. I'm still very reluctant on running the official 2.4.18,
since 2.4 linux has gone Windows :-/

>I think Linux is mostly "do/figure out it yourself" thing

Yes.

>you are either able to solve your problems based on information
>located elsewhere, or just do not touch anything without consulting
>with knowledgeable person.

I do consider myself being able to solve (most of) my own problems.
But as you stated earlier: there are still some bugs in the kernel,
that interact with reiserfs.

>If you touched something you was not sure about and it broke - bah,
>bad luck.

Sure. But it did not hurt asking here, I got my data back and can now
experiment with the "tea" hash, because the partition's main purpose
is the files of the freedb (550000 little files in about 10
directories). ext2 is waaaay to slow and wastes much space (2.2 GB).

Thanks and kind regards

Frederick


