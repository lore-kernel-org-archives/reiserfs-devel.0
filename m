From: Hans Reiser <reiser@namesys.com>
Subject: Re: Silly question, defrag
Date: Fri, 05 Apr 2002 19:07:36 +0400
Message-ID: <3CADBDB8.3000809@namesys.com>
References: <Pine.LNX.4.44.0204050840330.6398-100000@dragon.inside.ntisys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Benjamin Scott <bscott@ntisys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Benjamin Scott wrote:

>On Fri, 5 Apr 2002, at 12:31am, Ross Vandegrift wrote:
>
>>>I think it would seem likely that, once a filesystem does become fragmented,
>>>performance is going to suck mud.
>>>
>>I'm curious though - shouldn't the elevator read algorithms take care of
>>this, for the most part?  If you wait to do a read until you have a few,
>>and read sequentially across the disk, you won't be hit with any seeks.
>>
>
>  I am no expert, but I suspect there is only so much the elevator can do.  
>For a moderately small read, I image your scenario would work.  But given a
>larger read and enough fragmentation, you are going to have to seek all over
>the place.  Sure, you could increase the wait time in the elevator, and use
>tons of buffers to re-order reads, but you will eventually start spending so
>many resources on the elevator that you are back to a performance problem
>again.
>
Actually, the larger the read, the better the elevator can compensate. 
 The problem is that if you do a whole bunch of separate reads of a 
whole bunch of files, and you wait for each read to complete before 
doing the next one, the elevator cannot do a good job.  Also, if you 
have data you don't want to read interleaved with what you do want to 
read, then your transfer rate will be decreased.

Hans


