From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs : fix improper free in reiserfs_get_block
Date: Wed, 15 Jul 2020 10:04:51 +0200
Message-ID: <20200715080451.GK23073@quack2.suse.cz>
References: <20200714130509.11791-1-trix@redhat.com>
 <20200714131043.GB12769@casper.infradead.org>
 <bc5a13bd-54c4-509d-7202-20c93f43e2f6@redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bc5a13bd-54c4-509d-7202-20c93f43e2f6@redhat.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rix <trix@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>, jack@suse.cz, william.kucharski@oracle.com, jeffm@suse.com, joseph.qi@linux.alibaba.com, liao.pingfang@zte.com.cn, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue 14-07-20 06:12:47, Tom Rix wrote:
> 
> On 7/14/20 6:10 AM, Matthew Wilcox wrote:
> > On Tue, Jul 14, 2020 at 06:05:09AM -0700, trix@redhat.com wrote:
> >> From: Tom Rix <trix@redhat.com>
> >>
> >> clang static analysis flags this error
> >>
> >> inode.c:1083:5: warning: Argument to kfree() is the address of the
> >>   local variable 'unf_single', which is not memory allocated by
> >>   malloc() [unix.Malloc]
> >>                                 kfree(un);
> >>                                 ^~~~~~~~~
> >> Assignment of 'un'
> >>
> >> 	/*
> >> 	 * We use this in case we need to allocate
> >> 	 * only one block which is a fastpath
> >> 	 */
> >> 	unp_t unf_single = 0;
> >>
> >> 	...
> >>
> >> 	if (blocks_needed == 1) {
> >> 		un = &unf_single;
> >> 	} else {
> >> 		un = kcalloc(min(blocks_needed, max_to_insert),
> >> 			     UNFM_P_SIZE, GFP_NOFS);
> >> 		if (!un) {
> >> 			un = &unf_single;
> >> 			blocks_needed = 1;
> >> 			max_to_insert = 0;
> >> 		}
> >> 	}
> >>
> >> The logic to free 'un'
> >>
> >> 	if (blocks_needed != 1)
> >> 		kfree(un);
> >>
> >> Because the kcalloc failure falls back to using unf_single,
> >> the if-check for the free is wrong.
> > I think you mean "Because clang's static analysis is limited, it
> > warns incorrectly about this".  There's no path to get to the
> > kfree with blocks_needed != 1 and un being equal to &unf_single.
> 
> Ok.

I agree with Matthew the patch will make the code more obviously correct so
it's a sensible cleanup. But the changelog needs to redone to reflect this
is just a cleanup before the patch can be merged.

									Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
