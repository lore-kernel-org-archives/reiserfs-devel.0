From: Michael James <Michael.James@csiro.au>
Subject: How to set a reiserfs partition to get an occasional fsck?
Date: Fri, 30 Jan 2004 15:15:10 +1100
Message-ID: <200401301515.10852.Michael.James@csiro.au>
Reply-To: Michael.James@csiro.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

While the new logging filesystems are a great improvement
 my experience is that they can't survive forever in the real world
 without an occasional rebuild or fsck.

The suse and other lists have warnings by people burnt by reiserfs.
I haven't (yet) lost any data but have had some scary times.

This hasn't been bugs in reiserfs (3.6) itself
 as most instability was tracked to (very marginally) flakey RAM.

However while the glitches were caused by corrupt RAM
 they left me with faults in the filesystem,
 faults that persisted across reboots.

These included un-list-able and un-cat-able files.
ie: read or ask the size of that file
 and it's bye-bye to that terminal.
It made the whole system unuseable
 as processes "trod on the cracks" and hung.
Backups? Hah, not with that file in the partition.

So I think a lot of bad press stems from the misconception
 that any filesystem can avoid bitrot forever without an fsck.
But this is painful to do by hand, I have to boot a rescue system
 and run reiserfsck by hand, to do the root and system partitions.

How can I get back the old behaviour an fsck happening
 during reboot every x reboots or y days?

Or,  how can I trigger an "fsck reboot"?

TIA, michaelj

PS:	I've just realized I can do it by adding an fsck
	  into the linuxrc script of a cooked initrd image.
	That would give me an "fsck boot" option in grub.
	Comments?

-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

