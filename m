From: Gorazd Golob <gorazdg@noviforum.si>
Subject: Re: reiser3 and O_DIRECT read
Date: Mon, 10 Oct 2005 14:30:06 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510101428500.3955@dacun.noviforum.si>
References: <Pine.LNX.4.61.0510071208030.1805@dacun.noviforum.si>
 <4346784A.1050208@namesys.com> <Pine.LNX.4.61.0510101223390.3955@dacun.noviforum.si>
 <434A5D19.2030006@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26443-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <434A5D19.2030006@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com



On Mon, 10 Oct 2005, Vladimir V. Saveliev wrote:

>
> Does it work on ext2?
Yes it work on ext2, ext3, xfs ..

> Are you sure that file offset is properly aligned?
Yes ..


>
>> Without O_DIRECT works fine as said in previous mails. Write with
>> O_DIRECT works fine. Kernel version is:
>> Linux xxxx 2.6.12.6 #6 SMP Thu Sep 15 12:29:53 CEST 2005 x86_64 Intel(R)
>> Xeon(TM) CPU 3.00GHz GenuineIntel GNU/Linux
>>
>> please let me know if you need more info.
>>
>> tnx, Gorazd
>>
>>
>>
>>
>>
>>
>>>> Or in other words is reiserfs3 supporting reading with O_DIRECT flag?
>>>> Writing works well with 0_DIRECT on reiserfs3.
>>>>
>>>> Gorazd
>>>>
>>>>
>>>>
>>>
>>>
>>
>>
>
>
