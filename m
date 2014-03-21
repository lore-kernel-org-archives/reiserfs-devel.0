From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Fri, 21 Mar 2014 13:00:55 -0700
Message-ID: <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabian Frederick <fabf@skynet.be>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Fri, 21 Mar 2014 17:18:30 +0100 Fabian Frederick <fabf@skynet.be> wrote:

> Loop around congestion_wait on allocation failure/alloc_journal_list
> like already fixed in other FS.
> 
> ...
>
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -2487,8 +2487,13 @@ static int journal_read(struct super_block *sb)
>  static struct reiserfs_journal_list *alloc_journal_list(struct super_block *s)
>  {
>  	struct reiserfs_journal_list *jl;
> -	jl = kzalloc(sizeof(struct reiserfs_journal_list),
> -		     GFP_NOFS | __GFP_NOFAIL);
> +
> +	do {
> +		jl = kzalloc(sizeof(struct reiserfs_journal_list), GFP_NOFS);
> +		if (unlikely(!jl))
> +			congestion_wait(BLK_RW_ASYNC, HZ/50);
> +	} while (!jl)
> +

Dammit, who has been running around converting __GFP_NOFAIL into
open-coded congestion_wait() loops?

The whole point of __GFP_NOFAIL is to centralise this
wait-for-memory-for-ever operation.  So it is implemented in a common
(core) place and so that we can easily locate these problematic
callers.

This comment in ext4:

			/*
			 * If __GFP_FS is not present, then we may be
			 * being called from inside the fs writeback
			 * layer, so we MUST NOT fail.  Since
			 * __GFP_NOFAIL is going away, we will arrange
			 * to retry the allocation ourselves.
			 */

is exactly wrong.  Yes, we'd like __GFP_NOFAIL to go away, but it
cannot go away until buggy callsites such as this one are *fixed*. 
Removing the __GFP_NOFAIL usage simply hides the buggy code from casual
searchers.

argh.

What we should do is to fix all these call sites so they can handle
memory exhaustion.  That's hard so in the interim they should be using
__GFP_NOFAIL.

