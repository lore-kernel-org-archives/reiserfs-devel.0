From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Tue, 06 Jun 2006 17:42:24 -0700
Message-ID: <448620F0.9070505@namesys.com>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero>	<1149604706.6389.40.camel@tribesman.namesys.com>	<20060606153035.GF10672@HAL_5000D> <4485D69B.1090608@namesys.com> <20060607001323.GG10672@HAL_5000D>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060607001323.GG10672@HAL_5000D>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Clay Barnes wrote:

>On 12:25 Tue 06 Jun     , Hans Reiser wrote:
>  
>
>>Clay Barnes wrote:
>>
>>    
>>
>>>On 18:38 Tue 06 Jun     , Vladimir V. Saveliev wrote:
>>> 
>>>
>>>      
>>>
>>>>Hello
>>>>
>>>>On Tue, 2006-06-06 at 09:44 -0400, Tom Vier wrote:
>>>>   
>>>>
>>>>        
>>>>
>>>>>On Tue, May 23, 2006 at 11:51:02AM -0400, Tom Vier wrote:
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>>>It seems that both r4 and xfs allow a large number of pages to be dirtied,
>>>>>>before queuing them for writeback, and this has a negative effect on
>>>>>>throughput. In my test (rsync'ing ~50gigs of flacs), r4 and xfs are almost
>>>>>>10 minutes slower than jfs.
>>>>>>       
>>>>>>
>>>>>>            
>>>>>>
>>>>>Just to follow up on this (i've been too busy lately), that's how delayed
>>>>>allocation works. It waits til the vm forces writeouts.
>>>>>
>>>>>In my case of copying large files from a slower drive, the delayed allocation
>>>>>of r4 and xfs is stalling reads from the source, since neither will write
>>>>>until the vw forces it.
>>>>>
>>>>>Is there a way in r4 to force sync a mount every so often, ala flushd? 
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>reiser4 has an option for that.
>>>>mount -o tmgr.atom_max_age=N
>>>>N is decimal number of seconds. Changes older than N will be forced to
>>>>commit.
>>>>   
>>>>
>>>>        
>>>>
>>>This may have been mentioned before, but perhaps there could be a
>>>"trickle-out" option along the lines of "if the hard drive is idle (and
>>>optionally only if it's spun up), slowly write out the changes to the
>>>disk structure." 
>>>
>>>      
>>>
>>Yes, I will take a patch to do the above as it would be good, but I am
>>    
>>
>I wish I had the skills to do so.  Perhaps after a few more C classes
>and my next degree. :-/
>  
>
When we get our wiki going, we should create a desired features page,
and maybe you can add this to that.

Someday we will surely code this, but when I cannot today say.


