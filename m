From: Hans Reiser <reiser@namesys.com>
Subject: Re: Getopt improvements
Date: Fri, 28 Feb 2003 01:35:38 +0300
Message-ID: <3E5E92BA.4090307@namesys.com>
References: <3E5D26A2.7010804@suse.com> <20030227092551.C28643@namesys.com> <3E5E312C.50406@suse.com> <3E5E730C.7030804@namesys.com> <3E5E84B2.90708@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12959-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E5E84B2.90708@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Oleg Drokin <green@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:

> Hans Reiser wrote:
>
>> Jeff Mahoney wrote:
>>
>>>
>>>     Oleg -
>>>         I like the ability to specify the bits that should be cleared. 
>>
>>
>>
>> What do you mean by that, forgive me for not reading closely
>>
>>> It's more flexible than my solution, and doesn't involve looping 
>>> after each option. 
>>
>>
>>
>> Doesn't yours do a better job of handling "no"?
>
>
>     For the simple cases (which also happen to be all we have right 
> now), yes, I think that my implementation is cleaner. It allows the 
> simple use of mutually exclusive options, through the "no" prefix, and 
> clearing of the other bits in a multivalue option.  For now, that's 
> all we need - and it's a valid argument for using my code. However, 
> what I like about Oleg's implementation is that if you have an option 
> that excludes other options (even when it's not multivalue), it can 
> clear those bits as well.

It clears them without failing, yes?  Not sure I like that.

> What I don't like is how it makes the descriptor definition for each 
> argument pretty long and really ugly. 

An example?

>
>
>     -Jeff
>


-- 
Hans


