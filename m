From: <doiggl@velocitynet.com.au>
Subject: I have an idea to allow shrinkage of a Reiser4 volume.
Date: Sun, 19 Mar 2017 21:39:05 +1100
Message-ID: <a0531a2488bd81ed6b33b18d17e3328a@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello,

I have an idea to allow shrinkage of a Reiser4 volume.
And I ask help in writing a command line utility for it.

my idea's,example:
- ensure debugfs.reiser4 installed. [debugfs.reiser4] reiser4progs
- check unmounted volume is a Reiser4 formatted partition.
- find the last 'used block' on a unmounted Reiser4 partition [1]
- check block number is greater than >0 and less than < the maximum block
of reiser4 volume size.
- print details of new volume, space unused.
- ask to perform shrink reiser4 volume to nnn.
- if 'y' do volume shrink.
- verify volume details and print new details used/free,


Reason I ask:
Allow shinkage of reiser4 volume to last 'used block' + [n blocks free]
Since no reiser4 blocks moved, no reiser4 metadata changes needed.
Just volume size changes [no blocks moved].
Is this idea logical to ask ?
Thanks
--Glenn

[1] find the last 'used block'.

# debugfs.reiser4 /dev/sdb2  --print-tree | grep -i "NODE"   | grep -v
"NPTR"| cut -d" " -f2  | sed 's/(//'  | sed 's/)//'  |sort -n |tail -1
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

2938354

other info:

Total blocks used:
#################
# debugfs.reiser4 /dev/sdb2  --print-tree | grep -i "NODE"   | grep -v
"NPTR"| cut -d" " -f2  | sed 's/(//'  | sed 's/)//'  |sort -n | wc -l
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

833657
