From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: reiser4 problems
Date: Wed, 22 Mar 2006 16:36:42 -0600
Message-ID: <1143067002.9624.45.camel@gentoo>
References: <442040FF.4040800@parkheights.dyndns.org>
	 <200603221033.43606.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28319-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603221033.43606.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vitaly@namesys.com
Cc: reiserfs-list@namesys.com, Sergey Ivanov <seriv@parkheights.dyndns.org>

On Wed, 2006-03-22 at 10:33 +0300, Vitaly Fertman wrote:
> Hello,
> 
> On Tuesday 21 March 2006 21:07, Sergey Ivanov wrote:
> > Hi,
> > I am sorry to report problems I had this night at my e-mail server.
> > Grepped reiser4 messages from /var/log/messages are at
> > http://parkheights.dyndns.org/r4log.bz2
> > I have 2 processor system (athlon) with raid5 software array with 5x62.1
> > GB, giving me 248.4GB for use. I have created lvm2 volumes for imap
> > folders there, and also have /usr, /var, /home and other resides on the
> > same raid5, everything formatted reiser4.
> > Yesterday the server stops working, but answer pings. I've rebooted it
> > with magic SysRQ key combinations after forced unmounting and syncing
> > all partitions. But in the night the problems reappear on some of
> > virtual volumes. In the morning I did remount -o ro and fsck.reiser4,
> > all but one volume was O.K, but one required rebuild-fs. Excuse me, I
> > have not saved the first fsck.reiser4 output. After rebuilding fs and
> > then rebooting the system, I've got immediately problems, the filesystem
> > was not accessible, all attempts to get ls of it finished with i/o error
> > messagees. (I have errors in /etc/fstab, the reiser4 volumes has lines 
> > ending with 1 1, not 1 2 as it should be. I'm not sure it attributed to
> > the these  problems).
> > The second fsck.reiser4 once more founded some problems, it's the log:
> > ---
> > [root@parkheights ~]# fsck.reiser4 -y --build-fs /dev/evms/imap-seriv
> > *******************************************************************
> > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> > *******************************************************************
> > 
> > Fscking the /dev/evms/imap-seriv block device.
> > Will check the consistency of the Reiser4 SuperBlock.
> > Will build the Reiser4 FileSystem.
> > ***** fsck.reiser4 started at Tue Mar 21 08:34:40 2006
> > Reiser4 fs was detected on /dev/evms/imap-seriv.
> > 
> > CHECKING STORAGE TREE
> > FSCK: Node (740803): The left delimiting key [29:1(SD):0:2a:0] in the
> > parent node (740782), pos (0/4294967295) does not match the first key
> > [0:0(NAME):0:0:
> > 0] in the node. Fixed.
> > FSCK: The tree height 4 found in the format is wrong. Fixed to 5.
> >         Read nodes 440830
> >         Nodes left in the tree 440830
> >                 Leaves of them 435415, Twigs of them 5323
> >         Time interval: Tue Mar 21 08:34:41 2006 - Tue Mar 21 08:44:54 2006
> > CHECKING EXTENT REGIONS.
> >         Read twigs 5323
> >         Time interval: Tue Mar 21 08:44:54 2006 - Tue Mar 21 08:46:14 2006
> > LOOKING FOR UNCONNECTED NODES
> >         Read nodes 0
> >         Good nodes 0
> >                 Leaves of them 0, Twigs of them 0
> >         Time interval: Tue Mar 21 08:46:14 2006 - Tue Mar 21 08:46:14 2006
> > CHECKING EXTENT REGIONS.
> >         Read twigs 0
> >         Time interval: Tue Mar 21 08:46:14 2006 - Tue Mar 21 08:46:14 2006
> > INSERTING UNCONNECTED NODES
> > 1. Twigs: done
> > 2. Twigs by item: done
> > 3. Leaves: done
> > 4. Leaves by item: done
> >         Twigs: read 0, inserted 0, by item 0, empty 0
> >         Leaves: read 0, inserted 0, by item 0
> >         Time interval: Tue Mar 21 08:46:14 2006 - Tue Mar 21 08:46:14 2006
> > CHECKING SEMANTIC TREE
> > FSCK: Node (762207), item (5), [6f6e9:6e657700000000:6f6eb] (stat40):
> > wrong size (20), Fixed to (21).
> > FSCK: Node (762207), item (5), [6f6e9:6e657700000000:6f6eb] (stat40):
> > wrong bytes (2473), Fixed to (2605).
> > FSCK: Node (773635), item (5), [6f62a:6e657700000000:6f62c] (stat40):
> > wrong size (6), Fixed to (7).
> > FSCK: Node (773635), item (5), [6f62a:6e657700000000:6f62c] (stat40):
> > wrong bytes (628), Fixed to (760).
> > FSCK: Node (773635), item (6), [6f62a:746d7000000000:6f62b] (stat40):
> > wrong size (4), Fixed to (3).
> > FSCK: Node (773635), item (6), [6f62a:746d7000000000:6f62b] (stat40):
> > wrong bytes (312), Fixed to (206).
> >         Found 395956 objects.
> >         Time interval: Tue Mar 21 08:46:14 2006 - Tue Mar 21 09:28:41 2006
> > CLEANUPING STORAGE TREE
> > ...
> > --- (once more, excuse me, I have copied it from xterm while it was
> > 'cleanuping storage tree', so it's not the full log).
> 
> wrong bytes is not a big problem, reiser4 indeed counted them wrongly some 
> time ago, although it seems to be fixed already. 

I recently encountered a wrong bytes issue on 2.6.15.1 with the 2.6.15-1
patch. After a lot of compiling (emerge -eD world in Gentoo), I ended up
with a directory that I couldn't delete.

fsck.reiser4 --check log:

FSCK: Node (21121314), item (10), [10467f6:6c6f63616c6500:10467f7] (stat40):
wrong size (3), Should be (2).
FSCK: Node (21121314), item (10), [10467f6:6c6f63616c6500:10467f7] (stat40):
wrong bytes (182), Should be (100).

fsck.reiser4 --fix log:

FSCK: Node (19374202), item (0): 1 mergable units were found in the extent40
unit. Merged.
FSCK: Node (21121314), item (10), [10467f6:6c6f63616c6500:10467f7] (stat40):
wrong size (3), Fixed to (2).
FSCK: Node (21121314), item (10), [10467f6:6c6f63616c6500:10467f7] (stat40):
wrong bytes (182), Fixed to (100).

After fixing, --check came up clean. It's good to know the bug is
relatively harmless and has been fixed, but is there any way to take
advantage of improvements and bugfixes made in the last two months
without running 2.6.14 or the -mm patchset?

> the only serious problem 
> here is at the beginning of the 'CHECKING STORAGE TREE' pass -- there must 
> not be a key [0:0(NAME):0:0:0].
>  
> > After second fsck, I have unmounted and mounted it read only to save
> > data on ext3 partition and to wait answers and suggestions before using
> > reiser4 once more.
> 
> which reiser4progs version do you use?
> 
> it is already difficult to say why this strange key appeared -- you have
> already run several build-fs runs -- although it may be related to remount 
> (I remember we used to have some problems before) or to fsck --build-fs.
> 
> unmount you fs please and run 'fsck --check' on the unmounted fs -- check 
> that all is right there now.
> 
> which kernel version do you use?
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

