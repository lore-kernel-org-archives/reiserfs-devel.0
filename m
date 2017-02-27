From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: BUG during a backup (sequentially reading the whole fs)
 on 4.9
Date: Mon, 27 Feb 2017 17:30:58 +0100
Message-ID: <4a88640c-8d98-1cc0-5713-3abd76abf208@gmail.com>
References: <1488211296.5395.2.camel@intelfx.name>
 <f7c80f08-6e89-226b-7914-54d2385aa834@gmail.com>
 <1488212421.5395.3.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=RHN9bEuAp9z24Vec707q/5ApvQq6M+cCZIJ9NzfwOTo=;
        b=E3Tw5B5Un/s/RrcegFnQKkVeafJ/NyJDH8o6dVAq2rHc0Ot6ahecSVX/RpvlkTZLlg
         M97uXMx958KIEdJn0+7wZAmPIWdCL+hFCvTHLVTH9JKTrJXPHpdKLFGuWm3esdw6Ebuu
         oBre2UFWRj6Ye32rOwaBmy3oraHLK36SHAd5nmm1TSEvUI8PvH3waNOekLQAOhFBd8bb
         Bf858mg+j9fqx+R0A+hvNl807dJ8MgNKAHBEN51DtXPDaG8vOMSWqJnGVL9fU+LeNoa6
         EryRCNUFxwHVRPPHYPOF8AFQiZy+O5zCJ61XityxbBrLSwp8BLIUj+AUEWmvIcouDi9/
         6I4A==
In-Reply-To: <1488212421.5395.3.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Please, check your partition with fsck (repair if damaged).
Then build the kernel with the following patch applied: 
9eca07b7b992724446d5e7327c86bb0bf1f20a41
Let me know, if the oops appears again.

Thanks,
Edward.

On 02/27/2017 05:20 PM, Ivan Shapovalov wrote:
> I'm on this one:
>
> commit 40d2771c607aab3817f21c394ae39e3fba11aa2f
> Author: Edward Shishkin <edward.shishkin@gmail.com>
> Date:   Thu Jan 26 13:16:39 2017 +0100
>
>      Reiser4: use vmalloc instead of kmalloc to alloacte zhash table
>
>      Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
>

