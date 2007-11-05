From: Chris Mason <chris.mason@oracle.com>
Subject: Re: migratepage failures on reiserfs
Date: Mon, 5 Nov 2007 08:40:48 -0500
Message-ID: <20071105084048.28035e52@think.oraclecorp.com>
References: <1193768824.8904.11.camel@dyn9047017100.beaverton.ibm.com>
	<20071030135442.5d33c61c@think.oraclecorp.com>
	<1193781245.8904.28.camel@dyn9047017100.beaverton.ibm.com>
	<20071030185840.48f5a10b@think.oraclecorp.com>
	<1193847261.17412.13.camel@dyn9047017100.beaverton.ibm.com>
	<20071031134006.2ecd520b@think.oraclecorp.com>
	<1193935137.26106.5.camel@dyn9047017100.beaverton.ibm.com>
	<20071101115103.62de4b2e@think.oraclecorp.com>
	<1193940626.26106.13.camel@dyn9047017100.beaverton.ibm.com>
	<20071105102335.GA6272@skynet.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071105102335.GA6272@skynet.ie>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mel Gorman <mel@skynet.ie>
Cc: Badari Pulavarty <pbadari@us.ibm.com>, reiserfs-devel@vger.kernel.org, linux-mm <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Mon, 5 Nov 2007 10:23:35 +0000
mel@skynet.ie (Mel Gorman) wrote:

> On (01/11/07 10:10), Badari Pulavarty didst pronounce:
>
> > > Hmpf, my first reply had a paragraph about the block device inode
> > > pages, I noticed the phrase file data pages and deleted it ;)
> > > 
> > > But, for the metadata buffers there's not much we can do.  They
> > > are included in a bunch of different lists and the patch would
> > > be non-trivial.
> > 
> > Unfortunately, these buffer pages are spread all around making
> > those sections of memory non-removable. Of course, one can use
> > ZONE_MOVABLE to make sure to guarantee the remove. But I am
> > hoping we could easily group all these allocations and minimize
> > spreading them around. Mel ?
> 
> The grow_dev_page() pages should be reclaimable even though migration
> is not supported for those pages? They were marked movable as it was
> useful for lumpy reclaim taking back pages for hugepage allocations
> and the like. Would it make sense for memory unremove to attempt
> migration first and reclaim second?
> 

In this case, reiserfs has the page pinned while it is doing journal
magic.  Not sure if ext3 has the same issues.

-chris
