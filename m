From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 WARNING: discard atom failed (-95)
Date: Fri, 18 Sep 2015 17:15:46 +0200
Message-ID: <55FC2AA2.5040707@gmail.com>
References: <55FC21EF.6000804@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=UNxfI8/6CaZOjgb1pwWEGpE1R+tLwoA8QNviBLdf7Es=;
        b=z3eZip5JJg64WL0D+/ggBucstGMnun0Hn5IMcYSjuhQIRIVknxRpmaLofcOTF93HwV
         Dd6WpK+aApAX6nYu2lAcCZq67BwAQozH2JA5fxKAG5bYHBLqb2fOUK5Sod530Jse7eQY
         0UO3Xhx0/wEEcUntBx2zlH9McyoXQzYgcsjoWY8qphVTQw2b+lJgaUgpNS//mXzB7qO2
         p+aGb49XRIZWRX2pZWAdtSTWvLqF6KbMl42KfH9e53OLOquRMmSoI1O6RIr1LIJBy/cT
         h+g+LZm45fIA+5m2IMEJW6XUiB/EhdfJEpU20wvDcpYFrSyiuZYA/IydlwZs5M42LlQv
         ImdA==
In-Reply-To: <55FC21EF.6000804@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gleb Baryshev <gleb.baryshev@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi Gleb,

It means that your sdb1 doesn't support TRIM command.
sdb1 is virtual device, correct?

Edward.


On 09/18/2015 04:38 PM, Gleb Baryshev wrote:
> Hi,
>
> I'm trying out reiser4 discard feature (openSUSE with doiggl's package 
> under VirtualBox) and getting this repeated warning. So I'd like to 
> know if it is a known issue and how serious it is.
>
>
> [  667.619577] Loading Reiser4 (format release: 4.0.1) See 
> www.namesys.com for a description of Reiser4.
> [  667.621406] reiser4: sdb1: found disk format 4.0.1.
> [  667.658860] reiser4: sdb1: using Hybrid Transaction Model.
> ...
> [  687.278657] reiser4[kcminit_startup(1503)]: 
> reiser4_post_write_back_hook 
> (../fs/reiser4/block_alloc.c:1153)[intelfx-8]:
>                WARNING: discard atom failed (-95)
> [  687.284161] reiser4[kcminit_startup(1503)]: 
> reiser4_post_write_back_hook 
> (../fs/reiser4/block_alloc.c:1153)[intelfx-8]:
>                WARNING: discard atom failed (-95)
> [  687.329700] reiser4[kcminit_startup(1503)]: 
> reiser4_post_write_back_hook 
> (../fs/reiser4/block_alloc.c:1153)[intelfx-8]:
>                WARNING: discard atom failed (-95)
> [  687.338194] reiser4[kcminit_startup(1503)]: 
> reiser4_post_write_back_hook 
> (../fs/reiser4/block_alloc.c:1153)[intelfx-8]:
>                WARNING: discard atom failed (-95)
>
>
> Linux version: 4.1.6
> Format options: create=ccreg40,compress=gzip1
> Mount options: noatime,onerror=remount-ro,discard
>
>
> Best regards,
> Gleb

