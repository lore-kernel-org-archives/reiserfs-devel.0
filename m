From: Vince <fuzzy77@free.fr>
Subject: Re: status of grub reiser4 support ?
Date: Mon, 15 Mar 2004 17:52:32 +0100
Message-ID: <4055DF50.4030105@free.fr>
References: <405597B6.1000906@free.fr> <200403151715.50569.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403151715.50569.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>, bug-grub@gnu.org

Building succeded, this is what I have:

diablo:/boot/grub# ll *stage*
-rw-r--r--    1 root     root         7616 Mar 15 17:27 e2fs_stage1_5
-rw-r--r--    1 root     root         7376 Mar 15 17:27 fat_stage1_5
-rw-r--r--    1 root     root         6688 Mar 15 17:27 ffs_stage1_5
-rw-r--r--    1 root     root         8224 Mar 15 17:27 jfs_stage1_5
-rw-r--r--    1 root     root         6880 Mar 15 17:27 minix_stage1_5
-rw-r--r--    1 root     root        54088 Mar 15 17:27 reiser4_stage1_5
-rw-r--r--    1 root     root         9088 Mar 15 17:27 reiserfs_stage1_5
-rw-r--r--    1 root     root          512 Mar 15 17:27 stage1
-rw-r--r--    1 root     root       103752 Mar 15 17:27 stage2
-rw-r--r--    1 root     root         6336 Mar 15 17:27 vstafs_stage1_5
-rw-r--r--    1 root     root         9160 Mar 15 17:27 xfs_stage1_5

Unfortunately, grub under linux will encounter a segmentation as soon as 
I try to read a file on a reiser4 partition:
grub> cat (hd1,<TAB>
  Possible partitions are:
    Partition num: 0,  Filesystem type is reiser4, partition type 0xc
    Partition num: 1,  Filesystem type is reiserfs, partition type 0x83
    Partition num: 2,  Filesystem type is reiser4, partition type 0x83
 

grub> cat (hd1,2)/<TAB>zsh: segmentation fault  grub

Booting directly grub from the bios, reiser4 partitions are marked as 
unknown (but I bet this is probably a stage 1/1.5/2 problem from my part)...

Vince

Vitaly Fertman wrote:
> On Monday 15 March 2004 14:47, Vince wrote:
>
>>  I'd like to know the current status of bootloaders support for
>>reiser4. The latest patch for grub I could find is this one:
>>http://www.namesys.com/snapshots/2003.06.06/grub-0.93-reiser4-20030606.diff
 >> [...]
>>Is there a more up to date patch for grub available ?
> 
> 
> this is the reiser4 support patch for grub-0.94, would you try it?
> 
> 
