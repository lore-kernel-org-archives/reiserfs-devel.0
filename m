From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 metas/bmap problem
Date: Sat, 31 Jul 2004 15:43:50 +0400
Message-ID: <410B85F6.8010107@namesys.com>
References: <Pine.GSO.4.44L.0407281754290.11129-100000@unix2.cc.ksu.edu> <20040729012549.GE1439@schnapps.adilger.int> <4108AA34.70202@namesys.com> <4108ABDD.9010803@namesys.com> <410A955D.3030101@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19887-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410A955D.3030101@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Matt Stegman <matts@ksu.edu>, reiserfs-list@namesys.com

Hello

Hans Reiser wrote:
> Vladimir V. Saveliev wrote:
> 
>> Hello
>>
>> Hans Reiser wrote:
>>
>>> Andreas Dilger wrote:
>>>
>>>>
>>>>
>>>> The ext3_bmap() function flushes all file data to disk when called, 
>>>> and it
>>>> would be prudent to do the same with reiser4, since bmap users tend 
>>>> to be
>>>> important and not speed critical (e.g. lilo) and failing to do so 
>>>> can mean
>>>> not booting later.
>>>>  
>>>>
>>> Interesting point.  vs, please comment.
>>>
>> Yes, reiser4 might do something like that too. However, i am not sure 
>> how we can prevent relocation for files which were bmap-ed.
>>
>>>
>>>
>>
>>
>>
>>
> fsync first and then bmap?
> 
> 

It file will be later overwritten - flush may decide to relocate it.
So, if application which bmapped it will not re-bmap - there will be a confusion.

We need some way to mark file non-relocatable.

