From: Evgeniy <iron.udjin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Tue, 17 Sep 2013 23:24:09 +0300
Message-ID: <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <5238B2FF.5060900@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=ZBGiiRhgsq4T05PlkBQSKLvncYo1g+MmlykuoA7A2s4=;
        b=d6YX19zMQg0KQxsr9Uv681zRGT1KqpEHbfAL1279RrDbPj41YrHYc+256sjEPtIQtY
         lKV2B6sMHPjMixEagY7WYi8T0ISDLKhi1aDCkOpc//4Ww2u/4i4HQiIu8JCE90c7EVXB
         fEH4OuAQzXzlcqzLtVGhSeAX4byLO/klbOROEEGTdzfxlINuP2zml8gFPv5PcLF9gHTM
         KlErcBMDCeetVplAaH761fE+GrSOJAVW2GpgkWWmxwdPhow3W4aA2OQFtJRGeRB+vn23
         Nw+ZvnNpDtuqx2z0yQLiaKnxCx6N8up75aIrMyOTtRxu1nkniy/JyO7DaO8VwoyMVbPp
         T9HQ==
In-Reply-To: <5238B2FF.5060900@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Mathieu Belanger <m@thieu.so>, reiserfs-devel@vger.kernel.org

Hello all,

I'm a active user of reiser4 filesystem. Currently I use it with LZO
compression for Magento cache store. Let me join in your small team of
testers of this beautiful fs :)

Regarding collaboration tool, I think the best idea to use GitHub.
It's the most user friendly IMHO.

Also I'd like to ask about reiser4 over soft raid0. If I have raid0
chunk size 4K, what is optimal cluster size of reiser4 fs?

P.S: It would be perfect to implement Snappy compression algo
https://code.google.com/p/snappy/. According to tests it has advantage
over LZO.

Thanks,

On 17 September 2013 22:52, Edward Shishkin <edward.shishkin@gmail.com> wrote:
> On 09/17/2013 08:15 PM, Mathieu Belanger wrote:
>>
>>
>> Hello,
>>
>> I made reiser4 for kernel 3.11-rc4 patchs some time ago and I did not
>> publish them due to a small issue I got with them and did not have time to
>> debug it.
>
>
>
> Yeah, it's a pity...
>
>
>
>>
>> I think it would be a good idea to have a GIT or any kind of work
>> collaboration tool so people don't redo what other people do on there side
>> but instead do it in a way so other can see and fix/improve it faster.
>>
>> I think that the best way would be to put the last vanilla patched with
>> reiser4 and work on it that way (so it's will be simple to simply generate
>> the reiser4 patch from the git + vanilla)
>
>
>
> It must be a good idea...
>
>
> Thanks,
> Edward.
>
>
>>
>> I can set it up tonight (will update my patch to the latest 3.11, instead
>> of rc4, in the same time).
>>
>> --
>> Mathieu Belanger
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
