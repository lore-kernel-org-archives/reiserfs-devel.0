From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser3 and O_DIRECT read
Date: Mon, 10 Oct 2005 16:22:49 +0400
Message-ID: <434A5D19.2030006@namesys.com>
References: <Pine.LNX.4.61.0510071208030.1805@dacun.noviforum.si> <4346784A.1050208@namesys.com> <Pine.LNX.4.61.0510101223390.3955@dacun.noviforum.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.61.0510101223390.3955@dacun.noviforum.si>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gorazd Golob <gorazdg@noviforum.si>
Cc: reiserfs-list@namesys.com

Hello

Gorazd Golob wrote:
> Hi!
> 
>>> re!
>>>
>>> Are we looking on wrong suspect - snip from code looks like this:
>>>
>>> fd = open(f, O_RDONLY | O_DIRECT, 0);
>>>
>>> and is not working for reiserfs3 filesystem?
>>>
>>
>> reiserfs is supposed to support O_DIRECT. Please provide more details
>> about the
>> problem.
>>
> 
> File is opened with fd = open(f, O_RDONLY | O_DIRECT, 0);
> 
> After we tried to do:
> numRead=read(fd, buf, alignedSize - offset)
> 
> numRead returns -1 errno is EINVAL (22).
> 

Does it work on ext2?
Are you sure that file offset is properly aligned?

> Without O_DIRECT works fine as said in previous mails. Write with
> O_DIRECT works fine. Kernel version is:
> Linux xxxx 2.6.12.6 #6 SMP Thu Sep 15 12:29:53 CEST 2005 x86_64 Intel(R)
> Xeon(TM) CPU 3.00GHz GenuineIntel GNU/Linux
> 
> please let me know if you need more info.
> 
> tnx, Gorazd
> 
> 
> 
> 
> 
> 
>>> Or in other words is reiserfs3 supporting reading with O_DIRECT flag?
>>> Writing works well with 0_DIRECT on reiserfs3.
>>>
>>> Gorazd
>>>
>>>
>>>
>>
>>
> 
> 

