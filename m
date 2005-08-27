From: Ronald Moesbergen <ronald.moesbergen@gmail.com>
Subject: Reiser4 oops with 2.6.13-rc6-mm2
Date: Sat, 27 Aug 2005 18:03:34 +0200
Message-ID: <656cfae8050827090370d11864@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25660-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

While running a vmware virtual machine from a reiser4 filesystem, my
machine consistently locks up and produces the following OOPS:

kernel: Oops: 0002 [#1]
kernel: PREEMPT SMP
kernel: last sysfs file: /class/vc/vcsa8/dev
kernel: Modules linked in: vmnet vmmon nvidia
kernel: CPU:    0
kernel: EIP:    0060:[lock_object+84/127]    Tainted: P      VLI
kernel: EIP:    0060:[<b01a1317>]    Tainted: P      VLI
kernel: EFLAGS: 00013202   (2.6.13-rc6-mm2)
kernel: EIP is at lock_object+0x54/0x7f
kernel: eax: cf569e94   ebx: 00000000   ecx: e256fe80   edx: e256fe94
kernel: esi: dba35280   edi: e256fec8   ebp: e256fec8   esp: e256fb48
kernel: ds: 007b   es: 007b   ss: 0068
kernel: Process vmware-vmx (pid: 11869, threadinfo=3De256e000 task=3Deec0c0=
30)
kernel: Stack: dba35280 00000000 e256fec8 b01a16e7 e256fec8 dba352b4
00000000 dba352f0
kernel:        b01a17ba e256fec8 00000000 00000000 00000001 00000000
00000000 e256fec8
kernel:        dba35280 dba352f0 b01a18ad e256fec8 b02a7417 efe1d76c
d9fa46c4 00000016
kernel: Call Trace:
kernel:  [lock_tail+80/113] lock_tail+0x50/0x71
kernel:  [<b01a16e7>] lock_tail+0x50/0x71
kernel:  [longterm_lock_tryfast+178/229] longterm_lock_tryfast+0xb2/0xe5
kernel:  [<b01a17ba>] longterm_lock_tryfast+0xb2/0xe5
kernel:  [longterm_lock_znode+192/695] longterm_lock_znode+0xc0/0x2b7
kernel:  [<b01a18ad>] longterm_lock_znode+0xc0/0x2b7
kernel:  [ata_scsi_translate+265/320] ata_scsi_translate+0x109/0x140
kernel:  [<b02a7417>] ata_scsi_translate+0x109/0x140
kernel:  [ata_scsi_rw_xlat+0/974] ata_scsi_rw_xlat+0x0/0x3ce
kernel:  [<b02a6e95>] ata_scsi_rw_xlat+0x0/0x3ce
kernel:  [cbk_cache_scan_slots+320/754] cbk_cache_scan_slots+0x140/0x2f2
kernel:  [schedule+1320/3501] schedule+0x528/0xdad
kernel:  [<b039752c>] schedule+0x528/0xdad
kernel:  [cbk_cache_search+39/92] cbk_cache_search+0x27/0x5c
kernel:  [<b01b2466>] cbk_cache_search+0x27/0x5c
kernel:  [coord_by_handle+16/41] coord_by_handle+0x10/0x29
kernel:  [<b01b110f>] coord_by_handle+0x10/0x29
kernel:  [object_lookup+188/230] object_lookup+0xbc/0xe6
kernel:  [<b01b10d5>] object_lookup+0xbc/0xe6
kernel:  [find_file_item+322/482] find_file_item+0x142/0x1e2
kernel:  [<b01e4d71>] find_file_item+0x142/0x1e2
kernel:  [read_file+185/530] read_file+0xb9/0x212
kernel:  [<b01e6d83>] read_file+0xb9/0x212
kernel:  [txn_begin+29/33] txn_begin+0x1d/0x21
kernel:  [<b01a74b1>] txn_begin+0x1d/0x21
kernel:  [read_unix_file+532/831] read_unix_file+0x214/0x33f
kernel:  [<b01e70fe>] read_unix_file+0x214/0x33f
kernel:  [init_context+117/189] init_context+0x75/0xbd
kernel:  [<b01a47dd>] init_context+0x75/0xbd
kernel:  [reiser4_read+143/255] reiser4_read+0x8f/0xff
kernel:  [<b01baade>] reiser4_read+0x8f/0xff
kernel:  [vfs_read+328/333] vfs_read+0x148/0x14d
kernel:  [<b015e7e6>] vfs_read+0x148/0x14d
kernel:  [sys_pread64+112/125] sys_pread64+0x70/0x7d
kernel:  [<b015ebd4>] sys_pread64+0x70/0x7d
kernel:  [sysenter_past_esp+84/117] sysenter_past_esp+0x54/0x75
kernel:  [<b0102d9b>] sysenter_past_esp+0x54/0x75
kernel: Code: 04 89 71 08 8d 51 0c 8b 58 04 89 41 0c 89 50 04 89 13 89
5a 04 8d 51 14 83 47 18 01 8b 86 84 00 00 00$
kernel:  <3>BUG: vmware-vmx[11869] exited with nonzero preempt_count 1!

If I move the virtual harddisk images to another partition that
doesn't use reiser4, it runs fine and there are no problems. I suspect
this is a bug in reiser4. Could you assist me in solving this problem?
I'm running kernel 2.6.13-rc6-mm2, but I've also tried 2.6.12 with the
reiser4 patches from your ftp site, with the same effect. Vmware
any-any-93 patches are applied. If you need any more info, please ask.

Thanks,
Ronald.
