From: Thomas Evans <tom@23palmer.net>
Subject: Re: Bitmap alignment issues....
Date: Thu, 10 Feb 2005 00:10:14 -0500
Message-ID: <200502100010.15363.tom@23palmer.net>
References: <E1Cyw7x-00073N-00@smtp03.mrf.mail.rcn.net> <20050209181911.GM7482@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050209181911.GM7482@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alex Zarochentsev <zam@namesys.com>


Thanks for the patch the helped with the vast majority of the fixups.

Now there are just a trickle occurring in various places - would it be helpful 
for me to track them down, or are there folks who are already pursuing this?

...tom

On Wednesday 09 February 2005 01:19 pm, Alex Zarochentsev wrote:
> hello,
>
> On Wed, Feb 09, 2005 at 12:59:17PM -0500, Tom Evans wrote:
> > Hi All -
> >
> > I am new to the list - I have been using Reiser4 on Linux/Alpha
> > for several months now and like very much what it offers.
> >
> > (I use a -mm kernel from kernel.org with a Debian distro)
> >
> > Recently I became aware or a large number or alignment fixups
> > occurring in the kernel, specifically in the reiser4 code.
> >
> > (My machine(s) would occasionally slow to a crawl when doing
> >  intense disk i/o - I thought it was because I had recently
> >  started using IDE drives in my systems (the IDE controllers
> >  on these boards are notoriously slow) ).
> >
> > I determined that 50k+ alignment faults were happening
> > per second - I traced the majority down to these 3 functions:
> >
> > 1) reiser4_find_next_set_bit  (in fs/reiser4/plugins/space/bitmap.c)
> > 2) find_next_zero_bit (in asm/bitops.h)
> > 3) replace_extent (in fs/reiser4/plugins/item/extent.c)
> >
> > The first 2 accounted for ~4million faults during boot - essentially,
> > the base address of the bit array is not aligned properly
> > for ulong accesses on Alpha (which are 64bit).
> >
> > I worked around this by using "get_unaligned()" for the array
> > accesses in #1 and implemented a version of "find_next_zero_bit"
> > local to reiser4 that handles unaligned base addresses (no need
> > for all other users of the function to suffer the same performance hit).
> >
> > Those 2 changes brought the number of alignment fixups to 0 on a boot -
> > the #3 issue accounts for a very small number of fixups - I have not
> > yet found the exact location.
> >
> > While these changes eliminated the faults, they are not optimal,
> > get_unaligned() adds many cycles over a standard load.
> >
> > I wanted to see if anyone here was already familiar with this issue and
> > what the process would be for getting it addressed.
>
> it is known. ca you try the attached patch?
>
> > Thanks for your patience!
> >
> > ...tom

