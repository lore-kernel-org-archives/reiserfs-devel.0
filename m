From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: can't find a reiserfs file ssytem!
Date: Fri, 19 Mar 2004 14:51:43 +0300
Message-ID: <200403191451.43084.vitaly@namesys.com>
References: <20040317004935.565332B2B57@ws5-7.us4.outblaze.com> <200403171948.28885.Dieter.Nuetzel@hamburg.de> <20040318115900.GA19944@raptus.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17315-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040318115900.GA19944@raptus.homelinux.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

Hello Domenico,

On Thursday 18 March 2004 14:59, Domenico Andreoli wrote:
> On Wed, Mar 17, 2004 at 07:48:28PM +0100, Dieter N?tzel wrote:
> > E.g. when will we see 3.6.14 (even for RAID)?
>
> i'm also interested in a quick release of 3.6.14, if it has any important
> fix. debian is near to the freeze of new distribution and i'd like it
> had the most recent and hopefully fixed releases.

As you can see already 3.6.14 has very important fix for the journal
replay and 3.6.15-pre1 has a fix in the mount entry detection code.
Other fixes are not so critical.

> btw, we finally have reiser4progs in testing (aka the next debian
> distribution). as soon as kernel patch for reiser4 is accepted and
> reaches testing, debian will have a somewhat good (the best achievable
> until reiser4 gets merged in linus' tree) support for reiser4 in the
> hope of widen the testing user base :))
>
> thanks
> domenico
>
> -----[ Domenico Andreoli, aka cavok
>  --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
>    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50

-- 
Thanks,
Vitaly Fertman


