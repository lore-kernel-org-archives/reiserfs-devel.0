From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Re4: Question about reiser performance - short system freezes
Date: Tue, 01 Mar 2011 22:24:23 +0100
Message-ID: <4D6D6407.1050206@gmail.com>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D6D0CE7.22102.64597@jafojtik.seznam.cz>, <4D6D220D.2020309@gmail.com> <4D6D5E67.11412.144A223@jafojtik.seznam.cz> <4D6D63B7.6060100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D6D63B7.6060100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jaroslav Fojtik <jafojtik@seznam.cz>
Cc: reiserfs-devel@vger.kernel.org

On 03/01/2011 10:23 PM, Edward Shishkin wrote:
> On 03/01/2011 10:00 PM, Jaroslav Fojtik wrote:
>> Dear Edward Shishkin,
>>
>>>>> It might be a regression that have been fixed in the latest
>>>>> kernels. Consider upgrading to .37. If it doesn't disappear,
>>>>> then please send the SysRq-w output.
>>>>
>>>> sorry, I cannot test on 2.6.37.2 :(
>>>> reiser4 completely crashes kernel here.
>>>
>>>
>>> Please, make sure you build everything correctly.
>>> Also please avoid suffixed (37.x, etc) stuff: it
>>> can contain changes incompatible with reiser4.
>>
>> I have used "reiser4-for-2.6.37.patch" against
>> "linux-2.6.37.2". I do not know what do you mean with 37.x?
>
> I have prepared this patch against linux-2.6.37
> (not the same as linux-2.6.37


Err.. not the same as linux-2.6.37.2



). Does it also crash?
>
> Thanks,
> Edward.
>
>> You have asked me to upgrade ".37".
>>
>> Patch has been downloaded from here:
>> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/
>>
>>
>> Everything worked fine until I started to copy files from one HDD
>> to second one. After 30min Linux crashed.
>>
>> regards
>> Jara
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>

