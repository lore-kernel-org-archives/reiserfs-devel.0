From: Hans Reiser <reiser@namesys.com>
Subject: Re: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 22:27:42 +0300
Message-ID: <40083B2E.8040608@namesys.com>
References: <20040116145551.GH1693@backtop.namesys.com> <20040116151144.86109.qmail@web21501.mail.yahoo.com> <20040116152209.GJ1693@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16555-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040116152209.GJ1693@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Paolo Correnti <paolunix@yahoo.com>, reiserfs-list@namesys.com

Alex Zarochentsev wrote:

>On Fri, Jan 16, 2004 at 07:11:44AM -0800, Paolo Correnti wrote:
>  
>
>>"Alex Zarochentsev" wrote
>>
>>    
>>
>>>can you try sync(1) and see does it help to recover
>>>free space ?
>>>      
>>>
>>Of course, but how do you use sync (I mean with what
>>option) ?
>>    
>>
>
>
>just /bin/sync, it should force commit of reiser4 transactions  and, thereby, 
>free space.
>  
>
Reiser4 should do this automatically when it runs out of disk space, I 
think I said this before, but folks were probably busy with other things 
when I said it....  Please correct it.


-- 
Hans


