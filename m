From: Brad Dameron <brad@seatab.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Mon, 17 Jul 2006 11:14:12 -0700
Message-ID: <1153160052.3925.5.camel@serpent.office.seatab.com>
References: <200607120816.11292.fjcabello@visual-tools.com>
	 <200607141420.36656.fjcabello@visual-tools.com>
	 <1152881975.6407.58.camel@tribesman.namesys.com>
	 <200607171053.42044.fjcabello@visual-tools.com>
	 <1153158952.6311.87.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29038-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153158952.6311.87.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon, 2006-07-17 at 21:55 +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> On Mon, 2006-07-17 at 10:53 +0200, Francisco Javier Cabello wrote:
> > Hello Vladimir,
> > > such corruptions used to be considered as hardware bugs. Memory failure,
> > > for instance. Did you ever run memtest on your systems?
> > 
> > Yes, We have run memtest in our system. It's very seldom to find a system with 
> > a hardware memory problem running. When we find a memory problem the kernel 
> > doesn't boot. I am going to pass memtest in some of the system with reiserfs 
> > corruption problem.
> > 

This is not true. There are certain memory issues that can still allow
the system to boot and appear to run ok. I had a system that didn't show
a memory error until the 4th pass on memtest. I just happened to let it
run over the weekend. I have seen other issues with my larger systems
that have 64GB of ram. To where memtest after a week didn't detect
anything but the kernel mcelog reported weird ECC memory issues. I
replaced several DIMM's and the issue went away. But who knows what
could of occured had I not replaced the memory.

Brad Dameron
SeaTab Software
www.seatab.com

