From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: reiser fs slow on mksf and mount
Date: Fri, 26 Aug 2005 13:08:57 -0400
Message-ID: <1125076138.5549.65.camel@localhost.localdomain>
References: <1125074717.5549.44.camel@localhost.localdomain>
	 <430F4B91.7030909@namesys.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430F4B91.7030909@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

i think 3.2TB partition is not that big these days right?

i would think some people that hold millions of files will have much
larger partition than this.

so you think this is a normal speed for such size partition?

also iostat 1 -k shows that during mount, there are small size read
happen each second. so this is because read meta data and metadata is
not continuous on disk?

ming


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

