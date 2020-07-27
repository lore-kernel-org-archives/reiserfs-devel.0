From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: reiserfs.h: delete a duplicated word
Date: Mon, 27 Jul 2020 10:58:48 +0200
Message-ID: <20200727085848.GG23179@quack2.suse.cz>
References: <20200720001431.29718-1-rdunlap@infradead.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200720001431.29718-1-rdunlap@infradead.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

On Sun 19-07-20 17:14:31, Randy Dunlap wrote:
> Drop the repeated word "than" in a comment.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Jeff Mahoney <jeffm@suse.com>
> Cc: reiserfs-devel@vger.kernel.org

Thanks! Applied.

								Honza

> ---
>  fs/reiserfs/reiserfs.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200717.orig/fs/reiserfs/reiserfs.h
> +++ linux-next-20200717/fs/reiserfs/reiserfs.h
> @@ -1109,7 +1109,7 @@ int is_reiserfs_jr(struct reiserfs_super
>   * ReiserFS leaves the first 64k unused, so that partition labels have
>   * enough space.  If someone wants to write a fancy bootloader that
>   * needs more than 64k, let us know, and this will be increased in size.
> - * This number must be larger than than the largest block size on any
> + * This number must be larger than the largest block size on any
>   * platform, or code will break.  -Hans
>   */
>  #define REISERFS_DISK_OFFSET_IN_BYTES (64 * 1024)
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
