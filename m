From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 data journalling?
Date: Wed, 03 Sep 2003 02:21:20 +0400
Message-ID: <3F5517E0.6000403@namesys.com>
References: <3F4E3AF9.2060100@tupshin.com>	<16206.16138.72832.920045@laputa.namesys.com>	<3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero>	<3F4E9C6D.2080009@namesys.com> <20030829012322.GJ21352@matchmail.com>	<20030829050857.GA5755@namesys.com> <3F4F91DB.2080900@namesys.com>	<16207.38985.871686.419166@laputa.namesys.com>	<3F4FC8FD.1050303@namesys.com> <m3oey7m2ed.fsf@averell.firstfloor.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15519-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3oey7m2ed.fsf@averell.firstfloor.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andi Kleen <ak@muc.de>
Cc: reiserfs-list@namesys.com

Andi Kleen wrote:

>Hans Reiser <reiser@namesys.com> writes:
>  
>
>>Because atomicity in ext3 basically consists of guaranteeing that the filesystem is consistent, and due to the disk drive implementation 4k blocks are written atomically.  So, if you span more than one block, it is not guaranteed to be atomic.
>>    
>>
>
>I was told most modern disks run with 32-64K blocks internally.
>
This is very interesting, it would explain something that has puzzled me 
for a long time about 64k being the optimal transfer size.

>4K is very unlikely.
>
>Of course they don't always guarantee that a write of such a block
>is atomic, but then they also don't guarantee it for 4K.
>
What they do in the event of power loss is the big unclear for hard 
drives.  Maybe I should ask for government funding to test hard drives 
for what they actually do, and how they handle power loss.;-)   Somebody 
needs to test these folks.....

Most filesystems are designed based around the assumption that ecc on 
the drive will detect failed writes with 4k granularity.  If I remember 
right, some folks on this list have said some things suggesting that for 
some IBM drives a power failure can cause a more than 4k chunk to go 
bad, and that this can be a problem for filesystem consistency.

It would probably be nice for the OS and the drive to use the same block 
size..... or at least interesting to experiment with.

>The only sure way is to wait for the disk telling you it is finished 
>(= use write barriers)  and/or turn the write buffer off.
>Even then you have to hope that the disk firmware doesn't lie to you.
>
>-Andi
>
>
>  
>


-- 
Hans


