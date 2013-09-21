From: Christopher Gentile <cnjgentile@gmail.com>
Subject: Re: Issue in my API re-implementation in my kernel 3.11
Date: Sat, 21 Sep 2013 19:53:40 +0000
Message-ID: <CABYXC3a+Mg1iZiFH3x-RCFbKweG2KyoTbPMa49-4212SzKMdww@mail.gmail.com>
References: <20130921031821.Horde.7huC_KAbvhnsxkwHkVoEVg2@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=qnsv5znZ0WxmXzt2ueUGWMlu9CTP7k2vUtcvfRojKdk=;
        b=NwqhGY35ZyyEKOdnw/qWtg2xya6ah/jhGAY1EchmuX+oXGOvipejuCQZ4NVB9T68Jw
         UckJdc7Ca41rcPcXvrf9UTQ8ISm3CusBhZKoE77GqOyNzkOe4KSBQ1ivkMT9j+2lXV2K
         DFrB/wXF/e7E3/pU1auihaNEO2dLDs02TV4QD9oMoy+gQvaqUUj4sA4rOSLGcWZ0DaeS
         gZ73YlYgXwR1Dgn5kJetfG4uLCszrQl0FXPBWXOnquTmQccyLm3Yjc7rm4XsYFwzanp1
         8XorsEgmo9911xHsSZAujIR8rZuWya5LmbIFIv73QY31grLPlykexCsIgNFWeFamZSg9
         0f3g==
In-Reply-To: <20130921031821.Horde.7huC_KAbvhnsxkwHkVoEVg2@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Belanger <m@thieu.so>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

I've experienced corruption in the 3.12-rc1 on the git tree and just
did a fsck.reiser4 --build-fs. Also re-downloaded the tree and
recompiled as it looks like you've made changes I'll keep you posted.



On Sat, Sep 21, 2013 at 3:18 AM, Mathieu Belanger <m@thieu.so> wrote:
> In my kernel 3.11 on my git, I have re-implemented an API because I did not
> know how to port the reiser4 to the new API (readdir -> iterate).
>
> I did not get any problem with reiser4 or reiserfs -but- after installing
> the 3.12-rc1 kernel and rebooting, the kernel was missing and the grub.conf
> was total garbage. The /boot is EXT2 on my system.
>
> readdir is for reading dir mostly, I don't know if it's the cause of the
> corruption or if it did not sync properly but still, if you want to play
> with a ext2 partition and you use the kernel 3.11 from my git, reboot to
> another kernel before, just as precaution.
>
> The kernel 3.12-rc1 is not affected if it's because of that readdir API
> reimplementation because it's based on the Ivan port + shrinker new API
> patchs for reiser4.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
