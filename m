From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: (mostly) solved: reiserfsck 3.6.8 + corrupted filesystem
Date: Sun, 06 Jul 2003 22:17:26 -0400
Message-ID: <pan.2003.07.06.22.17.23.828104.16446@umail.hungrycats.org>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307022231.36007.vitaly@namesys.com> <pan.2003.07.02.19.12.09.969889.20132@umail.hungrycats.org> <pan.2003.07.02.19.12.09.969889.20132@umail.hungrycats.org> <200307031516.44549.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14838-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 03 Jul 2003 07:16:44 -0400, Vitaly Fertman wrote:
> On Thursday 03 July 2003 03:12, Zygo Blaxell wrote:
>> Basically something in the output of pass 0 is different from what is
>> expected based on in-RAM data in pass 1.  The diagnostic message could
>> be (much!) clearer about that, rather than just guessing that I must
>> have "bad memory."
> 
> Ok, I will try to make it clear and any suggestions are appreciated.

Here's a suggestion:  Check the partition tables too.  Then check them
again.  Even if you haven't changed them, maybe someone else did.

I tested the RAM.  I tested the disks individually.  I even tested the
array with badblocks's non-destructive read-write mode.  There were no
errors in the system logs.  Replicating the array onto a set of fresh
disks in a second machine reproduced the problem.  So the problem must be
reiserfsck, right?  Well...

Somehow, one of the disks in my array got slightly repartitioned.  Instead
of a partition from cylinder 1 to N, where N is the number of cylinders on
the disk, I somehow had a partition from cylinder 2 to N+3.  I'm normally
quite meticulous about this--there's no way I would have written a
partition table like that, especially considering that I partition arrays
for RAID using a script so that they're all done exactly the same way.  I
also record all the partition tables after building an array, and the
recorded tables are fine.  I'm totally mystified as to where this rogue
partition table came from.

Apparently the kernel and the drive will happily try to write data to
cylinders N+1..N+3, despite the fact that these are outside the official
capacity of the drive; however, the drive doesn't always read the same
data that was written in this area.  It does read _similar_ data, and it
seems to read identical data immediately after writes until some other
distant part of the disk is written. I suspect this data area is used
internally by the drive for remapped bad sectors or performance monitoring
or some such thing.

The RAM test was OK, of course--nothing wrong with the RAM.  Each
individual disk test was OK, since the kernel uses the disk's reported
capacity instead of the partition table boundaries when testing /dev/hda,
etc.  Even the badblocks read-write test on the whole array was OK,
because the data was written and immediately reread.  The replicated array
was replicated onto same vendor+model disks, so it behaves in exactly the
same way, and of course the partition tables were copied verbatim along
with everything else.

reiserfsck isn't off the hook yet, however--I unpacked the file generated
by debugreiserfs, ran reiserfsck over it, and got a segfault after about
three hours of pass0.  I'm now running under gdb to try to find out where
this happens, and if it happens in reiserfsck 3.6.8 or later.  Fortunately
it's pretty easy to debug a repeatable segfault.  :-P

> Actually in-memory data only are conserned here, they are not written to
> disk and read again, trey all the time in the memory and just a part of
> them will be written to disk at the end of fscking.

Pass0 reads all allocated blocks on the filesystem and makes a list
(actually a bitmap) of blocks that contain valid leaves.   Along the way
pass0 deletes items in leaves containing obviously invalid data, except if
the entire block is deleted during this correction, the entire block is
omitted from the list of valid blocks for pass1.  Pass1 therefore expects
all the pages it reads to be correct, and aborts if it detects something
that isn't.  The code is actually pretty clean about this...I was looking
at it for hours trying to find a bug, and came up empty.  ;-)

In my case, pass0 writes correct data to the drive but the drive some time
later mangles the data.  Pass1 eventually reads invalid data, then blames
memory for the inconsistency.  Well, it's close... :-P

In a slightly different system configuration, the swap partition could
have been affected in a similar way, which would silently rewrite parts of
the reiserfsck's process memory if they were swapped out.
