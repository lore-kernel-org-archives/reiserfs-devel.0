From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs corruption
Date: Thu, 26 Jan 2006 16:42:48 +0300
Message-ID: <1138282968.6313.113.camel@tribesman.namesys.com>
References: <5486cca80601260249n6bb98418v@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5486cca80601260249n6bb98418v@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Antonio <tritemio@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2006-01-26 at 11:49 +0100, Antonio wrote:
> Hi to the list,
> 
> I'm using reiserfs v3 in my root partition of my debian testing system
> for 3 years without a single problem. It's a quite common 32bit pc.
> 
> Since a week (approximately when I began to use 2.6.15.1, don't know
> if it matters though) I beginned to see strange errors like this:
> 
>   kernel: attempt to access beyond end of device
>   kernel: hda9: rw=0, want=42762504, limit=14201397
>   kernel: attempt to access beyond end of device
>   kernel: hda9: rw=0, want=42762504, limit=14201397
>   kernel: attempt to access beyond end of device
>   kernel: hda9: rw=0, want=42762504, limit=14201397
> 
> and this:
> 
>   ReiserFS: warning: is_tree_node: node level 24111 does not match to
> the expected one 1
>   ReiserFS: hda9: warning: vs-5150: search_by_key: invalid format
> found in block 1960. Fsck?
>   ReiserFS: hda9: warning: vs-13070: reiserfs_read_locked_inode: i/o
> failure occurred trying to find stat data of [172 59564 0x0 SD]
> 
> The first time I ran "reisefsck --rebuidl-tree" and corrected all the
> errors. After few day I had again those errors, so I thinked that my
> HD was at the end of his life. However I have another debian system on
> the same disk that works without problems.

is it on reiserfs?
would you, please, show output of
fdisk -l /dev/hda


>  I rebuilt the tree 3 times
> this week but after some usage I get again those errors (and often the
> system become instable).
> 
> I've ran smartctl (my IDE disk supports smart) but it didn't find any
> error even doing the short and the long tests.
> 
> Then I thinked about badblocks, I've read the faq on the namesys site
> so I ran "badbloks -b 4096 /dev/hda9" but no badblocks where found
> (there was no output at all).
> 
> I've cheked all the other partitions and they have no error. The
> partition which gived errors is the only reiserfs on this disk. So,
> maybe my disk is damaged, but how can I be sure it isn't a software
> problem if neither smartctl and badblocks can find any error? Is there
> some other check I can do?
> 

Would you, please, downgrade to 2.6.14 (or whatever kernel you used
before 2.6.15.1) and see whether the problem comes up.

> If it can help here is debugreiserfs output on the damaged partition:
> 
> --------------------------------------------
> # debugreiserfs /dev/hda9
> debugreiserfs 3.6.19 (2003 www.namesys.com)
> 
> 
> Filesystem state: consistent
> 
> Reiserfs super block in block 16 on 0x309 of format 3.6 with standard journal
> Count of blocks on the device: 1775168
> Number of bitmaps: 55
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks): 384382
> Root block: 8690
> Filesystem is clean
> Tree height: 5
> Hash function used to sort names: "r5"
> Objectid map size 158, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x1e79a00]
>         Size 8193 blocks (including 1 for journal header) (first block 18)
>         Max transaction length 1024 blocks
>         Max batch size 900 blocks
>         Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x0:
> sb_version: 2
> inode generation number: 5725378
> UUID: be002094-1df2-415b-8f12-f0f199c6390c
> LABEL:
> Set flags in SB:
>         ATTRIBUTES CLEAN
> --------------------------------------------
> 
> Any hit is welcome, tell me if you need further informations.
> 
> 
> Best Regards,
> 
>   ~ Antonio
> 

