From: Linas Vepstas <linas@austin.ibm.com>
Subject: BUG in submit_ordered_buffer at fs/reiserfs/journal.c:616!
Date: Fri, 11 Mar 2005 16:49:36 -0600
Message-ID: <20050311224936.GK1220@austin.ibm.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-dev@namesys.com
Cc: reiserfs-list@namesys.com



Hi,

I've been experimenting with automatic bus error recovery in the
2.6.11 kernel.  During one of my failed experiments, I tripped over
a Reiserfs bug, below.  Basically, my error recovery failed, which
means a SCSI disk went permanently offline, which, admitedly,
is pretty catastrophic, but shouldn't be a kernel panic.  It seems
that reiser hits a 'BUG_ON' in this case.

FWIW, in my limited experience with ext3 in the same exact situation, 
it seems that ext3 handles this gracefully, returning -EIO to all 
affected apps accessing the disk.

Unfortunately, I don't know how to tell you how to reproduce this :)

--linas


Here's dmesg leading up to the failure, and the stack traces are shown below.

<4>sym0:8:0: HOST RESET operation timed-out.
<6>scsi: Device offlined - not ready after error recovery: host 0 channel 0 id 8 lun 0
<3>scsi0 (8:0): rejecting I/O to offline device
<3>scsi0 (8:0): rejecting I/O to offline device
<3>Buffer I/O error on device sda3, logical block 8210
<4>lost page write due to I/O error on sda3
<4>ReiserFS: sda3: warning: journal-837: IO error during journal replay 
<2>REISERFS: abort (device sda3): Write error while updating journal header in flush_journal_list
<2>REISERFS: Aborting journal for filesystem on sda3
<3>scsi0 (8:0): rejecting I/O to offline device
<3>Buffer I/O error on device sda3, logical block 741
<4>lost page write due to I/O error on sda3
<3>Buffer I/O error on device sda3, logical block 742
<4>lost page write due to I/O error on sda3
<3>Buffer I/O error on device sda3, logical block 743
<4>lost page write due to I/O error on sda3
<3>Buffer I/O error on device sda3, logical block 744
<4>lost page write due to I/O error on sda3
<3>Buffer I/O error on device sda3, logical block 745
<4>lost page write due to I/O error on sda3
<3>Buffer I/O error on device sda3, logical block 746
<4>lost page write due to I/O error on sda3
<3>Buffer I/O error on device sda3, logical block 747
<4>lost page write due to I/O error on sda3
<3>Buffer I/O error on device sda3, logical block 748
<4>lost page write due to I/O error on sda3
<3>Buffer I/O error on device sda3, logical block 749
<4>lost page write due to I/O error on sda3
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda3: warning: clm-6006: writing inode 346759 on readonly FS
<4>ReiserFS: sda3: warning: clm-6006: writing inode 346759 on readonly FS
<4>ReiserFS: sda3: warning: clm-6006: writing inode 346759 on readonly FS
<4>ReiserFS: sda3: warning: clm-6006: writing inode 346759 on readonly FS
<4>ReiserFS: sda3: warning: clm-6006: writing inode 346759 on readonly FS
<4>ReiserFS: sda3: warning: clm-6006: writing inode 346759 on readonly FS
<2>kernel BUG in submit_ordered_buffer at fs/reiserfs/journal.c:616!
<3>scsi0 (8:0): rejecting I/O to offline device


cpu 0x1: Vector: 700 (Program Check) at [c00000000fcef740]
    pc: c000000000132ac8: .write_ordered_chunk+0xa4/0x100
    lr: c000000000133274: .write_ordered_buffers+0x348/0x364
    sp: c00000000fcef9c0
   msr: 9000000000029032
  current = 0xc00000000fea87b0
  paca    = 0xc00000000053b400
    pid   = 953, comm = reiserfs/1
kernel BUG in submit_ordered_buffer at fs/reiserfs/journal.c:616!
enter ? for help
1:mon> t
[c00000000fcefa60] c000000000133274 .write_ordered_buffers+0x348/0x364
[c00000000fcefc30] c000000000133af0 .flush_commit_list+0x80c/0x8cc
[c00000000fcefd10] c000000000138ac0 .flush_async_commits+0xf0/0xf4
[c00000000fcefdb0] c00000000006d2fc .worker_thread+0x258/0x32c
[c00000000fcefee0] c000000000073d80 .kthread+0x174/0x1c8
[c00000000fceff90] c000000000014240 .kernel_thread+0x4c/0x6c
1:mon>
1:mon> c
cpus stopped: 0-3
1:mon> c 0
0:mon> t
[c0000000004efdd0] c00000000000f948 .cpu_idle+0x3c/0x54
[c0000000004efe50] c00000000000c188 .rest_init+0x3c/0x58
[c0000000004efed0] c00000000049b7dc .start_kernel+0x27c/0x2fc
[c0000000004eff90] c00000000000c000 .__setup_cpu_power3+0x0/0x4
0:mon> c 2
2:mon> t
[c00000000424fe80] c00000000000f948 .cpu_idle+0x3c/0x54
[c00000000424ff00] c00000000003a878 .start_secondary+0x108/0x148
[c00000000424ff90] c00000000000bd28 .enable_64b_mode+0x0/0x28
2:mon> c 3
3:mon> t
[c000000004253e80] c00000000000f948 .cpu_idle+0x3c/0x54
[c000000004253f00] c00000000003a878 .start_secondary+0x108/0x148
[c000000004253f90] c00000000000bd28 .enable_64b_mode+0x0/0x28

