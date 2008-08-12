From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/3][reiser4] don't leave loop prematurely
Date: Tue, 12 Aug 2008 16:54:38 +0400
Message-ID: <48A1880E.7000401@gmail.com>
References: <48A0BF59.4050605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48A0BF59.4050605@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Hope <rmh3093@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Ryan Hope wrote:
> This was item #9 on the todo list for reiser4 inclusion in mainline:
>
> diff --git
> a/52d76fde71070a6c4c8c581dd2bfe3c6ffa82ad7:fs/reiser4/page_cache.c
> b/7f1ee1bb0c5a2948f5347646795afd088da30eaf:fs/reiser4/page_cache.c
> index
> edf0911dc8bb61398374ecf4f849aa30753fb274..fe713681b73d2a6c4214f5938f21794573d8607d
> 100644
> --- a/52d76fde71070a6c4c8c581dd2bfe3c6ffa82ad7:fs/reiser4/page_cache.c
> +++ b/7f1ee1bb0c5a2948f5347646795afd088da30eaf:fs/reiser4/page_cache.c
> @@ -658,8 +658,7 @@ truncate_jnodes_range(struct inode *inode, pgoff_t
> from, pgoff_t count)
>                  unhash_unformatted_jnode(node);
>                  truncated_jnodes++;
>                  jput(node);
> -            } else
> -                break;
> +            }

No, this is wrong:
if (node == NULL), then there is nothing to do in this loop.

Edward.

>          }
>          if (i != taken || taken == 0)
>              break;
>
>
> -Ryan
>

