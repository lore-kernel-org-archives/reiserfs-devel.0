From: Jose R R <jose.r.r@metztli.com>
Subject: Re: help wanted to repair and so mount command be done to use a
 reiser4 volume ? [located on /dev/sdb]
Date: Fri, 23 Oct 2015 00:27:05 -0700
Message-ID: <CAM12Q5SAUA_Lj_uL5N56abo_ATaF+0LfqeC9mWkYq334W4WcTw@mail.gmail.com>
References: <a513052ee63b7f1e42c9d2fc9e6627c3@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a513052ee63b7f1e42c9d2fc9e6627c3@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze!



On Sun, Oct 18, 2015 at 5:41 AM,  <doiggl@velocitynet.com.au> wrote:
> Hello,
>
> Some reiser4 metdadata problems which I need help with [located /dev/sdb].
> see: http://www.spinics.net/lists/reiserfs-devel/msg04899.html
>
> Some questions I have are these:
>
> - help wanted to repair and so mount command be done to use a reiser4
> volume ? [located on /dev/sdb]
>
> Its a large amount of metadata.
>
> I have a seperate 4TB hdd with its space unused.
> I can format that and unpack metadata on that hdd if needed.
> I can use that, to run commands against the  metadata.
>
> Question:
> --------
> - What commands would get the information that would be useful to resolve
> problem listed as follows ?
> See http://www.spinics.net/lists/reiserfs-devel/msg04899.html
>
> I have packed reiser4 metadata via command
> # debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4meta-sdb.gz
>
> # split up to smaller chunks
> # split --bytes=1800m r4meta-sdb.gz r4meta-sdb.gz-part-
>
> Files:
> 1,887,436,800 r4meta-sdb.gz-part-aa
> 1,196,849,440 r4meta-sdb.gz-part-ab
>
> -To join it up for use:
> #cat r4meta-sdb.gz-part-aa r4meta-sdb.gz-part-ab > r4meta-sdb.gz
>
> History
> -------
> http://www.spinics.net/lists/reiserfs-devel/msg03094.html
>
> I know files and data are on disk but just cannot get to it.
> Thank you for any help on accessing this volume.
> Cheers Glenn

Have you tried using disk recovery tools to salvage your data?

testdisk - to make sure your partition table is sound.

GParted - might check/copy contents in possibly damaged fs/hardware
into another storage media.

scalpel - filesystem-independent and will carve files from FAT16, FAT32,
exFAT, NTFS, Ext2, Ext3, Ext4, JFS, XFS, ReiserFS, raw partitions, etc.

safecopy (compare to below utility)

gddrescue - The gddrescue tool copies data from one file or block device
(hard disc, cdrom, etc) to another, trying hard to rescue data
in case of read errors.

Good luck!

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
