From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Flushing like mad
Date: Fri, 19 Jul 2013 15:22:17 +0200
Message-ID: <51E93D89.8050801@gmail.com>
References: <51E82DF2.8030704@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=iK0eWts/z67F0QkyHrAhxlFZdzOpCgmG954tkNRbecg=;
        b=Fiiqdkt5FDcasQ0ibeobgtGxlAGPtVMZIJ06wzbQPNGraXOCN3ib85A1lGDKy5KWyY
         872G3lJIKXUDWjvEnx42MfB99R5RwwHQDQ1YAVHU/6tqiMR2bfbhiOz7hNJQ4VbeSUH5
         g2eKPqEI2BuEAQX6E6+5gA1bE9JlayjT38JBbYFb+b87ygJsyW3vrHvgnUozHQLhg04v
         AdJFAe2OQFES03MY7l2vSI3xaQkd2Tlk0Q22OGnoZ32zgJ6gXeY3+ThqsCbM2bVQnORW
         YEqjBsUa/3vLhECvxgYtty5SeSyTUjf3BnROC7kDxbydRDirOawXm62S5XnaUh59ngfh
         4hDw==
In-Reply-To: <51E82DF2.8030704@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Morgan Smith <moondog13@gmail.com>
Cc: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Hello.

Yes, it can happen, especially under high workload.
Also you may observe the warning: "search by key:
too many iterations", which has the similar nature.

If those warnings are sporadic, then simply ignore them.
We are not ready to get rid of them completely for now,
as in some cases it indicates data corruption (in this
case the warnings look like flood).

Thanks for report,
Edward.


On 07/18/2013 08:03 PM, Morgan Smith wrote:
> Good morning.
>
> I have a machine with a reiser4 formatted drive of redundant data on it.
> The data is accessed and modified daily as if it were a production
> machine except that nobody cares if the data is lost.
>
> I have noticed these warnings in the daily logs:
>
> Jul 14 06:37:08 logan kernel: reiser4[ktxnmgrd:sdb1:r(31883)]: commit_current_atom (fs/reiser4/txnmgr.c:1049)[nikita-3176]:
>
> Jul 14 06:37:08 logan kernel: WARNING: Flushing like mad: 16384
>
>
> This is even after a file system check with fsck.reiser4 1.0.8 which
> reported 0 issues. I don't seem to have any performance issues or data
> corruptions though I'd like to provide what information I can regarding
> this if it's of any concern. I believe the drive was formatted with the
> following options:
>
> create=reg40,hash=tea_hash,fibration=lexic_fibre,formatting=smart
>
>
> -- Morgan
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

