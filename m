From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsck in background?
Date: Mon, 31 Mar 2003 22:54:06 +0400
Message-ID: <3E888ECE.2090301@namesys.com>
References: <3E8818CD.1000500@dotcom.pl> <20030331144609.B1430@namesys.com> <3E88775F.5070302@namesys.com> <200303312154.35760.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13496-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303312154.35760.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, myciel <myciel@dotcom.pl>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>On Monday 31 March 2003 21:14, Hans Reiser wrote:
>  
>
>>Oleg Drokin wrote:
>>    
>>
>>>Hello!
>>>
>>>On Mon, Mar 31, 2003 at 12:30:37PM +0200, myciel wrote:
>>>      
>>>
>>>>Yes, I know this sounds strange, but if one have 1T filesystem full of
>>>>small files,
>>>>reiserfsck estimates duration to be of order of months,
>>>>        
>>>>
>>>We have a patch that significantly speeds things up.
>>>In the similar case 28+ years estimated for pass 0 turned into 208 hours
>>>total
>>>      
>>>
>>As I said before, 208 hours is unacceptable and Vitaly needs to do more
>>work on it. If Vitaly doesn't know how to fix it, then I need to review
>>his algorithms in detail.
>>    
>>
>
>As I wrote you the objectid handling is not the problem anymore, and I 
>described also that the performance problem for now is nlink calculation 
>on semantic rebuild pass which needs many writes on disk what is not easy
>to optimize in the case with shared objectids.
>
by shared objectids you mean when more than one file is discovered by 
fsck to have the same oid?  what is the problem?

> Although it could be solved 
>with another pass which would solve all such shared objectid problems just 
>before semantic rebuild pass. 
>
>  
>


-- 
Hans


