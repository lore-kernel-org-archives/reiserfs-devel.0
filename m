From: Claudio Martins <ctpm@rnl.ist.utl.pt>
Subject: oops testing reiser4 with 2.5.72
Date: Sun, 29 Jun 2003 05:39:03 +0100
Message-ID: <200306290539.03118.ctpm@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14783-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


  Greetings to all

  I don't know if reporting potential reiser4 crashes is apropriate at this 
time, since the code is still changing fast, but anyway I hope this helps.

  I have been testing reiser4 and kernel snapshot (2.5.72) from namesys 
bitkeeper repository from 24/06/2003.

  My setup is composed of a 40GB reiser4 partition (Quantum Fireball Plus AS 
40GB), formated with default options (smart40). The other partitions on the 
machine are using reiserfs.

 The stress method I used was to extract in paralell around 5 big different 
tarballs located on another partition, into different directories on the 
reiser4 partition. The tarballs range from linux-kernel source (30MB) to 
openoffice sources (160MB compressed),  thus composed of many thousands of 
small files and directories. 
 At the same time a 12GB file was also being copied into the reiser4 
partition, and an already decompressed kernel tree together with two 700MB 
files were being copied from the reiser4 to another partition.

  This method caused considerable load on the system, and after about 5 
minutes into the test, I got the following oops:

Unable to handle kernel NULL pointer dereference at virtual address 00000014
 printing eip:
c01de9d2
*pde = 00000000
Oops: 0002 [#1]
CPU:    0
EIP:    0060:[<c01de9d2>]    Not tainted
EFLAGS: 00010202
EIP is at protect_extent_nodes+0x9a/0x290
eax: 00000000   ebx: c8b9e000   ecx: 00000000   edx: 00000015
esi: 00000000   edi: 0000275c   ebp: 00000000   esp: c8b9fa28
ds: 007b   es: 007b   ss: 0068
Process pdflush (pid: 20617, threadinfo=c8b9e000 task=c541a080)
Stack: 00000000 00000001 c8b9fb78 c8b9fb38 00000000 d2d14024 00000000
00000000
       c3fbb020 00000000 00000003 c8b9fb78 c8b9fb38 c8b9fb38 0000275c
00000000
       c3fbb020 d2d14024 00000003 c8b9fb78 c8b9fba0 00000003 c01e16a2
c8b9fba0
Call Trace:
 [<c01e16a2>] item_length_by_coord+0x12/0x18
 [<c01ded74>] allocate_and_copy_extent+0x1ac/0x3dc
 [<c01bf9da>] __reiser4_grab_space+0x3a/0x9c
 [<c01c246d>] znode_make_dirty+0x99/0xac
 [<c01d2566>] plugin_by_unsafe_id+0x1e/0xa8
 [<c01e1709>] item_id_by_coord+0x11/0x30
 [<c01c44a0>] squeeze_right_twig+0x58/0x170
 [<c01b857b>] zload_ra+0x23/0x28
 [<c01c4601>] squeeze_right_twig_and_advance_coord+0x15/0x4c
 [<c01c4bd5>] handle_pos_end_of_twig+0x99/0x294
 [<c01bedcb>] coord_next_unit+0x3b/0x94
 [<c01c502f>] squalloc+0x23/0x48
 [<c01c3b6a>] jnode_flush+0x18e/0x284
 [<c01c3e37>] flush_current_atom+0x1bf/0x258
 [<c01c1694>] flush_some_atom+0x130/0x194
 [<c01cdf62>] writeout+0x36/0x54
 [<c01cdfca>] reiser4_sync_inodes+0x4a/0x64
 [<c015f788>] sync_sb_inodes+0x18/0x2c
 [<c015f7ee>] writeback_inodes+0x52/0x90
 [<c0130a98>] background_writeout+0x54/0xb0
 [<c01310f9>] __pdflush+0x109/0x1ac
 [<c013119c>] pdflush+0x0/0x14
 [<c01311a7>] pdflush+0xb/0x14
 [<c0130a44>] background_writeout+0x0/0xb0
 [<c0106f1d>] kernel_thread_helper+0x5/0xc

Code: 0f ab 56 14 8b 46 14 f6 c4 08 0f 84 80 00 00 00 83 7c 24 10
 <6>note: pdflush[20617] exited with preempt_count 1


   At least 4 of the processes reading/writing to the reiser4 partition got 
stuck in the D state (the tars and the 12GB file copy), but I was able to 
interrupt the others. After this I rebooted to kill the stuck processes, 
though the system was still usable.

  After reboot I was able to mount reiser4 fs without problems and could see 
the files that had been copied up to the oops. The partition was about 60% 
full at the time.

 I am not sure if this oops is really related to reiser4 or to the block io / 
pdflush code. But otherwise the system has been stable with good old reiserfs 
on the other disks. If you think this oops is not related to reiser4 please 
tell me and I'll be happy to report it on the kernel list or do more tests.

  The relevant part of the kernel config is:

CONFIG_REISER4_FS=y
# CONFIG_REISER4_FS_SYSCALL is not set
# CONFIG_REISER4_CHECK is not set
CONFIG_REISER4_USE_EFLUSH=y
# CONFIG_REISER4_BADBLOCKS is not set


  The machine is a PII 350 with 320MB RAM, running Debian.
  If needed I can give other details about the setup or do more tests.

Thanks for your attention

Best regards

Claudio Martins



