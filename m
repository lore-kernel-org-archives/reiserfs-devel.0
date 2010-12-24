From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiserfs: Make sure va_end() is always called after va_start().
Date: Fri, 24 Dec 2010 23:22:11 +0100
Message-ID: <4D151D13.4060802@gmail.com>
References: <alpine.LNX.2.00.1012241933390.28973@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=/BwQhrbTgxKTxYn0ixfiKpCy103PXz6d7cCn9o591j8=;
        b=K4XKN34V/+PSJXTWu/KfYQdD7Nl9Ve8Py19oF4w4nWV1iF+6VXC+S3KZESqqnesJ2a
         sYIHqI7WUYYdTZDeDZs19zapshfAfFzrNLVThnddE45wXMElRay1sZHofTGi8Ca42sOu
         BAKiAOXlRTpC0PcdWVv/0zK76w4Pvdc84/KVs=
In-Reply-To: <alpine.LNX.2.00.1012241933390.28973@swampdragon.chaosbits.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jesper Juhl <jj@chaosbits.net>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Jesper Juhl wrote:
> Greetings,
>
> A call to va_start() must always be followed by a call to va_end() in the 
> same function. In fs/reiserfs/prints.c::print_block() this is not always 
> the case. If 'bh' is NULL we'll return without calling va_end().
> One could add a call to va_end() before the 'return' statement, but it's 
> nicer to just move the call to va_start() after the test for 'bh' being 
> NULL.
>
> Signed-off-by: Jesper Juhl <jj@chaosbits.net>
>   

Acked-by: Edward Shishkin <edward.shishkin@gmail.com>

> ---
>  prints.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
> index adbc6f5..45de98b 100644
> --- a/fs/reiserfs/prints.c
> +++ b/fs/reiserfs/prints.c
> @@ -586,13 +586,13 @@ void print_block(struct buffer_head *bh, ...)	//int print_mode, int first, int l
>  	va_list args;
>  	int mode, first, last;
>  
> -	va_start(args, bh);
> -
>  	if (!bh) {
>  		printk("print_block: buffer is NULL\n");
>  		return;
>  	}
>  
> +	va_start(args, bh);
> +
>  	mode = va_arg(args, int);
>  	first = va_arg(args, int);
>  	last = va_arg(args, int);
>
>
>
>   

