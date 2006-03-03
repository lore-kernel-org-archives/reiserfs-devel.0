From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: reiserfs_file_write will lose error code when
 a 0-length write occurs w/ O_SYNC
Date: Fri, 03 Mar 2006 09:31:19 -0800
Message-ID: <44087D67.2000104@namesys.com>
References: <20060302210947.GA16696@locomotive.unixthugs.org> <20060302153358.4cace15e.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28204-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060302153358.4cace15e.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: Jeff Mahoney <jeffm@suse.com>, torvalds@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Andrew Morton wrote:

>Boy, lots of reiserfs things happening lately.
>
>We presently have:
>
>reiserfs-do-not-check-if-unsigned-0.patch	[ merged today ]
>reiserfs-fix-transaction-overflowing.patch
>reiserfs-handle-trans_id-overflow.patch
>reiserfs-reiserfs_file_write-will-lose-error-code-when-a-0-length-write-occurs-w-o_sync.patch
>reiserfs-cleanups.patch
>reiserfs-use-balance_dirty_pages_ratelimited_nr-in-reiserfs_file_write.patch
>reiserfs-fix-unaligned-bitmap-usage.patch
>
>The question is, which of these are sufficiently serious-and-safe for
>2.6.16?
>
>I haven't seen any resierfs bug reports for quite some time (except for the
>usual dribble of it-goes-oops-in-prints.c-when-something-went-wrong
>reports).
>
>So I'm inclined to hold off on all the above?
>
>
>  
>
I suggest that they sit in -mm or an rc for ~2 weeks before they go in. 
If 2.6.16 is coming out before then, then let it ship without them.  All
of these things are pretty obscure/rare, so not unsettling the code
matters more than getting them in.
