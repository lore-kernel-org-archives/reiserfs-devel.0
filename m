From: Hans Reiser <reiser@namesys.com>
Subject: Re: Calling stat with millions of files
Date: Tue, 08 Jun 2004 09:58:31 -0700
Message-ID: <40C5F037.3040807@namesys.com>
References: <Pine.LNX.4.58.0406071735290.30177@localhost.localdomain>	 <40C5E92D.2090101@namesys.com> <1086712717.10973.122.camel@watt.suse.com>	 <40C5EDAE.6000707@namesys.com> <1086713475.10973.125.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19095-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1086713475.10973.125.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Ross Skaliotis <mross@rs-net.org>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Tue, 2004-06-08 at 12:47, Hans Reiser wrote:
>  
>
>>really afford to do it just for you, sorry.
>>    
>>
>>>You'll get better results with the new block allocator in 2.6.7-rcX-mm,
>>>but in the end the stat information for the file isn't horribly close to
>>>the directory entries, and performance won't be perfect.
>>>
>>>Hans, I thought reiser4 was going to be good at this kind of thing?
>>>
>>>
>>>      
>>>
>>what in reiser4 optimizes accesses to hard links to files whose stat 
>>data is stored in other directories?  Maybe the stat data being stored 
>>near other stat data instead of near file bodies will help,.  Hmmm.  
>>Could be, have to try it to see.
>>    
>>
>
>He said above that it creates hard links "when it can", not sure what
>percentage of the time this actually happens.
>
>-chris
>
>
>
>
>  
>
Probably reiser4 will indeed do much better at this.  Wish I had more 
guys working on the debugging.....;-)
