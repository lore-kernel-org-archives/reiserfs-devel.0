From: Hans Reiser <reiser@namesys.com>
Subject: Re: Getopt improvements
Date: Fri, 28 Feb 2003 15:52:17 +0300
Message-ID: <3E5F5B81.1040602@namesys.com>
References: <3E5D26A2.7010804@suse.com> <20030227092551.C28643@namesys.com> <3E5E312C.50406@suse.com> <3E5E730C.7030804@namesys.com> <3E5E84B2.90708@suse.com> <3E5E92BA.4090307@namesys.com> <20030228100147.A878@namesys.com> <3E5F504A.6010902@namesys.com> <20030228154157.A10830@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228154157.A10830@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Reiserfs List <reiserfs-list@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Fri, Feb 28, 2003 at 03:04:26PM +0300, Hans Reiser wrote:
>  
>
>>>>> For the simple cases (which also happen to be all we have right 
>>>>>now), yes, I think that my implementation is cleaner. It allows the 
>>>>>simple use of mutually exclusive options, through the "no" prefix, and 
>>>>>clearing of the other bits in a multivalue option.  For now, that's 
>>>>>all we need - and it's a valid argument for using my code. However, 
>>>>>what I like about Oleg's implementation is that if you have an option 
>>>>>that excludes other options (even when it's not multivalue), it can 
>>>>>clear those bits as well.
>>>>>          
>>>>>
>>>>It clears them without failing, yes?  Not sure I like that.
>>>>        
>>>>
>>>Hm, why should it fail?
>>>      
>>>
>>Incompatible options should fail as they represent error.  Feel free to 
>>argue with that.
>>    
>>
>
>Hm, I am not going to argue. But we never had this kind of logic.
>Usually the latest-specified option was taking effect.
>
>Bye,
>    Oleg
>
>
>
>  
>
Conflicts in the same command line should fail, latest command line 
should override.  Yes?

-- 
Hans


