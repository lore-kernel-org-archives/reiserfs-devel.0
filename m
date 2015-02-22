From: Vladimir Shebordaev <vladimir.shebordaev@gmail.com>
Subject: Re: Is there any way to access to the following r4 partition on
 disk - /dev/sdb
Date: Sun, 22 Feb 2015 18:56:00 +0300
Message-ID: <1424620560.28916.20.camel@home.ted.local>
References: <dc3ed57038648dab74529a88d27dc054@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version:content-transfer-encoding;
        bh=eyUpq3P89GTzw28AtzjK6WdjCmTwEAipHDndK7MNO0c=;
        b=AnyXRhKw3PYfkjh/i/GfpvYr167tmfG4U8013ZrIQ5yIVgciOXxfLNAFpnM6ifhkKt
         oRXMbL3KRdVuj7g2LhPoIirqFcmAH0pscOtwjTfcWVc0OJ2vH37u2NBlhGibRZe+q9Up
         nefpjm+MQypSpJaoNHbOGJ7g7ddRvFEjzGjEbbL+0P/sW9g5J3INc3yPJGY43JtYD3D3
         n7piOfGgd/LnymuG6E6xWSoC/nsIgbBjcjhD7/yZtNoKTaFgld/opsevvn46PpP3Yc+b
         m0FPo6DNnhyOWes9RNLRWXhOnkflP1+RvsyaQewpQ9nlldHMYCsyzsqKR+yEAfJ0TaH/
         ycGw==
In-Reply-To: <dc3ed57038648dab74529a88d27dc054@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

Hi,

On Mon, 2015-02-23 at 01:32 +1100, doiggl@velocitynet.com.au wrote:
> Hello,
> - Is there any way to access to the following r4 partition on disk ?
> [dev/sdb]
> - Are there any switches to help identify the problem ?
> I want to copy the files to another partition.
> 
> The command fails for some reason:
> How can I get the following to work ?
> 
> # mount /dev/sdb  /media/disk
> mount: mount(2) failed: No such file or directory
> 

This error message literally means that mount(2) system call fails to
find a directory entry. Since you have just two of it on you command
line, it shouldn't take long to guess what.

Are you sure /media/disk mountpoint exists? If it does, what shows up
from /proc/partitions? Is sdb a removable disk? Do you have udev
running?.. 

By the way, did you try to run fsck on this disk ever since 08/26 last
year?

--
Regards,
Vladimir
 
> --Thankyou Glenn
> 
> # rpm -qa | grep -i reiser4progs
> reiser4progs-1.0.9-58.1.x86_64
> reiser4progs-debuginfo-1.0.9-56.1.x86_64
> 
> # ll /lib/modules/`uname -r`/kernel/fs/reiser4
> total 733                                                                 
>      
> -rw-r--r-- 1 root root 747680 Feb 16 12:34 reiser4.ko
> Links
> http://www.spinics.net/lists/reiserfs-devel/msg04657.html
> http://www.spinics.net/lists/reiserfs-devel/msg04206.html
> 
> I did this in the past.
> #######################
> 
>     # fsck.reiser4 --build-fs --force  /dev/sdb
>     *******************************************************************
>     This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>     *******************************************************************
> 
>     Fscking the /dev/sdb block device.
> 
>     Will check the consistency of the Reiser4 SuperBlock. Will build the
> Reiser4 FileSystem. ***** fsck.reiser4 started at Tue Aug 26 17:22:24 2014
> 
>     Reiser4 fs was detected on /dev/sdb.
> 
>     Master super block (16):
> 
>     magic:          ReIsEr4
>     blksize:        4096
>     format:         0x0 (format40)
>     uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
>     label:          <none>
> 
>     Format super block (17):
> 
>     plugin:         format40
>     description:    Disk-format plugin.
>     version:        0
>     magic:          ReIsEr40FoRmAt
>     mkfs id:        0x1ddaf754
>     flushes:        0
>     blocks:         488378640
>     free blocks:    217146980
>     root block:     37017218
>     tail policy:    0x2 (smart)
>     next oid:       0xedade
>     file count:     188313
>     tree height:    6
>     key policy:     LARGE
> 
>     CHECKING THE STORAGE TREE Read nodes 197008413 Nodes left in the tree
> 197008413 Leaves of them 194764277, Twigs of them 2217790 Time interval:
> Tue Aug 26 17:24:21 2014 - Wed Aug 27 01:25:31 2014 CHECKING EXTENT
> REGIONS. Read twigs 2217790 Time interval: Wed Aug 27 01:25:31 2014 - Wed
> Aug 27 03:35:39 2014 LOOKING FOR UNCONNECTED NODES FSCK: node.c: 108:
> repair_node_items_check: Node (43828275), items (0) and
> 
>     (1): Wrong order of keys.
>     FSCK: node.c: 108: repair_node_items_check: Node (52697435), items
> (79)
>     and (80): Wrong order of keys.
>     FSCK: node.c: 108: repair_node_items_check: Node (63227569), items
> (24)
>     and (25): Wrong order of keys.
>     FSCK: node.c: 108: repair_node_items_check: Node (63227571), items
> (73)
>     and (74): Wrong order of keys.
>     FSCK: node.c: 108: repair_node_items_check: Node (116595727), items
> (20)
>     and (21): Wrong order of keys.
>     FSCK: node.c: 108: repair_node_items_check: Node (227923161), items
> (22)
>     and (23): Wrong order of keys.
>     FSCK: node.c: 108: repair_node_items_check: Node (284305753), items
> (61)
>     and (62): Wrong order of keys.
>              Read nodes 1481038
> 
>     Good nodes 471512
> 
>                      Leaves of them 466164, Twigs of them 5348
>              Time interval: Wed Aug 27 03:35:57 2014 - Wed Aug 27 03:39:46
> 2014
> 
>     ***** fsck.reiser4 finished at Wed Aug 27 03:39:46 2014
>     Closing fs...done
> 
>     FS is consistent.
> 
> 
> 
> This is a bug in fsck: it jumps to wrong branch for some reasons.
> Not yet fixed.
> 
> Edward.
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


