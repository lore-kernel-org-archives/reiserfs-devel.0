From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4
Date: Fri, 17 Dec 2010 21:06:57 +0100
Message-ID: <4D0BC2E1.1000101@gmail.com>
References: <20101217162550.GA1864@ishi> <4D0BA308.5050602@gmail.com> <20101217193549.GA1646@ishi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20101217193549.GA1646@ishi>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Milan Buska <milan.buska@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Milan Buska wrote:
> 17. Dec (Friday) v 18:51:04 +0100 2010, edward.shishkin@gmail.com napsal(a):
>   
>> Milan Buska wrote:
>>     
>>> Hi all.
>>>       
>> Hello.
>>
>>     
>>> I have a few questions.
>>>
>>> 1, fs reiser4 is limited by file size
>>>       
>> file size is limited by MAX_LFS_FILESIZE,
>> see definition in ./include/linux/fs.h
>>     
>
> Much of it I understand. I'm not a programmer.
>
> #if BITS_PER_LONG==32
> #define MAX_LFS_FILESIZE	(((u64)PAGE_CACHE_SIZE << (BITS_PER_LONG-1))-1) 
> #elif BITS_PER_LONG==64
> #define MAX_LFS_FILESIZE 	0x7fffffffffffffffUL
> #endif
>
> I have to learn more
>   

Which box do you have?
For example, for i386 machines the limit is 8T

>   
>>> 2, is there any connection between the reiser4 and SATA disk
>>>       
>> not sure what do you mean..
>>     
>
> I think I was still ripe in this forum.
>
> Thanks
>
>   

