From: David Greaves <david@dgreaves.com>
Subject: Re: How long will a shrinkfs take?
Date: Fri, 11 Jun 2004 09:29:11 +0100
Message-ID: <40C96D57.2030208@dgreaves.com>
References: <40C8C0EF.7060704@dgreaves.com> <20040610205419.GQ8091@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040610205419.GQ8091@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Alex Zarochentsev wrote:

>On Thu, Jun 10, 2004 at 09:13:35PM +0100, David Greaves wrote:
>  
>
>>Hi
>>
>>I have a 1Tb reiserfs that I want to shrink to 500Gb
>>400Gb of data is used.
>>
>>Any estimates as to how long this will take?
>>Sustained I/O is about 33Mb/s at the fs level, 44 Mb/s at the lv level 
>>and 65Mb/s at the md0 level.
>>    
>>
>
>ReiserFs shrinker reads all tree nodes as fsck does (reiserfsck --check may be
>used for rough estimation) plus shrinker writes relocated nodes (this highly
>depends on how many nodes are above 500GB boundary).
>  
>
OK -  well I know that fsck --check is of the order of minutes rather 
than hours (did that rather too recently ;) )

So if I asume even spread, 50% is above so 200 Gb needs reading + then 
writing so say 1Gb/min = 3-4 hours

OK ta.

BTW, is resizefs safely interruptible? So can I run it for a couple of 
hours, interrupt, fsck, remount and do it again?
(The system's in use and I only get short windows when I can do this 
kind of thing)
I understand that if this happens the fs won't have been resized.

I envisage the behaviour to be:
1 calc new top boundary
2 scan for files (nodes) with data above boundary
3 foreach file
3.1 copy data below boundary
3.2 change node to reflect new position
3.3 mark old space as free
4 set new top boundary

most of the time being spent in 3.

David

>Anyway running reiserfsck --check before shrinking is a good practice.
>
>  
>
>>(I didn't expect the fs to be so slow so I'm going to try a few tuning 
>>params on the new 500Gb space before copying over the data and growing 
>>back to a Tb)
>>
>>Is it proportional to the amount of shrinkage (ie 2 hrs to reduce by 
>>50G, 20 hrs to reduce by 500Gb)
>>    
>>
>
>  
>
>>David
>>    
>>
>
>  
>

