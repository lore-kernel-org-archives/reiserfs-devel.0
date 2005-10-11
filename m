From: David Masover <ninja@slaphack.com>
Subject: Re: 2.6.13.2 + reiser4 system hangs and poor performance
Date: Tue, 11 Oct 2005 11:52:38 -0500
Message-ID: <434BEDD6.2080508@slaphack.com>
References: <623652d50510110922j319d5325i@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <623652d50510110922j319d5325i@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: reiserfs-list@namesys.com

Chris Bainbridge wrote:
> Hi,
> 
> Since updating to 2.6.13.2 last week I've had a couple of system hangs
> which required a poweroff. I can now reproduce a bad performance +
> can't reboot situation. I'm using gentoo with a reiser4 root
> partition. I've only tested this on my own system, so if another
> 2.6.13.2 + reiser4 gentoo user could try this that would be useful.
> 
> Under 2.6.12.5, do 'time emerge =sun-jdk-1.5.0.05'. Total time is 2
> minutes 10 seconds.
> Under 2.6.13.2, do 'time emerge =sun-jdk-1.5.0.05'. Total time is 6
> minutes 51 seconds. Will appear to hang at the "gzipping man page:
> unpack200.1" but eventually finishes. After this, attempting to
> shutdown will result in a system hang.
> 
> Like I said, this happens every time I emerge that package. Probably
> it causes some pattern of disk I/O that triggers a bug in reiser4.
> During the hang time, the pdflush process is taking up most of the
> cpu, and there is almost no disk i/o. I tested with a non-preempt
> kernel, and get the same. With 2.6.12.5, everything is okay.

I'll confirm this.  Problem is, I think this was with the mm patch, and 
I tried the standard patch, which refused to compile.  I'll send a more 
detailed bug report later, but pretty much -- hang (after much longer, 
the install phaze of a glibc compile), the rest of the system seems to 
keep functioning, but shutdown doesn't work.  Don't remember if it was a 
single program hanging forever or an actual kernel panic.

I don't have all of my Reiser4 machines available at the moment, I'm on 
an OS X laptop.  Some are ssh-able, but some are physically off.

