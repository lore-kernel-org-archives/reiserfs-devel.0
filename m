From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH 03/04] reiserfs: reorganize bitmap loading functions
Date: Mon, 19 Jun 2006 17:56:06 -0700
Message-ID: <20060619175606.6e7cb919.akpm@osdl.org>
References: <20060615014203.GA8216@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060615014203.GA8216@locomotive.unixthugs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: linux-kernel@vger.kernel.org, torvalds@osdl.org, reiserfs-list@namesys.com

Jeff Mahoney <jeffm@suse.com> wrote:
>
> +	for (i = 0; i < SB_BMAP_NR(sb); i++)
> +		bitmap[i].bh = reiserfs_read_bitmap_block(sb, i);

Can return NULL.

> +	/* make sure we have them all */
> +	for (i = 0; i < SB_BMAP_NR(sb); i++) {
> +		wait_on_buffer(bitmap[i].bh);

Will go oops.
