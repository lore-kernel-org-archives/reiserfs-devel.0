From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: file corruption, advice needed
Date: Thu, 2 Oct 2003 15:40:28 +0400
Message-ID: <200310021540.28479.vitaly@namesys.com>
References: <3F7BF9EA.3090404@g-house.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15767-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F7BF9EA.3090404@g-house.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian <evil@g-house.de>, reiserfs-list@namesys.com

On Thursday 02 October 2003 14:11, Christian wrote:
> Hi,

Hi

> recently i noticed some corrupt (only 1 really, about 9 MB big) or even
> disappeared (say a dozen or perhaps more).
> i run reiserfsck on the very partition while it was mounted RO, no
> corruptions were found. should i trust it (and blame some application
> for the messed up files) or should i try with --rebuild-sb (needs a
> --rebuild-tree afterwards, right?) ?

if reiserfsck does not find any corruption that means that reiserfs on-disk
structures are consistent. no rebuild operation is needed.


> i have to admit, that i had "not so good" experience with --rebuild-*
> operations, but this was 1 or 2 years ago.
>
> so, can you give me advice on this? should i still backup this parition?
> (it's my root ( / ) partition, so it's not that important)

reiserfsck is considered as stable now, but backups are always useful, 
thus you would have this dozen of files backuped now.


-- 
Thanks,
Vitaly Fertman


> this is with Debian/stable i386 (AMD K7 SMP), reiserfsprogs 3.6.11.
> debugreiserfs on this rw mounted parition shows:
>
> --------
> root@atlant:~# debugreiserfs /dev/sda1
> debugreiserfs 3.6.11 (2003 www.namesys.com)
>
>
> Filesystem state: consistency is not checked after last mounting
>
> Reiserfs super block in block 16 on 0x801 of format 3.6 with standard
> journal
> Count of blocks on the device: 2239484
> Number of bitmaps: 69
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks): 680307
> Root block: 36301
> Filesystem is NOT cleanly umounted
> Tree height: 5
> Hash function used to sort names: "r5"
> Objectid map size 26, max 972
> Journal parameters:
>          Device [0x0]
>          Magic [0x6961a7e1]
>          Size 8193 blocks (including 1 for journal header) (first block 18)
>          Max transaction length 1024 blocks
>          Max batch size 900 blocks
>          Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x0:
> sb_version: 2
> inode generation number: 5996064
> UUID: 00000000-0000-0000-0000-000000000000
> LABEL:
> Set flags in SB:
> root@atlant:~#
> -----------
>
> i can provide more information / fsdumps if there is interest. but i
> think it's rather hard to do anything now, because i don't even know if
> it is a filesystem thing anyway.
>
> Thank you for your time,
> Christian.

