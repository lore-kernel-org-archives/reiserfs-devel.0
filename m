From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv2 0/5] reiser4: discard support: initial implementation.
Date: Tue, 06 May 2014 18:43:52 +0200
Message-ID: <53691148.6060405@gmail.com>
References: <1399354223-5334-1-git-send-email-intelfx100@gmail.com> <CADW=+3=B7aNyBdKwhHS_r8bMO+ZrjK5WNbdEXVXfGvRP7KQK-g@mail.gmail.com> <4205015.az6QQplYXK@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=5JvS/I370WryZokhqkIboQw/zSH3XZNtu+rPlmnB0i0=;
        b=n+AeAAZpEzpHzWaftPtisU+YIuwks18ZmyYrt+kXMd7l62JlX4yck4pHG6NJeaWv/n
         grrXRsy4AD0i6NpkSW/iE4mv2DXM1ZO8cfdpdWA/yCIyb9poVnaHnQhCT1yLpScCbAOQ
         bT1bumuvxnT5TsULEDHcVEQN7MSdoQKlA0ogqhcbAU4kC0N8vBgExJg4mRxc9YEWesm6
         cA20hr1uUMNy8J1Skbk+aybDz3r3r367v7OxAbnuffcSkz4IdwCbiwpJJIT1MV/bNmcs
         VWFoXlH/tl8tJQWk5K4zVUJlQsP7K2Lm6lfoEZcXKTL5SHRocZjk9oOI2ofo3JeNYcn5
         t5SQ==
In-Reply-To: <4205015.az6QQplYXK@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 05/06/2014 11:56 AM, Ivan Shapovalov wrote:
> Hi Du=C5=A1an,
>
> On Tuesday 06 May 2014 at 09:09:12, Du=C5=A1an =C4=8Coli=C4=87 wrote:=
=09
>> What about trim performance penalty? AFAIK all devices that are belo=
w
>> SATA3.1 have pretty long time to execute discard command so if we ex=
ecute
>> discard at every commit time we could make large stalls to the syste=
m. Can
>> we batch them
> This is already happening. Other filesystems issue discard requests d=
irectly
> when blocks are deallocated, once per each extent. We delay them unti=
l a
> transaction is committed, in hope to be able to merge small extents i=
nto large
> ones and issue a lesser count of discard requests.


I would also add that discard extents issued by reiser4 are of the best
quality, because we maintain 2 exemplars of bitmap. Allocation always
happens on the base of working bitmap, where discard extents are still
marked as busy. So we don't "spoil" them..

Edward.


> Any penalties remaining with this approach are inherent; if one can't=
 tolerate
> these, they just should not use "realtime" TRIM, i. e. not pass 'disc=
ard'
> mount option.
>
> There is other way around: fstrim utility and FITRIM ioctl, which tel=
ls
> filesystem to do a "cleaning sweep" and discard every free block at o=
nce. This
> is to be implemented shortly.
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
