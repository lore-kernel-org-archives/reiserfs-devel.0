From: Hans Reiser <reiser@namesys.com>
Subject: Re: hmm, dependencies
Date: Mon, 20 Dec 2004 09:14:28 -0800
Message-ID: <41C70874.9030001@namesys.com>
References: <1103226970.704.1.camel@localhost>	 <1103291711.3589.32.camel@tribesman.namesys.com>	 <1103296970.12405.0.camel@localhost>	 <1103304658.3589.109.camel@tribesman.namesys.com>	 <1103306958.12423.1.camel@localhost> <1103308669.3589.117.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1103308669.3589.117.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: redeeman@metanurb.dk, Reiserfs Mailinglist <reiserfs-list@namesys.com>

Vladimir Saveliev wrote:

>Hello
>
>On Fri, 2004-12-17 at 21:09, Redeeman wrote:
>  
>
>>On Fri, 2004-12-17 at 20:30 +0300, Vladimir Saveliev wrote:
>>    
>>
>>>Hello
>>>
>>>On Fri, 2004-12-17 at 18:22, Redeeman wrote:
>>>      
>>>
>>>>On Fri, 2004-12-17 at 16:55 +0300, Vladimir Saveliev wrote:
>>>>        
>>>>
>>>>>Hello
>>>>>
>>>>>On Thu, 2004-12-16 at 22:56, Redeeman wrote:
>>>>>          
>>>>>
>>>>>>hello.. reiser4 is now in mm, but i realize that nearly all of the stuff
>>>>>>that was mm specific when the move to mm was made, are probably merged
>>>>>>into upstream by now, i wonder, can anyone tell me exactly what from mm
>>>>>>it depends on?
>>>>>>
>>>>>>thanks
>>>>>>
>>>>>>            
>>>>>>
>>>>>reiser4 got included into mm not because it needed something of it, but
>>>>>rather because it is supposed that being in mm for certain amount of
>>>>>time reiser4 will get a lot of testing and will prove that it is worth
>>>>>to get included into stock kernel. 
>>>>>          
>>>>>
>>>>im aware, however, the reiser4 patches in mm are against mm, which means
>>>>it depends on something from it, and i'd like to find out what :D so
>>>>that i can take it out and apply to vanilla along with reiser4
>>>>        
>>>>
>>>did you see ftp.namesys.com/pub/reiser4-for-2.6/2.6.9?
>>>It contains all things which reiser4 depends on.
>>>      
>>>
>>nice
>>    
>>
>>>If you would like to add reiser4 to vanilla kernel yourself you would
>>>have to add reiser4 patches of mm kernel to vanilla one:
>>>
>>>people/akpm/patches/2.6/2.6.X/2.6.X-mmY/broken-out/reiser4-*
>>>and add the patch i am attaching to this email.
>>>
>>>      
>>>
>>yeah i tried that, however they dont patch against latest vanilla, it
>>would seem the vfs has changed abit.. i just wondered if anyone knew
>>exactly which of the mm patches was needed to make up for this, but, now
>>you gave me that url :) never mind..
>>
>>    
>>
>
>Ah, yes, you are right, there is a patch which rejects.
>But, I guess that if we keep ftp.namesys.com/pub/reiser4-for-2.6/
>uptodate - that would be ok and we would not have to release separate
>patches for vanilla kernel
>  
>
How is this a one step install process for users?  Anything that 
diverges from a one step install process is bad with the amount badness 
proportional to the number of steps.  Minimize the badness.

Give the task to vitaly though.

>
>  
>
>>thanks
>>    
>>
>
>
>
>  
>

