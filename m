From: Christoph Lameter <clameter@sgi.com>
Subject: Re: migratepage failures on reiserfs
Date: Mon, 5 Nov 2007 14:46:45 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0711051446130.20927@schroedinger.engr.sgi.com>
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
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20071105102335.GA6272@skynet.ie>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mel Gorman <mel@skynet.ie>
Cc: Badari Pulavarty <pbadari@us.ibm.com>, Chris Mason <chris.mason@oracle.com>, reiserfs-devel@vger.kernel.org, linux-mm <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Mon, 5 Nov 2007, Mel Gorman wrote:

> The grow_dev_page() pages should be reclaimable even though migration
> is not supported for those pages? They were marked movable as it was
> useful for lumpy reclaim taking back pages for hugepage allocations and
> the like. Would it make sense for memory unremove to attempt migration
> first and reclaim second?

Note that a page is still movable even if there is no file system method 
for migration available. In that case the page needs to be cleaned before 
it can be moved.

