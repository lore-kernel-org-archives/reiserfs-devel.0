From: Chris Mason <mason@suse.com>
Subject: Re: udpated data logging available
Date: 01 Jul 2003 21:46:23 -0400
Message-ID: <1057110382.20904.881.camel@tiny.suse.com>
References: <1055764071.24111.650.camel@tiny.suse.com>
	 <200306260216.41204.christian.mayrhuber@gmx.net>
	 <1056592066.20899.10.camel@tiny.suse.com>
	 <200306261342.08725.Dieter.Nuetzel@hamburg.de>
	 <3F022B6B.3010801@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F022B6B.3010801@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuelkrause@netscape.net>
Cc: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, reiserfs-list <reiserfs-list@namesys.com>

On Tue, 2003-07-01 at 20:46, Manuel Krause wrote:
>  
> > Setting HZ=1000 (from 100) in linux/include/asm/param.h give me very 
> > impressive latency boost. 2.4.21-rc1-jam1 (-rc1aa1)
> 
> Just tried this HZ=1000 setting, too.
> 
> (With the following patches "only": data-logging, search_reada-4 and
> rml-preempt on 2.4.21-final, and AA.00_nanosleep-6.diff (THAT ONE
> decreased my VMware+system CPU idle usage in these circumstances by
> approx. 1/2 [from 25% to approx. 12.5%] ).
> 

Some userspace tools depend on the HZ value.  It's clear the io-stalls-7
patch can't be the final one, I need to add userspace knobs to tune
things towards latency or multi-writer throughput (basically server or
desktop workloads).

-chris

