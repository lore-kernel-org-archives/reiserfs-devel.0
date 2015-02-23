From: Vladimir Shebordaev <vladimir.shebordaev@gmail.com>
Subject: Re: Is there any way to access to the following r4 partition on
 disk - /dev/sdb
Date: Mon, 23 Feb 2015 12:52:30 +0300
Message-ID: <1424685150.12259.44.camel@home.ted.local>
References: <dc3ed57038648dab74529a88d27dc054@mail.velocitynet.com.au>
	 <1424620560.28916.20.camel@home.ted.local>
	 <b73256ce7edc512f2aa15f973b007770@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version:content-transfer-encoding;
        bh=cxxN53znxP8HBjAYchqfTiTG8X02hGtQkv9VnH2ithA=;
        b=FFx0g47xOAmtMdcH+Foa4SMS/uIuwAOneJEIWA3hNt8lS0YNy3HDlh7RBLTVPxfyFa
         2ntbURVzIfzkQk8zKOmrIhv2PxCyMjMLIJG6Ahsgkx1KDNaAHCU4Gtq95svgvJhT337A
         /cY+8H0yM3gviE9gMNGreA8IErRd4kjdgIjR6iOLhHLT4xsAdAALCG1dnhlrvEcJKcS1
         u4PZ6JB08DwDEdOHn+RejS+zAz78rzdNS01cYUnkCRps1ImixAgwMVohW1yjUdc+fNKq
         lAC7kWU3j7GJ2j7hscQ6JuD/Ce8U1OGImv7uasBecPFmPPwS85wxpw1LqzX3tJ8uazgx
         pkkQ==
In-Reply-To: <b73256ce7edc512f2aa15f973b007770@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On Mon, 2015-02-23 at 13:14 +1100, doiggl@velocitynet.com.au wrote:
> On Sun, 22 Feb 2015 18:56:00 +0300, Vladimir Shebordaev
> <vladimir.shebordaev@gmail.com> wrote:
> > Hi,
> > 
> > On Mon, 2015-02-23 at 01:32 +1100, doiggl@velocitynet.com.au wrote:
> >> Hello,
> >> - Is there any way to access to the following r4 partition on disk ?
> >> [dev/sdb]
> >> - Are there any switches to help identify the problem ?
> >> I want to copy the files to another partition.
> >> 
> >> The command fails for some reason:
> >> How can I get the following to work ?
> >> 
> >> # mount /dev/sdb  /media/disk
> >> mount: mount(2) failed: No such file or directory
> >> 
> > 
> > This error message literally means that mount(2) system call fails to
> > find a directory entry. Since you have just two of it on you command
> > line, it shouldn't take long to guess what.
> > 
> > Are you sure /media/disk mountpoint exists? If it does, what shows up
> > from /proc/partitions? Is sdb a removable disk? Do you have udev
> > running?.. 
> > 
> > By the way, did you try to run fsck on this disk ever since 08/26 last
> > year?
> > 
> > --
> > Regards,
> > Vladimir
> >  
> >> --Thankyou Glenn
> >> 
> >> # rpm -qa | grep -i reiser4progs
> >> reiser4progs-1.0.9-58.1.x86_64
> >> reiser4progs-debuginfo-1.0.9-56.1.x86_64
> >> 
> >> # ll /lib/modules/`uname -r`/kernel/fs/reiser4
> >> total 733                                                              
> 
> >>
> >>      
> >> -rw-r--r-- 1 root root 747680 Feb 16 12:34 reiser4.ko
> >> Links
> >> http://www.spinics.net/lists/reiserfs-devel/msg04657.html
> >> http://www.spinics.net/lists/reiserfs-devel/msg04206.html
> >> 
> >> I did this in the past.
> >> #######################
> >> 
> >>     # fsck.reiser4 --build-fs --force  /dev/sdb
> >>     *******************************************************************
> >>     This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> >>     *******************************************************************
> >> 
> >>     Fscking the /dev/sdb block device.
> >> 
> >>     Will check the consistency of the Reiser4 SuperBlock. Will build
> the
> >> Reiser4 FileSystem. ***** fsck.reiser4 started at Tue Aug 26 17:22:24
> >> 2014
> >> 
> >>     Reiser4 fs was detected on /dev/sdb.
> >> 
> >>     Master super block (16):
> >> 
> >>     magic:          ReIsEr4
> >>     blksize:        4096
> >>     format:         0x0 (format40)
> >>     uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
> >>     label:          <none>
> >> 
> >>     Format super block (17):
> >> 
> >>     plugin:         format40
> >>     description:    Disk-format plugin.
> >>     version:        0
> >>     magic:          ReIsEr40FoRmAt
> >>     mkfs id:        0x1ddaf754
> >>     flushes:        0
> >>     blocks:         488378640
> >>     free blocks:    217146980
> >>     root block:     37017218
> >>     tail policy:    0x2 (smart)
> >>     next oid:       0xedade
> >>     file count:     188313
> >>     tree height:    6
> >>     key policy:     LARGE
> >> 
> >>     CHECKING THE STORAGE TREE Read nodes 197008413 Nodes left in the
> tree
> >> 197008413 Leaves of them 194764277, Twigs of them 2217790 Time
> interval:
> >> Tue Aug 26 17:24:21 2014 - Wed Aug 27 01:25:31 2014 CHECKING EXTENT
> >> REGIONS. Read twigs 2217790 Time interval: Wed Aug 27 01:25:31 2014 -
> Wed
> >> Aug 27 03:35:39 2014 LOOKING FOR UNCONNECTED NODES FSCK: node.c: 108:
> >> repair_node_items_check: Node (43828275), items (0) and
> >> 
> >>     (1): Wrong order of keys.
> >>     FSCK: node.c: 108: repair_node_items_check: Node (52697435), items
> >> (79)
> >>     and (80): Wrong order of keys.
> >>     FSCK: node.c: 108: repair_node_items_check: Node (63227569), items
> >> (24)
> >>     and (25): Wrong order of keys.
> >>     FSCK: node.c: 108: repair_node_items_check: Node (63227571), items
> >> (73)
> >>     and (74): Wrong order of keys.
> >>     FSCK: node.c: 108: repair_node_items_check: Node (116595727), items
> >> (20)
> >>     and (21): Wrong order of keys.
> >>     FSCK: node.c: 108: repair_node_items_check: Node (227923161), items
> >> (22)
> >>     and (23): Wrong order of keys.
> >>     FSCK: node.c: 108: repair_node_items_check: Node (284305753), items
> >> (61)
> >>     and (62): Wrong order of keys.
> >>              Read nodes 1481038
> >> 
> >>     Good nodes 471512
> >> 
> >>                      Leaves of them 466164, Twigs of them 5348
> >>              Time interval: Wed Aug 27 03:35:57 2014 - Wed Aug 27
> >>              03:39:46
> >> 2014
> >> 
> >>     ***** fsck.reiser4 finished at Wed Aug 27 03:39:46 2014
> >>     Closing fs...done
> >> 
> >>     FS is consistent.
> >> 
> >> 
> >> 
> >> This is a bug in fsck: it jumps to wrong branch for some reasons.
> >> Not yet fixed.
> >> 
> >> Edward.
> >> 
> >> 
> ################
> Hello.
> 
> RE:
> Are you sure /media/disk mountpoint exists? If it does, what shows up
> from /proc/partitions? Is sdb a removable disk? Do you have udev
> running?..
> 
> - Are you sure /media/disk mountpoint exists? yes
> 
> 
> # ll /media/disk
> total 0
> 
> - what shows up from /proc/partitions ?
> 
> # ll  /proc/partitions
> -r--r--r-- 1 root root 0 Feb 23 07:40 /proc/partitions
> 
> # cat   /proc/partitions
> major minor  #blocks  name
> 
>    8        0   62522712 sda
>    8        1   18217678 sda1
>    8        2   12546765 sda2
>    8        3   29295173 sda3
>    8        4    2462720 sda4
>   11        0    1048575 sr0
>    8       16 1953514584 sdb
> 

ok.

> - Do you have udev running ?
> 
> # ps -ef | grep -i udev
> root       281     1  0 Feb22 ?        00:00:00
> /usr/lib/systemd/systemd-udevd
> 
> - By the way, did you try to run fsck on this disk ever since 08/26 last
> year?
> 
> yes with --check option
> 
> # fsck.reiser4 --check /dev/sdb 
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the /dev/sdb block device.                                        
>                                                                   
> Will check the consistency of the Reiser4 SuperBlock.                     
>                                                                   
> Will check the consistency of the Reiser4 FileSystem.                     
>                                                                   
> Continue?                                                                 
>                                                                   
> (Yes/No): yes
> ***** fsck.reiser4 started at Mon Feb 23 01:34:22 2015
> Reiser4 fs was detected on /dev/sdb.                                      
>                                                                   
> Master super block (16): 
> magic:          ReIsEr4 
> blksize:        4096 
> format:         0x0 (format40) 
> uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede 
> label:          <none> 
>  
> Format super block (17): 
> plugin:         format40 
> description:    Disk-format plugin. 
> version:        0 
> magic:          ReIsEr40FoRmAt 
> mkfs id:        0x1ddaf754 
> flushes:        0 
> blocks:         488378640 
> free blocks:    217146980 
> root block:     37017218 
> tail policy:    0x2 (smart) 
> next oid:       0xedade 
> file count:     188313 
> tree height:    6 
> key policy:     LARGE 
>  
> 
> CHECKING THE STORAGE TREE                                                 
>                                                                   
>         Read nodes 197008413                                              
>                                                                   
>         Nodes left in the tree 197008413 
>                 Leaves of them 194764277, Twigs of them 2217790 
>         Time interval: Mon Feb 23 01:36:17 2015 - Mon Feb 23 09:24:11 2015
> 
> CHECKING EXTENT REGIONS.                                                  
>                                                                   
>                                                ] 5%CHECKING THE STORAGE
> TREE                                                                       
>                                             
>         Read nodes 197008413                                              
>                                                                   
>         Nodes left in the tree 197008413 
>                 Leaves of them 194764277, Twigs of them 2217790 
>         Time interval: Mon Feb 23 01:36:17 2015 - Mon Feb 23 09:24:11 2015
> 
>         Read twigs 2217790                                                
>                                                                   
>         Time interval: Mon Feb 23 09:24:11 2015 - Mon Feb 23 11:34:13 2015
> 
> CHECKING THE SEMANTIC TREE                                                
>                                                                   
> FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
> plugin for the directory [29:0:2a].                                  
> FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
> opened. 

This looks like a generic format error. Roughly speaking, here your
current fsck fails to recognize a partition as the reiser4 one in its
current sense. The same thing may happen at runtime, so that
reiser4_mount() eventually return -ENOENT to the kernel. You should use
debugger or at least enable debugging output in the filesystem code to
be pretty confident of it.

So, my guess is that something get screwed up when you manually apply
all experimental patches against reiser4/progs release(s).

There are 2 ways to get it fixed.

The first one is to continue on with debugging, make dumps, use kgdb or
whatever kernel debugger you've got handy, etc. This routine would make
sense if you keep track of changes you do against reiser4/progs
releases, so that you will be able to identify the incompatible one and
roll it back. Either, you can guess what you are missing. It would also
help you to understand what you are doing.

Instead, you can just make use of the same mkfs/fsck, library and
kernel/module binaries that you have been using to format the disk and
mount it for the first time. Sure, if you did back it up.

In the hope it helps.

--
Regards,
Vladimir

>         Time interval: Mon Feb 23 11:34:13 2015 - Mon Feb 23 11:34:13 2015
>                                                                   
> FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and really
> used block bitmap differ.                                          
> ***** fsck.reiser4 finished at Mon Feb 23 11:34:13 2015
> Closing fs...done
> 
> 2 fatal corruptions were detected in FileSystem. Run with --build-fs
> option to fix them.
> #
> 
> 
> Next:
> -----
> Will run the following command and post result:
> # fsck.reiser4 --build-fs --force  /dev/sdb
> 
> 
> --Glenn


