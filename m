From: Hans Reiser <reiser@namesys.com>
Subject: Re: Problems with journal size option on mkfs
Date: Thu, 16 May 2002 14:55:34 +0400
Message-ID: <3CE39026.2010508@namesys.com>
References: <OFE8E86981.F03B17DE-ON85256BBA.006A1833@pok.ibm.com> <20020516091611.A6880@namesys.com> <3CE38E43.1000408@namesys.com> <3CE39135.9010706@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yury Umanets <umka@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Yury Umanets wrote:

> Hans Reiser wrote:
>
>> Oleg Drokin wrote:
>>
>>> Hello!
>>>
>>> On Wed, May 15, 2002 at 03:12:40PM -0500, Steve Pratt wrote:
>>>
>>>  
>>>
>>>> I am in the process of writing a File System Interface Module 
>>>> (FSIM) for
>>>> EVMS that will interface with ReiserFS and am having a problem with 
>>>> the -s
>>>> (journal size) option on mkfs.reiserfs.  The problem is that if I 
>>>> specify
>>>> any journal size the mkfs fails.  By fails, what I mean is that the 
>>>> device
>>>> is not mountable, I don't actually get any error message from 
>>>> mkfs.  This
>>>> happens even when I give it the default size of 8193 blocks.  I 
>>>> didn't see
>>>>   
>>>
>>>
>>>
>>> This is because non-standard journal support is only included in 2.5 
>>> kernel
>>> series.
>>> 2.4 support is available as separate patch for now.
>>>
>>> Bye,
>>>    Oleg
>>
>>
>> journal resizing and relocating will go into the next pre1.
>>
> progsreiserfs (libreiserfs for reiser3) could relocate and resize 
> journal three versions ago.
>
>
>
>
>
>
>
and the kernel code....


