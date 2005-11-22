From: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: Help tracking down files on a bad block:  understanding the output
 of debugreiserfs
Date: Tue, 22 Nov 2005 20:00:57 +0100
Message-ID: <43836AE9.5020403@muenning.com>
References: <43835EFD.40906@sasser.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43835EFD.40906@sasser.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dewey Sasser <dewey@sasser.com>
Cc: reiserfs-list@namesys.com

Hi!

Unfortunately I can't help you with the debugreiserfs output but maybe
with another approach for finding the correct blocknum of the bad
sector(s). Why don't you try

badblocks -b 4096 /dev/hda5

I'm not telling that your approach is wrong but this way (assuming your
reiserfs block is the default 4k) you'll be sure to have all bad blocks.
But it takes some time. On the other hand you may try this:

dd of=/dev/null if=/dev/hda5 bs=4k count=1 skip=xxx

with xxx the block number(s) of your calculation or output from
badblocks. Just to check if the block you've found is really unreadable.

How to identify the inode number corresponding to that block I can't
tell but finding the file etc. to the inode may be done with

find /mount-point-of-fs -inum xxx

where xxx is the inode number in question. See man find.

Hope that helps.
Konstantin

Dewey Sasser wrote:
> Hello all,
> 
> I've recently received a bad block notice from SMARTD and I'm trying to
> track down which files might be affected.  I *think* I have the basic
> process correct but I'm missing the final step -- how to get the inode
> of the affected files.  My skill with Google and man pages got me to
> where I am but seems unequal to my remaining task.
> 
> My question is:  is the inode of the file in question found in the
> output of debugreiserfs -1 <blocknum> or is there some other way to get
> the inode?
> 
> Attached is a console log documenting the process I'm using so far.  How
> should I interpret this output from debugreiserfs?
> 
> Many thanks,
> 
> -- 
> Dewey Sasser
> 
> 
>    straits messages # grep LBAsect messages.1 | tail -n 1
>    Nov  9 09:45:34 straits hda: dma_intr: error=0x40 {
>    UncorrectableError }, LBAsect=32378944, sector=28250176
>    straits messages # fdisk -ul /dev/hda
> 
>    Disk /dev/hda: 122.9 GB, 122942324736 bytes
>    255 heads, 63 sectors/track, 14946 cylinders, total 240121728 sectors
>    Units = sectors of 1 * 512 = 512 bytes
> 
>       Device Boot      Start         End      Blocks   Id  System
>    /dev/hda1   *          63      128519       64228+  83  Linux
>    /dev/hda2          128520     4128704     2000092+  83  Linux
>    /dev/hda3         4128705   240107489   117989392+   5  Extended
>    /dev/hda5         4128768    43198784    19535008+  83  Linux
>    /dev/hda6        43198848   240107489    98454321   83  Linux
>    straits messages # dc
>    32378944     /# LBA Sector/
>    4128768       /# Starting sector for hda5/
>    -
>    p
>    28250176     /# result:  this is the sector within hda5/
>    8                   /# convert 512 byte sectors to 4096 byte
>    ReiserFS blocks
>    /
>    /p
>    3531272       # /result:  this is the ReiserFS block containing the
>    bad sector/
>    q
>    straits messages # debugreiserfs -1 3531272 /dev/hda5
>    debugreiserfs 3.6.19 (2003 www.namesys.com)
> 
>    3531272 is used in ondisk bitmap
> 
>    ===================================================================
>    LEAF NODE (3531272) contains level=1, nr_items=12, free_space=632
>    rdkey (real items 12)
>   
> -------------------------------------------------------------------------------
> 
>    |###|type|ilen|f/sp| loc|fmt|fsck|                    
> key                      |
>    |   |    |    |e/cn|    |    
> |need|                                            |
>   
> -------------------------------------------------------------------------------
> 
>    |  0|3065513 2078685 0x0 SD (0), len 44, location 4052 entry count
>    65535, fsck need 0, format new|
>    (NEW SD), mode -rw-rw-r--, size 0, nlink 1, mtime 24/2005 04:17:29
>    blocks 0, uid 0
>   
> -------------------------------------------------------------------------------
> 
>    |  1|3065513 2078685 0x1 DRCT (2), len 456, location 3596 entry
>    count 65535, fsck need 0, format new|
>   
> -------------------------------------------------------------------------------
> 
>    |  2|3065513 2269255 0x0 SD (0), len 44, location 3552 entry count
>    65535, fsck need 0, format new|
>    (NEW SD), mode -rw-rw-r--, size 610, nlink 1, mtime 02/2005 04:05:49
>    blocks 8, uid 0
>   
> -------------------------------------------------------------------------------
> 
>    |  3|3065513 2269255 0x1 DRCT (2), len 616, location 2936 entry
>    count 65535, fsck need 0, format new|
>   
> -------------------------------------------------------------------------------
> 
>    |  4|3065513 2269421 0x0 SD (0), len 44, location 2892 entry count
>    65535, fsck need 0, format new|
>    (NEW SD), mode -rw-rw-r--, size 505, nlink 1, mtime 01/2005 14:35:40
>    blocks 8, uid 0
>   
> -------------------------------------------------------------------------------
> 
>    |  5|3065513 2269421 0x1 DRCT (2), len 512, location 2380 entry
>    count 65535, fsck need 0, format new|
>   
> -------------------------------------------------------------------------------
> 
>    |  6|3065513 2269440 0x0 SD (0), len 44, location 2336 entry count
>    65535, fsck need 0, format new|
>    (NEW SD), mode -rw-rw-r--, size 371, nlink 1, mtime 21/2005 14:35:50
>    blocks 8, uid 0
>   
> -------------------------------------------------------------------------------
> 
>    |  7|3065513 2269440 0x1 DRCT (2), len 376, location 1960 entry
>    count 65535, fsck need 0, format new|
>   
> -------------------------------------------------------------------------------
> 
>    |  8|3065513 2269513 0x0 SD (0), len 44, location 1916 entry count
>    65535, fsck need 0, format new|
>    (NEW SD), mode -rw-rw-r--, size 873, nlink 1, mtime 17/2005 16:06:08
>    blocks 8, uid 0
>   
> -------------------------------------------------------------------------------
> 
>    |  9|3065513 2269513 0x1 DRCT (2), len 880, location 1036 entry
>    count 65535, fsck need 0, format new|
>   
> -------------------------------------------------------------------------------
> 
>    | 10|3065513 2288540 0x0 SD (0), len 44, location 992 entry count
>    65535, fsck need 0, format new|
>    (NEW SD), mode -rw-rw-r--, size 643, nlink 1, mtime 09/2005 15:35:43
>    blocks 8, uid 0
>   
> -------------------------------------------------------------------------------
> 
>    | 11|3065513 2288540 0x1 DRCT (2), len 48, location 944 entry count
>    65535, fsck need 0, format new|
>    ===================================================================
