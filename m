From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: reiser fs slow on mksf and mount
Date: Mon, 29 Aug 2005 12:44:43 -0400
Message-ID: <1125333883.5544.101.camel@localhost.localdomain>
References: <1125074717.5549.44.camel@localhost.localdomain>
	 <430F4B91.7030909@namesys.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430F4B91.7030909@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs <reiserfs-list@namesys.com>

just reproduced this on a 18GB SCSI disk. mount is still slow. so not
related to RAID but only with bitmap. i just do modprobe aic7xxx, mkfs,
then do mount, so the disk should be spin up.

ming


--------------------------------------

[root@sc420 root]# time mkfs.reiserfs -ff /dev/sdh1
mkfs.reiserfs 3.6.13 (2003 www.namesys.com)

...

Guessing about desired format.. Kernel 2.6.12.4 is running.
Format 3.6 with standard journal
Count of blocks on the device: 4421872
Number of blocks consumed by mkreiserfs formatting process: 8346
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: b3de310a-b494-4415-a921-090d94f2f211
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

Tell your friends to use a kernel based on 2.4.18 or later, and
especially not a
kernel based on 2.4.9, when you use reiserFS. Have fun.

ReiserFS is successfully created on /dev/sdh1.

real    0m5.018s
user    0m0.028s
sys     0m0.134s

[root@sc420 root]# time mount /dev/sdh1 t

real    1m3.608s
user    0m0.000s
sys     0m0.052s

[root@sc420 root]# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda5             20161172   6417940  12719092  34% /
/dev/sda3               194449     18990    165419  11% /boot
none                    127544         0    127544   0% /dev/shm
/dev/sdh1             17686944     32840  17654104   1% /root/t

[root@sc420 root]# rpm -q reiserfs-utils
reiserfs-utils-3.6.13-1


On Fri, 2005-08-26 at 21:04 +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> Ming Zhang wrote:
> > Hi, folks
> > 
> > I am not sure if this is normal or not.
> > 
> > I try to create&use a reiserfs on a 8 disk raid0. Then I found that mkfs
> > need ~90 sec and mount need ~70 seconds. 
> > 
> > Is there anything wrong on my side?
> > 
> 
> Your device is too big.
> 
> > Thanks!
> > 
> > 
> > Ming
> > 
> > 
> > 
> > Detailed info followed.
> > ---------------------------------------------------------------------
> > [root@bakstor2u root]# cat /proc/mdstat
> > Personalities : [linear] [raid0] [raid1] [raid5] [multipath] [raid6]
> > [raid10] [faulty]
> > md0 : active raid0 sda[0] sdh[7] sdg[6] sdf[5] sde[4] sdd[3] sdc[2] sdb
> > [1]
> >       3125690368 blocks 64k chunks
> > 
> > unused devices: <none>
> > 
> > [root@bakstor2u root]# time mkfs.reiserfs /dev/md0 -ff
> > mkfs.reiserfs 3.6.13 (2003 www.namesys.com)
> > 
> > <...>
> > 
> > Guessing about desired format.. Kernel 2.6.11.12 is running.
> > Format 3.6 with standard journal
> > Count of blocks on the device: 781422592
> > Number of blocks consumed by mkreiserfs formatting process: 32059
> > Blocksize: 4096
> > Hash function used to sort names: "r5"
> > Journal Size 8193 blocks (first block 18)
> > Journal Max transaction length 1024
> > inode generation number: 0
> > UUID: 98d990f3-d54f-43e3-9fde-8c9c9a6d3481
> > Initializing journal - 0%....20%....40%....60%....80%....100%
> > Syncing..ok
> > 
> > Tell your friends to use a kernel based on 2.4.18 or later, and
> > especially not a
> > kernel based on 2.4.9, when you use reiserFS. Have fun.
> > 
> > ReiserFS is successfully created on /dev/md0.
> > 
> > real    1m28.783s
> > user    0m0.151s
> > sys     0m0.398s
> > 
> 
> Hmm, mkfs.reiserfs had to write 32059 blocks. It is about 131mb. 1m28s is too much for that.
> Could it be that some of disks used in that raid were not spinning when you started mkreiserfs?
> 
> > [root@bakstor2u root]# time mount /dev/md0  t
> > 
> > real    1m11.448s
> > user    0m0.000s
> > sys     0m0.225s
> > 
> 
> There is a patch to cure this problem.
> http://www.mail-archive.com/reiserfs-list@namesys.com/msg18442.html
> Please note that it is experimental one.
> 
> > 
> > 
> > 
> 

