From: tytso@mit.edu
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Wed, 26 Mar 2014 09:29:36 -0400
Message-ID: <20140326132936.GB4907@thunk.org>
References: <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
 <20140322170322.GA23583@thunk.org>
 <20140322101512.eaeb542b.akpm@linux-foundation.org>
 <20140322172606.GB23583@thunk.org>
 <20140322173207.GC23583@thunk.org>
 <20140322105524.7baec73a.akpm@linux-foundation.org>
 <20140322192423.GA10176@redhat.com>
 <alpine.DEB.2.02.1403251800320.21733@chino.kir.corp.google.com>
 <20140326061904.GA4907@thunk.org>
 <20140325233209.31756c92.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=thunk.org; s=mail;
	t=1395840576; bh=oKhNzffRS1kW6GN/yghbyUGYQ2kYaoAGV+Yudgsvf+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKeC/cjMfnQj5hE//WClxW0eCHpgy9VIlFscAQJkirRTCG/L9FDW/S9H9YFXSR0hz
	 J7DbCJN3gzR3i1NvPscxIhj3Pp2sc/iSnh89IWScQfui55aHazSCQir23nU4b1mAqg
	 4VItxTiIfD9XL3ya1Pa+s325WjWq6megqCK1UzzU=
Content-Disposition: inline
In-Reply-To: <20140325233209.31756c92.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Rientjes <rientjes@google.com>, Dave Jones <davej@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Joe Perches <joe@perches.com>

On Tue, Mar 25, 2014 at 11:32:09PM -0700, Andrew Morton wrote:
> Well, there are always alternatives.  For example ext3 could
> preallocate a single transaction_t and a single IO page and fall back
> to synchronous page-at-a-time journal writes.  But I can totally see
> that such things are unattractive: heaps of new code which is never
> tested in real life.  The page allocator works so damn well that it
> doesn't make sense to implement it.

I'm not sure that there are _always_ solutions.  For example, ext3
still needs to use buffer cache to do the I/O, and that may require
allocations as well.  Fortunately, this was patched around other ways
to avoid livelock issues in the page cleaner in 2013: 84235de394d977

But that's another new user of GFP_NOFAIL (and one added three years
after David tried to declare There Shalt Be No New Users of
GFP_NOFAIL), and sure, we could probably patch around that by having
places where there's no other alternaive to keep a preallocated batch
of pages and/or allocated structures at each code site.  But that's as
bad as looping at each code site; in fact, wouldn't it be better if
the allocator wants to avoid looping, to have a separate batch of
pages which (ala GFP_ATOMIC) which is reserved for just for GFP_NOFAIL
allocations when all else fails?

(BTW, we have a similar issue with bio's in the block layer, but
fortunately, those structures are relatively small, and since they are
in their own slab cache, and are constantly being used and then
recycled, it's in practice rare that allocations will fail when we are
in a desparate low memory situation.  But technically there will be
places where we should pass a gfp_t down to the block layers, and use
GFP_NOFAIL if we really want to make sure that memory allocations
needed to try to clean pages and/or avoid user data corruption are
needed.)

> Please use NOFAIL ;) The core page allocator will always be able to
> implement this better than callers.

I'll convert jbd2 to use NOFAIL.  :-)

Cheers,

						- Ted
