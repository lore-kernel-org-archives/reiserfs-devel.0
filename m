From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: ReiserFS problems
Date: Wed, 6 Aug 2003 18:20:55 +0200
Message-ID: <20030806182055.A28562@bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: copy@harddisk-recovery.nl


Hi,

We're using reiserfs on a large (640Gb) raid disk. 

Reiserfs messed up our filesystem again (one file gives us "permission
denied" when we try to remove it). So when we had the system in
single-user mode because of a hardware change (another 600G raid
partition). We decided to run reiserfsck...

Because I seem to remember that without the --rebuild-tree this
problem doesn't go away, we decided to run with the --rebuild-tree
option immediately. After some "pondering" it mentionted it was going
to read some 137 million blocks. We were impressed with the speed at
which it was doing that: 130Mbytes per second. But then we realized
that was going to take quite a while. I just did the math, and it's
going to take another 2 hours. (which is optimistic as the disk
doesn't do 130M per second at the end, but only just over 70Mbytes per
second)

A "surface scan" needs to read all the datablocks. But an fsck
doesn't. At least that's the normal case.

As we were not going to be here in 2 hours, and we still have some
work to do, we decided that we would be able to live with the "non
removable file" for some more time, and that we'd run the fsck
later. So we hit control-C on the fsck.

But now mounting the filesystem gives us: 

ReiserFS version 3.6.25
reiserfs: checking transaction log (device 09:00) ...
is_tree_node: node level 0 does not match to the expected one 65534
vs-5150: search_by_key: invalid format found in block 0. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [1 2 0x0 SD]
Using r5 hash to sort names
is_tree_node: node level 0 does not match to the expected one 65534
vs-5150: search_by_key: invalid format found in block 0. Fsck?
vs-2140: finish_unfinished: search_by_key returned -2

and fsck without --rebuild-tree gives us that an unfinished
--rebuild-tree was in progress. So we've restarted the tree-rebuild.


Question: If it is reading all datablocks, I'm guessing that it is
looking for the magics that build up the filesystem. We're a
datarecovery company. We probably don't have any current
datarecoveries of people with Reiserfs on their disk. But if we had a
disk-image with a valid (or not) Reiserfs on it, would it link that
into our filesytem?

Anyway, when I first started out with Reiserfs, it didn't support > 2G
files (or was it 4G?) I had to patch the kernel and (irreversably!) 
upgrade the on-disk format. 

We've noticed horrible slowdowns when the filesystem is > 90% full. It
turns out that when a block group is more than 90% full reiserfs will
prefer a different block group. i.e. it is ALWAYS switching block
groups when the whole disk is > 90% full. Something like that. When we
report something like that it's always: Ah, yes, that's an old bug
we've fixed it. Use patch.....

Well, FYI, this is the last incident we have with Reiserfs, and we'll
move on to something that's a bit more mature. Feel free to continue
to work on your toy filesystem, but we're no longer available for
testing it. I'm sorry. 

Good luck!

			Roger. 

-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
