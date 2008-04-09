From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 on 2.6.24: corruption, hang on read()
Date: Thu, 10 Apr 2008 02:04:36 +0400
Message-ID: <47FD3D74.8080408@gmail.com>
References: <54b33ccd0804091310j25978ab3p6621e8896ae2b493@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <54b33ccd0804091310j25978ab3p6621e8896ae2b493@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marti Raudsepp <marti@juffo.org>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hello.

There are 2 pending patches against reiser4-for-2.6.24.
They fix some bugs that can be related to your corruption:

http://marc.info/?l=reiserfs-devel&m=120498592129461&q=p3
http://marc.info/?l=reiserfs-devel&m=120527307032124&q=p3

Please, apply, and  report if any problems..

Thanks,
Edward.

Marti Raudsepp wrote:

>Hello,
>
>I recently found my computer consuming 100% of CPU in system; some
>investigation revealed that this was caused by some zombie processes
>attempting to read a particular file, not returning from the syscall.
>Kill had no effect on the processes. Metadata operations (stat,
>rename, etc) still succeeded, but according to strace, processes
>reading the file froze after the second read() to the given file.
>There were no relevant messages in dmesg.
>
>Apparently the problematic file has been truncated; I am not sure if
>that happened during normal operation or was part of the malfunction.
>
>When the problem re-appeared after a reboot, I decided to run fsck on
>the file system which found several problems, including 1 fatal
>corruption. I made a backup copy of the entire partition (in case more
>analysis is necessary) and ran fsck --build-fs on it. After the
>rebuild, the file system appears to be performing normally.
>
>This file system had been subject to moderate, but constant
>multithreaded load for over a week now. As far as I know, this file
>system has not had to tolerate unexpected resets or power loss. The
>file system is located on a LVM volume, which sits on top of software
>RAID0, on two identical SATA disks.
>
>uname -a: Linux hez 2.6.24-gentoo-r4 #1 SMP Wed Apr 9 18:47:14 UTC
>2008 x86_64 AMD Athlon(tm) 64 X2 Dual Core Processor 5600+
>AuthenticAMD GNU/Linux
>(this kernel was built after the problem occured; the corruption
>happened with the initial vanilla 2.6.24 release)
>
>Here's the fsck output:
>--------------------------------------------------------------------------
>***** fsck.reiser4 started at Wed Apr  9 19:07:37 2008
>Reiser4 fs was detected on /dev/mapper/plain-freenet.
>Master super block (16):
>magic:          ReIsEr4
>blksize:        4096
>format:         0x0 (format40)
>uuid:           e70223e5-e538-4491-ab8a-98509c426814
>label:          <none>
>
>Format super block (17):
>plugin:         format40
>description:    Disk-format plugin.
>version:        0
>magic:          ReIsEr40FoRmAt
>mkfs id:        0x2ea688e7
>flushes:        0
>blocks:         2096640
>free blocks:    284099
>root block:     87
>tail policy:    0x2 (smart)
>next oid:       0x80db5
>file count:     14470
>tree height:    5
>key policy:     LARGE
>
>
>CHECKING THE STORAGE TREE
>        Read nodes 5588
>        Nodes left in the tree 5588
>                Leaves of them 2328, Twigs of them 3153
>        Time interval: Wed Apr  9 19:07:38 2008 - Wed Apr  9 19:08:32 2008
>CHECKING EXTENT REGIONS.
>FSCK: extent40_repair.c: 96: extent40_check_layout: Node (1395911),
>item (5), unit (9),
>[11d61:4(FB):174656d702d3761:77f11:0]: points out of the fs, region
>[2096637..2096639].
>        Read twigs 3153
>        Invaid extent pointers 1
>        Time interval: Wed Apr  9 19:08:32 2008 - Wed Apr  9 19:08:32 2008
>CHECKING THE SEMANTIC TREE
>FSCK: obj40_repair.c: 350: obj40_stat_lw_check: Node (611499), item
>(24), [10004:727470726f7073:80b2d]
>(stat40): wrong size (15697), Should be (12288).
>        Found 14470 objects (some could be encountered more then
>once).
>        Time interval: Wed Apr  9 19:08:32 2008 - Wed Apr  9 19:08:33 2008
>FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and
>really used block bitmap differ.
>***** fsck.reiser4 finished at Wed Apr  9 19:08:33 2008
>Closing fs...done
>
>1 fatal corruptions were detected in FileSystem. Run with --build-fs
>option to fix them.
>--------------------------------------------------------------------------
>
>Output of fsck.reiser4 --rebuild-fs:
>--------------------------------------------------------------------------
>CHECKING THE STORAGE TREE
>        Read nodes 5588
>        Nodes left in the tree 5588
>                Leaves of them 2328, Twigs of them 3153
>        Time interval: Wed Apr  9 19:40:52 2008 - Wed Apr  9 19:41:55
>2008
>CHECKING EXTENT REGIONS.
>FSCK: extent40_repair.c: 96: extent40_check_layout: Node (1395911),
>item (5), unit (9),
>[11d61:4(FB):174656d702d3761:77f11:0]: points out of the fs, region
>[2096637..2096639]. Zeroed.
>        Read twigs 3153
>        Corrected nodes 1
>        Fixed invalid extent pointers 1
>        Time interval: Wed Apr  9 19:41:55 2008 - Wed Apr  9 19:41:55
>2008
>LOOKING FOR UNCONNECTED NODES
>        Read nodes 3
>        Good nodes 0
>                Leaves of them 0, Twigs of them 0
>        Time interval: Wed Apr  9 19:41:55 2008 - Wed Apr  9 19:41:55
>2008
>CHECKING EXTENT REGIONS.
>        Read twigs 0
>        Time interval: Wed Apr  9 19:41:55 2008 - Wed Apr  9 19:41:55
>2008
>INSERTING UNCONNECTED NODES
>1. Twigs: done
>2. Twigs by item: done
>3. Leaves: done
>4. Leaves by item: done
>        Twigs: read 0, inserted 0, by item 0, empty 0
>        Leaves: read 0, inserted 0, by item 0
>        Time interval: Wed Apr  9 19:41:55 2008 - Wed Apr  9 19:41:55
>2008
>CHECKING THE SEMANTIC TREE
>FSCK: semantic.c: 705: repair_semantic_lost_prepare: No 'lost+found'
>entry found. Building a new object with the key 2a:0:ffff.
>FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize
>the plugin for the directory [2a:0:ffff].
>FSCK: semantic.c: 581: repair_semantic_dir_open: Trying to recover the
>directory [2a:0:ffff] with the default  plugin--dir40.
>FSCK: obj40_repair.c: 576: obj40_prepare_stat: The file [2a:0:ffff]
>does not have a StatData item. Creating a new one. Plugin dir40.
>FSCK: dir40_repair.c: 40: dir40_dot: Directory [2a:0:ffff]: The entry
>"." is not found. Insert a new one. Plugin (dir40).
>FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (7634), item
>(2), [2a:0:ffff] (stat40): wrong bytes (0), Fixed to (50).
>FSCK: obj40_repair.c: 350: obj40_stat_lw_check: Node (7634), item (2),
>[2a:0:ffff] (stat40): wrong size (0), Fixed to (1).
>FSCK: obj40_repair.c: 350: obj40_stat_lw_check: Node (611500), item
>(23), [10004:727470726f7073:80b2d]
>(stat40): wrong size (15697), Fixed to (12288).
>FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (1260934), item
>(37), [11d61:174656d702d3761:77f11]
>(stat40): wrong bytes (528384), Fixed to (516096).
>        Found 14471 objects.
>        Time interval: Wed Apr  9 19:41:55 2008 - Wed Apr  9 19:41:56 2008
>CLEANING UP THE STORAGE TREE
>        Removed items 57
>        Time interval: Wed Apr  9 19:41:56 2008 - Wed Apr  9 19:41:56 2008
>FSCK: repair.c: 677: repair_update: File count 14470 is wrong. Fixed to 14471.
>***** fsck.reiser4 finished at Wed Apr  9 19:41:56 2008
>--------------------------------------------------------------------------
>
>
>Regards,
>Marti Raudsepp
>--
>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>

