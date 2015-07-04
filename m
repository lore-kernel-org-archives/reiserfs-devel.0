From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Sun, 05 Jul 2015 02:33:23 +0800
Message-ID: <559826F3.9010201@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>	 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com> <1436032389.25552.6.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=OX6wX0Nz0uV+ep+hcZE10SwMHuoKDnhnXQvk0boATX8=;
        b=zU31xeN2vTljcwBuT48irp1abrM4YNMgA1rIAU/i7lw8HokU9n8uhsU/l/MlKCCnSu
         vK5kuUQaorV2eGojJbH3BctuZ1BcfNe5t9PU7tA8yCTUssPlG+fRWTi7dxiUNha6HkwF
         t6eEp7pq3ajUPCkW+VOd1xJqe0xNKZvpjrCzuryF9XMgb4z+5uGeUppJYEnnU6oKSHXh
         WY5B0rV9dPpOD2SlXfoNBWLjwScLloT+8TDzv6H3l7rb3bEUHZ8d0qDfdN1E/zU745eW
         vMXGVtDDFTQWZDACJARLaGO9YTUW4R8KMs1EP2fTkEyIu7dr+tHWAIHP46Bw/5cqxu8W
         ToWA==
In-Reply-To: <1436032389.25552.6.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 07/05/2015 01:53 AM, Ivan Shapovalov wrote:
> On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
>> On 07/02/2015 07:35 AM, Ivan Shapovalov wrote:
>>> On 2015-06-30 at 10:58 +0200, Edward Shishkin wrote:
>>>> [...]
>>>> BTW, we need to do something with the "precise discard > > > extension":
>>>> http://sourceforge.net/projects/reiser4/files/patches/
>>>> It reports erase unit 512 bytes for my samsung SSD 840 EVO.
>>>> You said that this is incorrect. If so, then how to retrieve
>>>> correct
>>>> discard parameters?
>>> I was wrong about usage of `hdparm -I`. The "limit" it says about
>>> is in fact "how many 512-byte blocks worth of LBA ranges can be
>>> given
>>> to the drive in a single ATA trim command"[1].
>>>
>>> In fact, the standard (referenced below) doesn't seem to contain
>>> any references to the trim granularity, let alone to define any
>>> means
>>> to query it.
>>>
>>> So, I guess, the kernel will never tell us correct values for ATA
>>> SSDs,
>>> and the only option is direct testing at mount time.
>>
>> And how to test directly at mount time?
> Something along the lines of
> - allocate 1 MiB of contiguous space
> - fill it with non-zeros
> - for N = 1, 2, 4, ...:
>    - discard N sectors from the contiguous space
>    - check if anything in the discarded space became zero-filled
>    - if it did, infer alignnment from the first zero-filled block,
>      infer granularity from the zero-filled region size.


mkfs seems to be more suitable for this funny business


>> It seems that nobody cares about it..
> It's just ATA interface does not provide necessary data.


OK, so our precise discard extension is waiting for the
best times..

Thanks,
Edward.
