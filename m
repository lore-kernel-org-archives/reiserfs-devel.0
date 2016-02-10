From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Wed, 10 Feb 2016 10:01:29 +0100
Message-ID: <56BAFC69.8010605@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>
 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>
 <1436101712.6440.3.camel@gmail.com>
 <CADW=+3=J7Rt1yxtTfW=ZCLC40-D1FPCFR7KGSyp_YLgcRcH3FQ@mail.gmail.com>
 <1436109206.6440.12.camel@gmail.com> <56BA2793.7090906@gmail.com>
 <1455077047.22912.4.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=pNefqrstKyCUji/2moVJ4/tARehHEckkLo3FNWEzg50=;
        b=JIg7zCBsFFCaIZsSNFpbZohClKXuJnXWUXIsYiQ0tGqFrgkMfrTCns64a5MjpsmtI5
         RLSkc37vT66UkHG8i4gL4z9v64M9RQteby+v1msZs8Sjr3UKJvH0owFqzo739DSOcnL5
         xJU4ANtZGJt8bbrbvvdnOdM7Wt1Cqzx7blPc/pzVL10qfSe+NWDrkwmm8sbPcXkOh8gN
         fxh6Y3cQo8XKRfyuChXbrZmrLRXPa02nEVVBLvyBv0pJ4W6Qg2f2WI40qxkUyBlWiYC6
         LOJtiKQkyPn9DFjp5uomG1GsYVfB5WUD5IQCF1KzLi0YvXW72Yypm/feddY/LLfr8VL5
         ZQdw==
In-Reply-To: <1455077047.22912.4.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, Ivan Shapovalov <intelfx100@gmail.com>, =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 02/10/2016 05:04 AM, Ivan Shapovalov wrote:
> On 2016-02-09 at 18:53 +0100, Edward Shishkin wrote:
>> Hi all,
>>
>> There is a pending patch for precise discarsd, which I can not merge
>> because it is incomplete. Just want to know, is there any progress on
>> this?
>>
>> So we found that calculating discard params by mkfs and storing
>> them in superblock is a dirty option, so I suggest to reserve a
>> contiguous area (1 MiB?) on disk at "mkfs -d" time (just mark it busy
>> in the bitmap). And calculate erase unit size and offset at mount
>> time.
>> If calculation failed for some reasons, then use non-precise discard.
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
>>
> Hello Edward,
>
> yes, finishing this is on top of my to-do list (but it is being
> dequeued at a very slow rate due to the university...).


Ah, this is of highest priority, ofc.


>
> I was under assumption of that we still want to go by path of probing
> parameters at mkfs time + having a special utility for rewriting these


I am afraid that 99% of users will be unaware of that utility..

Thanks,
Edward.


> fields. But if you are now ok with probing at mount time, then that's
> great. I'll try to do something in nearest week or two.
>

