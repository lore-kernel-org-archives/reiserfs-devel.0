From: Hans Reiser <reiser@namesys.com>
Subject: Re: Linux Gazette benchmark Reiser 4
Date: Fri, 06 Jan 2006 12:15:47 -0800
Message-ID: <43BECFF3.10204@namesys.com>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com> <op.s2y0t2t2cigqcu@apollo13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27605-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.s2y0t2t2cigqcu@apollo13>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: PFC <lists@peufeu.com>, jpiszcz@lucidpixels.com
Cc: reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

PFC wrote:

>
>     Hehe. Wow. Sure, a benchmark that runs in 0.03 seconds for the
> fastest  one and 0.07 seconds for the slowest one looks pretty
> reliable to me. How  much time does it take to spawn the "touch"
> process 10k times ? Hm... I'd  guess most of the benchmark time ?

Well said, but there are some results we need to investigate and
reproduce. 

If someone is still learning about benchmarking and learning still that
benchmarks that take fractions of a second are meaningless, it means
that the possibility for error in other aspects is high.  I am willing
to bet that he copied and tar'd the kernel from a different filesystem
than the one he benchmarked, as this is the standard mistake everyone
makes at first, and the impact on performance is HUGE.  That said,
everyone hits things from a different angle.  I'd really like to have
the guys reproduce his big file copy benchmark, as that seems hard to
believe in, unless, well, if the problem is that the file is not big
enough, it would make a lot of sense.  reiser4 used to have a quality
that once it starts to flush something, it really flushes it, and if a
file is the wrong size that can be a disadvantage.  I thought we had
done something about that, but maybe it is still there.  zam, please
comment.

There is probably stuff of value in there, we just have to look at it,
and you should all understand that Slashdot and Linux Gazette are not
the same as peer reviewed journals (though I must say that a lot of the
slashdot posters made good remarks and found flaws that I missed, like
he uses a 500Mhz cpu and a modern hard drive).

A pity the guys are on vacation.....

Justin, if you need access to a modern CPU, we can give you time on one
of our servers.  We have an AMD64....  I am sure others can loan you
access to hardware also.

Justin, if you would like feedback before you publish on benchmarks, we
would be happy to provide it.  Benchmarking turns out to require at
least as much experience as designing filesystems to do well, and indeed
how well one writes a filesystem is often directly related to how well
one analyzes its performance with benchmarks.;-)

Hans

>
> On Fri, 06 Jan 2006 19:10:47 +0100, Robert Hulme <rob@robhulme.com>
> wrote:
>
>> http://linuxgazette.net/122/TWDT.html#piszcz
>>
>> It seems to come off fairly badly in most of the tests.
>>
>> Slashdot have linked to this now so I suspect it will get a lot of 
>> eyeballs.
>>
>> -Rob
>> -- 
>> ------------------------------------------------------
>> "Verbing weirds language" - Calvin
>> "Java: Write once, debug everywhere."
>>
>> http://www.robhulme.com/
>> http://robhu.livejournal.com/
>
>
>
>
>

