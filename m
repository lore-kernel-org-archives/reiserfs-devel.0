From: Badari Pulavarty <pbadari@us.ibm.com>
Subject: Re: migratepage failures on reiserfs
Date: Wed, 07 Nov 2007 07:58:57 -0800
Message-ID: <1194451138.26782.30.camel@dyn9047017100.beaverton.ibm.com>
References: <20071030135442.5d33c61c@think.oraclecorp.com>
	 <1193781245.8904.28.camel@dyn9047017100.beaverton.ibm.com>
	 <20071030185840.48f5a10b@think.oraclecorp.com>
	 <1193847261.17412.13.camel@dyn9047017100.beaverton.ibm.com>
	 <20071031134006.2ecd520b@think.oraclecorp.com>
	 <1193935137.26106.5.camel@dyn9047017100.beaverton.ibm.com>
	 <20071101115103.62de4b2e@think.oraclecorp.com>
	 <1193940626.26106.13.camel@dyn9047017100.beaverton.ibm.com>
	 <20071105102335.GA6272@skynet.ie>
	 <Pine.LNX.4.64.0711051446130.20927@schroedinger.engr.sgi.com>
	 <20071107145619.GA32737@skynet.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071107145619.GA32737@skynet.ie>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mel Gorman <mel@skynet.ie>
Cc: Christoph Lameter <clameter@sgi.com>, Chris Mason <chris.mason@oracle.com>, reiserfs-devel@vger.kernel.org, linux-mm <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Wed, 2007-11-07 at 14:56 +0000, Mel Gorman wrote:
> On (05/11/07 14:46), Christoph Lameter didst pronounce:
> > On Mon, 5 Nov 2007, Mel Gorman wrote:
> > 
> > > The grow_dev_page() pages should be reclaimable even though migration
> > > is not supported for those pages? They were marked movable as it was
> > > useful for lumpy reclaim taking back pages for hugepage allocations and
> > > the like. Would it make sense for memory unremove to attempt migration
> > > first and reclaim second?
> > 
> > Note that a page is still movable even if there is no file system method 
> > for migration available. In that case the page needs to be cleaned before 
> > it can be moved.
> > 
> 
> Badari, do you know if the pages failed to migrate because they were
> dirty or because the filesystem simply had ownership of the pages and
> wouldn't let them go?

From the debug, it looks like all the buffers are clean and they
have a b_count == 1. So drop_buffers() fails to release the buffer.

Thanks,
Badari

