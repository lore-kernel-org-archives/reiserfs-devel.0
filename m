From: Russell Coker <russell@coker.com.au>
Subject: non volatile ram devices
Date: Wed, 4 Dec 2002 20:59:35 +0100
Message-ID: <200212042059.35300.russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-ide-arrays@lists.math.uh.edu
Cc: ReiserFS <reiserfs-list@namesys.com>

I have some servers that are giving inadequate disk performance for Maildir 
mail spools.  They are running kernel 2.4.19 (2.4.20 upgrade is planned) and 
using ReiserFS for everything that's important.

At this stage it is impossible for me to replace disks, RAID controllers, or 
anything else really significant.

What I am thinking of doing is using a kernel that supports data journalling 
which should increase performance, but still probably won't give me enough.  
So I am thinking of using an "external journal" (or using software RAID to 
put the part of the partition containing the journal on a different device).

The device containing the journal would be something much faster than physical 
media.  I have been doing some research on non-volatile memory devices.  I 
only found one company producing disks that are RAM based with battery 
backup, and they seem to start at $10K (too expensive - probably because they 
are much larger than I need, I need 128M at most, they provide 2G).  I found 
many companies selling flash memory, but that only takes a million writes 
(that'll last about an hour for the use I plan).  I found one company selling 
PC-Card devices that have two batterys for backup, but that requires getting 
a PCI controller for PC-Card's (something I haven't tried before).

Does anyone know of an affordable ($1000 or less) device that can survive 
unexpected power outages of at least 24 hours duration, can commit a write in 
less than 1ms, supports unlimited writes, and connects to a IDE or SCSI bus 
(or PCI if there's a suitable Linux driver).

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

