From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: does "reiserfsck --rebuild-sb" require free space?
Date: Mon, 6 Dec 2004 18:52:53 +0300
Message-ID: <200412061852.53260.vitaly@namesys.com>
References: <41B38E30.3060308@inter.net.il> <1102338274.1652.63.camel@tribesman.namesys.com> <200412061817.14671.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412061817.14671.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>, Omry Yadan <omry_y@inter.net.il>
Cc: reiserfs-list@namesys.com

On Monday 06 December 2004 18:17, Vitaly Fertman wrote:
> Hello
>
> On Monday 06 December 2004 16:04, Vladimir Saveliev wrote:
> > Hello
> >
> > On Mon, 2004-12-06 at 01:39, Omry Yadan wrote:
> > > I have a partial image of a reiserfs partition which takes up all the
> > > space on the (reiserfs) parition it sits on.
> > > there are 0 bytes free on that partition.
> > > the image was created with dd, and I ran out space when creating it.
> > > when I try to run
> > > reiserfsck --rebuild-sb backup.img
> > > I get the error
> > > bwrite: write 4096 bytes returned -1 (block=16, dev=3): No space left
> > > on device
> > >
> > > does that make sense?
> >
> > Yes. That means that you have hit reiserfsck bug. Vitaly will contact
> > with you soon.
>
> nothing about reiserfsck here. write to the file asks for some space on
> the host fs (which is reiserfs also) and there is no any. this looks like
> the correct behaviour for the fully packed fs as some data needs to be
> overwritten and access time needs to be updated.

the only thing that is not clear yet is why reiserfs needs some blocks 
here -- the journal space is reserved and the file data will be overwritten 
on-place, with no temporary locations. thus this could be a reiserfs bug 
or just-in-case reservation ... this needs to be checked.

you can free some space on the host reiserfs for now and write to the file
should succeed then.

-- 
Thanks,
Vitaly Fertman


