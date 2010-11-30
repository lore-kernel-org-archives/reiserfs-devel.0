From: Simon <sur3@gmx.de>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Tue, 30 Nov 2010 11:09:50 +0100
Message-ID: <4CF4CD6E.4040305@gmx.de>
References: <4CE87674.4090909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4CE87674.4090909@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello,
first of all thanks for your works!

Now my Problem:
When theres no userspace left, my kernel crashes,
cpu then works hard i think as the fan speed increases,
but i cant move the mouse-cursor and magic-sys-req-keys also dont work
anymore, so i have to do an ACPI-emergency-off then by pressing
powerbutton 6s.
This error especially happens when using vuze.

--
% fsck.reiser4 --print-profile /dev/sda7
Default profile:
create:          "reg40"           (id:0x0 type:0x0)	[Regular file
plugin for creat(2)]
key:             "key_large"       (id:0x1 type:0xb)	[Key plugin]
compress:        "lzo1"            (id:0x0 type:0xc)	[Compression plugin]
compressMode:    "conv"            (id:0x4 type:0xd)	[Compression Mode
plugin]
cluster:         "64K"             (id:0x0 type:0x10)	[Cluster plugin]
hash:            "r5_hash"         (id:0x1 type:0x3)	[Directory entry
hash plugin]
fibration:       "ext_1_fibre"     (id:0x2 type:0x4)	[Key fibration plugin]
formatting:      "smart"           (id:0x2 type:0x5)	[File body
formatting plugin]

--
well just cleaned some diskspace but probably this shows something anyway..
% measurefs.reiser4 -f /dev/sda7
measurefs.reiser4 1.0.7
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Tree statistics ... done


Packing statistics:


  Formatted nodes:    3390.97b (82.79%)
  Branch nodes:       1049.52b (25.62%)
  Twig nodes:         2575.07b (62.87%)
  Leaf nodes:         3807.24b (92.95%)

Node statistics:
  Total nodes:       23135597
  Formatted nodes:     200158
  Unformatted nodes: 22935439
  Branch nodes:           546
  Twig nodes:           11580
  Leaf nodes:        23123471

Item statistics:
  Total items:        1058097
  Nodeptr items:       200157
  Statdata items:     360716
  Direntry items:       46410
  Tail items:          363788
  Extent items:         87026
---


Am 21.11.2010 02:31, schrieb Edward Shishkin:
> Changes since 2.6.35:
> 
> . Fixed ->write_end() method: the old one didn't update i_size, and this
>  resulted in empty files and "orphan" items. The problem took place only
>  for splice users (loop devices, pipe2, etc).
> 
> . Implemented ->sync_fs() method of super operations. Since introducing a
>  new per-bdi flushing stuff reiser4 wasn't able to perform sync on umount.
>  Now such sync is performed by reiser4_sync_fs().
> 
> . Fixed an old bug which led to non-deletable directories.
> 
> . Fixed an old bug in tail conversion, which led to data corruption when
>  running in disk space pressure situations.
> 
> Please, find at
> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/
> 
> 
> Thanks,
> Edward.
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
