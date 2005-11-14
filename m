From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: More Slowdown
Date: Mon, 14 Nov 2005 21:47:07 +0100
Message-ID: <200511142147.07787.chrivers@iversen-net.dk>
References: <200511111359.39715.jgilmore@glycou.com> <200511120906.39109.jgilmore@glycou.com> <1131997263.10816.56.camel@teratron.lan.etheus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1131997263.10816.56.camel@teratron.lan.etheus.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 14 November 2005 20:41, Craig Shelley wrote:
> On Sat, 2005-11-12 at 09:06 +0000, John Gilmore wrote:
> > Oh, BTW. "The slowdown" as I called it is still there. I guess I spoke to
> > soon. The specific symptom is that the effected process locks for a time,
> > usually just a second or two, but sometimes a minute or two and and at
> > least once for many many minutes. I think that the crash (soft lockup)
> > that I reported earlier is related as well. And it sounds like the
> > comment that rvalles had about lockups with mmaped files, except that it
> > doesn't lock up permanently. Just for a second or three usually.
>
> Hi,
>
> I am sorry to say that I am having the same slowdown issue with Reiser4
> and kernel 2.6.14.2. It seems that my problem is not related to the I/O
> scheduler algorithm as I have tried both cfq and anticipatory.
>
> The I/O activity seems to come in long bursts lasting up to 15 seconds,
> and is unpredictable. The system almost grinds to a halt while the burst
> of I/O is taking place, which can be quite annoying while typing.
> There are no warnings in dmesg/syslog and the filesystem is clean.
>
> Sometimes the burst of I/O activity occurs in a different form, with
> short bursts every second, lasting about 10 seconds. Approx 30% duty
> cycle. When a burst occurs in this form, it tends not to lock processes
> as much.
>
> The general sound of the drive when a burst is in progress is that of
> heavy head movement, as if the drive is repeatedly seeking between two
> or three locations.
>
> Also, a thing which I noticed a while back, and may not be related in
> any way to Reiser4.. When I re-size the columns in Evolution Mail, I get
> continuous hard disk activity during the re-size. This hard disk
> activity stops either when I release the mouse or hold it still with the
> button down. Just wondering if anyone else gets the same thing.

That's _serisouly_ odd. I've seen something like this happen before, when X 
programs generated some (non-harmful) X warnings. These were then written 
into a log file, typically .xsession-errors or similar. Any chance that's 
what you are seeing?

-- 
Regards,
Christian Iversen
