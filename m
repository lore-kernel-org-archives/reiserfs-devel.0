From: Pysiak Satriani <pysiak.satriani@wp.pl>
Subject: Re[2]: Linux Gazette benchmark Reiser 4
Date: Mon, 9 Jan 2006 12:04:22 +0100
Message-ID: <267316269.20060109120422@wp.pl>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com>
 <op.s2y0t2t2cigqcu@apollo13> <43BECFF3.10204@namesys.com>
 <43C18D32.8020106@namesys.com>
Reply-To: Pysiak Satriani <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27636-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C18D32.8020106@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: PFC <lists@peufeu.com>, jpiszcz@lucidpixels.com, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Hello Edward,

Sunday, January 8, 2006, 11:07:46 PM, you wrote:
> Let's consider this important aspect of benchmarking more carefully.
> So there is an interesting question: how much should be a difference
> in order to approve that some fs really wins at this statistics? Is
> there any guarantee you won't get, say, 0.05 and 0.02 after next run?
> Sorry, but I didn't find any answer in Justin's notes, NOTE5 (Tests
> Performed) says that questionable tests were re-run, but it seems we
> need something kinda research here instead of re-run.
Exactly. By the way, Justin writes he did only 3 tests and calculated
the average out of these 3. In statistics this is a very small sample.
We would need at least 30 or so. If the results would have a big
variance, they should be treated with exponential smoothening.
And then we can go off with the calculations. Also It would be nice
to have data from the exact tests made regularly to test for regressions
and see what's the trend.

> etc..) 10 times. We will obtain for the same statistics X a set of
> different (because of errors) values x1, x2, ..., x10. Suppose that
> X has a normal distribution (any objections?)
Well, for serious reasoning a smirnof-kolmogorov test should be used
or Shapiro-Wilk or any other that applies to check the normal
distribution. If it is, we can go ahead with all the calculations.
If not.. Well, I'm not enough of a statistics guru to say :-)

Regards,
Maciej


