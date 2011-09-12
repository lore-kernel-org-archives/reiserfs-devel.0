From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: What is the most likely next reiser4 patch, will it be for
 2.6.39x or 3.0.0x or something else ?
Date: Mon, 12 Sep 2011 14:15:59 +0200
Message-ID: <CAAFfQUWbi_6gq7iBW2Z3_Y8dP6LiK_b=Y+nZscRc_FS1Xp2DcA@mail.gmail.com>
References: <1626b065834d22009b37bd503f73385d@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=QCnuoL46PzAYzXl0dqM4L1llblP1kO+AFJUJkiDwIiI=;
        b=O6N5ueA7bzAuNFjjq4sx/V19HxWSVMLHMSM0WjqH4SiIVWTwUkAp5eBgEIGQUWPlhN
         61CoKF409MI7raGwZN5m3C8xe17EaUCXxfYiNh7eDEj+OEefwnIvfY21FxxvLAusEwC/
         NVo1hWpwuB4eZtvw8fIksYEC4IjnDzUk5N9Os=
In-Reply-To: <1626b065834d22009b37bd503f73385d@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: doiggl@velocitynet.com.au
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Mon, Sep 12, 2011 at 3:51 AM,  <doiggl@velocitynet.com.au> wrote:
> Hello,
> I have a question for Edward Shishkin
> What is the most likely next reiser4 patch, will it be for 2.6.39x or
> 3.0.0x or something else ?
>


I do have the stuff against .39, and, I guess, it also works for 3.0
However an old bug still takes place, which has become rather
annoying after pdflush has been removed in .30

The common idea is that I wouldn't like to put buggy stuff for
public needs.

Thanks,
Edward.


> The reason I ask is, so I can setup a compile environment setup using=
 this
> type of envionment[1]
> [1]https://build.opensuse.org/package/show?package=3Dkernel-reiser4&p=
roject=3Dhome%3Adoiggl
>
> Thanks Glenn
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
