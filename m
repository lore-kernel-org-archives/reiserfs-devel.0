From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 as a module
Date: Fri, 22 Oct 2010 12:30:40 +0200
Message-ID: <4CC167D0.1050502@gmail.com>
References: <AANLkTi=o5bXDxY4XKSYzcX9fX4yHZRC68=oMk0sikViS@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=s4ByKcT+kNlFz1RrfKigREV6NLwa9ZgG2o70vZOoKsA=;
        b=IOhFY+lvwiJXNo8AmVRtAuUtbHGxxxs65MR4C+lfWw7EspVFJiMxIRJvj2ougkF3/c
         Oe8jq851qZvIGyhZwCUogxBz7GlU3QcOs3pqkBluAutCcqmPIEYMLP9bqKGzfllL5gK7
         V4pZvt/e7e+5uJIojH0D+0n80g/kb1037+kL0=
In-Reply-To: <AANLkTi=o5bXDxY4XKSYzcX9fX4yHZRC68=oMk0sikViS@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viji V Nair <viji@fedoraproject.org>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Viji V Nair wrote:
> Hi,
>
>   

Hello.

> I have been trying to build reiser4 as a module, but the module which
> is getting compiled having the "symbol" issue.
>
> <snip>
> reiser4: Unknown symbol lzo1x_1_compress
> reiser4: Unknown symbol might_fault
> reiser4: Unknown symbol mutex_lock_nested
> reiser4: Unknown symbol zlib_deflate
> reiser4: Unknown symbol writeback_inodes_wbc
> </snip>
>   


How to reproduce?
What stuff are you using?

Thanks,
Edward.

> I could see from the reiser4 2.6.34 patch that it is adding
> "EXPORT_SYMBOL" to few files in fs & mm directories of the kernel
> source tree. Can we have all these symbols defined in the core source
> tree of resier4 also? Do we have a patch for this already?
>
> Thanks
> Viji
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

