From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Need help retrieving data
Date: Fri, 1 Sep 2006 15:45:32 +0400
Message-ID: <200609011545.33194.zam@namesys.com>
References: <44EDE55E.7030106@comcast.net> <44EE0F5F.1040009@namesys.com> <6096245.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29775-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6096245.post@talk.nabble.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alex Efros <powerman-asdf@yandex.ru>

On 1 September 2006 14:30, Alex Efros wrote:
> I've similar problem. Looks like --rebuild-tree finally fixed
> everything, but there is a bug in reiserfsck because it doesn't see
> any errors while mount unable to work.
> I've a copy of this partition in file (3GB) on my harddrive in broken
> state (i.e. before running any reiserfsck). I can't upload it, of
> course, :) but if you wish to analyse it I can run anything you say
> on this file and send you results. I'll keep this file while I'm
> waiting for your answers - about a week.
> (I'm not really subscribed to list, so please CC: me, but I'll
> monitor this thread using web gate www.nabble.com anyway.)
>
> I've no idea how filesystem become damaged. Only suspicious thing was
> dead CMOS battery (this comp is old Celeron 333), but I don't really
> think dead CMOS battery can affect this... So, linux was booted 2-3
> times after BIOS warning 'Press F1 to continue' and on next boot Grub
> refuse to boot with 'Error 17'. There no bad blocks on this
> partition.
>
> I've moved harddrive to another comp and checked reiserfs, results is
> below. Here is configuration of these computers (both has Gentoo
> Hardened installed).
> Original:
>     sys-fs/reiserfsprogs-3.6.19
>     bzImage-2.6.14-hardened-r7
> Fixer:
>     sys-fs/reiserfsprogs-3.6.19
>     bzImage-2.6.16-hardened-r10
>
> -----------------------------------------------------------
>
> # mount -t reiserfs /dev/hdc5 /mnt/cdrom/
>
> 2006-08-31_08:49:02.92678 kern.warn: ReiserFS: hdc5: warning:
> sh-2021: reiserfs_fill_super: can not find reiserfs on hdc5
>
> -----------------------------------------------------------
>
> # reiserfsck /dev/hdc5
> reiserfsck 3.6.19 (2003 www.namesys.com)
> ...
> reiserfs_open: the reiserfs superblock cannot be found on /dev/hdc5.
> Failed to open the filesystem.
>
> If the partition table has not been changed, and the partition is
> valid  and  it really  contains  a reiserfs  partition,  then the
> superblock  is corrupted and you need to run this utility with
> --rebuild-sb.
>
> -----------------------------------------------------------
>
> # reiserfsck --rebuild-sb /dev/hdc5
> ...
> reiserfs_open: the reiserfs superblock cannot be found on /dev/hdc5.
>
> what the version of ReiserFS do you use[1-4]
>         (1)   3.6.x
>         (2) >=3.5.9 (introduced in the middle of 1999) (if you use
> linux 2.2, choose this one)
>         (3) < 3.5.9 converted to new format (don't choose if unsure)
>         (4) < 3.5.9 (this is very old format, don't choose if unsure)
>         (X)   exit
> 1
>
> Enter block size [4096]:
> 4096
>
> No journal device was specified. (If journal is not available, re-run
> with --no-journal-available option specified).
> Is journal default? (y/n)[y]: y
>
> Did you use resizer(y/n)[n]: n
>
> rebuild-sb: You either have a corrupted journal or have just changed
> the start of the partition with some partition table editor. If you
> are sure that the start of the partition is ok, rebuild the journal
> header. Do you want to rebuild the journal header? (y/n)[n]: y
>
> Reiserfs super block in block 16 on 0x1605 of format 3.6 with
> standard journal
> Count of blocks on the device: 769104
> Number of bitmaps: 24
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data,
> reserved] blocks): 0
> Root block: 0
> Filesystem is NOT clean
> Tree height: 0
> Hash function used to sort names: not set
> Objectid map size 0, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x0]
>         Size 8193 blocks (including 1 for journal header) (first
> block 18) Max transaction length 1024 blocks
>         Max batch size 900 blocks
>         Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x1:
>          some corruptions exist.
> sb_version: 2
> inode generation number: 0
> UUID: 4390ff17-0cca-462a-ae4f-8aa75f9f3dd8
> LABEL:
> Set flags in SB:
> Is this ok ? (y/n)[n]: y
> The fs may still be unconsistent. Run reiserfsck --check.
>
> -----------------------------------------------------------
>
> # reiserfsck /dev/hdc5
> ...
> ###########
> reiserfsck --check started at Thu Aug 31 11:55:23 2006
> ###########
> Replaying journal..
> Trans replayed: mountid 946, transid 887592, desc 4062, len 7, commit
> 4070, next trans offset 4053
> Trans replayed: mountid 946, transid 887593, desc 4071, len 1, commit
> 4073, next trans offset 4056
> Trans replayed: mountid 946, transid 887594, desc 4074, len 7, commit
> 4082, next trans offset 4065
> Trans replayed: mountid 946, transid 887595, desc 4083, len 1, commit
> 4085, next trans offset 4068
> Trans replayed: mountid 946, transid 887596, desc 4086, len 16,
> commit 4103, next trans offset 4086
> Trans replayed: mountid 946, transid 887597, desc 4104, len 7, commit
> 4112, next trans offset 4095
> Reiserfs journal '/dev/hdc5' in blocks [18..8211]: 6 transactions
> replayed hecking internal tree..finished
> Comparing bitmaps..finished
> Checking Semantic tree:
> finished
> No corruptions found
> There are on the filesystem:
>         Leaves 47645
>         Internal nodes 307
>         Directories 28553
>         Other files 217465
>         Data block pointers 661164 (25894 of them are zero)
>         Safe links 1
> ###########
> reiserfsck finished at Thu Aug 31 11:59:37 2006
> ###########
>
> -----------------------------------------------------------
>
> # mount -t reiserfs /dev/hdc5 /mnt/cdrom/
>
> 2006-08-31_09:07:44.70007 kern.notice: ReiserFS: hdc5: found reiserfs
> format "3.6" with standard journal
> 2006-08-31_09:07:44.94496 kern.notice: ReiserFS: hdc5: using ordered
> data mode
> 2006-08-31_09:07:44.95777 kern.notice: ReiserFS: hdc5: journal
> params: device hdc5, size 8192, journal first block 18, max trans len
> 1024, max batch 900, max commit age 30, max trans age 30
> 2006-08-31_09:07:44.95868 kern.notice: ReiserFS: hdc5: checking
> transaction log (hdc5)
> 2006-08-31_09:07:45.02493 kern.warn: ReiserFS: hdc5: warning:
> vs-7000: search_by_entry_key: search_by_key returned item position ==
> 0
>
> -----------------------------------------------------------

yes, it is the same bug, looks like fsck --rebuild-sb doesn't set hash 
function id in the super block and then fsck --check misses the error.

unfortunately no fix for fsck is available yet.

-- 
Alex.
