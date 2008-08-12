From: Nick Piggin <nickpiggin@yahoo.com.au>
Subject: Re: [PATCH 3/3][reiser4] dont get radix-tree dirty tagging out of sync
Date: Tue, 12 Aug 2008 16:00:40 +1000
Message-ID: <200808121600.40293.nickpiggin@yahoo.com.au>
References: <48A0BFC9.40502@gmail.com> <200808121236.51599.nickpiggin@yahoo.com.au> <48f7fe350808112112k5e92330epa8345cbe4eb4c1b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752264AbYHLGA6@vger.kernel.org>
In-Reply-To: <48f7fe350808112112k5e92330epa8345cbe4eb4c1b5@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Hope <rmh3093@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Edward Shishkin <edward.shishkin@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

On Tuesday 12 August 2008 14:12, Ryan Hope wrote:
> I tried just using __set_page_dirty_nobuffers but that caused issues
> with ext3/ext4 (i can send a bug trace later if needed).
>
>                                 __inc_bdi_stat(mapping->backing_dev_info,
>                                                 BDI_RECLAIMABLE);
>                                 task_io_account_write(PAGE_CACHE_SIZE);
>
> ^^^ the above code in __set_page_dirty_nobuffers causes an issue with
> do_writepages in ext3/4 when I use something like the code below:
>
> int reiser4_set_page_dirty_internal(struct page *page)
> {
>      return __set_page_dirty_nobuffers(page);
> }

Hmm, it causes issues in ext3/4 even though it doesn't change any
code executed by ext3/4? Yes, if you could send a trace...
