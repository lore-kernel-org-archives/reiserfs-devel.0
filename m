From: Hans Reiser <reiser@namesys.com>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"expressed
 by kernelnewbies.org regarding reiser4 inclusion]
Date: Mon, 31 Jul 2006 20:40:51 -0600
Message-ID: <44CEBF33.4020208@namesys.com>
References: <20060801034726.58097.qmail@web51311.mail.yahoo.com> <44CED777.5080308@slaphack.com> <Pine.LNX.4.63.0607312133080.15179@qynat.qvtvafvgr.pbz> <20060801064837.GB1987@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29382-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060801064837.GB1987@thunk.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Theodore Tso <tytso@mit.edu>
Cc: David Lang <dlang@digitalinsight.com>, David Masover <ninja@slaphack.com>, tdwebste2@yahoo.com, Nate Diller <nate.diller@gmail.com>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Theodore Tso wrote:

>On Mon, Jul 31, 2006 at 09:41:02PM -0700, David Lang wrote:
>  
>
>>just becouse you have redundancy doesn't mean that your data is idle enough 
>>for you to run a repacker with your spare cycles. to run a repacker you 
>>need a time when the chunk of the filesystem that you are repacking is not 
>>being accessed or written to. it doesn't matter if that data lives on one 
>>disk or 9 disks all mirroring the same data, you can't just break off 1 of 
>>the copies and repack that becouse by the time you finish it won't match 
>>the live drives anymore.
>>
>>database servers have a repacker (vaccum), and they are under tremendous 
>>preasure from their users to avoid having to use it becouse of the 
>>performance hit that it generates. (the theory in the past is exactly what 
>>was presented in this thread, make things run faster most of the time and 
>>accept the performance hit when you repack). the trend seems to be for a 
>>repacker thread that runs continuously, causing a small impact all the time 
>>(that can be calculated into the capacity planning) instead of a large 
>>impact once in a while.
>>    
>>
>
>Ah, but as soon as the repacker thread runs continuously, then you
>lose all or most of the claimed advantage of "wandering logs".
>  
>
Wandering logs is a term specific to reiser4, and I think you are making
a more general remark.

You are missing the implications of the oft-cited statistic that 80% of
files never or rarely move.   You are also missing the implications of
the repacker being able to do larger IOs than occur for a random tiny IO
workload which is impacting a filesystem that is performing allocations
on the fly.

>Specifically, the claim of the "wandering log" is that you don't have
>to write your data twice --- once to the log, and once to the final
>location on disk (whereas with ext3 you end up having to do double
>writes).  But if the repacker is running continuously, you end up
>doing double writes anyway, as the repacker moves things from a
>location that is convenient for the log, to a location which is
>efficient for reading.  Worse yet, if the repacker is moving disk
>blocks or objects which are no longer in cache, it may end up having
>to read objects in before writing them to a final location on disk.
>So instead of a write-write overhead, you end up with a
>write-read-write overhead.
>
>But of course, people tend to disable the repacker when doing
>benchmarks because they're trying to play the "my filesystem/database
>has bigger performance numbers than yours" game....
>  
>
When the repacker is done, we will just for you run one of our
benchmarks the morning after the repacker is run (and reference this
email);-)....  that was what you wanted us to do to address your
concern, yes?;-)

>					- Ted
>
>
>  
>

