From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [patch 7/7] reiserfs: ignore on disk s_bmap_nr value
Date: Wed, 17 Oct 2007 15:19:30 -0700
Message-ID: <20071017151930.9d53a230.akpm@linux-foundation.org>
References: <20071016230210.779927000@suse.com>
	<20071016230259.005368000@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071016230259.005368000@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: torvalds@linux-foundation.org, reiserfs-devel@vger.kernel.org

On Tue, 16 Oct 2007 19:02:17 -0400
Jeff Mahoney <jeffm@suse.com> wrote:

> +/* s_bmap_nr is a u16 */
> +#define reiserfs_bmap_count(sb)	reiserfs_bmap_nr(SB_BLOCK_COUNT(sb), sb->s_blocksize)
> +#define reiserfs_bmap_nr(count, blk_size) ((count - 1) / (blk_size * 8) + 1)
> +#define bmap_would_wrap(n)		(n > ((1LL << 16) - 1))

Please only use macros when the code HAS to be implemented as a macro for
some reason.  These could have been implemented as (possibly inlined) C
functions.  

reiserfs_bmap_count() is in fact buggy - it references its argument more
than once.  Nobody will be doing reiserfs_bmap_count(foo++), but it is bad
practice.

Also, all three macros fail to sufficiently parenthesise their arguments.

All this is fixable by coding in C, not cpp...
