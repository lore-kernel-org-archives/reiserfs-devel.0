From: Bruce Israel <israel@tux.org>
Subject: a hosed reiserfs
Date: Fri, 25 Jun 2004 11:52:58 -0400
Message-ID: <20040625115258.A27445@tux.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

OK, I've been hosed.  I had a disk crash, and my ReiserFS /home partition
doesn't mount (/dev/hdf8 on my machine).

When I ran reiserfsck on it, I got an message saying it's a hardware
problem, with an I/O error that it can't read a block (output included
below).

I don't really care about the disk (an 80 GB Western Digital), even though
I bought it within the past year, but I really want to get the data off of
it.

Even though reiserfsck says there's a hardware problem on hdf8, I boot just
fine from that disk (using hdf1 and hdf7, my /boot and / partitions, both
ext3), and I can also successfully mount and read hdf9, another ReiserFS
partion.

I installed a new disk that I'm booting off of until I can figure out how
to deal with this and not screw things further.

I tried to follow the instructions in
http://namesys.com/bad-block-handling.html by copying the partition using
"dd_rescue /dev/hdf8 /home/bad-partition" (where /home is on the new disk).
It ran for a while and created a 4.5 GB file (it's a 20 GB partition, about
15GB used) and then hung my system (completely, couldn't switch VCs, no
other shells responding, etc.).  After powercycling I did it again, and got
the EXACT same behaviour, down to the exact same number of characters
copied into the 4.5GB output file.

It also tried giving dd_rescue that byte count as the starting point, but
that also hung things.

What can I do to recover my files?  Is there something else I can use to
dd_rescue the partition prior to running "reiserfsck --rebuild-tree"?
Maybe incrementing the byte count by 1K and writing in 1K of 0's?  Or
another invocation that would get it to read the data?

Or something else that would get the data back?

Also, if anyone has any advice on *things to avoid* that might potentially
lower the probability of data recovery, I'd appreciate it.  I've been very
cautious in what I do so that I don't exacerbate the problem. Thanks.

Bruce

======== reiserfsck output

reiserfsck 3.6.11 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/hdf8
Will put log info to 'check.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):###########
reiserfsck --check started at Fri Jun 11 00:15:18 2004
###########
Replaying journal..
0 transactions replayed

The problem has occurred looks like a hardware problem.
If you have bad blocks, we advise you to get a new hard
drive, because once you get one bad block that the disk
drive internals cannot hide from your sight, the chances
of getting more are generally said to become much higher
(precise statistics are unknown to us), and this disk drive
is probably not expensive enough for you to risk your time
and data on it. If you don't want to follow that advice,
then if you have just a few bad blocks, try writing to the
bad blocks and see if the drive remaps the bad blocks (that
means it takes a block it has in reserve and allocates it
for use for requests of that block number).  If it cannot
remap the block, this could be quite bad, as it may mean
that so many blocks have gone bad that none remain in 
reserve to allocate.

bread: Cannot read the block (4161536): (Input/output error).


******************************************************
* Warning: The dma on your hard drive is turned off. *
* This may really slow down the fsck process.        *
******************************************************

