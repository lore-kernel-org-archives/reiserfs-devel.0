From: Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [PATCH v2 04/14] gfs2: replace ll_rw_block()
Date: Mon, 5 Sep 2022 16:10:01 +0200
Message-ID: <CAHc6FU4XqSxUr3CS8zxu=Fh_kHytJbzezim0ie_cxdioW5R=FA@mail.gmail.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com> <20220901133505.2510834-5-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662387015;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/aM9Hz/CxTU/5IZIiOb0wSytjLDU1CYz4f/uZlzEYfY=;
        b=WXhE9tE+lWskXL7dnxRIFOx82M1hrtyWC1zMSjoHGv+JpsLFoAduU4XWYEOByeCoMYIC7/
        7XBDNz8gfqUeOXwJPLKEcM3HTA63IHoRDKgCWlxianshklmZW4oqlVRJIhc2w4xvaOWG/v
        scfBuFAyCrPa1mN5TgQrb6ClPeB9J3U=
In-Reply-To: <20220901133505.2510834-5-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

On Thu, Sep 1, 2022 at 3:24 PM Zhang Yi <yi.zhang@huawei.com> wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that always submitting read IO if the buffer has been locked,
> so stop using it. We also switch to new bh_readahead() helper for the
> readahead path.
>
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> ---
>  fs/gfs2/meta_io.c | 7 ++-----
>  fs/gfs2/quota.c   | 8 ++------
>  2 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
> index 7e70e0ba5a6c..6ed728aae9a5 100644
> --- a/fs/gfs2/meta_io.c
> +++ b/fs/gfs2/meta_io.c
> @@ -525,8 +525,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
>
>         if (buffer_uptodate(first_bh))
>                 goto out;
> -       if (!buffer_locked(first_bh))
> -               ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &first_bh);
> +       bh_read_nowait(first_bh, REQ_META | REQ_PRIO);
>
>         dblock++;
>         extlen--;
> @@ -534,9 +533,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
>         while (extlen) {
>                 bh = gfs2_getbuf(gl, dblock, CREATE);
>
> -               if (!buffer_uptodate(bh) && !buffer_locked(bh))
> -                       ll_rw_block(REQ_OP_READ | REQ_RAHEAD | REQ_META |
> -                                   REQ_PRIO, 1, &bh);
> +               bh_readahead(bh, REQ_RAHEAD | REQ_META | REQ_PRIO);
>                 brelse(bh);
>                 dblock++;
>                 extlen--;
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index f201eaf59d0d..1ed17226d9ed 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -745,12 +745,8 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
>                 }
>                 if (PageUptodate(page))
>                         set_buffer_uptodate(bh);
> -               if (!buffer_uptodate(bh)) {
> -                       ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &bh);
> -                       wait_on_buffer(bh);
> -                       if (!buffer_uptodate(bh))
> -                               goto unlock_out;
> -               }
> +               if (bh_read(bh, REQ_META | REQ_PRIO) < 0)
> +                       goto unlock_out;
>                 if (gfs2_is_jdata(ip))
>                         gfs2_trans_add_data(ip->i_gl, bh);
>                 else
> --
> 2.31.1
>

Thanks for this fix; looking good.

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

Andreas

