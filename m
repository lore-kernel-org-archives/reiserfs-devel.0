From: Hans Reiser <reiser@namesys.com>
Subject: Re: Linux Gazette benchmark Reiser 4
Date: Mon, 09 Jan 2006 23:57:36 -0800
Message-ID: <43C368F0.7020202@namesys.com>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com> <op.s2y0t2t2cigqcu@apollo13> <43BECFF3.10204@namesys.com> <43C18D32.8020106@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27651-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C18D32.8020106@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: PFC <lists@peufeu.com>, jpiszcz@lucidpixels.com, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Did we really do the sophisticated statistical analysis below?  I
assumed we had just taken a look at how much our numbers tended to vary,
and based on experience assumed anything less than 2% was not above
noise.;-) 

The other rule of thumb I have is that really short times can be
amazingly unreliable indicators even when reproduceable.  I am not
entirely sure of why, but I know it to be true.;-)  People suggest such
things as timer inaccuracy, but perhaps there is more inaccuracy than
that could explain.  Perhaps it is scheduler timing related?  I don't
know why it is, I just know it is so.

I do like the way Zam did the red/green/black numbers by the way, I
think I forgot to compliment him on it (it was Zam who did it?).

We need to reproduce Justin's benchmark, fixing the mistakes he made in
its design, and then see how we do at it.  We need to know such things
as, how did he generate filenames, etc.  When people get back....

Hans

Edward Shishkin wrote:

> Hans Reiser wrote:
>
>> PFC wrote:
>>
>>  
>>
>>>    Hehe. Wow. Sure, a benchmark that runs in 0.03 seconds for the
>>> fastest  one and 0.07 seconds for the slowest one looks pretty
>>> reliable to me. How  much time does it take to spawn the "touch"
>>> process 10k times ? Hm... I'd  guess most of the benchmark time ?
>>>   
>>
>>
>>  
>>
>
> Let's consider this important aspect of benchmarking more carefully.
> So there is an interesting question: how much should be a difference
> in order to approve that some fs really wins at this statistics? Is
> there any guarantee you won't get, say, 0.05 and 0.02 after next run?
> Sorry, but I didn't find any answer in Justin's notes, NOTE5 (Tests
> Performed) says that questionable tests were re-run, but it seems we
> need something kinda research here instead of re-run.
>
> Below are some comments for how this problem is resolved (1*) in mongo
> benchmark. Look for example at this table:
> http://www.namesys.com/benchmarks.html#mongo.2.6.11
> Fractions like 0.982 (D/A), 1.017 (C/A) are in black color, it means
> that we _can not_ do any assumptions about winner because
> |1 - X/A| < 0.02. What the magic M = 0.02 is?
> Let's run the same phase for the same settings (file system, file set,
> etc..) 10 times. We will obtain for the same statistics X a set of
> different (because of errors) values x1, x2, ..., x10. Suppose that
> X has a normal distribution (any objections?). It means that we can
> calculate its trusted interval for a single measurement (2*) as
> [X - d(P), X + d(P)], where d(P) = D*U(P), D is dispersion and U(P)
> should be found from the standard table by any nominated value of
> trusted probability P (3*).
> Now we have the following simple criterion (*4):
>
> |A - X| >= 2d(P), i.e. |1 - X/A| >= 2D*U(P)/A
>
> |           |<-d->|    |<-d->|
> ------<-----|----->----<-----|----->------
>            A                X
>
> The magic M = 0.02 for mongo benchmark was calculated as 2D*U(P)/A
> for the trusted probability P=0.85 (5*).
> Now it is clear from the formula above why statistics shouldn't be
> too small: because the criterion becomes false. I am sure (and it
> is easy to check) 2d(P=0.85) is much more then |0.07 - 0.03| as it
> is in the case of find 10000 files. By the way, some settings, which
> provide a small values (~5 sec) of the mongo STATS statistics also
> make this criterion false.
>
>
> (1*) Maybe this is not a perfect way, but it is better then nothing
> (2*) For N measurements the expression for boundaries becomes a bit
>     complicated.
> (3*) For P=0.85 (as we can found in any scientific book) U(P)=1.44
> (4*) One more assumption here about identical distributions of A and X
> (5*) Actually D = max(D_create, D_copy, D_read, D_delete, D_dd), where
>     D_each_phase was estimated once by 10 measurements with some fixed
>     settings by the standard way:
>     D^2 = ((x - x1)^2 + ... + (x - x10)^2)/(10 - 1), where
>     x = (x1 + ... + x10)/10 is an average value.
>
> Edward.
>
>
>
>

