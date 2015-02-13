From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: discard: handle incomplete erase units at
 the end of a partition.
Date: Fri, 13 Feb 2015 10:05:16 +0100
Message-ID: <54DDBE4C.3080202@gmail.com>
References: <1423803778-19698-1-git-send-email-intelfx100@gmail.com> <1423803778-19698-4-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=C6H/iMH/3BAUxOykgnjBUQfA6sYMdv6wKSiwKNpHP68=;
        b=m+2D/E/2ehPQDUfrk0tLalrTBBx4+b9Esv5SzQNMSforRxP4ETTorOfiW1ZJgLznvp
         mPIqn3eHyPJTlio0jb8SqyLm/SoOIkmU4Xzvk+dwBp6aodta9cszTr2633NO/abih915
         M0H/MjqrpGHtLG7k4eYDJQkTrU5F5UAA1VO9c16VW0afv7L06Yfp5+qVd09eVjeEoKmo
         GtfcNlKew9cZgF1R5p59sAz4Ia5Ea94cspgP4rf3v0tmWe138j+ry5NWXELoCtyYLUXy
         Z/3wsBQAKOf5l0LHhqWjdmbbwB9KYE+DldlFPv4wet1k2pb/4qX/noj2Kbf9dVpZ6vmY
         Wmzw==
In-Reply-To: <1423803778-19698-4-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

Ok.

On 02/13/2015 06:02 AM, Ivan Shapovalov wrote:
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/discard.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
> index 10c1707..6163ea2 100644
> --- a/fs/reiser4/discard.c
> +++ b/fs/reiser4/discard.c
> @@ -542,7 +542,8 @@ static int discard_precise_extents(struct list_head *head)
>   					last_padding_end = end;
>   					last_padding_clean = 1;
>   
> -				} else if (try_allocate_blocks(end, tailp)) {
> +				} else if (end + tailp <= reiser4_block_count(sb) &&
> +					   try_allocate_blocks(end, tailp)) {
>   					/*
>   					 * tail padding is clean,
>   					 * pad the tail

