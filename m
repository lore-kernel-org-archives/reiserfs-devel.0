From: Christopher Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 16:21:04 +0000
Message-ID: <CABYXC3ahREZe3ZxhphULa-W_+w1Ww5dXGvEU9DOBWWpL-Nqt0g@mail.gmail.com>
References: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so> <20130919155519.Horde.ECPL8bqkTU-l0OG4BvsgnA1@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Nes7CYgjh4NxJ6FtMhUf0TwttOCzKIHaiwKJ6+iG8Vc=;
        b=hhr70J4Mh+laeJ3yAFcXbOERlWhE92U89yjCcR0D/53728BqBWZdCIHggX3kmPV0uR
         9FSg0nu7caMOo/Nzs6hQ8xPcY1gTdkMuTXqVPJLcwPJcF+9jDjgt7yS6H4QkkVla0/SY
         0lYDXEa0yrXnGvQiSs6D38oTkP0Pq3Afn9ynkWBUTiEhGuFOWgaMWTfkVsw1hoiPG6ZK
         PciM2JyHZLrOReEulIAMG3qVDMG5aQDcX6Ia0ss5YL91/KHqQacuGlJEaqP+Zx08u9Ts
         06/V7VDYBKaxkAq+s54RIqDGZzp93wK66csgTgiA7IUBFlUqdDjvjpoXcmyA+P1wMZDu
         tNHg==
In-Reply-To: <20130919155519.Horde.ECPL8bqkTU-l0OG4BvsgnA1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Belanger <m@thieu.so>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Du?an ?oli? <dusanc@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

BINGO!
Compiles just fine..
Vanilla (i redownloaded your whole tree just to make sure).
Going to apply my standard patches now minus the CK1 BFS (doesn't work
on 3.12 yet) and see what happens but I expect no issues will let you
know when I'm booted into 3.12 on my rootfs :)

Thanks for doing that!
You guys are making tons of great headway congrats!

Chris


On Thu, Sep 19, 2013 at 3:55 PM, Mathieu Belanger <m@thieu.so> wrote:
>
> I have updated 3.12-rc1 in git. It compile and should work.
>
> Note that the shrinker API is gone so the code need to be adapted.
>
> Until that, I reverted the kill shrinker API patch to make it work.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
