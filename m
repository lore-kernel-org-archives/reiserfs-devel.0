From: twist <twist@twistrulz.de>
Subject: Re: journal size==0 [reiserfs 3.6, reiserutils 3.x.1b]
Date: Mon, 15 Apr 2002 15:35:57 +0200
Message-ID: <20020415153557.1480b7ff.twist@twistrulz.de>
References: <20020415002651.377f3c5c.twist@twistrulz.de>
	<3CBA155D.1080008@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CBA155D.1080008@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon, 15 Apr 2002 03:48:45 +0400
Hans Reiser <reiser@namesys.com> wrote:

> Thomas Wiedemann wrote:
> 
> >hi reiserfs-developers,
> >
> >i cannot mount my reiserfs partition any more, because of that:
> >
> >super-459: read_super_block: super found at block 16 is within its own log. It must not be of this format type.
> >
> >
> >so, here's the story how i "created" this error and some details:
> >
> >due a hardware failure (the harddisk?), i got some weird error messages:
> >
> >Apr 13 17:32:13 hq kernel: hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> >Apr 13 17:32:13 hq kernel: hdb: dma_intr: error=0x84 { DriveStatusError BadCRC }
> >(...)
> >
> >followed by some filesystem errors:
> >
> >Apr 13 17:33:46 hq kernel: is_tree_node: node level 432 does not match to the expected one 1
> >Apr 13 17:33:46 hq kernel: vs-5150: search_by_key: invalid format found in block 19232. Fsck?
> >Apr 13 17:33:46 hq kernel: vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [1584 1590 0x0
> > SD]
> >...and so on....
> >
> >i had to reboot my pc, the disk was ok, but the partition was dead.
> >so i downloaded the newest reiserfs-utils (3.x.1b) and tried to repair it.
> >the superblock seemed to be screwed up, so...
> >
> ># reiserfsck /dev/hdb1 --rebuild-sb --no-journal-available
> ># reiserfsck --rebuild-tree
> >
> >...did some work on the filesystem, but i'm still not able to mount it, because while rebuilding the superblock, fsck did not make a journal on the device:
> >
> ># debugreiserfs /dev/hdb1
> >
> ><-------------debugreiserfs, 2002------------->
> >reiserfsprogs 3.x.1b
> >
> >
> >Filesystem state: consistent
> >
> >Reiserfs super block in block 16 on 0x341 of format 3.6 with standard journal
> >Count of blocks on the device: 11273605
> >Number of bitmaps: 345
> >Blocksize: 4096
> >Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 1611835
> >Root block: 431
> >Filesystem is cleanly umounted
> >Tree height: 5
> >Hash function used to sort names: "r5"
> >Objectid map size 972, max 972
> >Journal parameters:
> >        Device [0x0]
> >        Magic [0x0]
> >        Size 1 blocks (including 1 for journal header) (first block 0)
> >        Max transaction length 0 blocks
> >        Max batch size 0 blocks
> >        Max commit age 0
> >Blocks reserved by journal: 0
> >Fs state field: 0x0
> >sb_version: 2
> >inode generation number: 0
> >UUID: c0ce572a-1ed0-4827-b72a-8aef5cdb2015
> >LABEL: 
> >Set flags in SB:
> >
> >
> >now, that the journal's size is only one block, mount fails, while fsck claims everything to be alright (mount -o nolog also fails).
> >i don't know if this is a bug in reiserfsck....and maybe there is a way to insert a journal into between the rootblock and the superblock (where the journal was before the crash...)?
> >
> >thanks, thomas.
> >
> >
> >
> bad/misconfigured hardware consequences (and recovering from them) are 
> handled by www.namesys.com/support.html, or by users on the mailing 
> list.   The more people who go to www.namesys.com/support.html, the more 
> I can afford to have Vitaly improve fsck....
> 
> Hans
> 

the information on this partition is not that important that i would pay money for it. i'm just a student trying to fix a harddrive, i just thought the missing journal on a 2.4 kernel and with mount -o nolog not working is something like a bug.

bye, thomas


--
"Windows is the most documented operating system that has ever been."

--Bill Gates
