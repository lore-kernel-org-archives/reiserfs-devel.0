From: robs@op.net
Subject: Re: bug report
Date: Tue, 29 Apr 2003 04:20:44 -0400 (EDT)
Sender: robs@max15g
Message-ID: <Pine.LNX.4.53.0304290246160.662@max15g>
References: <Pine.LNX.4.53.0304281636140.366@max15g> <20030429054902.GA16939@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13893-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030429054902.GA16939@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


Thanks for writing back. :)

> Well, unfortunatelly you provided not enough info at all.

Of course.  I wasn't sure your needs, and rather than write a book,... :)
Firstly- there is no panic here.  I'd love to recover the data, but nothing
is at all critical, etc.  I can see the data on sectors, so I know it's
there and I can harvest anything I care to.  I'm more interested in figuring
out how to do this, and very much hopefully helping you guys. :)

I'll answer in different order-


> What is the kernel version?

2.4.20, 2.4.21-rc1-ac3, 2.5.68


> We'd like to know: what was your problem,
> how did you decide that reiserfs is damaged?

It will not mount.  Mount says: "wrong fs type, bad option, bad superblock
on /dev/hdb1, or too many mounted filesystems."

1) root (/dev/hda2) is Reiserfs, so that works. :)
2) root is only mounted filesystem (so not too many mounted)
3) specified "-t reiserfs" on mount line


> Do you know how you get it damaged?

Brilliant MS "format"- it formatted the WRONG partition.  I don't know how,
partition was different and marked "Linux 83", but leave it to MS.  I looked
at the sectors- it overwrote the MBR and everything.  I fixed the partition
table because I had the info.  "MS Format" didn't do a ton of damage,
though, and I'm hoping to get back some data, but it's not critical. :)
(In the future I will NOT run MS stuff with Linux partitions in the same
system.  I certainly will NOT run any MS "tools" with Linux partitions in
system.  Never had a problem before, but that's good old MS for you.)


> what reiserfsck version do you have?

Tried 2:

3.6.4 - came with "Slackware 9.0", the OS distro on that system.

3.6.7-pre1 - I downloaded and compiled these with gcc 3.2.2, libc 2.3.1, ...


> What steps have you already performed?

ran "reiserfsck" - it wants "--no-journal-available"

That churns and finally seems to say everything is OK. :)  But, it says I
must run "reiserfstune to specify a new journal before mounting it."

ran "reiserfsck --rebuild-sb /dev/hdb1"
ran "reiserfsck --rebuild-sb --no-journal-available /dev/hdb1"

Both say: "Reiserfs with non standard journal found, but there was not
specified any journal dev".

Not sure what to do there- the journal was always internal.

Anyway, tried "reiserfstune --make-journal-standard /dev/hdb1" and that
dumps a bunch of stuff:

---------------------------------------------------------------------

Current parameters:

Filesystem state: consistent

Reiserfs super block in block 16 on 0x341 of format 3.6 with non-standard journal
Count of blocks on the device: 1401663
Number of bitmaps: 43
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 1054508
Root block: 20
Filesystem is cleanly umounted
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 191, max 972
Journal parameters:
	Device [0x343]
	Magic [0xffffffff]
	Size 283145 blocks (including 1 for journal header) (first block 0)
	Max transaction length 1024 blocks
	Max batch size 900 blocks
	Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 0
UUID: d79d6899-0a1c-4349-b159-9e10e9762b65
LABEL:
Set flags in SB:
	ATTRIBUTES CLEAN
Current journal parameters:
	Device [0x343]
	Magic [0xffffffff]
	Size 283145 blocks (including 1 for journal header) (first block 0)
	Max transaction length 1024 blocks
	Max batch size 900 blocks
	Max commit age 30
ATTENTION! Filesystem with non-standard journal found. Continue? (y/n):y
reiserfstune: Can not create standard journal on separated device [0x343]

--------------------------------------------------------------------


> Quote any relevant messages from kernel/reiserfsprogs.

Nothing from kernel.


Tried "-f" options with some of above and got nowhere.  I can't find where
to get the patches you refer to in documentation- for relocatable journal,
etc.

Thanks!!!  Hope my problem helps you and your work. :)

Rob S.



On Tue, 29 Apr 2003, Oleg Drokin wrote:

> Hello!
>
> On Mon, Apr 28, 2003 at 04:40:49PM -0400, robs@op.net wrote:
> > Having difficulty recovering a damaged ReiserFS.
> > Tried stuff- reiserfsck, reiserfstune, etc.  Seems to lead into an infinite
> > loop of things to try but don't work- ie: do x, but x needs y, but y needs
> > z, but z needs x.
> > Not sure what you need to know.
> > "reiserfstune" man page talks about "kernel patched with special
> > 'relocatable journal support' patch"
