From: Hans Reiser <reiser@namesys.com>
Subject: Re: [2.4.18]: Reiserfs: vs-2120: add_save_link: insert_item	returned
 -28
Date: Fri, 16 Jan 2004 15:55:26 +0300
Message-ID: <4007DF3E.6010307@namesys.com>
References: <200401091622.41352.lkml@kcore.org>	 <4007A54A.3030005@namesys.com>	 <1074244260.2250.45.camel@tribesman.namesys.com>	 <200401161229.30831.lkml@kcore.org>  <4007DBC6.4040606@namesys.com> <1074257413.2250.53.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16541-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1074257413.2250.53.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Jan De Luyck <lkml@kcore.org>, reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>On Fri, 2004-01-16 at 15:40, Hans Reiser wrote:
>  
>
>>Jan De Luyck wrote:
>>
>>    
>>
>>>On Friday 16 January 2004 10:11, Vladimir Saveliev wrote:
>>> 
>>>
>>>      
>>>
>>>>On Fri, 2004-01-16 at 11:48, Hans Reiser wrote:
>>>>   
>>>>
>>>>        
>>>>
>>>>>Vladimir Saveliev wrote:
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>>>Hello
>>>>>>
>>>>>>On Fri, 2004-01-09 at 18:22, Jan De Luyck wrote:
>>>>>>       
>>>>>>
>>>>>>            
>>>>>>
>>>>>>>Hello list,
>>>>>>>
>>>>>>>Today I discovered I could no longer create files on one of my boxes,
>>>>>>>which still runs 2.4.18 (box is too far away to upgrade right now). It
>>>>>>>gives me 'disk full' messages.
>>>>>>>
>>>>>>>The following message is all over my logs since January 3:
>>>>>>>
>>>>>>>vs-2120: add_save_link: insert_item returned -28
>>>>>>>         
>>>>>>>
>>>>>>>              
>>>>>>>
>>>>>>This is just a warning. You should be able to free some disk space by
>>>>>>removing some files.
>>>>>>
>>>>>>       
>>>>>>
>>>>>>            
>>>>>>
>>>>>>
>At this case we do not return ENOSPC. Operation which failed due to
>ENOSPC was "save link" insertion. The major operation (unlink or
>truncate) just continues without "save links". (save link are used to be
>able to complete removal of unlinked/truncated files on reboot if they
>did not manage to get properly removed/truncated due to unclean
>shutdown).
>
>
>
>
>
>  
>
so it is a real bug which can result in space leaks?

-- 
Hans


