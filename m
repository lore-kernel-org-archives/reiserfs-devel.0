From: Chris Mason <chris.mason@oracle.com>
Subject: Re: migratepage failures on reiserfs
Date: Tue, 30 Oct 2007 13:54:42 -0400
Message-ID: <20071030135442.5d33c61c@think.oraclecorp.com>
References: <1193768824.8904.11.camel@dyn9047017100.beaverton.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1193768824.8904.11.camel@dyn9047017100.beaverton.ibm.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Badari Pulavarty <pbadari@us.ibm.com>
Cc: reiserfs-devel@vger.kernel.org, linux-mm <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Tue, 30 Oct 2007 10:27:04 -0800
Badari Pulavarty <pbadari@us.ibm.com> wrote:

> Hi,
> 
> While testing hotplug memory remove, I ran into this issue. Given a
> range of pages hotplug memory remove tries to migrate those pages.
> 
> migrate_pages() keeps failing to migrate pages containing pagecache
> pages for reiserfs files. I noticed that reiserfs doesn't have 
> ->migratepage() ops. So, fallback_migrate_page() code tries to
> do try_to_release_page(). try_to_release_page() fails to
> drop_buffers() since b_count == 1. Here is what my debug shows:
> 
> 	migrate pages failed pfn 258111/flags 3f00000000801
> 	bh c00000000b53f6e0 flags 110029 count 1
> 	
> Any one know why the b_count == 1 and not getting dropped to zero ? 

If these are file data pages, the count is probably elevated as part of
the data=ordered tracking.  You can verify this via b_private, or just
mount data=writeback to double check.

-chris
