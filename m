From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: ACL support.
Date: Wed, 26 Mar 2014 18:04:06 +0100
Message-ID: <53330886.30506@gmail.com>
References: <5332645E.4070600@gmail.com> <5332AD40.1020308@gmail.com> <5332F56A.2030506@gmail.com> <5332F9E9.5050905@gmail.com> <533303EC.6020100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=+b0DMT+EsXR3Xggx48AKsPmW1GVzr4xNV5lD/elO73Q=;
        b=GfZAQ7ZRxSkZhChw2Hp9VS1jl6vQlLLE5Lo7gLN2Q+BVHOAzAtLgiiQePIHt35M1Bw
         ArsKaTpV4D3Kembtgbkqo63NH4COEDFUr+OizNUuGOohylOozQOKsG4hJVHuDclOcJuS
         eJtGdzXVHEv0RiIZl/0AdMF4rbdhuNyKxpEVM4bL7XY4H8ANYuy8wJcPiWA7YIwdfQ1D
         NsmUK/lgzGOmV+lo4629Lxybrj3iZViUGN6/V2176jzPc9VVN6m/Ec5BFqnO8HSjH22j
         IJTQJh56ljTIb87u2wdaKznxXMCeU8CHxUHhKxMSlLOV+8S2Q7Oyt6ycMEot0STLAk/D
         KTRA==
In-Reply-To: <533303EC.6020100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dE <de.techno@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 03/26/2014 05:44 PM, dE wrote:
> On 03/26/14 21:31, Edward Shishkin wrote:
>> On 03/26/2014 04:42 PM, dE wrote:
>>> On 03/26/14 16:04, Edward Shishkin wrote:
>>>> On 03/26/2014 06:23 AM, dE wrote:
>>>>> Does reiser4 support ACL?
>>>>
>>>> Nope for historical reasons.
>>>> I'll provide hints how to implement this, if someone wants..
>>>>
>>>> Edward.
>>>
>>> Thanks for the response.
>>>
>>> I was just asking for educational purposes (my home dir recedes on 
>>> reiser4).
>>>
>>> And yes -- I got a major bug to report which cause FF to crash. 
>>> Duplicating ~/.firefox solved the problem. I've the bad ~/.firefox.
>>>
>>> What do I have to do to report the problem?
>>
>> 1) "bad" means what?
>> 2) any kernel complaints?
>> 3) results of checking the partition with fsck.reiser4
>> 4) Is it possible to reproduce the problem?
>>
>> Thanks,
>> Edward.
>
> I started having problems with FF which was diagnosed to contents of 
> ~/.firefox.

Which kernel version?
Do you use the new reiser4 transaction models announced not so long ago?

> So renamed it to ~/.firefox_bad and copied ~/.firefox_bad to 
> ~/.firefox to solve the problem.
>
> So I still have ~/.firefox_bad; this problem occurred twice, and I 
> have both of the ~/.firefox_bad
>
> Yes -- the kernel showed a backtrace from some reiser4 sources.

Could you send it, if possible?

Thanks,
Edward.

>
> fsck.reiser4 was done -- nothing was wrong.
>
> Yes -- I have the ~/.firefox_bad just for the purpose of bug reporting.

