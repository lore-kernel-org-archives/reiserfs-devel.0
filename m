From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Tue, 17 Sep 2013 21:22:46 +0000
Message-ID: <5238C826.9030202@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com> <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com> <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=FquDv9opIlE/i2UeH1Luog1KXV1ZKQShAPYo3j4kntA=;
        b=nSMHz9Ql9seEynCGOovsmgtSDmOcZ3yrgP8nSmWcsHu0W3Bvt6PX+2Pg/Uza5QrjFC
         e36rwM5VjvEH4igHug2ps7igwLIRPkV64V8IjlA1eTO7ihUgIEKd0PSIZmOj+dtZrwYW
         pdO8URb8aWXJsHa5vYaoP7hVVj7cPfLY/PSryZMK+I0fKPRpHSiUVY+JMgSlhiuk7dap
         mb4Z8AqODnj95WPCsqfrNy/tUfXmCUQl+k/dZXXKBhT0JQuau6Xo8bF4O6L5Pxbzyrpu
         ClqwcA7olKOUYdDUWLBHGoCXZDpmXXLlXrthoZnvr37Df5rr9pHwEKkjpXHzws36fEic
         +BuA==
In-Reply-To: <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Belanger <m@thieu.so>
Cc: Evgeniy <iron.udjin@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

Matt,  thanks a bunch I will try in the short.

Best,
Chris


On 09/17/2013 09:15 PM, Mathieu Belanger wrote:
> Uploading to my GIT
>
> I have cloned the kernel and added a branch reiser4-for-3.11-rc4..
> Should pop there once it's uploaded  (will take a while as it's fresh
> and the kernel git origin is big and uploading at +-100KiB/s.
>
> https://github.com/DestroyFX/reiser4/branches
>
> I fixed the .for_sync stupidity I have done initially... might work ok
> and DON'T try on anything that have stuff that you want to keep ;)
>
> PS : I did not reboot/test after re-adding .for_sync.

