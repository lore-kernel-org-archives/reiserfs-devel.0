From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Snapshot against 2.6.1 released.
Date: Mon, 19 Jan 2004 22:13:51 +0300
Message-ID: <16396.11375.115895.934750@laputa.namesys.com>
References: <16395.60465.989777.981597@laputa.namesys.com>
	<16396.1113.203997.785571@laputa.namesys.com>
	<400C2ABD.20106@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16575-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <400C2ABD.20106@libero.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@libero.it>
Cc: reiserfs-list@namesys.com

Domenico Andreoli writes:
 > Nikita Danilov wrote:
 > > Nikita Danilov writes:
 > >  > Hello,
 > >  > 
 > >  > new snapshot against 2.6.1 kernel is at
 > >  > 
 > >  > http://namesys.com/snapshots/2004.01.19/
 > >  > 
 > >  > look into READ.ME file for details.
 > > 
 > > Please also apply last-minute-fix.diff from there: it fixes some bug
 > > that slipped into snapshot.
 > > 
 > > last-minute-fix.diff should be applied from fs/reiser4:
 > > 
 > > $ cd /somewhere/fs/reiser4
 > > $ patch -p1 < /somewhereelse/last-minute-fix.diff
 > > 
 > > 
 > 
 > ehm.. my existing reiser4 partition is not mountable now that i recompiled 
 > 2.6.1 using latest snapshot. it did not contain anything so i formatted 
 > it, but nothing new happened.
 > 
 > # mkfs.reiser4 /dev/hdc6

Is this mkfs.reiser4 from the 2004.01.19 snapshot?

 > mkfs.reiser4 0.4.20
 > Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by 
 > reiser4progs/COPYING.
 > 
 > Block size 4096 will be used. 
 > 
 > Linux 2.6.1-reiser4 is detected. 
 > 
 > Uuid 81a2b014-f272-4f6e-adad-e323c0cb10eb will be used. 
 > 
 > Reiser4 is going to be created on /dev/hdc6. 
 > 
 > (Yes/No): yes
 > Creating reiser4 on /dev/hdc6...done
 > # mount /dev/hdc6 /mnt/extra2
 > mount: you must specify the filesystem type
 > # mount /dev/hdc6 /mnt/extra2 -t reiser4
 > mount: wrong fs type, bad option, bad superblock on /dev/hdc6,
 >         or too many mounted file systems
 > #

What is in the kernel logs (dmesg, /var/log/messages)?

 > 
 > 

Nikita.
