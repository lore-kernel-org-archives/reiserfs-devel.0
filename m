From: Oleg Drokin <green@namesys.com>
Subject: Re: r5 hash detected, unable to force r5 hash
Date: Mon, 22 Apr 2002 08:44:50 +0400
Message-ID: <20020422084450.A7155@namesys.com>
References: <20020419185715.GA3936@thebetteros.oche.de> <20020420150339.A28989@namesys.com> <20020420190025.GA6982@thebetteros.oche.de> <20020421134801.A2257@namesys.com> <20020421201341.GA9840@thebetteros.oche.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020421201341.GA9840@thebetteros.oche.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello!

On Sun, Apr 21, 2002 at 10:13:41PM +0200, Frederick Page wrote:

> >You hit the kernel error that was fixed already.
> Thank you for the info. Although super.c says:
>         } else if (reiserfs_r5_hash(s) && code != R5_HASH) {
>             printk("REISERFS: Error, r5 hash detected, "
>                    "unable to force r5 hash\n") ;
>             code = UNSET_HASH ;
>         }

There is separate patch, that was not included into 2.4.18 for whatever reason,
but was included into 2.4.19-pre3.
So you may try 2.4.19-pre3+ kernel, or patch you kernel with patches from
2.4.18.pending subdir on our ftp site. (this is mentioned on a web site, even)

> >Seriously, you run old kernel, went into problems, and instead of
> >upgrading to recommended kernel with recommended patches you just
> >wrote your original letter.
> Please take a look at the original mail. As soon as I ran into
> problems, I followed the advice on the home-page and upgraded to
> 2.4.18, it's near the bottom of my original mail. I also stated, that

Hm. So you went only half-through the instructions, then?
If latest kernel does not work for you, try applying all the pending patches.

> nothing changed, I did not run any buggy "official" kernel, but an
> Alan Cox one. I'm still very reluctant on running the official 2.4.18,
> since 2.4 linux has gone Windows :-/

That's your sole decision. 2.4.18 works great for me.
I even had 2.4.2 with 405 days of uptime until recently ;)

Bye,
    Oleg
