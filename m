From: Hans Reiser <reiser@namesys.com>
Subject: Re: bug report (?) with  reiserfsck --rebuild-tree.......
Date: Sat, 10 May 2003 20:31:50 +0400
Message-ID: <3EBD2976.2080406@namesys.com>
References: <20030510145146.58538.qmail@web13901.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14056-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030510145146.58538.qmail@web13901.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: serge rossel <serger@rocketmail.com>, reiserfs-list@namesys.com

Vitaly, does the current fsck explain at length that read errors tend to 
be hardware failures, and what to do?


Hans

serge rossel wrote:

>Hi,
>
>During the system boot (Suse8.1), I get this
>boot_log.msg:
>
>
>dd: no flushcache support
><6>scsi0 : SCSI host adapter emulation for IDE ATAPI
>devices
><4>  Vendor: JLMS      Model: XJ-HD166S         Rev:
>DS0F
><4>  Type:   CD-ROM                             ANSI
>SCSI revision: 02
><4>  Vendor: SONY      Model: CD-RW  CRX175A    Rev:
>1.0h
><4>  Type:   CD-ROM                             ANSI
>SCSI revision: 02
><7>sd_attach()
><7>sd_attach()
><4>reiserfs: found format "3.6" with standard journal
><4>reiserfs: checking transaction log (ide0(3,2)) for
>(ide0(3,2))
><4>reiserfs: using ordered data mode
><4>Using r5 hash to sort names
><4>VFS: Mounted root (reiserfs filesystem) readonly.
><5>Trying to move old root to /initrd ... failed
><5>Unmounting old root
><5>Trying to free ramdisk memory ... okay
><6>Freeing unused kernel memory: 164k freed
><6>md: Autodetecting RAID arrays.
><6>md: autorun ...
><6>md: ... autorun DONE.
><6>LVM version 1.0.5(mp-v6)(15/07/2002) module loaded
><6>Adding Swap: 136544k swap-space (priority 42)
><4>reiserfs: found format "3.6" with standard journal
><4>hda: read_intr: status=0x59 { DriveReady
>SeekComplete DataRequest Error }
><4>hda: read_intr: error=0x40 { UncorrectableError },
>LBAsect=230962500, sector=188743680
><4>end_request: I/O error, dev 03:04 (hda), sector
>188743680
><4>sh-2029: reiserfs read_bitmaps: bitmap block
>(#23592960) reading failed
><4>sh-2014: reiserfs_read_super: unable to read bitmap
><4>hda: read_intr: status=0x59 { DriveReady
>SeekComplete DataRequest Error }
><4>hda: read_intr: error=0x40 { UncorrectableError },
>LBAsect=231224644, sector=189005824
><4>end_request: I/O error, dev 03:04 (hda), sector
>189005824
><4>hda: read_intr: status=0x59 { DriveReady
>SeekComplete DataRequest Error }
><4>hda: read_intr: error=0x40 { UncorrectableError },
>LBAsect=231486789, sector=189267968
><4>end_request: I/O error, dev 03:04 (hda), sector
>189267968
>Kernel logging (ksyslog) stopped.
>Kernel log daemon terminating.
>
>
>Then, in order to solve that, I have tried all the
>different commands proposed with reiserfsck.
>
>Look what message I get by using this command.
>
>Thank you for your support
>Serge
>
>
>serge@dhcppc2:~> su
>Password:
>dhcppc2:/home/serge # reiserfsck --rebuild-tree 
>--logfile check.log /var/log
>reiserfsck 3.6.2 (2002)
> 
>**********************************************************
>  ** This  is  an  experimental  version  of 
>reiserfsck, 
>****!! MAKE A BACKUP FIRST !! **** Don't run this
>program unless something  is  broken. **
>  ** Some types of random FS damage can be recovered
>from ** ** by  this  program,   which  basically  
>throws away ** ** the internal nodes of the tree and
>then reconstructs ** ** them. This program is for use
>only by the desperate, ** ** and is of only beta
>quality.  If you are using  the **  ** latest 
>reiserfsprogs  and  it  fails  please  email ** ** bug
>reports to reiserfs-list@namesys.com.**
> 
>**********************************************************
>
>Will rebuild the filesystem (/var/log) tree
>Will put log info to 'check.log'
>
>Do you want to run this program?[N/Yes] (note need to
>type Yes):Yes
>
>bread: Cannot read a block # 2.
>
>Abandon
>
>dhcppc2:/home/serge #
>
>__________________________________
>Do you Yahoo!?
>The New Yahoo! Search - Faster. Easier. Bingo.
>http://search.yahoo.com
>
>
>  
>


-- 
Hans


