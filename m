From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Mon, 06 Jul 2015 10:56:43 +0200
Message-ID: <559A42CB.3030003@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>	 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>	 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>	 <1436101712.6440.3.camel@gmail.com>	 <CADW=+3=J7Rt1yxtTfW=ZCLC40-D1FPCFR7KGSyp_YLgcRcH3FQ@mail.gmail.com> <1436109206.6440.12.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=XxpeQ04QjjQz6v+iYv/KRAH0Its6Ut1nSOasrDqAd3o=;
        b=WB7n301WQjWWeeetmKpOFLaTTiR6HTvDcFsi7sKj1n1gPdmJ+V5FaFh+1/Yr9NvKWQ
         HrIF0b86DC3nV8Z1JhttmPcOi74AeXX27ccn9KSP2dnqi0v/FAhqx0/AsZvau5iDx5+B
         OSf8w96eqZCDu9Zop3ujJhid4d/SYf4DxDajDL7SGsT+rvasQjQjdPpadwXUhkAxTaZc
         1lFA4jyj/kPKsodT/sfMe1sqJGhkfo26s/22wYlCZKH6hWxX9F9msXzy38LLjTPDuhF9
         8AHaOy9Vu00unBcKIpNW0/yvO8mWB8jefnCJ7ht7QdwaZgdHFobgLwTu5SYisM31dCB8
         79xQ==
In-Reply-To: <1436109206.6440.12.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 07/05/2015 11:13 PM, Ivan Shapovalov wrote:
> On 2015-07-05 at 16:06 +0200, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>> On 5 Jul 2015 15:12, "Ivan Shapovalov"<intelfx100@gmail.com>  wrote:
>>> On 2015-07-05 at 02:33 +0800, Edward Shishkin wrote:
>>>> On 07/05/2015 01:53 AM, Ivan Shapovalov wrote:
>>>>> On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
>>>>>> [...]
>>>>>> And how to test directly at mount time?
>>>>> Something along the lines of
>>>>> - allocate 1 MiB of contiguous space
>>>>> - fill it with non-zeros
>>>>> - for N =3D 1, 2, 4, ...:
>>>>>     - discard N sectors from the contiguous space
>>>>>     - check if anything in the discarded space became zero
>>>>> -filled
>>>>>     - if it did, infer alignnment from the first zero-filled
>>>>> block,
>>>>>       infer granularity from the zero-filled region size.
>>>> mkfs seems to be more suitable for this funny business
>>> Yeah, sure. So... new superblock format with two extra fields?
>>>
>> But what happens when someone makes an image of whole partition and
>> uses it
>> on new different ssd?
> Maybe we can make a tunefs.reiser4 (just) for that purpose.


tunefs utilities usually accept already existing file system as one of=20
input arguments.
And it can happen that file system doesn't have enough space for=20
"probing". So the
cleanest option would be to create a simple tool for probing an empty=20
non-formatted
partition, and supply a script, which:

1) probes an empty partition;
2) dd;
3) updates superblock of the newly created image (by tunefs, etc) with=20
proper discard
parameters.

Thanks,
Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
