From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Sat, 04 Jul 2015 15:53:05 +0800
Message-ID: <559790E1.2020009@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com> <1435793708.3758.14.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=5B9nlt8X2/shtmOxrBBBvMhbtlViz+pO5NHJo6boWlg=;
        b=NiV7bUuynrRUoAPBNoKS2xv9HIqu6mCNSX6gyAG2oU12lxRDTf4kt0bOjqtF1F0rhq
         TtcY6mh4TMT69r5FLhkr/I2CzdfgvWYJSkmxpZdbOYrC8b/iS7ukuN+OMwgwk0vXKGWD
         s+AYaB1o/5I1BZ9aTIuP8spWR2OhTEnldmV2+Y/F4+seXe6E+gwKow1O/gCuZi9hSVkh
         hauc+lgH74Ftf38/CiINdmdgWH42uflLesLJdp1xb5GV3TUZWsxX8KhD2eLvEhHdF8zN
         nW+XPxvlaM0Gvh4J7fMoHXfcGIEv/qCE7nDxm1suqayxLu+Rm2lrujT9MIcnp6XICdpN
         0qHA==
In-Reply-To: <1435793708.3758.14.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>



On 07/02/2015 07:35 AM, Ivan Shapovalov wrote:
> On 2015-06-30 at 10:58 +0200, Edward Shishkin wrote:
>> On 06/30/2015 10:06 AM, Ivan Shapovalov wrote:
>>> On 2015-06-30 at 09:30 +0200, Edward Shishkin wrote:
>>>> On 06/30/2015 09:13 AM, Ivan Shapovalov wrote:
>>>>> On 2015-06-30 at 01:54 +0800, Edward Shishkin wrote:
>>>>>> Oh, bad
>>>>>> generic_write_checks() doesn't change offset now,
>>>>>> please, ignore this patch..
>>>>> Hi,
>>>> Hello.
>>>>
>>>>> it does change it, but in struct kiocb instance, but we keep
>>>>> using
>>>>> initial "off".
>>>>>
>>>>> i'm trying to port file_operations' ->write() to ->write_iter()
>>>>> right
>>>> Hmm. You'll need to modify ->write() of both file plugins -
>>>> it's not simple, esp. for cryptcompress, which performs writes by
>>>> chunks (4, 8, ... 64K)
>>> Yeah, I understand. However, it doesn't seem too complex. It's
>>> simply
>>> iov_iter* instead of a char*+size_t. I just need to grok how does
>>> the
>>> page cache work (wrt. "faulting in" pages, flushing caches, error
>>> handling, etc).
>>>
>>> I'm now trying to read the generic code together with btrfs'
>>> implementation, compare bit-by-bit and implement the same in
>>> reiser4.
>>>
>>>>> now, FTR. The obvious fix (assign back ki_pos to off) is too
>>>>> ugly
>>>>> :)
>>>> may be just create a static inline function
>>>> reiser4_write_check() ?
>>>> {
>>>>        ...
>>>>        generic_write_check();
>>>> *off = iocb.ki_pos;
>>>> }
>>> Sure, it will work, but right now, as everything in vfs moves
>>> towards
>>> *_iter methods, I guess there could be some sense in moving to
>>> those as
>>> well...
>>>
>>> Yes, I understand that vfs is a fast-moving target, but why not?
>> I afraid it'll get stuck in the queue "for review"..
> Then let's say that we have an "experimental"/"unreviewed" branch :)
>
>> BTW, we need to do something with the "precise discard extension":
>> http://sourceforge.net/projects/reiser4/files/patches/
>> It reports erase unit 512 bytes for my samsung SSD 840 EVO.
>> You said that this is incorrect. If so, then how to retrieve correct
>> discard parameters?
> I was wrong about usage of `hdparm -I`. The "limit" it says about
> is in fact "how many 512-byte blocks worth of LBA ranges can be given
> to the drive in a single ATA trim command"[1].
>
> In fact, the standard (referenced below) doesn't seem to contain
> any references to the trim granularity, let alone to define any means
> to query it.
>
> So, I guess, the kernel will never tell us correct values for ATA SSDs,
> and the only option is direct testing at mount time.


And how to test directly at mount time?
It seems that nobody cares about it..
E.g. I have the following (samsung SSD 840 EVO):

reiser4: sdb1: enable discard support (erase unit 512 bytes, alignment 0 
bytes)

Thanks,
Edward.


>
> [1]: ATA8-ACS3 (nevar.pl/pliki/ATA8-ACS-3.pdf), 7.16.7.55
>       "IDENTIFY DEVICE" - "Input From the Device to the Host Data
>       Structure" - "7.16.7.55 Word 105: Maximum number of 512-byte
>       blocks of LBA Range Entries per DATA SET MANAGEMENT command".
>
> Thanks,

