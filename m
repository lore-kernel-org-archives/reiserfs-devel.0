From: "Rudy L. Zijlstra" <rudy@edsons.demon.nl>
Subject: Re: Marking bad blocks
Date: Sun, 20 Jul 2003 11:17:02 +0200
Message-ID: <3F1A5E0E.6070505@edsons.demon.nl>
References: <20030720033004.GA6519@free.transpect.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030720033004.GA6519@free.transpect.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Whit Blauvelt <whit@transpect.com>
Cc: reiserfs-list@namesys.com

Whit Blauvelt wrote:

>Thanks for any advice on how to actually take care of this problem short of
>throwing out a drive (or going to another file system) just because a couple
>of blocks are bad.
>  
>
In my experience, you are courting a great amount of data loss.

Some HardDisk history (although imprecise on dates):

early 80's: HD was small, producing them difficult, and most had some 
badblocks on them from day 1. Manufacturers would actually tell you 
which blocks were bad on delivery of the disk. The on-disk state was not 
likely to change quickly, and the bad-block list tended to stay stable 
for long preriods of time.

Now we'll skip some time, and keep in mind that with HDs as with other 
things, functionality has moved from the OS into the disk.

current state of HDs:
- HD's are manifold bigger and faster
- HD's incorporate on disk memory caching
- HD's have an extra cylinder (sometimes more than 1) which they use to 
re-map bad-blocks. In other words, the HD contains a sub-system that 
checks whether a block has gone bad and if so, it no longer uses it, but 
in stead uses one from the "hidden" cylinders.

its this last feature that is important in this discussion. From early 
disks on to the current day, some bad blocks on a disk are no point at 
all. It is when they start growing in number that it getting time to 
exchange them. Usually, when the number of bad blocks start growing, it 
goes exponentially. First a slow growth, and the growth increases. I've 
recently had occasion to observe it again on a disk. Luckily not one of 
mine ;-)
This means that with a modern disk (from 5 years ago and later), once 
you start seeing bac blocks you already have at least a complete 
cylinder full of bad blocks, and it is no longer "some bad blocks". It 
also usually means the disk is rather far advanced on the exponential 
curve.... Of course, there are a number of "usually" in this.  Based on 
personal sad disk history, (yes, i have had several disks develop bad 
blocks, and the pattern is rather consistent) I will exchange a disk 
with bad blocks for a new one as soon as i detect bad blocks. If it is 
still within warranty it goes back to the manufacturer post speed.

Now of course you are free to change to an other file system, like for 
example ext2 and maybe you are lucky, and the disk stays stable for 
another year, after that it suddenly develops more bad block, prerhaps 
block 1 on cylinder 1, and then you will likely complain on the ext2 
list that you lost your data. Up to you, but don't expect  commiseration 
from them.

No filesystem will stay consistent, and not lose data, in the face of 
imperfect hardware.

good luck,

Rudy

