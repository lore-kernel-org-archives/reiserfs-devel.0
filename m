From: Badari Pulavarty <pbadari@us.ibm.com>
Subject: Re: migratepage failures on reiserfs
Date: Tue, 30 Oct 2007 13:54:05 -0800
Message-ID: <1193781245.8904.28.camel@dyn9047017100.beaverton.ibm.com>
References: <1193768824.8904.11.camel@dyn9047017100.beaverton.ibm.com>
	 <20071030135442.5d33c61c@think.oraclecorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20071030135442.5d33c61c@think.oraclecorp.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <chris.mason@oracle.com>
Cc: reiserfs-devel@vger.kernel.org, linux-mm <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Tue, 2007-10-30 at 13:54 -0400, Chris Mason wrote:
> On Tue, 30 Oct 2007 10:27:04 -0800
> Badari Pulavarty <pbadari@us.ibm.com> wrote:
> 
> > Hi,
> > 
> > While testing hotplug memory remove, I ran into this issue. Given a
> > range of pages hotplug memory remove tries to migrate those pages.
> > 
> > migrate_pages() keeps failing to migrate pages containing pagecache
> > pages for reiserfs files. I noticed that reiserfs doesn't have 
> > ->migratepage() ops. So, fallback_migrate_page() code tries to
> > do try_to_release_page(). try_to_release_page() fails to
> > drop_buffers() since b_count == 1. Here is what my debug shows:
> > 
> > 	migrate pages failed pfn 258111/flags 3f00000000801
> > 	bh c00000000b53f6e0 flags 110029 count 1
> > 	
> > Any one know why the b_count == 1 and not getting dropped to zero ? 
> 
> If these are file data pages, the count is probably elevated as part of
> the data=ordered tracking.  You can verify this via b_private, or just
> mount data=writeback to double check.


Chris,

That was my first assumption. But after looking at reiserfs_releasepage
(), realized that it would do reiserfs_free_jh() and clears the
b_private. I couldn't easily find out who has the ref. against this
bh.

bh c00000000bdaaf00 flags 110029 count 1 private 0

Thanks,
Badari

