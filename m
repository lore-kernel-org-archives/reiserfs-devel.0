From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: newly created 8.5TB reiserfs fails fsck on amd64 and causes OOPS
Date: Thu, 28 Jul 2005 17:56:06 +0400
Message-ID: <200507281756.06406.vitaly@namesys.com>
References: <20050719114736.GA25930@wurtel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050719114736.GA25930@wurtel.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello, 

On Tuesday 19 July 2005 15:47, Paul Slootman wrote:
> This is on a dual-CPU opteron system, with 2 x 3ware 9500 12-channel
> SATA controllers for a total of 8.5TB; I've configured a RAID5 over each
> 3ware controller, and use linux md RAID0 over those two "devices".
> There was an issue with linux md RAID0 for that size, but that's been
> resolved (at least, the problem I had first :-)
> 
> The device itself seems to work fine, as reiser4 works. I
> wanted to compare to reiserfs 3.6, so I created a reiserfs, mounted it,
> and tried to use it. Running bonnie++ on it caused an oops, apparently
> in the reiserfs code:
> 
> I rebooted (hard, as a shutdown didn't work...). After that, I tried a
> mkfs followd by an fsck, which gives an error! Here's the console log:
> 
> 
> satazilla:~# mkfs.reiserfs /dev/md13
> mkfs.reiserfs 3.6.19 (2003 www.namesys.com)
> 
> Guessing about desired format.. Kernel 2.6.12.2.raid0fixreiser4 is running.
> Format 3.6 with standard journal
> Count of blocks on the device: 2148377056

ahh, indeed, this amount of blocks needs 65564 bitmap count,
whereas there is only 16 bits field in the super block for 
the bitmap count. in other words, this limits the reiserfs 
size to: 65535 * BlockSize * 8 * Blocksize, for BlockSize 
== 4K it is 8T. 

the check for bitmap block count overflow seems to be missed 
in progs. hmm, and our faq about 16Tb is not correct also...

> Number of blocks consumed by mkreiserfs formatting process: 8239
> Blocksize: 4096
> Hash function used to sort names: "r5"
> Journal Size 8193 blocks (first block 18)
> Journal Max transaction length 1024
> inode generation number: 0
> UUID: 10ae60ee-1abb-49d1-ae55-cf238626c0b5
> ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
>         ALL DATA WILL BE LOST ON '/dev/md13'!
> Continue (y/n):y
> Initializing journal - 0%....20%....40%....60%....80%....100%
> Syncing..ok
> 
> Tell your friends to use a kernel based on 2.4.18 or later, and especially not a
> kernel based on 2.4.9, when you use reiserFS. Have fun.
> 
> ReiserFS is successfully created on /dev/md13.
> satazilla:~# reiserfsck  /dev/md13
> reiserfsck 3.6.19 (2003 www.namesys.com)
> 
> Will read-only check consistency of the filesystem on /dev/md13
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
> ###########
> reiserfsck --check started at Tue Jul 19 13:29:22 2005
> ###########
> Replaying journal..
> No transactions found
> reiserfs_open_ondisk_bitmap: wrong either bitmaps number,
> count of blocks or blocksize, run with --rebuild-sb to fix it
> reiserfsck: Could not open bitmap


 
> When I try running with --rebuild-sb it says:
> 
> Reiserfs super block in block 16 on 0x90d of format 3.6 with standard journal
> Count of blocks on the device: 2148377056
> Number of bitmaps: 28
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 2148368817
> Root block: 8211
> Filesystem is clean
> Tree height: 2
> Hash function used to sort names: "r5"
> Objectid map size 2, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x168ed58c]
>         Size 8193 blocks (including 1 for journal header) (first block 18)
>         Max transaction length 1024 blocks
>         Max batch size 900 blocks
>         Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x0:
> sb_version: 2
> inode generation number: 0
> UUID: 10ae60ee-1abb-49d1-ae55-cf238626c0b5
> LABEL: 
> Set flags in SB:
>         ATTRIBUTES CLEAN
> 
> Super block seems to be correct
> 
> 
> 
> Something seems seriously wrong here.
> I'm happy to run any tests or try any patches, this system is mine to play with
> until the end of the month.
> 
> 
> Paul Slootman
> 
> 

-- 
Thanks,
Vitaly Fertman
