From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: does "reiserfsck --rebuild-sb" require free space?
Date: Mon, 6 Dec 2004 20:10:36 +0300
Message-ID: <200412062010.36239.vitaly@namesys.com>
References: <41B38E30.3060308@inter.net.il> <200412061852.53260.vitaly@namesys.com> <41B4872B.8050804@inter.net.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22695-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41B4872B.8050804@inter.net.il>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Omry Yadan <omry_y@inter.net.il>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

On Monday 06 December 2004 19:22, Omry Yadan wrote:
> Vitaly Fertman wrote:
> >On Monday 06 December 2004 18:17, Vitaly Fertman wrote:
> >>Hello
> >>
> >>On Monday 06 December 2004 16:04, Vladimir Saveliev wrote:
> >>>Hello
> >>>
> >>>On Mon, 2004-12-06 at 01:39, Omry Yadan wrote:
> >>>>I have a partial image of a reiserfs partition which takes up all the
> >>>>space on the (reiserfs) parition it sits on.
> >>>>there are 0 bytes free on that partition.
> >>>>the image was created with dd, and I ran out space when creating it.
> >>>>when I try to run
> >>>>reiserfsck --rebuild-sb backup.img
> >>>>I get the error
> >>>>bwrite: write 4096 bytes returned -1 (block=16, dev=3): No space left
> >>>>on device
> >>>>
> >>>>does that make sense?
> >>>
> >>>Yes. That means that you have hit reiserfsck bug. Vitaly will contact
> >>>with you soon.
> >>
> >>nothing about reiserfsck here. write to the file asks for some space on
> >>the host fs (which is reiserfs also) and there is no any. this looks like
> >>the correct behaviour for the fully packed fs as some data needs to be
> >>overwritten and access time needs to be updated.
>
> It should write into the file, I don't see how the host file system is
> relevant here.

host fs returns ENOSPC on the write call.

> what if its a real partition and not an file containing an image?
> in that case there is NO host file system at all..

and no such a problem at all.

> if some data in the file must be overwritten, to make room for the file
> system overhead, so be it, but I don't see how trying to write outside
> of the image make sense here. (unless there is a spacial treatment for
> images).

reiserfs_file_write needs to be checked as I already mentioned.

> >the only thing that is not clear yet is why reiserfs needs some blocks
> >here -- the journal space is reserved and the file data will be
> > overwritten on-place, with no temporary locations. thus this could be a
> > reiserfs bug or just-in-case reservation ... this needs to be checked.
> >
> >you can free some space on the host reiserfs for now and write to the file
> >should succeed then.
>
> Easier said than done, that file system has but one file, which is the
> image.
> the only wat to 'free' up some space from it is to truncate the end if
> the image somehow.

btw, it would be not bad to 'reiserfsck --check' the host reiserfs also.

-- 
Thanks,
Vitaly Fertman


