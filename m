From: Chris Mason <mason@suse.com>
Subject: Re: BUG: Replaying ReiserFS log causes hard lockup
Date: Thu, 25 Mar 2004 07:54:22 -0500
Message-ID: <1080219262.14742.146.camel@watt.suse.com>
References: <20040325204836.07bcf910.a.nielsen@optushome.com.au>
	 <1080213348.1976.277.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17466-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080213348.1976.277.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Adam Nielsen <a.nielsen@optushome.com.au>, reiserfs-list@namesys.com

On Thu, 2004-03-25 at 06:15, Vladimir Saveliev wrote:
> Hello
> 
> On Thu, 2004-03-25 at 13:48, Adam Nielsen wrote:
> > Hi,
> > 
> > My apologies if this is the wrong place to send a report like this, but
> > I couldn't find anywhere more suitable!
> > 
> > I have just come across a rather annoying bug, which seems to be most
> > likely located in ReiserFS as my computer now locks up while
> > booting a stock 2.6.3 kernel almost immediately after displaying this:
> > 
> > found reiserfs format "3.6" with standard journal
> > Reiserfs journal params: device sda1, size 8192, journal first block 18,
> > max trans len 1024, max batch 900, max commit age 30, max trans age 30
> > reiserfs: checking transaction log (sda1) for (sda1)
> > 
Please compile the kernel with sysrq support, and try to do a sysrq-p
when things are locked.  If there kernel is completely frozen, you can
turn on the nmi watchdog, which should trigger an oops to tell us where
things are broken.  You can get more details about both of these from
the Documentation directory in the kernel source

Documentation/nmi_watchdog.txt
Documentation/sysrq.txt

-chris


