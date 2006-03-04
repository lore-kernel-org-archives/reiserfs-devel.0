From: "zotyalpb" <zotyalpb@freemail.hu>
Subject: crash / kernel 2.6.15.3 / reiserfs 3.6 (bugreport)
Date: Sat, 4 Mar 2006 22:32:35 +0100
Message-ID: <123901c63fd3$280cba90$0301a8c0@foobar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28212-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: reiserfs-list@namesys.com

Hi

I have an amd64 box with debian/sarge.
it has two reiserfs, one for the root (sda1 - 36G), and one for home (md0 - 
500G / raid10).

Since a week it randomly crashes. I got reiserfs panic in the syslog, and 
the md0 is not responding, but the sda is working fine.
I have to reboot to make it working again.


Mar  4 18:04:38 free kernel: REISERFS: panic (device Null superblock): 
vs-8025: set_entry_sizes: (mode==p, insert_size==56), invalid length of 
directory item
Mar  4 18:04:38 free kernel: ----------- [cut here ] --------- [please bite 
here ] ---------
Mar  4 18:04:38 free kernel: Kernel BUG at fs/reiserfs/prints.c:362
Mar  4 18:04:38 free kernel: invalid operand: 0000 [1] SMP
Mar  4 18:04:38 free kernel: CPU 0
Mar  4 18:04:39 free kernel: Modules linked in: nfs nfsd exportfs lockd 
sunrpc iptable_filter ip_tables 8250 serial_core generic i2c_nforce2 dm_mod 
w83627hf hwmon_vid i2c_isa 3c59x sata_sil
Mar  4 18:04:39 free kernel: Pid: 962, comm: convert Not tainted 2.6.15.3 #5
Mar  4 18:04:39 free kernel: RIP: 0010:[reiserfs_panic+193/234] 
<ffffffff801c8547>{reiserfs_panic+193}
Mar  4 18:04:39 free kernel: RSP: 0018:ffff810021147638  EFLAGS: 00010296
Mar  4 18:04:39 free kernel: RAX: 0000000000000087 RBX: ffffffff80362ca7 
RCX: ffffffff803d5768
Mar  4 18:04:39 free kernel: RDX: ffffffff803d5768 RSI: 0000000000000246 
RDI: ffffffff803d5760
Mar  4 18:04:39 free kernel: RBP: 0000000000000108 R08: ffffffff803d5768 
R09: 0000000000000000
Mar  4 18:04:39 free kernel: R10: 0000000100000000 R11: 0000000000000246 
R12: 0000000000000000
Mar  4 18:04:39 free kernel: R13: 0000000000000240 R14: 0000000000000001 
R15: ffff81004aea2d40
Mar  4 18:04:39 free kernel: FS:  00002aaaacac3170(0000) 
GS:ffffffff8048c800(0000) knlGS:0000000000000000
Mar  4 18:04:39 free kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
Mar  4 18:04:39 free kernel: CR2: 00002aaaaad51090 CR3: 000000001be9d000 
CR4: 00000000000006e0
Mar  4 18:04:39 free kernel: Process convert (pid: 962, threadinfo 
ffff810021146000, task ffff81001a2487b0)
Mar  4 18:04:39 free kernel: Stack: 0000003000000020 ffff810021147728 
ffff810021147658 0000000000000000
Mar  4 18:04:39 free kernel:        ffff81007e3e9800 ffffffff801d47a6 
0000000000000070 0000000000000038
Mar  4 18:04:39 free kernel:        0000000000011020 0000000000011008
Mar  4 18:04:39 free kernel: Call Trace:<ffffffff801d47a6>{get_cnode+24} 
<ffffffff801ca6d7>{leaf_copy_items_entirely+1011}
Mar  4 18:04:39 free kernel:        <ffffffff801d47a6>{get_cnode+24} 
<ffffffff801d85a8>{journal_mark_dirty+373}
Mar  4 18:04:39 free kernel: 
<ffffffff801cc6f1>{leaf_delete_items_entirely+565} 
<ffffffff801da9d6>{direntry_create_vi+480}
Mar  4 18:04:39 free kernel: 
<ffffffff801c084d>{create_virtual_node+817} 
<ffffffff801c279a>{ip_check_balance+839}
Mar  4 18:04:39 free kernel:        <ffffffff801c447b>{fix_nodes+547} 
<ffffffff801d2fb7>{reiserfs_paste_into_item+301}
Mar  4 18:04:39 free kernel: 
<ffffffff801b75e1>{reiserfs_add_entry+781} 
<ffffffff801bbd5c>{reiserfs_new_inode+1274}
Mar  4 18:04:39 free kernel: 
<ffffffff801dd77b>{__reiserfs_permission+373} 
<ffffffff801b78f8>{reiserfs_create+346}
Mar  4 18:04:39 free kernel:        <ffffffff8017f1ec>{vfs_create+225} 
<ffffffff8017f5c3>{open_namei+383}
Mar  4 18:04:39 free kernel:        <ffffffff8017050f>{filp_open+26} 
<ffffffff80170693>{get_unused_fd+108}
Mar  4 18:04:39 free kernel:        <ffffffff80170804>{do_sys_open+59} 
<ffffffff8010d76a>{system_call+126}
Mar  4 18:04:39 free kernel:
Mar  4 18:04:39 free kernel:
Mar  4 18:04:39 free kernel: Code: 0f 0b 68 70 32 36 80 c2 6a 01 48 c7 c7 e0 
f6 36 80 4d 85 e4
Mar  4 18:04:39 free kernel: RIP <ffffffff801c8547>{reiserfs_panic+193} RSP 
<ffff810021147638>
Mar  4 18:04:39 free kernel:  Badness in do_exit at kernel/exit.c:796
Mar  4 18:04:39 free kernel:
Mar  4 18:04:39 free kernel: Call Trace:<ffffffff801329cd>{do_exit+75} 
<ffffffff8010f20b>{die_nmi+0}
Mar  4 18:04:39 free kernel:        <ffffffff8010f58f>{do_invalid_op+145} 
<ffffffff801c8547>{reiserfs_panic+193}
Mar  4 18:04:39 free kernel:        <ffffffff801305a3>{printk+141} 
<ffffffff8010e4a5>{error_exit+0}
Mar  4 18:04:39 free kernel:        <ffffffff801c8547>{reiserfs_panic+193} 
<ffffffff801c8547>{reiserfs_panic+193}
Mar  4 18:04:39 free kernel:        <ffffffff801d47a6>{get_cnode+24} 
<ffffffff801ca6d7>{leaf_copy_items_entirely+1011}
Mar  4 18:04:39 free kernel:        <ffffffff801d47a6>{get_cnode+24} 
<ffffffff801d85a8>{journal_mark_dirty+373}
Mar  4 18:04:39 free kernel: 
<ffffffff801cc6f1>{leaf_delete_items_entirely+565} 
<ffffffff801da9d6>{direntry_create_vi+480}
Mar  4 18:04:39 free kernel: 
<ffffffff801c084d>{create_virtual_node+817} 
<ffffffff801c279a>{ip_check_balance+839}
Mar  4 18:04:39 free kernel:        <ffffffff801c447b>{fix_nodes+547} 
<ffffffff801d2fb7>{reiserfs_paste_into_item+301}
Mar  4 18:04:39 free kernel: 
<ffffffff801b75e1>{reiserfs_add_entry+781} 
<ffffffff801bbd5c>{reiserfs_new_inode+1274}
Mar  4 18:04:39 free kernel: 
<ffffffff801dd77b>{__reiserfs_permission+373} 
<ffffffff801b78f8>{reiserfs_create+346}
Mar  4 18:04:39 free kernel:        <ffffffff8017f1ec>{vfs_create+225} 
<ffffffff8017f5c3>{open_namei+383}
Mar  4 18:04:39 free kernel:        <ffffffff8017050f>{filp_open+26} 
<ffffffff80170693>{get_unused_fd+108}
Mar  4 18:04:39 free kernel:        <ffffffff80170804>{do_sys_open+59} 
<ffffffff8010d76a>{system_call+126}
Mar  4 18:04:39 free kernel:
Mar  4 18:04:39 free kernel: ReiserFS: sda1: warning: clm-2100: nesting info 
a different FS

...

Mar  4 22:32:38 free kernel: REISERFS: panic (device Null superblock): 
vs-8025: set_entry_sizes: (mode==p, insert_size==32), invalid length of 
directory item
Mar  4 22:32:38 free kernel: ----------- [cut here ] --------- [please bite 
here ] ---------
Mar  4 22:32:38 free kernel: Kernel BUG at fs/reiserfs/prints.c:362
Mar  4 22:32:38 free kernel: invalid operand: 0000 [1] SMP
Mar  4 22:32:38 free kernel: CPU 0
Mar  4 22:32:38 free kernel: Modules linked in: nfs nfsd exportfs lockd 
sunrpc iptable_filter ip_tables 8250 serial_core generic i2c_nforce2 dm_mod 
w83627hf hwmon_vid i2c_isa 3c59x sata_sil
Mar  4 22:32:38 free kernel: Pid: 31265, comm: apache Not tainted 2.6.15.3 
#5
Mar  4 22:32:38 free kernel: RIP: 0010:[reiserfs_panic+193/234] 
<ffffffff801c8547>{reiserfs_panic+193}
Mar  4 22:32:38 free kernel: RSP: 0018:ffff81006717b238  EFLAGS: 00010296
Mar  4 22:32:38 free kernel: RAX: 0000000000000087 RBX: ffffffff80362ca7 
RCX: ffffffff803d5768
Mar  4 22:32:38 free kernel: RDX: ffffffff803d5768 RSI: 0000000000000246 
RDI: ffffffff803d5760
Mar  4 22:32:38 free kernel: RBP: 0000000000000108 R08: ffffffff803d5768 
R09: 0000000000000000
Mar  4 22:32:38 free kernel: R10: 0000000100000000 R11: 0000000000000246 
R12: 0000000000000000
Mar  4 22:32:38 free kernel: R13: 0000000000000240 R14: 0000000000000001 
R15: ffff810040e3a1e8
Mar  4 22:32:38 free kernel: FS:  00002aaaab5d3a40(0000) 
GS:ffffffff8048c800(0000) knlGS:0000000000000000
Mar  4 22:32:38 free kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
000000008005003b
Mar  4 22:32:38 free kernel: CR2: 00002aaaafb61000 CR3: 000000006cea5000 
CR4: 00000000000006e0
Mar  4 22:32:38 free kernel: Process apache (pid: 31265, threadinfo 
ffff81006717a000, task ffff81003d84e240)
Mar  4 22:32:38 free kernel: Stack: 0000003000000020 ffff81006717b328 
ffff81006717b258 ffff81006574d018
Mar  4 22:32:38 free kernel:        ffff8100255df018 0000000000000001 
0000000000000070 0000000000000020
Mar  4 22:32:38 free kernel:        0000000000011008 0000000000010ff0
Mar  4 22:32:38 free kernel: Call 
Trace:<ffffffff801d85a8>{journal_mark_dirty+373} 
<ffffffff801cc464>{leaf_cut_from_buffer+1271}
Mar  4 22:32:38 free kernel: 
<ffffffff801da9d6>{direntry_create_vi+480} 
<ffffffff801c084d>{create_virtual_node+817}
Mar  4 22:32:38 free kernel:        <ffffffff801c279a>{ip_check_balance+839} 
<ffffffff801b5b94>{balance_leaf+10822}
Mar  4 22:32:38 free kernel:        <ffffffff801c447b>{fix_nodes+547} 
<ffffffff801d2fb7>{reiserfs_paste_into_item+301}
Mar  4 22:32:38 free kernel: 
<ffffffff801b75e1>{reiserfs_add_entry+781} 
<ffffffff80143896>{autoremove_wake_function+0}
Mar  4 22:32:38 free kernel:        <ffffffff801b8a56>{reiserfs_rename+489} 
<ffffffff80173530>{bh_lru_install+217}
Mar  4 22:32:38 free kernel:        <ffffffff8015aced>{activate_page+154} 
<ffffffff80143922>{wake_up_bit+14}
Mar  4 22:32:38 free kernel:        <ffffffff801d0304>{search_by_key+4205} 
<ffffffff80180ca3>{vfs_rename_other+196}
Mar  4 22:32:38 free kernel:        <ffffffff8018101c>{vfs_rename+803} 
<ffffffff80181294>{sys_rename+377}
Mar  4 22:32:38 free kernel:        <ffffffff8010d76a>{system_call+126}
Mar  4 22:32:38 free kernel:
Mar  4 22:32:38 free kernel: Code: 0f 0b 68 70 32 36 80 c2 6a 01 48 c7 c7 e0 
f6 36 80 4d 85 e4
Mar  4 22:32:38 free kernel: RIP <ffffffff801c8547>{reiserfs_panic+193} RSP 
<ffff81006717b238>
Mar  4 22:32:38 free kernel:  Badness in do_exit at kernel/exit.c:796
Mar  4 22:32:38 free kernel:
Mar  4 22:32:38 free kernel: Call Trace:<ffffffff801329cd>{do_exit+75} 
<ffffffff8010f20b>{die_nmi+0}
Mar  4 22:32:38 free kernel:        <ffffffff8010f58f>{do_invalid_op+145} 
<ffffffff801c8547>{reiserfs_panic+193}
Mar  4 22:32:38 free kernel:        <ffffffff80152ff6>{mempool_alloc+42} 
<ffffffff80296460>{ata_scsi_rw_xlat+0}
Mar  4 22:32:38 free kernel:        <ffffffff801305a3>{printk+141} 
<ffffffff8010e4a5>{error_exit+0}
Mar  4 22:32:38 free kernel:        <ffffffff801c8547>{reiserfs_panic+193} 
<ffffffff801c8547>{reiserfs_panic+193}
Mar  4 22:32:38 free kernel: 
<ffffffff801d85a8>{journal_mark_dirty+373} 
<ffffffff801cc464>{leaf_cut_from_buffer+1271}
Mar  4 22:32:38 free kernel: 
<ffffffff801da9d6>{direntry_create_vi+480} 
<ffffffff801c084d>{create_virtual_node+817}
Mar  4 22:32:38 free kernel:        <ffffffff801c279a>{ip_check_balance+839} 
<ffffffff801b5b94>{balance_leaf+10822}
Mar  4 22:32:38 free kernel:        <ffffffff801c447b>{fix_nodes+547} 
<ffffffff801d2fb7>{reiserfs_paste_into_item+301}
Mar  4 22:32:38 free kernel: 
<ffffffff801b75e1>{reiserfs_add_entry+781} 
<ffffffff80143896>{autoremove_wake_function+0}
Mar  4 22:32:38 free kernel:        <ffffffff801b8a56>{reiserfs_rename+489} 
<ffffffff80173530>{bh_lru_install+217}
Mar  4 22:32:38 free kernel:        <ffffffff8015aced>{activate_page+154} 
<ffffffff80143922>{wake_up_bit+14}
Mar  4 22:32:38 free kernel:        <ffffffff801d0304>{search_by_key+4205} 
<ffffffff80180ca3>{vfs_rename_other+196}
Mar  4 22:32:38 free kernel:        <ffffffff8018101c>{vfs_rename+803} 
<ffffffff80181294>{sys_rename+377}
Mar  4 22:32:38 free kernel:        <ffffffff8010d76a>{system_call+126}
Mar  4 22:32:38 free kernel: ReiserFS: sda1: warning: clm-2100: nesting info 
a different FS



sincerely,
zotyalpb

