From: Oleg Drokin <green@namesys.com>
Subject: Re: Symbol collisions in patch?
Date: Wed, 3 Apr 2002 09:32:10 +0400
Message-ID: <20020403093210.B5947@namesys.com>
References: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Oehser <tom@toms.net>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Apr 02, 2002 at 09:41:55PM -0500, Tom Oehser wrote:

> 2) There are symbol collisions that prevent supporting reiser AND ext3fs,
>    *even as a module*.  Come on, guys, symbol collisions between the two
>    most popular journalling filesystems?  Pa-thetic...

I believe this is ext3 problem, because reiserfs occupied these symbol first ;)
ext3 appeared a little bit later then reiserfs.

> 3) There is no support for version 3.6 filesystems in 2.2.x, so, what good
>    is reiser support on my rescue diskette, if 2.4.x users can't use it?

This is even documented. v3.6 format is for 2.4+ kernels only.
If you concerned that much about the issue and needs this v3.6 support,
you might try to convice Hans about that.
One of teh best ways to convice Hans to provice v3.6 support in 2.2 kernels
is to pay for the work (details are at http://www.namesys.com/support.html)

> 4) There seems to be no-one concerned about any of these issues, or
>    working on them, or talking about them.

It seems that most of reiserfs users are using v2.4 kernels.

> 5) My guess is that reiser-4 will be 2.5.x or 2.6.x only, and never get
>    back-supported to 2.4, much less 2.2.x.

I doubt for 2.2 support, but if 2.6 development will take another 2 years,
then 2.4 support might be provided ;) Also support for any kernel can be
provided if you'd pay for the porting. (even for non-Linux kernels)

> The bleeding-edge crowd may not be aware of it, but a new kernel is about
> to be released- it is now up to 2.0.40-rc4.  That's right, 2.0.40-rc4.

Yes, we are aware of that. ( kernel for hardcore paranoid crash-fearing people,
I presume)

> And I can tell you that scsi drivers and network card drivers are still
> being updated for that.  And the ext2 sparse-super and filesystem-type
> fixes were backported to 2.0.x.

Here is my opinition (may be Hans have another one), since there were no active
reiserfs users at 2.0 time, there is hardly any demand for reiserfs for linux
kernel 2.0.

> So, the rest of the world is still willing to devote *some* effort to
> supporting 2.0.x, (and libc5, for that matter), and *plenty* of effort to
> supporting 2.2.x, but it seems that reiser doesn't isn't or won't...

Well, with limited budget and workforce people tend to concentrate on things
that are important to them.

Bye,
    Oleg
