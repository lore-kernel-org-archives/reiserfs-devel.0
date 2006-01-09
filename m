From: Hans Reiser <reiser@namesys.com>
Subject: Re: Linux Gazette benchmark Reiser 4
Date: Mon, 09 Jan 2006 11:50:20 -0800
Message-ID: <43C2BE7C.8010703@namesys.com>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com> <op.s2y0t2t2cigqcu@apollo13> <43BECFF3.10204@namesys.com> <43C18D32.8020106@namesys.com> <267316269.20060109120422@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <267316269.20060109120422@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: Edward Shishkin <edward@namesys.com>, PFC <lists@peufeu.com>, jpiszcz@lucidpixels.com, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Pysiak Satriani wrote:

>Hello Edward,
>
>Sunday, January 8, 2006, 11:07:46 PM, you wrote:
>  
>
>>Let's consider this important aspect of benchmarking more carefully.
>>So there is an interesting question: how much should be a difference
>>in order to approve that some fs really wins at this statistics? Is
>>there any guarantee you won't get, say, 0.05 and 0.02 after next run?
>>Sorry, but I didn't find any answer in Justin's notes, NOTE5 (Tests
>>Performed) says that questionable tests were re-run, but it seems we
>>need something kinda research here instead of re-run.
>>    
>>
>Exactly. By the way, Justin writes he did only 3 tests and calculated
>the average out of these 3. In statistics this is a very small sample.
>We would need at least 30 or so. If the results would have a big
>variance, they should be treated with exponential smoothening.
>And then we can go off with the calculations. Also It would be nice
>to have data from the exact tests made regularly to test for regressions
>and see what's the trend.
>  
>
I can just tell you from experience that benchmarks that take less than
a minute have a high tendency to be poor measures  He should increase
the size of the benchmark until each thing he measures takes more than 2
minutes.  If it is reproduceable it can be still meaningless.

Hans

