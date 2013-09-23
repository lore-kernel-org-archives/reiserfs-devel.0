From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Issue in my API re-implementation in my kernel 3.11
Date: Mon, 23 Sep 2013 13:17:48 +0200
Message-ID: <5240235C.9090903@gmail.com>
References: <20130921031821.Horde.7huC_KAbvhnsxkwHkVoEVg2@mail.thieu.so> <CABYXC3a+Mg1iZiFH3x-RCFbKweG2KyoTbPMa49-4212SzKMdww@mail.gmail.com> <52401F7C.2040309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=ASt2JFD6fOYoL9NaFNrbYbObqI/ziBKZydYyE/SaUS4=;
        b=j2/TBzCYeOJXpWLU57sEwBSDWhEzzwsIVh2xUv3K9QBd4pDiIxS0/lHeRjqece1F7+
         5x7CRG6ZPgwiSg32n+O07zRNCDCFXUdnAmLnBglaud6dNhTnDflS3vAQ2mgul4TUG1xu
         zWAvt9/lY2SeKtdC2xX55Nd9gNlileZrLM7gwO01qXc43/oKxwT8T7LDwH28gfL+6R6Y
         /Yx6jtsalVXK9azqd648yWy1nc9TRihQ3grSMmcWoMgVnrwp/IxIWoFYjd4gAwDGYaKn
         YEgU07m1r0o6yrZg+asEqbpyNHz+/zu2OetMoopX9oPxouilhjOdd5SfhHzS2oC8J4MM
         ol3A==
In-Reply-To: <52401F7C.2040309@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Chris Gentile <cnjgentile@gmail.com>
Cc: Mathieu Belanger <m@thieu.so>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

23.09.2013 13:01, Chris Gentile =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Mathieu et, all ,
>
> Fixes seemed to have fixed the corruption issue thus far. Re-emerging
> 1000+ packages on Gentoo (tons of small reads/writes on SSD) with no
> problems yet. Also, just downloaded the Linux-next patch from this
> morning
> (https://www.kernel.org/pub/linux/kernel/next/patch-v3.12-rc1-next-20=
130923.xz)
> and applied on top of your Reiser4-for-3.12-rc1 branch recompiled
> re-installed NVidia (thanks for fixing that btw!) and resuming compil=
ing
> as we speak. Going strong still and fast.
>
> Not sure if it makes much difference but I use no compression just
> mkfs.reiser4 -o formatting=3Dsmart on SSD drives.


Which version of mkfs (mkfs.reiser4 --version)?
In 1.0.8 compression is enabled by default.


>
> Are there any special options I should be using on SSD arrays?
>
> Addressing the compression angle, does formatting an array with one o=
f
> the compression options (lzo perhaps?) have significant overhead?


What overhead do you mean?


> Storage space is not a concern however if there is very little overhe=
ad
> I'd like to backup my data and do some benchmarking.  Please advise a=
t
> your convenience.
>
>
> Thanks again,
> Chris
>
> On 09/21/13 19:53, Christopher Gentile wrote:
>> I've experienced corruption in the 3.12-rc1 on the git tree and just
>> did a fsck.reiser4 --build-fs. Also re-downloaded the tree and
>> recompiled as it looks like you've made changes I'll keep you posted=
=2E
>>
>>
>>
>> On Sat, Sep 21, 2013 at 3:18 AM, Mathieu Belanger <m@thieu.so> wrote=
:
>>> In my kernel 3.11 on my git, I have re-implemented an API because I=
 did not
>>> know how to port the reiser4 to the new API (readdir -> iterate).
>>>
>>> I did not get any problem with reiser4 or reiserfs -but- after inst=
alling
>>> the 3.12-rc1 kernel and rebooting, the kernel was missing and the g=
rub.conf
>>> was total garbage. The /boot is EXT2 on my system.
>>>
>>> readdir is for reading dir mostly, I don't know if it's the cause o=
f the
>>> corruption or if it did not sync properly but still, if you want to=
 play
>>> with a ext2 partition and you use the kernel 3.11 from my git, rebo=
ot to
>>> another kernel before, just as precaution.
>>>
>>> The kernel 3.12-rc1 is not affected if it's because of that readdir=
 API
>>> reimplementation because it's based on the Ivan port + shrinker new=
 API
>>> patchs for reiser4.
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe reiserfs-=
devel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
