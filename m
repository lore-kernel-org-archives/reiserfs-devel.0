From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Sat, 28 Sep 2013 14:22:05 -0400
Message-ID: <52471E4D.8090705@gmail.com>
References: <20130928162059.Horde.e5qchgOzKFDhZg1LolArqA2@mail.thieu.so> <52471524.2050602@gmail.com> <20130928174954.Horde.5eBFCXLtsWAtF9zNtt95nQ1@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=buMne/7D76GenY2sHjiGHeKDSWBnsYA+GZhPLBcIaBs=;
        b=IcjYqsaSS5DKoeYC7ocDKJkDsCkKUaK83oJvhYFvgdO/CXXyGlNhpBZIfOSUEtZtUH
         of4ULKhzqFSgI+SeXCzBBBCsfchji+jtMgZo8O56q84jJRp6tMZHGpysYQ1jg02WTFEZ
         LA/ENWy5OU/OnCHko01br0MOrjrpdyiFft2pZmPll+UIMTF2Iw8kQhutnMFNuRJQRg1P
         tLWJ6fBOQdWQHYqqPpWD8BTdbm6lv1hSOKxdSRe0yAnreqeYZpoDeVDIEQg1ziYCnQbi
         8ek25ytHdukrpyVitJ4HHN73DONr1YNA7ziiYI/tp8CYTn4FaiUA74g60HDtOlf7dKBU
         KkFA==
In-Reply-To: <20130928174954.Horde.5eBFCXLtsWAtF9zNtt95nQ1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Belanger <m@thieu.so>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

I believe you I probably just messed it up. I git-stupid believe me, a
skill I know I need to work on .
Thanks for attaching!


Chris
On 09/28/13 13:49, Mathieu Belanger wrote:
> Minotron-01 reiser4 # git diff v3.12-rc2 reiser4-for-3.12-rc2 >
> /tmp/patch.patch
> Minotron-01 reiser4 # ls /tmp/patch.patch -l
> -rw-r--r-- 1 root root 2391883 Sep 28 12:45 /tmp/patch.patch
>
> It work.. weird.. And it's the correct way to extract the patch.
>
> I attached the patch.
>

