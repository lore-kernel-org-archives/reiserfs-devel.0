From: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>
Subject: Re: Partial data loss with reiserfs3
Date: Wed, 16 Feb 2005 18:10:05 +0200
Message-ID: <1108570205.4213705d41816@webmail.vu.lt>
References: <200502161622.06930.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502161622.06930.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,

Cituojant Vitaly Fertman <vitaly@namesys.com>:

> (1) copy NTFS -> ext3
> (2) shrink NTFS
> (3) reboot

> > At this point the disk has, in order of physical layout: /dev/hda5
> > (NTFS), 4GB /dev/hda6 (no FS), 2GB /dev/hda7 (reiser).
> 
> was hda7 reiserfs or ext3 ??

Following history as you have written it, it was ext3. There were
following extra steps, that I have skipped, because at the end of them
I didn't have any problems with my data.
(3.1) create /dev/hda6 as ext3
(3.2) copy data from /dev/hda7 to /dev/hda6
(3.3) delete /dev/hda7
(3.4) find out that ext3 move/resize is unsupported
(3.5) create /dev/hda7 reiser
(3.6) copy data from /dev/hda6 to /dev/hda7

At this point I had hda7 reiser.

> (4) create reiserfs on former NTFS, between NTFS and ext3
> (5) copy ext3 -> reiserfs

> > It is possible that I had created, copied, destroyed partitions
> > since last boot - but no repartitioning.
> 
> this is not clear: created, destroyed partitions means
> repartitioning,
> changing parittion table means repartitioning. Do I understand
> correctly
> that you mean create, copy, destroy filesystems here?

Right, I meant filesystems, not partitions. Sorry.

> (6) fdisk: remove hda7, remove hda6, create large hda6;
> (7) reboot

> > [root@laurynas-pc ~]# resizefs.reiserfs -f /dev/hda6 +3G
> 
> 3G just looks too large, there was only 2G hda7 as you have
> mentioned.
> right?

Right. I have specified a value knowingly too big together with '-f'
option so that fs is resized to the maximum possible size (which is
about, but not exactly, 2G). 

> (8) rezise.reiserfs
> (9) reboot
> (10) login failed
> (11) lots of fs corruptions.
>  -- some lost file StatDatas 
>  -- some wrong delimiting keys
>  -- some unformatted blocks are used more then once
>  -- 1 formatted block is used more then once 
>  -- many broken bitmap blocks
> 
> when you run resizer, has it ever asked for confirmation?
> like 'Do you want to continue? [y/N]:'

I do not remember well, but I think there wasn't any serious warning.
If
there was a warning like "You specified +3G, I can resize only to +2G,
continue?" or similar, then I had accepted it. I would have stopped on
any more serious warning or warning that I do not understand well.

> are you sure you have the relable memory? would you test it?

The system generally is stable and GCC, being the notorious RAM
checker,
compilations do not SIGSEGV. I think I will arrange memcheck86 run to
be sure.

> the reason of the problem is not clear. resizer on expand writes only
> 
> to _new_ bitmap blocks and overwrites only super block, and it does 
> not touch the fs storage tree.
> 
> so you can try to recover from the whole partition on the copy. Have
> 
> you made fs/partition backup before rebuild-tree (probably fdisk)? 
> If no, make a copy of the hda6 partition and run
> 	reiserfsck --rebuild-tree -S <hda6-copy> -l logfile
> if yes, copy it back to hda6 and run on hda6.

I don't partition backup before rebuild-tree. I'll make one now, but it
will take some time, as free space is not readily available. I'll reply
later with results.

--
Thanks,
Laurynas

