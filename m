From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Sun, 05 Jul 2015 23:43:49 +0800
Message-ID: <559950B5.2000704@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>			 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>			 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>			 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>		 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>	 <1436101712.6440.3.camel@gmail.com> <5599353F.3090005@gmail.com> <1436109108.6440.10.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=GNHZGkZs2yCciqtIBZu9Devcv1gcJfs2mHMoeOhA8K8=;
        b=voboIYfP/qXrR4ao7j2XGpkkBgKjtkyufIG6mFBEl8WRIta5qc+stOrHu4F7nD+N4W
         0+oLbvDRLc8pRY+mf0ODufEvLl4IKAKO/sKFIRk2XAGfhYHRJrarLpAR1ipiwD5DUJrF
         NjTyMXfIZcBaf8WUpYeO6yeXa7RmREubuxTlfqJafbx0ix29bEUZn5sMFjQEfJ6MtSBo
         WQi9zL8+4bYMPTUythfkH2p194mfrIWcsVRBRrKfEvgVe4Y7ZoHA9RHXIqRRt39pGDHS
         5tnk3r1wlDNFxaNfi4v9Q7ghWi0VPdgrWNDW/etB9Jqe4LhcHaVIIYgh0Z8IprSstK0V
         2tmw==
In-Reply-To: <1436109108.6440.10.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>



On 07/05/2015 11:11 PM, Ivan Shapovalov wrote:
> On 2015-07-05 at 21:46 +0800, Edward Shishkin wrote:
>> On 07/05/2015 09:08 PM, Ivan Shapovalov wrote:
>>> On 2015-07-05 at 02:33 +0800, Edward Shishkin wrote:
>>>> On 07/05/2015 01:53 AM, Ivan Shapovalov wrote:
>>>>> On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
>>>>>> [...]
>>>>>> And how to test directly at mount time?
>>>>> Something along the lines of
>>>>> - allocate 1 MiB of contiguous space
>>>>> - fill it with non-zeros
>>>>> - for N = 1, 2, 4, ...:
>>>>>      - discard N sectors from the contiguous space
>>>>>      - check if anything in the discarded space became zero
>>>>> -filled
>>>>>      - if it did, infer alignnment from the first zero-filled
>>>>> block,
>>>>>        infer granularity from the zero-filled region size.
>>>> mkfs seems to be more suitable for this funny business
>>> Yeah, sure. So... new superblock format with two extra fields?
>>
>> The change will be forward and backward compatible, so there is no
>> need in a new format. Just add two new fields to the superblock40.
> So there will be zeroes in case we mount a non-aware filesystem,
> correct?


Yup.
We have a "reserved" space of 428 bytes at the end of 
format40_disk_super_block
for such purposes. This space is filled with zeros by mkfs. So 
"non-aware filesystems"
including the ones that were created by old versions of mkfs will have 
zeros there.

Edward.


>
>> Also people will want to "mount -o discard" when discard parameters
>> are not known. In this case I think to provide them
>> discard_extents().
>> which is currently merged. Otherwise use discard_precise_extents().
> Yeah.
> I'll do something with this after I finish porting ->write()
> to ->write_iter() (or if I run into heavy problems with that).
>
> Thanks,

