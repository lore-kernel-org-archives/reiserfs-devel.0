From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 bitmap & replication handling
Date: Tue, 20 May 2003 23:54:09 +0400
Message-ID: <3ECA87E1.7070906@namesys.com>
References: <002d01c31efe$5da8b5d0$b300a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14183-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <002d01c31efe$5da8b5d0$b300a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Fred -- Speed Up -- wrote:

>I just read this article about XFS :
>http://www-106.ibm.com/developerworks/library/l-fs9.html
>
>It says XFS uses B+Trees as Reiser4 does, and it uses this structure to store not only the keys, but also the bitmap data and replicates it storage trees to improve scalability and overall wide-disk performance. It also tries to allocate the largest contigous blocks to a file (but Reiser4 does this also), and comes close to raw performance when reading large files. The article concludes XFS is faster than Reiser 
>
well, his words are not quite that strong, and who knows if he is using 
the latest journaling patches but XFS is a very nice filesystem.....

>(3.6 I think, as the article has been published in 2002 by Gentoo CEO Daniel Robbins) with performance tweaks at mount time.
>
Which he does not define, so we cannot reproduce it.

> But how does Reiser4 ?
>  
>
Well, Reiser4 has much fewer seeks than other filesystems usually.  The 
current weakness of Reiser4 is CPU consumption, but our team is cutting 
that down at great speed.  It seems like each team member manages to 
reduce it by >10% a week, and there are 3 of them working actively on 
that.  This is fortunate, because it is still very high.....  I have 
this fond hope that performance will be something very nice by 
LinuxTag.....;-)

>How many times does Reiser replicate 
>
what do you mean, replicate the tree?

>and/or truncate its tree, and what structure has been chosen for bitmap data ?
>
bitmaps.;-) we have some nice little tweaks, like we count the number of 
used bits in every bitmap block so that we don't have to scan full 
blocks, and we hash around if we scan too much, but I have to say that 
bitmaps are nice and simple and work without a lot of code.

>Does Reiser4 divide the disk space in chunks, as XFS and ext2 do ?
>
No.  We experimented a little bit with that, and didn't get clear 
advantages.  My mind is still open though if someone shows me something 
compelling.

>Are you implementing some special features for very large disks,
>
how are they different

> RAID systems
>
Reiser4 will happen to work very well for them without understanding 
them (not entirely a coincidence).  I have as yet to get someone to fund 
tuning for them specifically, though it would probably yield benefits to 
do so.

> and multi-processing hardware 
>

Reiser4 made a massive code investment into fine-grained locking. 

>Is the developement far enough to get an idea of the final performance ? 
>
Reiser4 inconsistently performs very very fast.  We have no doubt that 
we can make that consistent but it is a lot of measuring and tweaking 
and measuring and tweaking.....

>I didn't remember, when do you plan to release Reiser4 ?
>
LinuxTag, July 11, if lucky, we will start our beta.

>
>I'm very interested in those brand new filesystem techniques, for now I think we can consider that XFS and Reiser3 are very close in overall performance. You're saying in the doc you'd like to keep on offering the best performance in the market : are you really that far ?
>
>Fred
>  
>


-- 
Hans


