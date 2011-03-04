From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: linux-2.6.37 crash reproduced - here is a screenshot
Date: Fri, 04 Mar 2011 23:58:39 +0100
Message-ID: <4D716E9F.8090902@gmail.com>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D702329.27637.A07FE@jafojtik.seznam.cz>, <4D702444.6000806@gmail.com> <4D7161F7.2754.6FF32@jafojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D7161F7.2754.6FF32@jafojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jaroslav Fojtik <jafojtik@seznam.cz>
Cc: reiserfs-devel@vger.kernel.org

On 03/04/2011 11:04 PM, Jaroslav Fojtik wrote:
> Dear Edward,
>
> have a look at attached screenshot.
>
> The crashing address should be visible here.
>
> Crash reproduced after 15min of stress. Now the dump is visible.

Hello Jaroslav.

I don't see any reiser4 bits in the stacktrace.
Could you please try to reproduce it without
reiser4? Report about results.

Thanks,
Edward


>
> best regards
>     Jara
>
>
>> On 03/04/2011 12:24 AM, Jaroslav Fojtik wrote:
>>> Dear Edward Shishkin,
>>>
>>>> Great.
>>>
>>> Sorry, after several attempts I managed to crash Linux even with kernel
>>> linux-2.6.37. No trace in log, system completely frozen and beeper
>>> sounded.
>>>
>>> It takes several hours to transfer 400 Gigabyte test data and create
>>> full stress of filesystem.
>>>
>>> I have improved my stress test and managed to find something with mc
>>> paralelly with data copying.
>>
>>
>> Ok, I'll try to reproduce.
>> Is you "/" on reiser4 partition?
>>
>> Thanks,
>> Edward.
>
>

