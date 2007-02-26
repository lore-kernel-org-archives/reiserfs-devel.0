From: Daniel Ho <ho@ibnm.uni-hannover.de>
Subject: reiserfs_panic
Date: Mon, 26 Feb 2007 11:28:59 +0100
Message-ID: <1172485739.23115.28.camel@courant.ifbnm.uni-hannover.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

To whom it may concerns,
I have a problem with the 3.6 reiserfs file system on my file server. 

Hardware: LSI controller MegaRaid sata 300-8x with 8 x 300 GB in Raid 5

I did setup the system 1 year ago and it worked fine for the last year.
But now I have massiv file system problems. The whole data partition
hangs when I try copy big files. I can not even reboot my machine.
I have changed the memory on the machine and flush the latest firmware
for the LSI controller. Is there any reiserfs bug known that can be the
reason for this problem?

Best regards
D.Ho

Distribution: Suse 10.0
Kernel: 2.6.13-15.13-smp
Reiserfs: reiserfs-3.6.18-5

Error messages from warn:

Feb 26 09:37:35 navier kernel:
Feb 26 09:37:35 navier kernel: ------------[ cut here ]------------
Feb 26 09:37:35 navier kernel: SMP
Feb 26 09:37:35 navier kernel: Modules linked in: nfsd exportfs ipv6
speedstep_lib freq_table button battery ac ide_cd cdrom edd tg3 generic
i2c
_i801 i2c_core uhci_hcd ehci_hcd shpchp pci_hotplug usbcore af_packet
parport_pc lp parport dm_mod reiserfs jbd raid1 fan thermal processor
mega
raid_mbox megaraid_mm ata_piix sg ahci libata piix sd_mod scsi_mod
ide_disk ide_core
Feb 26 09:37:35 navier kernel: CPU:    0
Feb 26 09:37:35 navier kernel: EIP:    0060:[<f8d0ae21>]    Not tainted
VLI
Feb 26 09:37:35 navier kernel: EFLAGS: 00010296   (2.6.13-15.13-smp)
Feb 26 09:37:35 navier kernel: EIP is at reiserfs_panic+0x41/0x80
[reiserfs]
Feb 26 09:37:35 navier kernel: eax: 00000063   ebx: f4ccb000   ecx:
c039e400   edx: 00000292
Feb 26 09:37:35 navier kernel: esi: f4ccb000   edi: f8cdd8e0   ebp:
f1c4d89c   esp: e1ced9ec
Feb 26 09:37:35 navier kernel: ds: 007b   es: 007b   ss: 0068
Feb 26 09:37:35 navier kernel: Process tar (pid: 8356,
threadinfo=e1cec000 task=ee4e1060)
Feb 26 09:37:35 navier kernel: Stack: f8d24718 f4ccb158 f8d32aa0
e1ceda0c f8d264ec f8d1a276 f4ccb000 f8d264ec
Feb 26 09:37:35 navier kernel:        00000400 f8ca8000 f8d157c6
f8f14c70 f4ccb000 f8d15892 f4ccb000 e1ceddb4
Feb 26 09:37:35 navier kernel:        f8ca8000 f1c4d89c 0000324b
f4ccb000 f8cdd8e0 118e324b f8cf270c f8d1aab9
Feb 26 09:37:35 navier kernel: Call Trace:
Feb 26 09:37:35 navier kernel:  [<f8d1a276>] journal_mark_dirty
+0x2c6/0x2e0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d157c6>] allocate_bitmap_node
+0x26/0x80 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d15892>] get_bitmap_node+0x72/0x80
[reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cf270c>] _reiserfs_free_block
+0xdc/0x1b0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d1aab9>] journal_mark_freed
+0xd9/0x1f0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cf2732>] _reiserfs_free_block
+0x102/0x1b0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d1aab9>] journal_mark_freed
+0xd9/0x1f0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d124ce>] prepare_for_delete_or_cut
+0x3fe/0x830 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cf709e>] free_thrown+0x2e/0x80
[reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d139e7>] reiserfs_cut_from_item
+0x117/0x570 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d1413c>] reiserfs_do_truncate
+0x25c/0x530 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cfdf77>] reiserfs_truncate_file
+0x117/0x220 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<c015ffd9>] vmtruncate+0xa9/0x170
Feb 26 09:37:35 navier kernel:  [<c018d0b8>] inode_setattr+0x78/0x220
Feb 26 09:37:35 navier kernel:  [<f8d1d73e>] get_xa_file_dentry
+0x1e/0x100 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cff551>] reiserfs_setattr
+0x111/0x2e6 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<c012b333>] current_fs_time+0x63/0x80
Feb 26 09:37:35 navier kernel:  [<f8cff440>] reiserfs_setattr+0x0/0x2e6
[reiserfs]
Feb 26 09:37:35 navier kernel:  [<c018d35e>] notify_change+0xfe/0x3f1
Feb 26 09:37:35 navier kernel:  [<c016f308>] do_truncate+0x38/0x50
Feb 26 09:37:35 navier kernel:  [<c0180ef3>] may_open+0x1f3/0x280
Feb 26 09:37:35 navier kernel:  [<c0181007>] open_namei+0x87/0x690
Feb 26 09:37:35 navier kernel:  [<c017eefa>] path_release+0xa/0x30
Feb 26 09:37:35 navier kernel:  [<c01702c9>] filp_open+0x29/0x50
Feb 26 09:37:35 navier kernel:  [<c01705ae>] get_unused_fd+0xae/0xd0
Feb 26 09:37:35 navier kernel:  [<c01706c5>] sys_open+0x45/0xe0
Feb 26 09:37:35 navier kernel:  [<c01042cb>] sysenter_past_esp+0x54/0x79
Feb 26 09:37:35 navier kernel: Code: fd ff ff 85 db b8 66 24 d2 f8 74 06
8d 83 58 01 00 00 b9 a0 2a d3 f8 89 4c 24 08 89 44 24 04 c7 04 24 18 47
d2 f8 e8 6f b2 41 c7 <0f> 0b 6a 01 76 24 d2 f8 85 db b8 66 24 d2 f8 74
06 8d 83 58 01
Feb 26 09:37:35 navier kernel:  Badness in do_exit at kernel/exit.c:790
Feb 26 09:37:35 navier kernel:  [<c0128df3>] do_exit+0x3a3/0x3b0
Feb 26 09:37:35 navier kernel:  [<c0105dff>] die+0x18f/0x190
Feb 26 09:37:35 navier kernel:  [<c0106130>] do_invalid_op+0x0/0xb0
Feb 26 09:37:35 navier kernel:  [<c01061d5>] do_invalid_op+0xa5/0xb0
Feb 26 09:37:35 navier kernel:  [<f8d0ae21>] reiserfs_panic+0x41/0x80
[reiserfs]
Feb 26 09:37:35 navier kernel:  [<c0120d88>] __wake_up+0x38/0x50
Feb 26 09:37:35 navier kernel:  [<c012647d>] release_console_sem
+0xad/0xc0
Feb 26 09:37:35 navier kernel:  [<c01262dd>] vprintk+0x22d/0x2a0
Feb 26 09:37:35 navier kernel:  [<c010554f>] error_code+0x4f/0x60
Feb 26 09:37:35 navier kernel:  [<f8d0ae21>] reiserfs_panic+0x41/0x80
[reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d1a276>] journal_mark_dirty
+0x2c6/0x2e0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d157c6>] allocate_bitmap_node
+0x26/0x80 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d15892>] get_bitmap_node+0x72/0x80
[reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cf270c>] _reiserfs_free_block
+0xdc/0x1b0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d1aab9>] journal_mark_freed
+0xd9/0x1f0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cf2732>] _reiserfs_free_block
+0x102/0x1b0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d1aab9>] journal_mark_freed
+0xd9/0x1f0 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d124ce>] prepare_for_delete_or_cut
+0x3fe/0x830 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cf709e>] free_thrown+0x2e/0x80
[reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d139e7>] reiserfs_cut_from_item
+0x117/0x570 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8d1413c>] reiserfs_do_truncate
+0x25c/0x530 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cfdf77>] reiserfs_truncate_file
+0x117/0x220 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<c015ffd9>] vmtruncate+0xa9/0x170
Feb 26 09:37:35 navier kernel:  [<c018d0b8>] inode_setattr+0x78/0x220
Feb 26 09:37:35 navier kernel:  [<f8d1d73e>] get_xa_file_dentry
+0x1e/0x100 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<f8cff551>] reiserfs_setattr
+0x111/0x2e6 [reiserfs]
Feb 26 09:37:35 navier kernel:  [<c012b333>] current_fs_time+0x63/0x80
Feb 26 09:37:35 navier kernel:  [<f8cff440>] reiserfs_setattr+0x0/0x2e6
[reiserfs]
Feb 26 09:37:35 navier kernel:  [<c018d35e>] notify_change+0xfe/0x3f1
Feb 26 09:37:35 navier kernel:  [<c016f308>] do_truncate+0x38/0x50
Feb 26 09:37:35 navier kernel:  [<c0180ef3>] may_open+0x1f3/0x280
Feb 26 09:37:35 navier kernel:  [<c0181007>] open_namei+0x87/0x690
Feb 26 09:37:35 navier kernel:  [<c017eefa>] path_release+0xa/0x30
Feb 26 09:37:35 navier kernel:  [<c01702c9>] filp_open+0x29/0x50
Feb 26 09:37:35 navier kernel:  [<c01705ae>] get_unused_fd+0xae/0xd0
Feb 26 09:37:35 navier kernel:  [<c01706c5>] sys_open+0x45/0xe0
Feb 26 09:37:35 navier kernel:  [<c01042cb>] sysenter_past_esp+0x54/0x79








