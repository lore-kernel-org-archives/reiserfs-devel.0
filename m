From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser (3.6) PANIC.
Date: Tue, 26 Sep 2006 11:48:11 +0400
Message-ID: <4518DB3B.3070808@namesys.com>
References: <451860D5.2060305@catbus.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29981-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <451860D5.2060305@catbus.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: James Beal <james_@catbus.co.uk>
Cc: reiserfs-list@namesys.com

James Beal wrote:

> This occurrs when trying to delete some files, repeatedly even after a
> /sbin/reiserfsck --rebuild-tree ?
> Any hints ?
>

Would you please upgrade your kernel to the latest stable version.
I believe this bug is fixed there.

>
> [james_@vmware ~]$ uname -a
> Linux vmware 2.6.15.2 #4 SMP Fri Feb 17 23:23:07 GMT 2006 i686 athlon
> i386 GNU/Linux
> [james_@vmware ~]$ df -k /export/homeb/
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sda5            2050554248 2048775976   1778272 100% /export/homeb
>
>
> 3w-9xxx: scsi0: AEN: INFO (0x04:0x0029): Verify started:unit=0.
> 3w-9xxx: scsi0: AEN: INFO (0x04:0x002B): Verify completed:unit=0.
> 3w-9xxx: scsi0: AEN: INFO (0x04:0x0029): Verify started:unit=0.
> 3w-9xxx: scsi0: AEN: INFO (0x04:0x002B): Verify completed:unit=0.
> REISERFS: panic (device sda5): journal-1413: journal_mark_dirty: j_len
> (1024) is too big
>
> ------------[ cut here ]------------
> kernel BUG at fs/reiserfs/prints.c:362!
> invalid operand: 0000 [#1]
> SMP
> Modules linked in: vmnet vmmon nfsd exportfs lockd ipv6 parport_pc lp
> parport autofs4 it87 hwmon_vid i2c_isa i2c_core sunrpc dm_mirror
> dm_mod button battery ac uhci_hcd ehci_hcd shpchp via_rhine e1000 e100
> mii floppy sata_nv ext3 jbd sata_sil libata 3w_9xxx sd_mod scsi_mod
> CPU:    0
> EIP:    0060:[<c01a00df>]    Tainted: P      VLI
> EFLAGS: 00010282   (2.6.15.2)
> EIP is at reiserfs_panic+0x36/0x56
> eax: 00000063   ebx: c031f097   ecx: edcb3b78   edx: c0321245
> esi: f736aa00   edi: f736ab98   ebp: f41bf1d8   esp: edcb3b74
> ds: 007b   es: 007b   ss: 0068
> Process rm (pid: 16643, threadinfo=edcb3000 task=ea4b5ab0)
> Stack: c0321245 f736ab98 c0486a40 f736aa00 ffffffff f899a000 c01ab985
> f736aa00
>        c0323238 00000400 edcb3f04 00000000 edcb3f04 00007fff f736aa00
> 00000f62
>        f897a000 c018ce56 f50187bc f5045000 07b17fff eaf90bb8 edcb3f04
> 07b17fff
> Call Trace:
>  [<c01ab985>] journal_mark_dirty+0x127/0x23e
>  [<c018ce56>] _reiserfs_free_block+0xf0/0x16e
>  [<c01a59a8>] prepare_for_delete_or_cut+0x5f1/0x665
>  [<c019c8d6>] fix_nodes+0x1c7/0x309
>  [<c01a6680>] reiserfs_cut_from_item+0xa5/0x419
>  [<c01a6d77>] reiserfs_do_truncate+0x317/0x442
>  [<c01a621a>] reiserfs_delete_object+0x2f/0x59
>  [<c0192eec>] reiserfs_delete_inode+0x0/0x111
>  [<c0192f85>] reiserfs_delete_inode+0x99/0x111
>  [<c016998a>] d_delete+0x102/0x108
>  [<c0192eec>] reiserfs_delete_inode+0x0/0x111
>  [<c016b2d8>] generic_delete_inode+0xa7/0x113
>  [<c016b4d9>] iput+0x5f/0x61
>  [<c0162c7d>] sys_unlink+0xce/0x109
>  [<c0164fa0>] sys_getdents64+0xa6/0xb0
>  [<c0103267>] sysenter_past_esp+0x54/0x75
> Code: 8b 44 24 14 bb 97 f0 31 c0 8d be 98 01 00 00 e8 e7 fd ff ff 68
> 40 6a 48 c0 85 f6 89 d8 0f 45 c7 50 68 45 12 32 c0 e8 ef cc f7 ff <0f>
> 0b 6a 01 69 12 32 c0 83 c4 0c 85 f6 68 40 6a 48 c0 0f 45 df
>  Badness in do_exit at kernel/exit.c:796
>  [<c011edc1>] do_exit+0x3f/0x34a
>  [<c010444f>] do_divide_error+0x0/0x88
>  [<c010459d>] do_invalid_op+0x0/0x8b
>  [<c010461c>] do_invalid_op+0x7f/0x8b
>  [<c01a00df>] reiserfs_panic+0x36/0x56
>  [<c011d12a>] release_console_sem+0xa4/0xaa
>  [<c011cfdf>] vprintk+0x200/0x224
>  [<c01e9867>] vsnprintf+0x45e/0x49e
>  [<c0103e5f>] error_code+0x4f/0x54
>  [<c01a00df>] reiserfs_panic+0x36/0x56
>  [<c01ab985>] journal_mark_dirty+0x127/0x23e
>  [<c018ce56>] _reiserfs_free_block+0xf0/0x16e
>  [<c01a59a8>] prepare_for_delete_or_cut+0x5f1/0x665
>  [<c019c8d6>] fix_nodes+0x1c7/0x309
>  [<c01a6680>] reiserfs_cut_from_item+0xa5/0x419
>  [<c01a6d77>] reiserfs_do_truncate+0x317/0x442
>  [<c01a621a>] reiserfs_delete_object+0x2f/0x59
>  [<c0192eec>] reiserfs_delete_inode+0x0/0x111
>  [<c0192f85>] reiserfs_delete_inode+0x99/0x111
>  [<c016998a>] d_delete+0x102/0x108
>  [<c0192eec>] reiserfs_delete_inode+0x0/0x111
>  [<c016b2d8>] generic_delete_inode+0xa7/0x113
>  [<c016b4d9>] iput+0x5f/0x61
>  [<c0162c7d>] sys_unlink+0xce/0x109
>  [<c0164fa0>] sys_getdents64+0xa6/0xb0
>  [<c0103267>] sysenter_past_esp+0x54/0x75
>
>
> - From a previous reiserfsck
>
> /sbin/reiserfsck --fix-fixable --logfile  /big.log /dev/sda5
> reiserfsck 3.6.19 (2003 www.namesys.com)
>
> *************************************************************
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
>
> Will check consistency of the filesystem on /dev/sda5
> and will fix what can be fixed without --rebuild-tree
> Will put log info to '/big.log'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> ###########
> reiserfsck --fix-fixable started at Mon Sep 25 01:25:38 2006
> ###########
> Replaying journal..
> Reiserfs journal '/dev/sda5' in blocks [18..8211]: 0 transactions replayed
> Checking internal tree..finished                              
> Comparing bitmaps..Bad nodes were found, Semantic pass skipped
> 2 found corruptions can be fixed only when running with --rebuild-tree
> ###########
> reiserfsck finished at Mon Sep 25 01:57:22 2006
> ###########
> [root@vmware james_]# /sbin/reiserfsck --rebuild-tree --logfile
> /big1.log /dev/sda5
> reiserfsck 3.6.19 (2003 www.namesys.com)
>
> *************************************************************
> ** Do not  run  the  program  with  --rebuild-tree  unless **
> ** something is broken and MAKE A BACKUP  before using it. **
> ** If you have bad sectors on a drive  it is usually a bad **
> ** idea to continue using it. Then you probably should get **
> ** a working hard drive, copy the file system from the bad **
> ** drive  to the good one -- dd_rescue is  a good tool for **
> ** that -- and only then run this program.                 **
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
>
> Will rebuild the filesystem (/dev/sda5) tree
> Will put log info to '/big1.log'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> Replaying journal..
> Reiserfs journal '/dev/sda5' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Mon Sep 25 02:04:06 2006
> ###########
>
> Pass 0:
> Loading on-disk bitmap .. ok, 512607558 blocks marked used
> Skipping 23855 blocks (super block, journal, bitmaps) 512583703 blocks
> will be read
> 0%..                                                          left 0,
> 17342 /secc       "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 512583703
>                 Leaves among those 524920
>                         - corrected leaves 1
>                         - leaves all contents of which could not be
> saved and deleted 55
>                 Objectids found 153581
>
> Pass 1 (will try to insert 524865 leaves):
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....100%                         left 0,
> 161 /sec
> Flushing..finished
>         524865 leaves read
>                 524529 inserted
>                 336 not inserted
>
> Pass 2:
> 0%....20%....40%....60%....80%....100%                           left
> 0, 3 /sec
> Flushing..finished
>         Leaves inserted item by item 336
> Pass 3 (semantic):
> Flushing..finished                                                         
>  
>  
>
>         Files found: 144973
>         Directories found: 8208
>         Symlinks found: 16
> Pass 3a (looking for lost dir/files):
> Looking for lost directories:
> Flushing..finished3, 118 /sec
> Pass 4 - finished done 524746, 86 /sec
>         Deleted unreachable items 66
> Flushing..finished
> Syncing..finished
> ###########
> reiserfsck finished at Mon Sep 25 12:55:22 2006
> ###########
>
>
> [james_@vmware ~]$ cat /proc/cpuinfo
> processor       : 0
> vendor_id       : AuthenticAMD
> cpu family      : 15
> model           : 47
> model name      : AMD Athlon(tm) 64 Processor 3200+
> stepping        : 2
> cpu MHz         : 2000.613
> cache size      : 512 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 1
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
> mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext
> fxsr_opt lm 3dnowext 3dnow pni lahf_lm
> bogomips        : 4003.63
>
> [james_@vmware ~]$ cat /proc/meminfo
> MemTotal:      3105736 kB
> MemFree:        863820 kB
> Buffers:        534992 kB
> Cached:        1582188 kB
> SwapCached:          0 kB
> Active:         709844 kB
> Inactive:      1452708 kB
> HighTotal:     2228032 kB
> HighFree:       575256 kB
> LowTotal:       877704 kB
> LowFree:        288564 kB
> SwapTotal:     2096472 kB
> SwapFree:      2096472 kB
> Dirty:              80 kB
> Writeback:           0 kB
> Mapped:         607600 kB
> Slab:            44732 kB
> CommitLimit:   3649340 kB
> Committed_AS:   275628 kB
> PageTables:       2900 kB
> VmallocTotal:   116728 kB
> VmallocUsed:      5476 kB
> VmallocChunk:   110324 kB
> HugePages_Total:     0
> HugePages_Free:      0
> Hugepagesize:     2048 kB

