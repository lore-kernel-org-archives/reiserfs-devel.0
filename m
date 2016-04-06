From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Wed, 06 Apr 2016 20:03:34 +0200
Message-ID: <57054F76.1000701@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>	 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>	 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>	 <1436101712.6440.3.camel@gmail.com>	 <CADW=+3=J7Rt1yxtTfW=ZCLC40-D1FPCFR7KGSyp_YLgcRcH3FQ@mail.gmail.com>	 <1436109206.6440.12.camel@gmail.com> <56BA2793.7090906@gmail.com> <1459961644.5177.6.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=rb+rqfXwD5qAUPtdQpvONDSlI2ks+FCa4oGPNphkGHo=;
        b=XtYWiPEhdHqF296lTtUHgHaIV69JXtFpyR9k79jsskwXZWopWD/hqvJ82xMROTRaAC
         NVQyUVLq6l1l6o2edoJ0M0cYkK/oCOr2c5OQmL332TVnndES68HNZZdn7Xd/1Jdm6mA+
         SS9aAFT0lmIb3h5ip15aXlwvzawlODbLdqLIeOIaI0Nt0Wr0XfssPkBlhzqJ+OLO8q6+
         1WTNGQucDI+xrJu81ge/6vD7FeGxjUxKWAWeTKZFB30AqKswYOp7BB18rH5sMkpy8Wi/
         g4EMLEPa5/LOIi1lf1G2jN1zuiwyj/vS7SIz+p8e04eQe+gfgjLrXNPxWmx5OawGVmnN
         UB6g==
In-Reply-To: <1459961644.5177.6.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: intelfx@intelfx.name, Ivan Shapovalov <intelfx100@gmail.com>, =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>



On 04/06/2016 06:54 PM, Ivan Shapovalov wrote:
> On 2016-02-09 at 18:53 +0100, Edward Shishkin wrote:
>> Hi all,
>>
>> There is a pending patch for precise discarsd, which I can not merge
>> because it is incomplete. Just want to know, is there any progress o=
n
>> this?
>>
>> So we found that calculating discard params by mkfs and storing
>> them in superblock is a dirty option, so I suggest to reserve a
>> contiguous area (1 MiB?) on disk at "mkfs -d" time (just mark it bus=
y
>> in the bitmap). And calculate erase unit size and offset at mount
>> time.
>> If calculation failed for some reasons, then use non-precise discard=
=2E
>>
>> So, I think, we'll need one d32 field in disk superblock, which
>> indicates
>> number of reserved blocks (0 means no reservation) and a pair of
>> definitions in disk_format40.h:
>>
>> #define FORMAT40_FIRST_RESERVED_FOR_PROBING \
>>         ((REISER4_MASTER_OFFSET / PAGE_CACHE_SIZE) + 6)
>> #define FORMAT40_MAX_BLOCKS_RESERVED_FOR_PROBING
>>
>> If any questions, or technical stoppers, then let me know.
>>
>> Thanks,
>> Edward.
> I guess it would be nicer to allocate the needed space dynamically at
> mount time.


And if no enough space, then switch to non-precise discard mode? OK.
Since the probing code is for SSD drives, it shouldn't lead to long mou=
nts
in the case of big terabyte partitions, which are full of data.


>   However, there is a problem: where to put the probing code
> in the fill_super() (I suppose?) sequence?


Put it in try_init_format40(), right after the sa_init_allocator():
seems to be a right place.

Thanks,
Edward.


>   We want the allocator to be
> intact, but nothing should be written to the filesystem so far.
>
> --
> Ivan Shapovalov / intelfx /
>
>>
>> On 07/05/2015 05:13 PM, Ivan Shapovalov wrote:
>>> On 2015-07-05 at 16:06 +0200, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>> On 5 Jul 2015 15:12, "Ivan Shapovalov"<intelfx100@gmail.com>  wro
>>>> te:
>>>>> On 2015-07-05 at 02:33 +0800, Edward Shishkin wrote:
>>>>>> On 07/05/2015 01:53 AM, Ivan Shapovalov wrote:
>>>>>>> On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
>>>>>>>> [...]
>>>>>>>> And how to test directly at mount time?
>>>>>>> Something along the lines of
>>>>>>> - allocate 1 MiB of contiguous space
>>>>>>> - fill it with non-zeros
>>>>>>> - for N =3D 1, 2, 4, ...:
>>>>>>>      - discard N sectors from the contiguous space
>>>>>>>      - check if anything in the discarded space became zero
>>>>>>> -filled
>>>>>>>      - if it did, infer alignnment from the first zero-
>>>>>>> filled
>>>>>>> block,
>>>>>>>        infer granularity from the zero-filled region size.
>>>>>> mkfs seems to be more suitable for this funny business
>>>>> Yeah, sure. So... new superblock format with two extra fields?
>>>>>
>>>> But what happens when someone makes an image of whole partition
>>>> and
>>>> uses it
>>>> on new different ssd?
>>> Maybe we can make a tunefs.reiser4 (just) for that purpose.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
