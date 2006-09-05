From: John M Harrison <jmh5@nei.mv.com>
Subject: Re: Reiser FS will not boot after crash
Date: Mon, 4 Sep 2006 20:10:08 -0400 (EDT)
Message-ID: <Pine.LNX.3.95.1060904200342.6194e-100000@nei>
References: <200609050029.05251.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29805-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609050029.05251.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Valdis.Kletnieks@vt.edu


Hi,

   You make some good points. I wonder what the "right" fix is?

   I certainly think the user should not be stopped from booting and then
get the inconsistent filesystem message over and over again as I do.

   Perhaps GRUB should offer to 'replay' the filesystem after discovering
that the filesystem is "inconsistent". I am not sure what other choices
there are since the kernel and the initial boot filesystem are presumably
not loadable?

   john

On Tue, 5 Sep 2006, Vladimir V. Saveliev wrote:

> Hello
> 
> On Tuesday 05 September 2006 00:30, Valdis.Kletnieks@vt.edu wrote:
> > On Mon, 04 Sep 2006 23:33:27 +0400, "Vladimir V. Saveliev" said:
> > > after unclean shutdown journal reply is necessary to return reiserfs to
> > > consistent state. Maybe GRUB did not do that?
> >
> > A case can be made that GRUB should be keeping its grubby little paws off
> > the filesystem journal.  It's a *bootloader*.  It's only purpose in life is
> > to load other code that can make intelligent decisions about things like
> > how (or even whether) to replay a filesystem journal.
> 
> Yes, I did not say that grub has to replay a journal, I just tried to guess 
> why grub failed to boot and why things went ok after fsck.
> 

