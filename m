From: Hans Reiser <reiser@namesys.com>
Subject: Re: typo: failed to genetate UUID? what's it?
Date: Wed, 14 Jan 2004 15:51:21 +0300
Message-ID: <40053B49.3000508@namesys.com>
References: <4003FCB1.4030205@libero.it> <200401141349.37081.vitaly@namesys.com> <40053457.1070901@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40053457.1070901@libero.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Domenico Andreoli wrote:

> Vitaly Fertman wrote:
>
>> On Tuesday 13 January 2004 17:12, Domenico Andreoli wrote:
>>
>>>
>>> what does it really mean? is something i need to worry? i sometimes 
>>> receive
>>> it when i'm formatting a new reiserfs partition.
>>
>>
>> do you have /dev/urandom? It should have read permissions.
>>
> no
>
> -----[ Domenico Andreoli, aka cavok
>  --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
>    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
>
>
Vitaly, if this happens to real users, then you must handle the error 
gracefully and informatively.....

I have no idea whether a significant percentage of them lack 
/dev/urandom, maybe you should ask the list.

-- 
Hans


