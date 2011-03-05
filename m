From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Re2: linux-2.6.37 crash reproduced - here is a screenshot
Date: Sat, 05 Mar 2011 23:44:27 +0100
Message-ID: <4D72BCCB.9000206@gmail.com>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D7161F7.2754.6FF32@jafojtik.seznam.cz>, <4D716E9F.8090902@gmail.com> <4D7214C2.30303.1B55FC@jafojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=O8JpQu5zR3ppSnZCtDojdJvH/A6bLnuMZzswsEHCFl4=;
        b=kpE+xXQ2IZe6vsnpr6iqnCaDbl1Xglu9xoElIPdakaK+eiIvecsIKVJXLD3jcuBzMY
         X5PgVk+1rnoKaN3wrBA/X1/vsXMYoHJmhhmhjmispXrxW/CGvZfmqtxs6S6Vam1aJbVO
         9Hzr48IZ/YmiNFPFIyExWaNuZjZjcmzGSISlw=
In-Reply-To: <4D7214C2.30303.1B55FC@jafojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jaroslav Fojtik <jafojtik@seznam.cz>
Cc: reiserfs-devel@vger.kernel.org

On 03/05/2011 11:47 AM, Jaroslav Fojtik wrote:
> Dear Edward Shishkin,
>
>> I don't see any reiser4 bits in the stacktrace.
> It might be scrolled down.
>
> I am sending two new hang reports.

I afraid that all useful information remained out of the screen ;(

Edward.

>
>
>> Could you please try to reproduce it without
>> reiser4? Report about results.
> I could try it, but reformating partition on test disk and fill it with
> graphics magick mirror spends around 8 hours. Fortunatelly this process
> is automatical and could run during night.
>
>
> Linux-2.6.32 is very stable. I have never experimented with other releases.
>
> regards
>    Jara
>
>
>
>
>> Thanks,
>> Edward
>>
>>
>>>
>>> best regards
>>>      Jara
>>>
>>>
>>>> On 03/04/2011 12:24 AM, Jaroslav Fojtik wrote:
>>>>> Dear Edward Shishkin,
>>>>>
>>>>>> Great.
>>>>>
>>>>> Sorry, after several attempts I managed to crash Linux even with kernel
>>>>> linux-2.6.37. No trace in log, system completely frozen and beeper
>>>>> sounded.
>>>>>
>>>>> It takes several hours to transfer 400 Gigabyte test data and create
>>>>> full stress of filesystem.
>>>>>
>>>>> I have improved my stress test and managed to find something with mc
>>>>> paralelly with data copying.
>>>>
>>>>
>>>> Ok, I'll try to reproduce.
>>>> Is you "/" on reiser4 partition?
>>>>
>>>> Thanks,
>>>> Edward.
>>>
>>>
>>
>
>

