From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: Thu, 13 Jun 2002 00:32:07 +0200
Message-ID: <3D07CBE7.5080701@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny>	<3CFC1CB5.8040102@mb.tu-ilmenau.de>	<1023157228.31475.38.camel@tiny> 	<3CFC33F2.7080009@mb.tu-ilmenau.de>	<1023196345.31682.81.camel@tiny> <3CFE7EFB.6080203@mb.tu-ilmenau.de> 	<3CFE8234.7010006@mb.tu-ilmenau.de> <1023322167.2920.772.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/06/2002 02:09 AM, Chris Mason wrote:
> Ok, ftp.suse.com/pub/people/mason/patches/data-logging has my latest
> updates, which have more optimizations for many threads all doing
> synchronous transactions.
> 
> -chris
> 

Mmh. I recompiled with the new one when it appeared on the server and 
kept the kernel append line with the obvious problem not to be able to 
easily reboot to my ext2 maintenance partition.

I had some disappearing files/dirs from /lib/modules/* and from 
somewhere within /var/* the second time now. First occurrence is about 6 
days ago. That takes action within a good uptime (I mean: not at startup 
or upon special programs' interaction).

Jun 12 20:52:48 firehead kernel: is_leaf: item location seems wrong 
(second one): *3.6* [5273 5274 0x1 IND], item_len 4, item_location 2120, 
free_space(entry_count) 0
Jun 12 20:52:48 firehead kernel: vs-5150: search_by_key: invalid format 
found in block 8422. Fsck?
Jun 12 20:52:48 firehead kernel: vs-13070: reiserfs_read_inode2: i/o 
failure occurred trying to find stat data of [5199 261934 0x0 SD]
Jun 12 20:52:48 firehead kernel: is_leaf: item location seems wrong 
(second one): *3.6* [5273 5274 0x1 IND], item_len 4, item_location 2120, 
free_space(entry_count) 0
Jun 12 20:52:48 firehead kernel: vs-5150: search_by_key: invalid format 
found in block 8422. Fsck?
[...] <- many many more
Jun 12 20:54:46 firehead kernel: vs-13070: reiserfs_read_inode2: i/o 
failure occurred trying to find stat data of [5199 261934 0x0 SD]
Jun 12 20:54:46 firehead modprobe: modprobe: Can't open dependencies 
file /lib/modules/2.4.19-pre9/modules.dep (Permission denied)


I then needed to do a reiserfsck --rebuild-tree, as suggested by most 
recent reiserfsck (3.x.1c-pre4), the 3.x.1b-one said, it was fixable by 
--fix-fixable, but I then decided to use the latest. And then I had to 
adjust the lost&found manually. -- Huh, that took a long time, but 
nothing's missing, if I experience my system correctly now.

My system/partitions still look like the recently posted setup:
  Kernel.2.4.19-pre9
  ReiserFS.pending.01..03,05 (rest doesn't cooperate cleanly)
  ReiserFS.mason.01..03 (most recent)
  rml.preempt-kernel (maybe slightly modified for this setup)

/ mounted -o noatime,notail,data=ordered
and from applied lilo.conf: append = "... rootflags=data=ordered"


Thanks, but the term "speedup" seems to be relative for me for now,

Manuel


