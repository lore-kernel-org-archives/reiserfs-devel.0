From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Fwd: Re: another seriously corrupt ext3 -- pesky journal
Date: Mon, 18 Aug 2003 13:20:33 -0700
Message-ID: <20030818202033.GC10320@matchmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15369-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Here's the full origional message from tso...

----- Forwarded message from Theodore Ts'o <tytso@mit.edu> -----

From: Theodore Ts'o <tytso@mit.edu>
To: Erez Zadok <ezk@fsl.cs.sunysb.edu>
Cc: ext3-users@redhat.com
Subject: Re: another seriously corrupt ext3 -- pesky journal
User-Agent: Mutt/1.5.4i
Date: Mon, 18 Aug 2003 14:13:54 -0400

On Mon, Aug 18, 2003 at 12:39:46PM -0400, Erez Zadok wrote:
> The power failure on Thursday did something evil to my ext3 file system (box
> running RH9+patches, ext3, /dev/md0, raid5 driver, 400GB f/s using 3x200GB
> IDE drives and one hot-spare).  The f/s got corrupt badly and the symptoms
> are very similar to what Eddy described here:
> 
> 	https://www.redhat.com/archives/ext3-users/2003-July/msg00015.html
> 
> That is, nearly everything I try results in and error such as
> 
> 	"Invalid argument while checking ext3 journal for /dev/md0"

What probably happened is that the power failed while you were writing
out the inode table, and the memory failed before the DMA engine and
hard drive did, since DRAM tends to be more sensitive to voltage drops
that other parts of the system.  As a result, random garbage got
scribbled all over the disk.  (Ted 's observation: PC Class hardware
is sh*t.)

Normally, this isn't a problem, since the ext3 journal contains full
backups of recently written data blocks.  (As opposed to filesystems
that use soft update or logically journaled filesystems, which are
even more fragile in the face of cheap hardware that scribble random
garbage on power failure.)  However, this is not true when the first
part of the inode table is scribbled upon, such that the journal inode
can not be found.  

Given that this sort of failure has been reported at least 2 or 3
times, now, it's clear we need to address this vulnerability, probably
by keeping a backup copy of the journal inode (or at least the journal
data blocks) in the superblock, so it can survive this particular
lossage mode.

> Ted answered here:
> 
> 	https://www.redhat.com/archives/ext3-users/2003-July/msg00035.html
> 
> and suggested the last ditch approach using mke2fs -S to reinitialize the
> superblock and group descriptors.  After trying all sort of "safe" methods
> to recover the files, I have tried the -S option as follows:
> 
> # mke2fs -j -b 4096 -S /dev/md0
   ....
> Creating journal (8192 blocks): mke2fs: File exists 
>  while trying to create journal
> ----------------------------------------------------------------------------

Yeah, what happened here is that the -S option does not clear the
inode table.  So when it tried to create the journal inode, it found
that there was something there already (but probably garbaged) and
then bombed out.

> And once again got this error wrt the journal.  Note that before I even
> tried this -S procedure, I tried to simply turn off the has_journal bit
> using tune2fs: didn't help.  (I'm willing to lose the info in the journal,
> as long as I can get the rest of my large f/s.)  But tune2fs and friends
> gave me a chicken-and-egg error about the invalid arg wrt the journal, while
> trying to turn it off (duhh).

You could have turned it off using debugfs, but up until now it's not
something that I've encouraged because of concerns that there might be
real data loss if it was too easy for users to disable the journal.

> Now I was able to start "e2fsck -b 71663616 -B 4096 /dev/md0".  It's been
> running for a couple of hours already.  Of course, it's discovering all
> sorts of wonderful new events and spewing messages I've never even seen
> before. 1/2 a :-)

Yup.  Some of the damage was caused by not replaying the journal
before running e2fsck, and some was done probably by the power failure
causing garbage to be scribbled on the disk.

> Anyway, my hypothesis now is that the f/s in question may have just had a
> really really bad journal inode on it that was preventing anything else from
> happening, and that perhaps I shouldn't have tried "mke2fs -S" above had I
> been able to just nuke the pesky journal (it might have prevented further
> corruption that fsck is now "fixing").

Your hypothesis was right.  Whether you nuked the journal by using
debugfs or y using mke2fs -S probably wouldn't have made any
difference, however.

> The good news is that prior to experimentation, I have made a dd backup of
> /dev/md0 (400GB) onto a file on another file server (1.5T), so I can dd it
> back onto my real /dev/md0 if need be.  Alternatively, I can make a second
> copy of that backup file, use losetup on the second copy, and then
> experiment.
> 
> Questions:
> 
> 1. Is there any reason why I couldn't experiment with e2fsprogs binaries on
>    a f/s dd image mounted over /dev/loopN?  I.e., will it behave the same as
>    a disk device as far as e2fsprogs are concerned?

No reason.  The e2fsprogs binaries don't need to operate on a block
device.  You can just point it at an dd image directly.

> 2. If my assertion is correct that most of my f/s is intact but the journal
>    is FUBAR, I need to find a way to force fsck to ignore the journal no
>    matter what.  Is there such a tool or option to some tool?  Is there a
>    way I could simply scan the disk and truncate the journal file, or turn
>    off the has_journal bit w/o touching the rest of the f/s?

You can use debugfs's feature command to turn off the has_journal bit
as follows:

debugfs -w /dev/hdaXX
debugfs: features ^has_journal
debugfs: features ^needs_recovery 
debugfs: quit

Hmm.... this will work unless the group descriptors are so badly
damaged that debugfs refuses to touch the superblock.  You can open it
in catastrophic mode, but right now as a safety precaution, you' re
not allowed to open the filesystem in read/write mode when in
catastrophic mode.  I can remove this restriction if we add some more
safety checks that will prevent debugfs from doing more damage when
opened in read/write catastrophic mode, at the moment, debugfs has
been written with a "first do no harm" principle.

Ultimately, though, it's probably more important to add a backup copy
of the journal inode to avoid needing to play games like this in the
first place, and to allow e2fsck to recover from these situations
automatically.

						- Ted


_______________________________________________
Ext3-users mailing list
Ext3-users@redhat.com
https://www.redhat.com/mailman/listinfo/ext3-users


----- End forwarded message -----
