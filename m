From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 03:32:42 +0300
Message-ID: <3E4C392A.2070909@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b2h7dc$ipp$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Zygo Blaxell wrote:

>>Hans Reiser wrote (in response to Anders Widman):
>>    
>>
>>>If we handle the journal block error without downtime, the user will 
>>>never chuck the hard drive, and that is bad in the longterm.
>>>      
>>>
>>Not agreed, unless you continue without a warning.
>>    
>>
>
>I'd prefer to continue in read-only mode, and refuse further read-write
>mounts with an error until the filesystem is fscked.
>
Yes, I agree with that.

>  I really like
>systems that can still boot and let me (attempt to) run diagnostic
>tools even when they're otherwise really unhealthy.  I don't care if
>recently written data is corrupt or missing--I probably didn't write to
>the diagnostic tools within the last journal interval, and if the
>filesystem is read-only I can't make any metadata corruption worse.
>
>I would think that most people notice that something's wrong if they
>can't write to their filesystems any more.  I certainly wouldn't want
>the filesystem to be modified if there's something known to be wrong
>with the metadata.  But if I can't read any of the data at all because
>some tiny part of it is suspicious, I just get annoyed.  :-P
>
>  
>

Agreed.  I think that this is actually what we do currently.  Oleg, can 
you check that?

-- 
Hans


