From: berthiaume_wayne@emc.com
Subject: RE: [PATCH CFT] tons of logging patches
Date: Tue, 4 Jun 2002 11:48:45 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BFAF9@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10504-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mason@suse.com
Cc: reiserfs-list@namesys.com, manuel.krause@mb.tu-ilmenau.de

	Chris, isn't there a danger, remotely, that with data=ordered you
could lose your data? For Ext3FS, if the machine should crash after the
filesystem data is updated but before the metadata is updated, fsck(8) will
reclaim the newly allocated blocks; therefore, the updated file is no longer
correct.
Wayne.

-----Original Message-----
From: Chris Mason [mailto:mason@suse.com]
Sent: Tuesday, June 04, 2002 9:12 AM
To: Manuel Krause
Cc: reiserfs-list
Subject: Re: [reiserfs-list] [PATCH CFT] tons of logging patches


On Mon, 2002-06-03 at 23:28, Manuel Krause wrote:

> 
> So, VMware is stable with it, too, on my well known "heavy-private-test" 
> of it (running Norton SpeedDisk at least twice within a most recent 
> VMware Win98). It doesn't show greatly different timings than to my 
> setup before though having a different disk i/o pattern (due to the 
> missing aa patches)... and me having a reduced RAM from 512to256MB at 
> the moment. And I should be honest to say I can't give exact timings as 
> the important disk contents changed during last weeks. But the 
> disk-access-times/related-to-the-content are definitively _not_ higher 
> than before!

same speed on 1/2 the ram isn't bad ;-)

> 
> > 
> > Great to hear, thanks for trying things out.
> > 
> > data=logging will be the slowest mode for everything except mail servers
> > and write heavy databases (or other apps that hammer on O_SYNC/fsync). 
> > This is because all the data gets written twice, once to log and once to
> > the main disk.  It helps synchronous writes by writing to the log in
> > quick sequential bursts, and then writing back to the main disk in
> > larger chunks.
> 
> Yes, I assumed/learnt that from your very previous explanations. But I 
> don't see the point "slowest", so far, on here.

try dbench, or any streaming write.  It should be roughtly 1/2 as fast
as the default mode.  If it isn't data=journal probably isn't really
activated (it sends a printk on mount about using journaled data mode).

> 
> This is a home/single session ?non?-production system on here. 1 to 2 
> IDE disks, one processor... notebook, you'd remember this setup from my 
>   mails.
> 
> > 
> > data=ordered will usually be fastest for streaming appends to a file. 
> > The rest of the time it will be the same or slightly slower than the
> > default (data=writeback).
> 
> What would be my recommended mount option later then (mentionned in the 
> manpages or on the webpage?!) Mmmh: I see I test that at the moment...

data=ordered will work best for most people.  The performance hit is
very small, and you won't have any more garbage in files after a crash.

> 
> Why is no combo possible? Meant as: Could/would that bring advantages in 
> future?!!

Since there are no userspace transactions, data=journal is only useful
in a very limited set of cases.  The fact that everything is logged
allows me to cheat, and skip some of the steps to keep block allocations
and deallocations safe in the writeback data mode.

intermezzo is the only app that really needs data=journal with the rest
of the FS mounted with some other write mode (for speed).  The patch has
a way for them to enable data logging mode on a single file.

I think I'll forward the patch announcement to the intermezzo list...

-chris

