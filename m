From: Hans Reiser <reiser@namesys.com>
Subject: Re: Promise raid controller writes to disk, anybody know where?
Date: Thu, 17 Apr 2003 05:40:51 +0400
Message-ID: <3E9E0623.7090708@namesys.com>
References: <Pine.LNX.4.44.0304161239010.24595-100000@dragon.inside.ntisys.com> <3E9D88FB.6090109@namesys.com> <1389382.20030416185111@tnonline.net> <3E9D8ABC.8050601@namesys.com> <1410590683.20030416185911@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1410590683.20030416185911@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: Reiserfs-List@namesys.com

Anders Widman wrote:

>>>>>>I just bought this motherboard with a promise raid controller builtin
>>>>>>whose manual mentions that it writes information to disk (volume and
>>>>>>config info I believe).
>>>>>>            
>>>>>>
>
><snip>
>
>  
>
>>It is for my Mom, I want both windows and Linux, and I was hoping the 
>>whole drive would get mirrored by the hardware.  It is okay though, I 
>>will have mom use dd once a week to do it, and this will protect from 
>>viruses better than a synchronous mirror.
>>    
>>
>
>The  BIOS  is  handling mirroring, which is supported good in Windows,
>and as "experimental" in Linux.
>
>//Anders
>
>--------
>PGP public key: https://tnonline.net/secure/pgp_key.txt
>
>
>
>  
>
So it sounds like I should just not use mirroring and life will be fine?

Their product seems to be a bit cheesy, and more than a bit lacking in 
good documentation.  It claims that one of my drives is part of a 1+0 
array.  How can one drive be part of a mirrored array?  Or does that 
mean that it is the mirror of one of the other drives?

-- 
Hans


