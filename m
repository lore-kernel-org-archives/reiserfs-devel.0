From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sat, 03 Apr 2004 09:59:14 -0800
Message-ID: <406EFB72.6000009@namesys.com>
References: <20040402172735.76368.qmail@web25009.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040402172735.76368.qmail@web25009.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Cc: reiserfs-list@namesys.com

Narcoleptic Electron wrote:

>Hans Reiser wrote: 
>
>  
>
>>Narcoleptic Electron wrote:
>>
>>    
>>
>>>1. Leave the "metas" directory as it is, for
>>>      
>>>
>>storing
>>    
>>
>>>the meta data hierarchy.
>>> 
>>>
>>>      
>>>
>>We will do 1.
>>    
>>
>
>What is the plan for addressing the name clash
>problems that this causes?  (eg. I copy a directory,
>that happens to contain a "metas" directory, to my
>Reiser4 partition)
>  
>
these problems will not exist significantly in reality.  Look at netapps 
and snapshots and clearcase and other filesystems, I remember wondering 
if .snapshot could be a problem when netapps were new and it was never a 
problem.

People who find it is a problem can #define it to something else.  If 5 
people bother to do so, I will be surprised.

Many languages have reserved keywords.....


>
>______________________________________________________________________ 
>Post your free ad now! http://personals.yahoo.ca
>
>
>  
>


-- 
Hans


