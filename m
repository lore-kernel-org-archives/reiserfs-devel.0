From: Michele Nicosia <michele.nicosia@lastminutetour.com>
Subject: Re: Crash recovery after a shutdown, lvm,reiser3.6,2.4.26, lost files
Date: Wed, 08 Sep 2004 16:52:07 +0200
Message-ID: <413F1C97.7090706@lastminutetour.com>
References: <918973493892.65637@bao72@lendingflow.net> <413EFE7C.2030006@lastminutetour.com> <200409081524.37440.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409081524.37440.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Christian Mayrhuber wrote:

> 1)
>
>I once had such an insult on a machine I was playing around and some old
>2.4.x kernel + ext2. (rebooting after partitioning did away with these 
>problems)
>  
>
Hi,
    the primary idea starting play with reiserfs is that on crash the 
journal will save the job...
It is not the same of ext2 fs.

>I may be wrong, but there is the possibility that your lvm configuration was 
>not quite right because you repartitioned your harddisk and created the lvm 
>configuration without rebooting after repartitioning. This can happen because 
>the kernel may not have read the correct partition table info. Thats why 
>fdisk suggests rebooting. (At least there was a time it was necessary)
>Your reboot after 3 months made the kernel read the correct
>partition table and resulted for lvm to fail, because it's disk information 
>did not match the kernel one.
>
>  
>
After the partitionig i restarted the machine (i also founded the limti 
of 15 partition), but i do not restarted after i add another pv to the 
volume group e resized the volume, like i suppose is the thing normal to do.
Except this i can suppose tha another thing about th elvm could be 
worng, but it is not the issue, because after recover the pv, and 
mounted the fs all the files, many of them, were corrupted!!


>2)
>One of your harddisks could be defect. Try to run the badblocks command.
>
>  
>
smart array 641 with six ultra3 scsi drive, i think it is not a disk 
failure.

>3)
>Your RAM could be defect. Try to run memtest86 for about 2 days.
>
>  
>
e.c.c. 1,5 g on proliant G3 dual xeon, also this, i suppose the ram is 
good, not sure , i'm not tested it, but the probabilyt is low..

>Note: ReiserFS has never failed for me on LVM and 2.4.x kernels (x >= 18,
>I didn't use the combination lvm+reiserfs on earlier kernels) 
>  
>

2.4.26  > 2.4.18 and the lvm with reiserfs is the most improtnat and 
useful thing to use with linux, IMHO....

Thanks

