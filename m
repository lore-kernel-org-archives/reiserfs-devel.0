From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 1/3] reiser4: fix filesystem init error path.
Date: Mon, 14 Sep 2015 09:51:02 +0200
Message-ID: <55F67C66.9050204@gmail.com>
References: <1442185720-25185-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=BVulBX9XV3lXnpGteWeWJsKUGcu8ZNnvwMc3ZkYnH90=;
        b=E0t77XANVwqqAnC+F+z8yT7bhhf+yNkSFX51lVXWRltW9LFzM86ZOU6gXsS6JUAHqg
         c2WrVWv060fx16CwkXLEc8Ke85hRUe1gU9wmWwga88VJkycMxrKzRYpgFUo4PAAFtl9C
         6jmoXlzgyTj44hCwfDZbkIRmngAD0HxxavsZHpRC8s75jUBOhXWWLlO3NDxqwZ2/YJ36
         IcVBQYykGvRFV04618HnOM53fvKij4kzmrp+y0nLbogQaHFi7Aly4RQttejv6ovZjo0h
         goSAQ7D8IAMMtQ2XUL/D6MmO56Jzy82konhnKdrOPm9mIY4AV0Pr/crj2dyCtj4XYTzV
         rzxg==
In-Reply-To: <1442185720-25185-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

OK

On 09/14/2015 01:08 AM, Ivan Shapovalov wrote:
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/super_ops.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
> index 76c16af..2afaf3b 100644
> --- a/fs/reiser4/super_ops.c
> +++ b/fs/reiser4/super_ops.c
> @@ -623,9 +623,9 @@ static int fill_super(struct super_block *super, void *data, int silent)
>   	reiser4_done_txnmgr(&sbinfo->tmgr);
>    failed_init_read_super:
>    failed_init_super_data:
> + failed_init_csum_tfm:
>   	reiser4_done_fs_info(super);
>    failed_init_sinfo:
> - failed_init_csum_tfm:
>   	reiser4_exit_context(&ctx);
>   	return result;
>   }

