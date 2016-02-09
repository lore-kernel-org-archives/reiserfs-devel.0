From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Tue, 9 Feb 2016 18:53:23 +0100
Message-ID: <56BA2793.7090906@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>
 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>
 <1436101712.6440.3.camel@gmail.com>
 <CADW=+3=J7Rt1yxtTfW=ZCLC40-D1FPCFR7KGSyp_YLgcRcH3FQ@mail.gmail.com>
 <1436109206.6440.12.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=Ivs6jukih01T0KEUXmW3C20+kXtZQOlrNNfDzDBRQSg=;
        b=XYyqrLawgZBe0BSrVzwWe4inlt87b9n/1Zv2Om23OXWpoIbCCT3rJdOUCKf+oTPBkU
         J8/RatPENa607c64lcatDYMn/Djc/cTefwK+vHVTcVCk00VBGW0rYusREoaGclSd4o9v
         f5qlzUADor4BvwQ+4matwa8BtlH+sAXBjsXgiVvp7YEKRL2EStx12sl5XDC1uDdd4sf2
         4zNEvgu4UHx7iHgzIgLmQrTTYj2ITjaAKfdfdzZxJNESvrCE15sjXXu4rdMdod4xZYJM
         r+ENFmGlB9UUYEoP97UTgoej+LiGClfpqcfjC7eBfvxrcq0Nv6mCue0HYpdmEHKRRPax
         vPBQ==
In-Reply-To: <1436109206.6440.12.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi all,

There is a pending patch for precise discarsd, which I can not merge
because it is incomplete. Just want to know, is there any progress on
this?

So we found that calculating discard params by mkfs and storing
them in superblock is a dirty option, so I suggest to reserve a
contiguous area (1 MiB?) on disk at "mkfs -d" time (just mark it busy
in the bitmap). And calculate erase unit size and offset at mount time.
If calculation failed for some reasons, then use non-precise discard.

So, I think, we'll need one d32 field in disk superblock, which indicat=
es
number of reserved blocks (0 means no reservation) and a pair of
definitions in disk_format40.h:

#define FORMAT40_FIRST_RESERVED_FOR_PROBING \
       ((REISER4_MASTER_OFFSET / PAGE_CACHE_SIZE) + 6)
#define FORMAT40_MAX_BLOCKS_RESERVED_FOR_PROBING

If any questions, or technical stoppers, then let me know.

Thanks,
Edward.


On 07/05/2015 05:13 PM, Ivan Shapovalov wrote:
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

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
