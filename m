From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsck.reiser4
Date: Thu, 25 Dec 2003 21:28:44 +0300
Message-ID: <3FEB2C5C.3030500@namesys.com>
References: <200312251542.28769.janfengler@web.de> <200312252000.52880.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16403-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200312252000.52880.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: janfengler@web.de, Reiserfs Mailinglist <reiserfs-list@namesys.com>

Vitaly Fertman wrote:

>On Thursday 25 December 2003 17:42, janfengler@web.de wrote:
>  
>
>>Hello,
>>    
>>
>
>Hello Jan,
>
>  
>
>>i have an Problem using fsck.reiser4:
>>I've copied my whole system to an newly formatted Reiser4-partition. Just
>>after unmounting i ran fsck.reiser4. There where lots of fixable minor
>>corruptions so i used fsck.reiser4 again submitting --fix to it. After the
>>Run it told me that it has found an corruption correctable using the
>>"--fix"-option. Therefore i ran it again, but it seems that fsck.reiser4
>>isn't able to correct it. It tells me after every run to run it again with
>>the "--fix"-option to correct the problem, wasting my time and doing
>>nothing else.
>>    
>>
>
>right, the problem can be fixed only by --build-fs but was counted 
>as fixable corruption. Will be fixed.
>
>Thank you for the report,
>Vitaly Fertman
>
>
>  
>
what is --build-fs?

-- 
Hans


