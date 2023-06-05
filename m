From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiserfs: Check the return value from __getblk()
Date: Mon, 5 Jun 2023 17:37:07 +0200
Message-ID: <4914c932-6d9a-a6a5-e98a-b1ded947f5d6@gmail.com>
References: <20230605142335.2883264-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685979430; x=1688571430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Awfq8Xd+Z8kj5FwpCW1Z2TUbRd0RoPOUoRNrdS9suN8=;
        b=bxszVkssWdtYm1AsrrdIDbqntiRPUns/ojupu2RlTEfMsxnH9Hh7aL4rZ9dbTq7dfJ
         YFIrA9QKG2ld4hbamvi8bRILOrkfRhs67kPfzEBE39+TPLA6Edod4GFm+GlArgD559SJ
         +K+CwxFuvxZ7tdK3z1JWZpx9mSP6cQ3Qe/9YKIckI+9jhFaDTEgXA6bqNedV4cO3dSDl
         /U/x5lX1bvu3rPMDk0LucnJONa9Nl76seBSzCRmzsMVf8cAiTi8vlMF3o80siE/4Elnb
         ZaKF1cIyCc+n4p/qMcb9UTKASJaFEIPWGVb3vAote4vc7ik8Mm9SpAC3mDZ0kZHVYUuI
         5PUg==
Content-Language: en-US
In-Reply-To: <20230605142335.2883264-1-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, reiserfs-devel@vger.kernel.org
Cc: butt3rflyh4ck <butterflyhuangxx@gmail.com>



On 6/5/23 16:23, Matthew Wilcox (Oracle) wrote:
> __getblk() can return a NULL pointer if we run out of memory or if
> we try to access beyond the end of the device; check it and handle it
> appropriately.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Link: https://lore.kernel.org/lkml/CAFcO6XOacq3hscbXevPQP7sXRoYFz34ZdKPYjmd6k5sZuhGFDw@mail.gmail.com/
> Tested-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") # probably introduced in 2002
> ---
>   fs/reiserfs/journal.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 4d11d60f493c..dd58e0dca5e5 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -2326,7 +2326,7 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
>   	int i, j;
>   
>   	bh = __getblk(dev, block, bufsize);
> -	if (buffer_uptodate(bh))
> +	if (!bh || buffer_uptodate(bh))
>   		return (bh);
>   
>   	if (block + BUFNR > max_block) {
> @@ -2336,6 +2336,8 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
>   	j = 1;
>   	for (i = 1; i < blocks; i++) {
>   		bh = __getblk(dev, block + i, bufsize);
> +		if (!bh)
> +			break;
>   		if (buffer_uptodate(bh)) {
>   			brelse(bh);
>   			break;

Acked-by: Edward Shishkin <edward.shishkin@gmail.com>
