From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 03:12:33 +0300
Message-ID: <3E499171.8080201@namesys.com>
References: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au> <3452483515.20030212001747@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3452483515.20030212001747@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Anders Widman wrote:

>>>I've used ReiserFS in the past, but have also used ext3 on my
>>>user's important
>>>data (/home) after a good chunk of one drive was converted to
>>>sparse/null files due to a screwup stemming from no 'badblocks' support
>>>in reiserfs.  Since then, i've used ext3 as well as Reiser but recently
>>>      
>>>
>
>  
>
>>I can't comment on your experience, but personally if I have a drive with
>>any number of badblocks (which are showing up to the fs layer, not invisibly
>>re-mapped by the drive) then I take the drive back and get a replacement, or
>>bin the drive.
>>    
>>
>
>However,  the FS SHOULD support handling of bad blocks/clusters at the
>FS  layer,  even  while running in a production system. Bad blocks can
>pop  up  at any give time for no particular reason, and it is at these
>times  you  (we) need a strong and reliable filesystem that can handle
>and logically remap broken blocks/sectors.
>
>Sure,  a  disk  with physical errors should be replaced, but until you
>find out about the error on the drive the FS HAS TO HANDLE these kinds
>of problems.
>
> - Anders
>
>
>
>
>
>  
>
We have gotten better at this over time.  There was a point in time when 
some of our guys reviewed all the bad block handling.  We still find 
cases where we could be better though. 

For some users it would be better to boot to a corrupted filesystem 
because running fsck is more of a problem than putting their data at 
higher risk.  For datalogging, it is probably conceivable to just toss 
the journal and lose the more recent updates to it.  For the default 
metadata journaling, this just does not seem prudent.

I really prefer making users understand that they have a problem they 
need to do something about.  This is just my style.  I want them to fail 
to boot, and after some effort learn that there is this thing called 
fsck, and dd_rescue, and that it is time to buy another hard drive and 
chuck their current one.  It would be best though if they were given 
detailed instructions about how they need to do this when the code hits 
that bad block.  Vitaly, please work on that.

If we handle the journal block error without downtime, the user will 
never chuck the hard drive, and that is bad in the longterm.

-- 
Hans


