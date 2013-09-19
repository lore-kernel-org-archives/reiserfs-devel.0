From: Christopher Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 18:16:04 +0000
Message-ID: <CABYXC3ZgJR=KnOoKJJBHfw-ghqer6V2dMp3ktVV7RConVvN6vg@mail.gmail.com>
References: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so> <20130919155519.Horde.ECPL8bqkTU-l0OG4BvsgnA1@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=nHewAnMPcfG8av2soPGx/id3c02p1EQZMk0cYovWFWk=;
        b=b07sfezmn5bghSMY2QeX3DpYGlWWyZgKmGkygv9UYz9tmo1paOiC+v3PZLJNAA9Sxg
         soY1qGv4xtvoC3QN0rA0gYbCVIcZqysLx9m78/LV4unGsTSKt6H57+HFgU6O+8vU1vsL
         MCjQu07nhJHVx/kzgr5khgj+1DgDt9ownQsRfb2Z8yW00LQitnslLt4/ydzXDqbQUcNf
         7xFa1Oq9BosPX6JGWVRiCYT0GeYuMXuFl+XaLAC3c4qBPNwxjm9ZDkuJfDIopX9dSL9K
         5JERgMrlRpYXVh4i7aNH/+hfK2WtFctGA1sLaJwAkXrgkaHbLYCjfRrpNUbo70+qWxMW
         eYbQ==
In-Reply-To: <20130919155519.Horde.ECPL8bqkTU-l0OG4BvsgnA1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Belanger <m@thieu.so>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Du?an ?oli? <dusanc@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Good show friend, works!
Had trouble with NVidia drivers but that has nothing to do with you or
your patch, it's the kernel itself being updated.
Found the patch, all is well!

Typing this on your patched 3.12-rc4 Reiser4 kernel w/BLD, kernel gcc
famlies patch, and UKSM patch applied.
Tried on vanilla, works obviously on that too.


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
