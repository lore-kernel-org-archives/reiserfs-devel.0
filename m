From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser FS will not boot after crash
Date: Tue, 5 Sep 2006 15:55:49 +0400
Message-ID: <200609051555.50179.vs@namesys.com>
References: <Pine.LNX.3.95.1060904200342.6194e-100000@nei>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.3.95.1060904200342.6194e-100000@nei>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John M Harrison <jmh5@nei.mv.com>
Cc: reiserfs-list@namesys.com, Valdis.Kletnieks@vt.edu

Hello

On Tuesday 05 September 2006 04:10, John M Harrison wrote:
> Hi,
>
>    You make some good points. I wonder what the "right" fix is?
>
>    I certainly think the user should not be stopped from booting and then
> get the inconsistent filesystem message over and over again as I do.
>
>    Perhaps GRUB should offer to 'replay' the filesystem after discovering
> that the filesystem is "inconsistent". I am not sure what other choices
> there are since the kernel and the initial boot filesystem are presumably
> not loadable?
>

I looked at grub sources. It looks like it takes journal into account. It may 
have a bug, though.
What version of grub do you have?
Would you like to help to debug the problem?

>    john
>
> On Tue, 5 Sep 2006, Vladimir V. Saveliev wrote:
> > Hello
> >
> > On Tuesday 05 September 2006 00:30, Valdis.Kletnieks@vt.edu wrote:
> > > On Mon, 04 Sep 2006 23:33:27 +0400, "Vladimir V. Saveliev" said:
> > > > after unclean shutdown journal reply is necessary to return reiserfs
> > > > to consistent state. Maybe GRUB did not do that?
> > >
> > > A case can be made that GRUB should be keeping its grubby little paws
> > > off the filesystem journal.  It's a *bootloader*.  It's only purpose in
> > > life is to load other code that can make intelligent decisions about
> > > things like how (or even whether) to replay a filesystem journal.
> >
> > Yes, I did not say that grub has to replay a journal, I just tried to
> > guess why grub failed to boot and why things went ok after fsck.
