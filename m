From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Mon, 17 Jul 2006 21:55:52 +0400
Message-ID: <1153158952.6311.87.camel@tribesman.namesys.com>
References: <200607120816.11292.fjcabello@visual-tools.com>
	 <200607141420.36656.fjcabello@visual-tools.com>
	 <1152881975.6407.58.camel@tribesman.namesys.com>
	 <200607171053.42044.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607171053.42044.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francisco Javier Cabello <fjcabello@visual-tools.com>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2006-07-17 at 10:53 +0200, Francisco Javier Cabello wrote:
> Hello Vladimir,
> > such corruptions used to be considered as hardware bugs. Memory failure,
> > for instance. Did you ever run memtest on your systems?
> 
> Yes, We have run memtest in our system. It's very seldom to find a system with 
> a hardware memory problem running. When we find a memory problem the kernel 
> doesn't boot. I am going to pass memtest in some of the system with reiserfs 
> corruption problem.
> 
please let it run few hours at least.

> Could I give you more information? Perhaps if I run 'reiserfsck 
> --rebuild-tree' and I give you the traces... would it be useful?
> 
ok, although
you sent reiserfsck --check log. The corruption looked like a content of
block was randomly overwritten by random characters. We used to consider
such corruptions as caused by hardware faults. Especially because most
of your systems are running in similar circumstances flawlessly.

> Regards,
> 
> Paco
> 
> On Friday, 14 de July de 2006 14:59, Vladimir V. Saveliev wrote:
> > Hello
> >
> > On Fri, 2006-07-14 at 14:20 +0200, Francisco Javier Cabello wrote:
> > > Hello Vladimir,
> > >
> > > # reiserfsck -l /tmp/reiserfsck.log -y --check /dev/hdc1
> > >
> > > Standard output:
> > > ======================================================
> > > Will read-only check consistency of the filesystem on /dev/hdc1
> > > Will put log info to '/tmp/reiserfsck.log'
> > > ###########
> > > reiserfsck --check started at Fri Jul 14 14:09:33 2006
> > > ###########
> > > Replaying journal..
> > > Reiserfs journal '/dev/hdc1' in blocks [18..8211]: 0 transactions
> > > replayed Checking internal tree..finished
> > > Comparing bitmaps..Bad nodes were found, Semantic pass skipped
> > > 1 found corruptions can be fixed only when running with --rebuild-tree
> > > ###########
> > > reiserfsck finished at Fri Jul 14 14:13:29 2006
> > > ###########
> > > ======================================================
> > >
> > > /tmp/reiserfsck.log:
> > > ======================================================
> > > bad_internal: vpf-10320: block 23868569, items 91 and 92: The wrong order
> > > of items: [410810496 11321 0x16abca00 ??? (15)], [11312 11321 0x22f1c880
> > > DIR (3)]
> >
> > such corruptions used to be considered as hardware bugs. Memory failure,
> > for instance. Did you ever run memtest on your systems?
> >
> > >  the problem in the internal node occured (23868569), whole subtree is
> > > skipped vpf-10640: The on-disk and the correct bitmaps differs.
> > > ======================================================
> 

