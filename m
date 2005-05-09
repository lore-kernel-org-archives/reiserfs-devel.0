From: Linas Vepstas <linas@austin.ibm.com>
Subject: kernel BUG() hit during PCI testing
Date: Mon, 9 May 2005 17:23:14 -0500
Message-ID: <20050509222314.GA17876@austin.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24015-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-dev@namesys.com, reiserfs-list@namesys.com




Hi,

I just hit a kernel BUG() during pci testing of 2.6.11.8.  The goal of 
the testing was to temporarily disable a PCI slot containing a SCSI controller. 
I think I permanently killed the PCI slot; i/o died, and shortly after 
I hit the BUG().  See below.

The goal is, of course, to have the kernel keep on trooping even if 
the SCSI controller dies out from under it; returning -EIO to user apps
accessing the failed file system is acceptable.

--linas

io-falcons:~ # dmesg


-bash: /bin/dmesg: Input/output error

(Above is the "normal" message when a file system returns -EIO to user space;
I expect to see these kinds of messages if the block device under the
file system fails. Then, a second later I got the crash:

io-falcons:~ #
io-falcons:~ #
io-falcons:~ # cpu 0x0: Vector: 700 (Program Check) at [c0000001ffe73740]
    pc: c000000000138b48: .write_ordered_chunk+0xa4/0x100
    lr: c0000000001392f4: .write_ordered_buffers+0x348/0x364
    sp: c0000001ffe739c0
   msr: 9000000000029032
  current = 0xc0000003fe6d5030
  paca    = 0xc000000000547000
    pid   = 942, comm = reiserfs/0
kernel BUG in submit_ordered_buffer at fs/reiserfs/journal.c:616!
enter ? for help
0:mon>

0:mon> t
[c0000001ffe73a60] c0000000001392f4 .write_ordered_buffers+0x348/0x364
[c0000001ffe73c30] c000000000139b70 .flush_commit_list+0x80c/0x8cc
[c0000001ffe73d10] c00000000013eb40 .flush_async_commits+0xf0/0xf4
[c0000001ffe73db0] c00000000006f5dc .worker_thread+0x258/0x32c
[c0000001ffe73ee0] c000000000076060 .kthread+0x174/0x1c8
[c0000001ffe73f90] c000000000014388 .kernel_thread+0x4c/0x6c

0:mon> r
R00 = 000000000000001c   R16 = 0000000000000000
R01 = c0000001ffe739c0   R17 = 0000000000000000
R02 = c0000000007017e8   R18 = 0000000003a10000
R03 = c0000001ffe73ad0   R19 = 0000000003edf020
R04 = c0000001f4031a78   R20 = 0000000000000000
R05 = d000000000080168   R21 = d000000000080000
R06 = c0000000006cf2a8   R22 = c0000003f8ca3aa8
R07 = 0000000000000000   R23 = 00000000000982f1
R08 = c0000003f8ca3b28   R24 = fffffffffffffffb
R09 = 0000000000000000   R25 = c0000001ffe73be0
R10 = c0000003f8ca3b28   R26 = c0000000006cf218
R11 = 0000000000000000   R27 = c0000001ffe73ad0
R12 = 0000000044044022   R28 = 0000000000000000
R13 = c000000000547000   R29 = 0000000000000002
R14 = 0000000000000000   R30 = c000000000594018
R15 = 0000000000000000   R31 = c0000001ffe739c0
pc  = c000000000138b48 .write_ordered_chunk+0xa4/0x100
lr  = c0000000001392f4 .write_ordered_buffers+0x348/0x364
msr = 9000000000029032   cr  = 24044024
ctr = c00000000013ea50   xer = 000000000000ff7f   trap =      700
0:mon>

