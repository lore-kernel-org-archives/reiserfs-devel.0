From: Naveen Nathan <naveen@cox.net>
Subject: Large Filesystem Support?
Date: Sun, 13 Mar 2005 01:13:11 -0800
Message-ID: <20050313091306.GB4160@naveen-osx.lan>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hey Reiser team  & fellow Reiser users.

iI have a system with 3x 3TB HW RAID5 volumes, using the latest
2.6.11.2 kernel & reiser4-utils 1.0.4.

Using mdadm I've created a raid0 for all 3 volumes which is /dev/md0.
This makes quite a large 9TB partition. Reading the FAQ on Reiser (3.6),
I was expecting to be well within the limits of the 17TB partition size
limit.

These are the results from trying to create the partition:

# mkfs.reiser4 /dev/md0
mkfs.reiser4 1.0.4
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by 
reiser4progs/COPYING. 

Block size 4096 will be used.                                                 
Linux 2.6.11.2 is detected.                                                   
Uuid f15dfd7a-8112-4f0a-96af-5ab781bdd2e4 will be used.                       
Fatal: The partition size is too big.                                         
Reiser4 is going to be created on /dev/md0.                                   
(Yes/No): yes
Fatal: The partition size is too big.                                         
Error: Can't initialize block allocator. 
Error: Can't create filesystem on /dev/md0.

Unfortunately reiser4 cannot make the large partition. I have yet to use
reiser3.6 assuming that reiser4 is the successor.

Could someone please advise how I would get reiserfs on my large partition.

Thanks,
Naveen Nathan
