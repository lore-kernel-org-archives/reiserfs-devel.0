From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfs3 rebuild-tree successful but no files
Date: Fri, 11 Feb 2005 13:57:41 +0300
Message-ID: <200502111357.41536.vitaly@namesys.com>
References: <200502082321.07706.kris@cp-data.de> <200502101825.06588.vitaly@namesys.com> <200502110832.28847.kris@cp-data.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502110832.28847.kris@cp-data.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Placzek <kris@cp-data.de>
Cc: reiserfs-list@namesys.com

> > after rebuilding the tree, does 'reiserfsck --check <device>' see these
> > files?
>
> Yes, see my original email from 08.02.2005 23:21. The original output has a
> length of about 13000 lines. A extract looks like this:
>
> ...
> rebuild_semantic_pass: The entry [741258 1025777] ("www.firstname.de.ico")
> in directory [296134 741258] points to nowhere - is removed
> rewrite_file: 2 items of file [741258 1041142] moved to [741258 93475]
> The entry [741258 1041142] ("deltab.de.ico") in directory [296134 741258]
> updated to point to [741258 93475]
> rewrite_file: 2 items of file [741258 1041137] moved to [741258 93569]
> The entry [741258 1041137] ("www.bild.t-online.de.ico") in directory
> [296134 741258] updated to point to [741258 93569]
> ...
>
> The last lines:
>
> ...
> Flushing..finished
>         Objects without names 18403
>         Empty lost dirs removed 384
>         Dirs linked to /lost+found: 2174
>                 Dirs without stat data found 83
>         Files linked to /lost+found 16229
>         Objects having used objectids: 49
>                 files fixed 47
>                 dirs fixed 2
> Pass 4 - finished   done 1476, 37 /sec
>         Deleted unreachable items 716
> Flushing..finished
> Syncing..finished
> ###########
> reiserfsck finished at Tue Feb  8 17:40:05 2005
> ...
>
> Most of the files were removed by 'reiserfsck --check <device>'.

besides the journal replay reiserfsck --check does not change 
anything on the partition, RO checks only. 

> > do you have a reiserfs support in the kernel?
>
> Sure, one of my data partition is reiserfs:
>
> ...
> root@marvin:~ 0$ # debugreiserfs -J /dev/hda7
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>
>
> Filesystem state: consistency is not checked after last mounting
>
> Reiserfs super block in block 16 on 0x307 of format 3.6 with standard
> journal Count of blocks on the device: 4393769
> ...
>
> > what if you zero the first 64K with
> >  dd conv=notrunc if=/dev/zero of=<device> bs=4096 count=16
> > can you mount it now? (rebuild-tree should already complete by the mount
> > time).
>
> Hurray, this is the trick! I don't understand why, but I can see hundreds
> of directories and thousends of files. Thanks a lot!!!
>
> > do you have anything related in the syslog about the mount time?
>
> This is the first time 'dmesg' gives an output:
>
> ReiserFS: sdc5: found reiserfs format "3.6" with standard journal
> ReiserFS: sdc5: using ordered data mode
> ReiserFS: sdc5: journal params: device sdc5, size 8192, journal first block
> 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
> ReiserFS: sdc5: checking transaction log (sdc5)
> ReiserFS: sdc5: Using r5 hash to sort names
>
> Could you give me a technical describtion why this worked?

the kernel found an ext2 magic somewhere in the first 64K, 
reiserfs keeps the super block on 64K offset, so ext2 one was 
not overwritten by rebuild-sb. this is why it was mounted as ext2.

but why the kernel refused to mount as reiserfs when was explicitely 
specified -- this is a bug.

-- 
Thanks,
Vitaly Fertman

