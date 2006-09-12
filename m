From: John M Harrison <jmh5@nei.mv.com>
Subject: Re: Reiser FS will not boot after crash
Date: Mon, 11 Sep 2006 21:35:09 -0400 (EDT)
Message-ID: <Pine.LNX.3.95.1060911212128.8856V-100000@nei>
References: <200609051555.50179.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609051555.50179.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Valdis.Kletnieks@vt.edu


Hi,

   Sorry to take so long giving you a response. I did connect to the box
as it crashed [via ssh]. There were no terminal messages [tail -f
/var/log/messages]. This latest time an initial window for camorama was
starting to open. 

   You ask, "Am I willing to help?" debug the problem. Absolutely. [Linux
has given so much to me!!]

   I reloaded camorama, so I should be able to reproduce the problem. The
problem (not being able to boot) occurs frequently though not every time I
run camorama. So my simple solution has been just to not run that program.

   This box has LILO on the master boot block. This chains to the Knoppix
partition which has GRUB as the partition boot loader. As mentioned GRUB
starts but then claims it finds an inconsistent filesystem.  This repeats
over and over until fsck.reiser is run on this partition from a different
OS on a different partition. fsck.reiser replays the journal at first and
then examines the filesystem and finds nothing wrong. I assume I am using
the "stock"  GRUB which Knoppix 5.0.1 installed since I haven't knowingly
changed it? Perhaps the "problem" is simply that Knoppix installed an
older version of GRUB ? 

    john

On Tue, 5 Sep 2006, Vladimir V. Saveliev wrote:

> Hello
> 
> On Tuesday 05 September 2006 04:10, John M Harrison wrote:
> > Hi,
> >
> >    You make some good points. I wonder what the "right" fix is?
> >
> >    I certainly think the user should not be stopped from booting and then
> > get the inconsistent filesystem message over and over again as I do.
> >
> >    Perhaps GRUB should offer to 'replay' the filesystem after discovering
> > that the filesystem is "inconsistent". I am not sure what other choices
> > there are since the kernel and the initial boot filesystem are presumably
> > not loadable?
> >
> 
> I looked at grub sources. It looks like it takes journal into account. It may 
> have a bug, though.
> What version of grub do you have?
> Would you like to help to debug the problem?
> 
> >    john
> >
> > On Tue, 5 Sep 2006, Vladimir V. Saveliev wrote:
> > > Hello
> > >
> > > On Tuesday 05 September 2006 00:30, Valdis.Kletnieks@vt.edu wrote:
> > > > On Mon, 04 Sep 2006 23:33:27 +0400, "Vladimir V. Saveliev" said:
> > > > > after unclean shutdown journal reply is necessary to return reiserfs
> > > > > to consistent state. Maybe GRUB did not do that?
> > > >
> > > > A case can be made that GRUB should be keeping its grubby little paws
> > > > off the filesystem journal.  It's a *bootloader*.  It's only purpose in
> > > > life is to load other code that can make intelligent decisions about
> > > > things like how (or even whether) to replay a filesystem journal.
> > >
> > > Yes, I did not say that grub has to replay a journal, I just tried to
> > > guess why grub failed to boot and why things went ok after fsck.
> 

