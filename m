From: Hans Reiser <reiser@namesys.com>
Subject: Re: tail policy question
Date: Thu, 13 Nov 2003 22:02:33 -0800
Message-ID: <3FB46FF9.2060402@namesys.com>
References: <Pine.GSO.4.58.0311121737100.9552@bingsun2.cc.binghamton.edu> <3FB22E06.9070500@namesys.com> <Pine.GSO.4.58.0311131322500.27178@bingsun2.cc.binghamton.edu> <20031114170604.GQ1278@backtop.namesys.com> <3FB46424.4000300@namesys.com> <20031114172716.GU1278@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16095-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031114172716.GU1278@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Zhihui Zhang <bf20761@binghamton.edu>, reiserfs-list@namesys.com, vs@namesys.com

Alex Zarochentsev wrote:

>On Thu, Nov 13, 2003 at 09:12:04PM -0800, Hans Reiser wrote:
>  
>
>>Alex Zarochentsev wrote:
>>
>>    
>>
>>>On Thu, Nov 13, 2003 at 01:34:07PM -0500, Zhihui Zhang wrote:
>>>
>>>
>>>      
>>>
>>>>Thanks for your and Alex's reply.  I poke around a little bit more and
>>>>find out that the mkfs.c does use ITEM_TAIL40_ID, which happens to have
>>>>the same value as TAIL_ID (0x6) in the kernel file. 
>>>>  
>>>>
>>>>        
>>>>
>>>they are from different name spaces.
>>>
>>>
>>>      
>>>
>>>      
>>>
>>>>However, I am confused
>>>>when I see the following in plugin.h:
>>>>
>>>>PLUGIN_BY_ID(item_plugin, REISER4_ITEM_PLUGIN_TYPE, item);
>>>>PLUGIN_BY_ID(tail_plugin, REISER4_TAIL_PLUGIN_TYPE, tail);
>>>>  
>>>>
>>>>        
>>>>
>>>IFAIK above defines service functions for plugins of different types, 
>>>it does not define concrete plugins. tail_plugin_type should be named
>>>as tail_policy_plugin for better understanding.
>>>
>>>
>>>
>>>      
>>>
>>>>The item plugin has TAIL_ID if the item is of tail type. So what is the
>>>>use of a separate tail_plugin?  Plus, the tail_plugin has three IDs
>>>>defined: NEVER, ALWAYS, and DEFAULT, none of which has a value of 0x6. My
>>>>guess is that the item plugin for tails are used to manage tails (merge,
>>>>split, read, write?), 
>>>>  
>>>>
>>>>        
>>>>
>>>yes
>>>
>>>
>>>
>>>      
>>>
>>>>while the tail_plugin is used to decide if a
>>>>conversion between tail format and extent format is needed.  If so, the
>>>>reiser4.h file should have:
>>>>
>>>>#define REISER4_TAIL_PLUGIN       (DEFAULT_TAIL_ID)
>>>>
>>>>instead of
>>>>
>>>>#define REISER4_TAIL_PLUGIN       (ALWAYS_TAIL_ID)
>>>>
>>>>Does this make sense? Please clarify this for me.  Thanks.
>>>>  
>>>>
>>>>        
>>>>
>>>what i would like to see:
>>>rename *_TAIL_ID to *_TAIL_POLICY_ID
>>>DEFAULT_TAIL_POLICY__ID renamed to SMART_TAIL_POLICY_ID
>>>
>>>
>>>      
>>>
>>16K_TAIL_POLICY is more informative....
>>    
>>
>
>I think digits cannot be at the first place.
>  
>
TAIL_16k_ID

>  
>
>>>#define REISER4_TAIL_POLICY_PLUGIN (one of SMART_TAIL_POLICY_ID 
>>>ALWAYS_TAIL_POLICY_ID,
>>>NEVER_TAIL_POLICY_ID)
>>>
>>>Does it make things more clear?
>>>
>>>Thanks.
>>>
>>>
>>>      
>>>
>>-- 
>>Hans
>>
>>
>>    
>>
>
>  
>


-- 
Hans


