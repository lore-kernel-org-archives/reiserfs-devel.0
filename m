From: Yury Umanets <umka@namesys.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: Wed, 27 Aug 2003 10:03:31 +0400
Message-ID: <1061964211.15513.41.camel@haron.namesys.com>
References: <20030826102233.GA14647@namesys.com>
	 <20030827055204.GA18114@cse.unsw.EDU.AU>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030827055204.GA18114@cse.unsw.EDU.AU>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ian Wienand <ianw@gelato.unsw.edu.au>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Wed, 2003-08-27 at 09:52, Ian Wienand wrote:
> On Tue, Aug 26, 2003 at 02:22:33PM +0400, Oleg Drokin wrote:
> > Fixed some bugs. And finally reiser4 should compile on 64bit boxes
> > (hm. somebody try it, as I am unable to build any 2.6 kernel for
> > ia64).
> 
> I built this with IA64 2.6.0-test4, it works but there were lots of
> warnings (I can put up a log if you want it).  This was on a dual
> processor Itanium 2 box.
> 
> First up, I tried a little test to make a few files, but once I had
> unmounted the disk I couldn't re-mount it.
> 
> --- example testing below ---

> bash-2.05b# mkfs.reiser4 /dev/sda5
> mkfs.reiser4 0.4.12
> Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4progs/COPYING.
>  
> Information: Reiser4 is going to be created on /dev/sda5.
> (Yes/No): Yes
> Creating reiser4 on /dev/sda5...
> mkfs.reiser4(5676): unaligned access to 0x60000000000242f2, ip=0x20000000000f7661
> mkfs.reiser4(5676): unaligned access to 0x60000000000242fa, ip=0x20000000000f77a1
> mkfs.reiser4(5676): unaligned access to 0x6000000000024302, ip=0x20000000000f78e1
> mkfs.reiser4(5676): unaligned access to 0x60000000000242f2, ip=0x20000000000f2671
> done
> Synchronizing /dev/sda5...done

I will fix it soon.

Thanks for report.

Regards.

