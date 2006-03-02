From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] reiserfs: reiserfs_file_write will lose error code when
 a 0-length write occurs w/ O_SYNC
Date: Thu, 2 Mar 2006 15:33:58 -0800
Message-ID: <20060302153358.4cace15e.akpm@osdl.org>
References: <20060302210947.GA16696@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28191-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060302210947.GA16696@locomotive.unixthugs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: torvalds@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com


Boy, lots of reiserfs things happening lately.

We presently have:

reiserfs-do-not-check-if-unsigned-0.patch	[ merged today ]
reiserfs-fix-transaction-overflowing.patch
reiserfs-handle-trans_id-overflow.patch
reiserfs-reiserfs_file_write-will-lose-error-code-when-a-0-length-write-occurs-w-o_sync.patch
reiserfs-cleanups.patch
reiserfs-use-balance_dirty_pages_ratelimited_nr-in-reiserfs_file_write.patch
reiserfs-fix-unaligned-bitmap-usage.patch

The question is, which of these are sufficiently serious-and-safe for
2.6.16?

I haven't seen any resierfs bug reports for quite some time (except for the
usual dribble of it-goes-oops-in-prints.c-when-something-went-wrong
reports).

So I'm inclined to hold off on all the above?
