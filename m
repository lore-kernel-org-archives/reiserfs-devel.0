From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Tue, 30 Jun 2015 10:58:36 +0200
Message-ID: <55925A3C.6000604@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com> <1435651611.15634.12.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=8bbSe1k3HVk30AY4Gwrc3Vd1isph0v6DdDrO5kbbVAM=;
        b=v+uEvZWOogPcnDrvw0dOu4mOwWuZMxINEfvzMPCcHVDr4zkejGU919Kuk45e01iAyS
         HAYdtyOW/ceJ56/mwWXKL1Urz8AX5GSMA5rf0/ekDYt1U4L8b38HIHrm4bGNq4IoBQYq
         Nj4xxmx3qgvrfLBaOFDT61CR5qPBaSKYzz2qm0R+KGwpsTG5aeqLZMcKQSL/Nxrv3gbR
         aJUF/O6PbP2l4goEO14biB508O7U1TiZrQNDd/tVjAyotqZf835ZHv1Q5/BrQN6Sh8Jl
         bgTbf8oaaHznJaZuXhQqKuFwJALL5J8AsVSPo89j2NegiCNDFIQ75VhNEjqeH+OesEzV
         LUog==
In-Reply-To: <1435651611.15634.12.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

On 06/30/2015 10:06 AM, Ivan Shapovalov wrote:
> On 2015-06-30 at 09:30 +0200, Edward Shishkin wrote:
>> On 06/30/2015 09:13 AM, Ivan Shapovalov wrote:
>>> On 2015-06-30 at 01:54 +0800, Edward Shishkin wrote:
>>>> Oh, bad
>>>> generic_write_checks() doesn't change offset now,
>>>> please, ignore this patch..
>>> Hi,
>> Hello.
>>
>>> it does change it, but in struct kiocb instance, but we keep using
>>> initial "off".
>>>
>>> i'm trying to port file_operations' ->write() to ->write_iter()
>>> right
>>
>> Hmm. You'll need to modify ->write() of both file plugins -
>> it's not simple, esp. for cryptcompress, which performs writes by
>> chunks (4, 8, ... 64K)
> Yeah, I understand. However, it doesn't seem too complex. It's simply
> iov_iter* instead of a char*+size_t. I just need to grok how does the
> page cache work (wrt. "faulting in" pages, flushing caches, error
> handling, etc).
>
> I'm now trying to read the generic code together with btrfs'
> implementation, compare bit-by-bit and implement the same in reiser4.
>
>>> now, FTR. The obvious fix (assign back ki_pos to off) is too ugly
>>> :)
>> may be just create a static inline function
>> reiser4_write_check() ?
>> {
>>       ...
>>       generic_write_check();
>> *off = iocb.ki_pos;
>> }
> Sure, it will work, but right now, as everything in vfs moves towards
> *_iter methods, I guess there could be some sense in moving to those as
> well...
>
> Yes, I understand that vfs is a fast-moving target, but why not?

I afraid it'll get stuck in the queue "for review"..

BTW, we need to do something with the "precise discard extension":
http://sourceforge.net/projects/reiser4/files/patches/
It reports erase unit 512 bytes for my samsung SSD 840 EVO.
You said that this is incorrect. If so, then how to retrieve correct
discard parameters?

Thanks,
Edward.
