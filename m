From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] reiserfs: bitmap: Assign array_size() to a variable
Date: Fri, 10 Jul 2020 16:25:31 -0500
Message-ID: <c62de6b5-a70d-4cfb-90ee-dbd7ad54c440@embeddedor.com>
References: <20200616184118.GA1917@embeddedor>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=s9e8j/XbEhGXPoz+/d0HZQwrpnEXHLKsoBFKj8A0bLE=; b=FY0ruNi4cBX8KJPYDNFKxM8kBw
        zrCVRcepO90cwWvBr74Ng9vx0hWbANi9zvWeIz0EHpguDy/6CEZsIicLi6w+58VI+jk1CdgYr5EQS
        nnJzKyuxGiIuvN3ugDpwuOmM9CTfVRCT1GcnvdRurq3emUVO/V9SIiW6zvxc2eu1kzoH4ueBDhag+
        ybYi2gSkA+Vx84r7Aj8abv+XMXYpEHENC/H/ZaWYQJqoGS4jQZHAi7TWoTHA3YM3C5PDCJcErxVmO
        uoh8nWhC/diY0ciNj49WdWBT8TJzyxv/Gr6iPTNnbKxIe8Lgtju1wsNZPzeRKjjUY+3abX9a0+HDO
        roxn 
In-Reply-To: <20200616184118.GA1917@embeddedor>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

Friendly ping: who can take this?

Thanks
--
Gustavo

On 6/16/20 13:41, Gustavo A. R. Silva wrote:
> Assign array_size() to variable _size_ and use it in both vmalloc()
> and memset(). These sorts of multiplication factors need to be wrapped
> in array_size().
> 
> This issue was found with the help of Coccinelle and, audited and fixed
> manually.
> 
> Addresses-KSPP-ID: https://github.com/KSPP/linux/issues/83
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  fs/reiserfs/bitmap.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
> index bf708ac287b4..3ca601893d2e 100644
> --- a/fs/reiserfs/bitmap.c
> +++ b/fs/reiserfs/bitmap.c
> @@ -1455,12 +1455,13 @@ int reiserfs_init_bitmap_cache(struct super_block *sb)
>  {
>  	struct reiserfs_bitmap_info *bitmap;
>  	unsigned int bmap_nr = reiserfs_bmap_count(sb);
> +	size_t size = array_size(bmap_nr, sizeof(*bitmap));
>  
> -	bitmap = vmalloc(array_size(bmap_nr, sizeof(*bitmap)));
> +	bitmap = vmalloc(size);
>  	if (bitmap == NULL)
>  		return -ENOMEM;
>  
> -	memset(bitmap, 0xff, sizeof(*bitmap) * bmap_nr);
> +	memset(bitmap, 0xff, size);
>  
>  	SB_AP_BITMAP(sb) = bitmap;
>  
> 
