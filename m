From: Adam Nielsen <a.nielsen@optushome.com.au>
Subject: Re: BUG: Replaying ReiserFS log causes hard lockup
Date: Fri, 26 Mar 2004 22:01:07 +1000
Message-ID: <20040326220107.333b23e8.a.nielsen@optushome.com.au>
References: <20040325204836.07bcf910.a.nielsen@optushome.com.au>
	<1080213348.1976.277.camel@tribesman.namesys.com>
	<1080219262.14742.146.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17490-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080219262.14742.146.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

> Please compile the kernel with sysrq support, and try to do a sysrq-p
> when things are locked.  If there kernel is completely frozen, you can
> turn on the nmi watchdog, which should trigger an oops to tell us
> where things are broken.

Well, try as I might, I can't get the oops to appear.  SysRq doesn't
work since it's a hard lockup, and the NMI watchdog doesn't seem to work
either.  I got the kernel booting once with nmi_watchdog=1 which gave an
interrupt count of zero, and then again with nmi_watchdog=2 which
incremented the NMI count about once every 30 seconds (but I also had
profiling turned on, which appears to use the NMI interrupt.)  I have
since turned profiling off, disabled the preemptive kernel, enabled
debugging info, made sure the APIC etc. was on but it has stopped
booting completely and now locks up during boot.  Now it goes as far as:

reiserfs: checking transaction log (sda1) for (sda1)
Using r5 hash to sort names
VFS: Mounted root (reiserfs filesystem) readonly.
Freeing unused kernel memory: 164k freed

Then it locks.  Once it printed the message about INIT starting after
this, so I guess it's something around this point that's causing the
problem.  However since it seems to be a *really* bad lock, I don't know
how to proceed :-(

Cheers,
Adam. (please CC replies)
