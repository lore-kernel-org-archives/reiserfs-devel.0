From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Where is reiserfsprogs?
Date: Wed, 10 Oct 2012 17:35:06 +0200
Message-ID: <507595AA.50201@gmail.com>
References: <alpine.DEB.2.01.1209241627360.10880@trent.utfs.org> <50610261.20307@suse.com> <alpine.DEB.2.01.1209242016500.10880@trent.utfs.org> <506125F1.4030500@suse.com> <50619895.7000003@gmail.com> <5075900B.9060402@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=5+0NANB/FntBBKgJJ8YVUDy/8L0onqBC1TS5KSlXJrI=;
        b=KQbCqPDeHFuztXwb2qVSKPFG2F8kEnlVbRyZ+KNnrjBy9y9EgfAlKuFBT5ex6VZLgy
         VEiNQerZwP0crJzhuUNCS2vyk0HGaZHJNyJvqKRFGBe6xlJM+qBIp0W8NSfLSaEEm6O8
         8JPouLhIrJe719+H4JA1Ks2EaeSl6Kuh/3pncdSmHDY2H8bLLdurguzvTCjzF1mYgOjy
         zV37lBI2alRJQDAlDKNaEIylYVX7vDVzuQfW7ByEAiMXzdLJMQZxVJMwPR3E0+trPALz
         Yia4pV3Ahia1QHasvbcgMqDPtdspPwPIO+2oDEwJAknzcbAVlurxyXw+4gDHMBCSsa5P
         bY8w==
In-Reply-To: <5075900B.9060402@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Christian Kujau <lists@nerdbynature.de>, reiserfs-devel@vger.kernel.org

On 10/10/2012 05:11 PM, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 9/25/12 7:42 AM, Edward Shishkin wrote:
>> On 09/25/2012 05:33 AM, Jeff Mahoney wrote:
>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>
>>> On 9/24/12 11:19 PM, Christian Kujau wrote:
>>>> On Mon, 24 Sep 2012 at 21:01, Jeff Mahoney wrote:
>>>>> I don't know if there's an official site anymore. You can
>>>>> grab 3.6.21 from the "filesystems" project in the open build
>>>>> service[1]
>>>> Thanks!
>>>>
>>>> @Edward, do you want to add this to your Sorceforge account? Or
>>>> can you put this back on your kernel.org home? Or do we want to
>>>> have the openSUSE build service to be the new "official" place
>>>> for reiserfsprogs?
>>> While I wouldn't mind seeing the publicity for OBS, that's not
>>> really the goal of the project.
>>>
>>> Edward, it's up to you. I know you don't do much with reiser3
>>> anymore. I can apply for and host it at a kernel.org account if
>>> you'd prefer. I have an outstanding patch anyway.
>>
>> OK, try to apply.
>>
>> I am sorry, currently this is a problem for me to collect needed
>> amount of signatures to recreate my account at kernel.org.
> Ok. I've published the versions of reiserfsprogs that SUSE has shipped
> in products (so I know that they're valid). Our ftp.namesys.com
> archive has long since been empty, so that's really the best I can do.
>
> That means the following versions:
> 3.x.0j
> 3.6.2
> 3.6.4
> 3.6.9
> 3.6.13
> 3.6.18
> 3.6.19
> 3.6.20
> 3.6.21
>
> http://ftp.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs
>
> Incidentally, the SUSE version of 3.6.21 has for some time carried
> patches for signedness and a use-after-free. If nobody has any
> objections, I'll publish that as 3.6.22.

OK.
I've also found some old stuff (4 patches), that you might find interesting
(will resend).

Thanks,
Edward.
