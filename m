From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Sun, 27 Jul 2003 16:38:23 +0400
Message-ID: <3F23C7BF.8040208@namesys.com>
References: <3F1EF7DB.2010805@namesys.com> <1059062380.29238.260.camel@sonja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059062380.29238.260.camel@sonja>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Egger <degger@fhm.edu>
Cc: linux-kernel@vger.kernel.org, reiserfs mailing list <reiserfs-list@namesys.com>

Daniel Egger wrote:

>Am Mit, 2003-07-23 um 23.02 schrieb Hans Reiser:
>
>  
>
>>In brief, V4 is way faster than V3, and the wandering logs are indeed 
>>twice as fast as fixed location logs when performing writes in large 
>>batches.
>>    
>>
>
>How do the wandering logs compare to the "wandering" logs of the log
>structured filesystem JFFS2? Does this mean I can achieve an implicit
>wear leveling for flash memory? 
>
Forgive me for answering your question with a question, but, wouldn't 
you want to do it at the block device layer?  If no, then it would not 
be hard to code a block allocation plugin for it.  Probably the main 
problem would be with the super block and bitmaps, which have fixed 
locations (and are written twice but we don't normally care because they 
are small and insignificant to performance.)

>
>  
>
>>We are able to perform all filesystem operations fully atomically,
>>while getting dramatic performance improvements.  (Other attempts at
>>introducing transactions into filesystems are said to have failed for
>>performance reasons.)
>>    
>>
>
>How failsafe is it to switch off the power several times? When the
>filesystem really works atomically I should have either the old or the
>new version but no mixture.
>
It is safe.

> Does it still need to fsck or is the
>transaction replay done at mount time?
>
mount time.

> In case one still needs fsck,
>what's the probability of needing user interaction? 
>
0, but an application can still write to two files, and if it does not 
use our atomic infrastructure (at this time none of them do;-) ), the 
two separate files will not be certain to be updated as one atom atomically.

>How long does it
>need to get a filesystem back into a consistent state after a powerloss
>(approx. per MB/GB)?
>
I don't have numbers, someone else will have to answer/measure it for you.

>
>Background: I'm doing systems on compactflash cards and need a reliable
>filesystem for it. At the moment I'm using a compressed JFFS2 over the
>mtd emulation driver for block devices which works quite well but has a
>few catches...
>
>  
>


-- 
Hans


