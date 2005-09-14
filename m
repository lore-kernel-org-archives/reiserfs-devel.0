From: Dan Oglesby <doglesby@teleformix.com>
Subject: ReiserFS errors in /var/log/messages
Date: Wed, 14 Sep 2005 11:56:13 -0500
Message-ID: <4328562D.4010901@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25957-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I recently started seeing the following message repeating in my 
/var/log/messages file on a server:

kernel: is_leaf: free space seems wrong: level=1, nr_items=39, 
free_space=0 rdkey
kernel: vs-5150: search_by_key: invalid format found in block 5405324. Fsck?
kernel: vs-13070: reiserfs_read_inode2: i/o failure occurred trying to 
find stat data of [11 618208 0x0 SD]

Every day a large filesystem rsyncs to another filesystem for 
backup/redundancy, and it looks like this coincides with the error 
listed above.  It repeats about 13 times every time rsync runs.  It's 
always the same block number.

This filesystem lives on a 3Ware RAID-5 array, and is running a 2.4.20 
kernel from RedHat that we cannot upgrade due to hardware and software 
dependancies.

I'm planning on downloading the latest version of the ReiserFS tools, 
and checking for errors/repairing.

Anyone know what this error means, so I have a better idea of what I'm 
dealing with?  I find it strange that I could have a block error on a 
logical drive (the RAID-5 device).

Thanks...

--Dan
