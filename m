From: Hans Reiser <reiser@namesys.com>
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 10:16:04 -0700
Message-ID: <4149CA54.80901@namesys.com>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com> <20040916130809.GI26192@nysv.org> <4149A843.7010804@willsmith.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4149A843.7010804@willsmith.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Will Smith <will@willsmith.org>
Cc: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, reiserfs-list@namesys.com

Well, I am going to try being honest and see what happens.

I am more than 170k in debt, and Namesys is doing badly fiscally.  A=20
technical great success being stabilized now, but then there is my=20
ongoing fiscal disaster.  Once again, we are missing payroll.  My wife=20
is divorcing me in part because I keep going deeper into debt, and I=20
thank her for divorcing me now rather than later.  Unfortunately she is=20
making the divorce messy enough to keep me from pulling Namesys out of=20
the fiscal tailspin by consuming all my time with things like proving I=20
am not making the fantastic amounts of money she claims I am.  I hope=20
next month is better.

The consistent tendency of large corporations to buy service contracts=20
only for proprietary software and not buy it for free software of equal=20
importance to their business is decisive in making our business not=20
viable fiscally.  Knowing that it is irrational of them economically=20
does not keep me in business.

So we need something to entice them into cutting a check, to which they=20
can then add support.  At the same time we want to avoid harming users=20
who cannot pay, or who don't care enough about the FS to bother to pay.

The repacker/resizer seems perfect for that.  Nobody has to have it, and=20
yet sysadmins of large corporations will pay for it.  I want them to pay=20
5% of their storage hardware costs, which means disk drives plus raid=20
cards, and if the machine is primarily a file server it means the whole=20
computer.  For this they get a resizer, a repacker, and priority=20
support, with cell phone numbers of developers if they pay more than $1000.

I keep experimenting with open source business models, trying to make=20
them work.  One of the possibilities for us is a blended model, in which=20
all the essentials are free, and the fripperies are for a fee.

There is nothing less essential than an online repacker/resizer.  Yet it=20
is desirable enough to pay for.

Reiser4 without an online repacker/resizer is better than ext3 by a=20
lot.  The money from the repacker will help us increase that lead=20
further.  An online  repacker/resizer could pay for the semantic=20
enhancements that are really important to users, and could allow us to=20
make those free.    I am worried that because of finances we are not=20
going to beat WinFS to market when we otherwise could have done so.

Money is like food.  The difference between a fine restaurant, and just=20
having a full refridgerator with ordinary vegetables and meat, is not a=20
lot.  The difference between a full refridgerator and an empty one is a lot.

Charity is best if made a part time job of, not because men need money,=20
but because families need money, and men need to fulfill that obligation=20
well enough that the refridgerator is full.

Hans

PS

We need to have a better understanding of why reiser4 is not doing a=20
good enough job with just allocation on flush.  I suspect it should be=20
doing better.  Next month I hope to be able to take the time to look=20
into it.  I am spending all of my time dealing with divorce and money=20
issues and the code is just going unsupervised, sigh....

Will Smith wrote:

>
> Markus T=F6rnqvist wrote:
>
>>> yes, we had similar results.  it is so cool that reiser4 repacker=20
>>> effect
>>> is visible outside namesys :)
>>
>>
>> S'cuse me, but why does it have to be run several times?
>
>
> I don't pretend to know the maths/logic of why, but from the reiser4=20
> description (http://www.namesys.com/v4/v4.html#repacker)
>
> "This repacker goes through the entire tree ordering, from left to=20
> right and then from right to left, alternating each time it runs."
>
> "In the absence of FS activity the effect of this over time is to sort=20
> by tree order (defragment), and to pack with perfect efficiency."
>
>
> My testing showed that this is indeed the case -
>
> If I ran the repacker once (say left to right), the fragmentation was=20
> not fully reduced.
>
> If I ran the repacker several times (left->right, right->left, and
> repeat) then fragmentation fell down to almost 0.
>
>
> Userspace Tool for Repacker
> ----------------------------
>
> I take it from an earlier comment by Hans that the repacker is not
> intended to be used yet?  If it is indeed ready for primetime,
> is anybody working on userspace tools
> (/etc/cron.daily/repacker.reiser4 or similar?)  I'd be happy to
> write these if nobody else is - but it will be in /bin/bash shell.
>
> My proposed design specs would include:
>
> 1) runs in /etc/cron.daily near the end (since cron causes lots of
>    disk activity)
> 2) the last-run-direction should be persistently stored per filesystem
> 3) parallel operation on multiple filesystems where possible,
>    but filesystems on a single physical device should
>    run in serial (same as /sbin/fsck -A)
> 4) some kind of config file in /etc/, parameters could include
>     o) maximum run time, global and per filesystem
>     o) run/dont run flag, global and per filesystem
>
>
> Any thoughts?  Shall I go ahead and write a first cut?
>
>
>
> Will Smith
>
>
>
>
>
>
>

