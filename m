From: Hans Reiser <reiser@namesys.com>
Subject: Re: Calling stat with millions of files
Date: Tue, 08 Jun 2004 15:10:27 -0700
Message-ID: <40C63953.2040603@namesys.com>
References: <Pine.LNX.4.58.0406071735290.30177@localhost.localdomain>  <40C5E92D.2090101@namesys.com> <1086712717.10973.122.camel@watt.suse.com>  <40C5EDAE.6000707@namesys.com> <1086713475.10973.125.camel@watt.suse.com> <Pine.LNX.4.58.0406081339010.3391@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0406081339010.3391@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ross Skaliotis <mross@rs-net.org>
Cc: reiserfs-list@namesys.com

Ross Skaliotis wrote:

>>On Tue, 2004-06-08 at 12:47, Hans Reiser wrote:
>>    
>>
>>>really afford to do it just for you, sorry.
>>>      
>>>
>>>>You'll get better results with the new block allocator in 2.6.7-rcX-mm,
>>>>but in the end the stat information for the file isn't horribly close to
>>>>the directory entries, and performance won't be perfect.
>>>>
>>>>Hans, I thought reiser4 was going to be good at this kind of thing?
>>>>
>>>>
>>>>        
>>>>
>>>what in reiser4 optimizes accesses to hard links to files whose stat
>>>data is stored in other directories?  Maybe the stat data being stored
>>>near other stat data instead of near file bodies will help,.  Hmmm.
>>>Could be, have to try it to see.
>>>      
>>>
>>He said above that it creates hard links "when it can", not sure what
>>percentage of the time this actually happens.
>>    
>>
>
>Most files have several hard links. Common files shared between many
>backed up computers (windows system files, etc.) can have up to 500 hard
>links.
>
>  
>
>>hardlinks destroy locality of reference for stat data, this is probably
>>your problem.
>>    
>>
>
>So this would be a problem with any filesystem, right? I don't understand
>filesystems nearly as well as others on this list, but am I correct in
>assuming the stat data would stay "near" the original file? If I can make
>my backup system only need to stat original files (which may have hard
>links linked to _them_) would my performance issues go away?
>  
>
In reiser4 it would probably cure it, probably not in reiser3, though it 
might help, and I could be wrong....

>Thanks and sorry for my ignorance,
>
>-Ross
>
>
>  
>

