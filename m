From: Oleg Drokin <green@namesys.com>
Subject: Re: link/unlink problem gone?
Date: Fri, 7 Feb 2003 09:19:33 +0300
Message-ID: <20030207091933.A6256@namesys.com>
References: <20030129164906.A8320@namesys.com> <20030129164906.A8320@namesys.com> <20030131105745.A7426@namesys.com> <b1unpa$bmb$1@satsuki.furryterror.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <b1unpa$bmb$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Feb 06, 2003 at 05:32:10PM -0500, Zygo Blaxell wrote:

> >   Sigh, these were false hopes indeed.
> >   I can reproduce it with 2.4.21-pre4, only it is now harder for some reason.
> I've seen times-to-failure ranging from 20 minutes to 20+ hours (!).

Same here.

> >   Chris: My current idea is it happens during low memory conditions, so I am
> >   actively running around prune_icache and id's dcache equivalent. Probably
> >   you can easily reproduce that if you'd have no swap and not very much RAM.
> >
> >   (Ok, I just checked, limited the RAM to 90M and turned off SWAP entirely.
> >    and reproduced the problem fairly quickly)
> I have observed the problem on machines ranging in size from 96 to
> 512MB RAM.  I haven't observed a correlation between swapping activity
> and failures but I haven't been looking for this either.  The machines

I noticed that with newer 2.4.21-pre kernels first I see processes die because
of OOM and only after that I see direntries pointing to nowhere.
I reproduced this much more than once, so I believe there is some correlation
between these.

> that have problems machines are swapping at some time or another (they
> have several hundred MB of swap used).

And they are just swapping all the time, so it may take a while before
useful code runs and problem happens, it seems.

So far I decided that with SWAP turned off one can reproduce problem more
easily that with SWAP on (especially if swap is large).

Bye,
    Oleg
