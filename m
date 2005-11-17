From: Thorsten Hirsch <t.hirsch@web.de>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Thu, 17 Nov 2005 20:13:54 +0100
Message-ID: <1132254834.6350.19.camel@bauerbob.hirsch.lan>
References: <200511171447.41362.mail@earthworm.de>
	 <437CBC63.3050202@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437CBC63.3050202@namesys.com>
Sender: t.hirsch@web.de
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi again,

> > http://www.earthworm.de/tmp/reiser4-fsync.c
> > 
> > with 2.6.13:
> > sync()                                  = 0 <0.000198>
> > fsync(3)                                = 0 <0.003353>
> > 
> > with 2.6.14 (with and without patch):
> > sync()                                  = 0 <2.092873>
> > fsync(3)                                = 0 <0.132579>
> 
> I tried your test on a box with reiser4 root fs:
> 2.6.13:
> strace -T -e sync,fsync ./eworm xx
> fsync(3)                                = 0 <0.158808>
> 
> 2.6.14-mm2 +
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-mm2/reiser4-for-2.6.14-mm2-1.patch.gz
> 
> strace -T -e sync,fsync ./eworm xx
> fsync(3)                                = 0 <0.005373>

here are my results for 2.6.14-mm2 (gentoo, w/o that patch for -mm2):

$ strace -T -e sync,fsync ./a.out
sync()                                  = 0 <0.767049>
fsync(3)                                = 0 <0.207243>

I'm going to install the latest gentoo-sources and will try it again
with some patches. Oh, but please have a closer look onto the mail from
John Gilmore, he wrote today. I'm experiencing the same: the slowdown
does not affect vim and evolution only, but the whole system. And yes,
also the reads are a lot slower. Bootup time has increased by factor 3
or 4. And because of all the disk activity I'd also guess, that some
kind of fragmentation is causing these problems, but I haven't checked
tree fragmentation, yet. ...probably later.

Thorsten

