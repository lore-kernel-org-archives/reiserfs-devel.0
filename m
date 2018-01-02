From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [BUG]Reiser4-for-4.12 kernel: reiser4[rsync(9841)]:
 reiser4_write_dispatch (fs/reiser4/plugin/file/file_conversion.c:582)[edward-1544]:\x0aWARNING:
 Inode 98653: file plugin conversion failed (-2)
Date: Tue, 2 Jan 2018 08:52:39 +0100
Message-ID: <CADW=+3mv7Ly-Bd3ZTdGEGyZ0iAUmjmqxoe9C-DGNUmXtuA0hUw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=yj5evxg5Yflncnf9dTMeQSCvKbOuOCCqSqq1948YQe8=;
        b=PyIk9vjVm9BamF45CR/taVm4g+uCcUuqKG9f4+xLN7u06VLnMf4T6oxyHgGR2YiFJd
         qlHHBQ6wmSuoI6MNNtSixzBRCEb+HElkcXJtAbaSlsj8LMqSlWstOvUuLYBmKPj9f9ME
         gu07c7O267sUCrZoC8roG8tMRV4PvKIls5Qawafp5fDbGjQKohLbMixEKVdQSg5kVQ8K
         akEwtvuTh97VV9qqeAYATiaztSwCem8zMz+XSqS4iMt9ZnNTSXBXT0DTsnlyb2iJSvhJ
         /HvM1OLV2Pe3UeDUFmOEkuuJm/rr6d0E7DcHAH08Mk/iNXYVe0kewxCz6rbxBpuexVOS
         bp2A==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hello

On kernel 4.12 while rsync-ing /home to newly created reiser4
partition I get lots of messages in logs:

kernel: reiser4[rsync(9841)]: reiser4_write_dispatch
(fs/reiser4/plugin/file/file_conversion.c:582)[edward-1544]:\x0aWARNING:
Inode 98653: file plugin conversion failed (-2)

Partition was created with mkfs.reiser4 /dev/md125

Additional info below.

Thanks

Dusan

krshina3 /home/dusan # uname -a
Linux krshina3 4.12.12-gentoo #2 SMP Mon Oct 9 19:58:41 CEST 2017
x86_64 Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz GenuineIntel GNU/Linux

krshina3 /home/dusan # cat /etc/fstab | grep -v "#"

/dev/sda1               /boot           ext2            noauto,noatime  1 2
/dev/md124              none            swap            sw              0 0
/dev/sda2               /               reiser4
txmod=wa,discard,noatime,onerror=remount-ro,dont_load_bitmap,tmgr.atom_max_size=25000
  0 0
/dev/md125              /mnt/backup     reiser4
noatime,noauto,dont_load_bitmap,tmgr.atom_max_size=25000        0 0
/dev/md126              /mnt/media      reiser4
noatime,users,onerror=remount-ro,dont_load_bitmap,tmgr.atom_max_size=25000
     0 0
/dev/md127              /usr/portage    reiser4
noatime,onerror=remount-ro,dont_load_bitmap,tmgr.atom_max_size=25000
         0 0
/dev/dvdrom             /mnt/cdrom      auto            noauto,ro       0 0
shm                     /dev/shm        tmpfs
nodev,nosuid,noexec     0 0

krshina3 /home/dusan # df
Filesystem     1K-blocks      Used Available Use% Mounted on
/dev/sda2       37017728  30610636   6407092  83% /
tmpfs             680628      1288    679340   1% /run
dev                10240         0     10240   0% /dev
shm              3403128         0   3403128   0% /dev/shm
cgroup_root        10240         0     10240   0% /sys/fs/cgroup
/dev/md126     383034100 254015048 129019052  67% /mnt/media
/dev/md127       6113484   4433940   1679544  73% /usr/portage
none             3403128        12   3403116   1% /run/user/1000
none             3403128        16   3403112   1% /run/user/1001
/dev/md125      64959612  17050824  47908788  27% /mnt/backup


krshina3 /home/dusan # ps -aux | grep "ktx"
root      1082  0.0  0.0      0     0 ?        S     2017   1:29
[ktxnmgrd:sda2:w]
root      2094  0.0  0.0      0     0 ?        S     2017   0:02
[ktxnmgrd:md126:]
root      2096  0.0  0.0      0     0 ?        S     2017   0:02
[ktxnmgrd:md127:]
root      9832 22.9  0.0      0     0 ?        R    03:32  68:43
[ktxnmgrd:md125:]

krshina3 /home/dusan # ps -aux | grep "rsync"
root      3940  0.0  0.0  10988     0 ?        Ss    2017   0:00
/usr/bin/rsync --daemon
root      9839  1.0  0.6 288540 40980 ?        S    03:32   3:19
/usr/bin/rsync -ax --delete --numeric-ids --relative --delete-excluded
--exclude=/home/windows.qcow2 /home/ /mnt/backup/daily.0/localhost/
root      9840  0.0  0.0  63304  5460 ?        S    03:32   0:02
/usr/bin/rsync -ax --delete --numeric-ids --relative --delete-excluded
--exclude=/home/windows.qcow2 /home/ /mnt/backup/daily.0/localhost/
root      9841  2.8  0.0 152232  6120 ?        D    03:32   8:28
/usr/bin/rsync -ax --delete --numeric-ids --relative --delete-excluded
--exclude=/home/windows.qcow2 /home/ /mnt/backup/daily.0/localhost/


krshina3 /home/dusan # cat /var/log/messages | grep kernel | grep -v
9841 |tail -n 500
Jan  1 19:46:54 krshina3 kernel: Purging GPU memory, 10962 pages
freed, 1575 pages still pinned.
Jan  1 19:46:54 krshina3 kernel: Purging GPU memory, 7699 pages freed,
1575 pages still pinned.
Jan  2 03:32:08 krshina3 kernel: reiser4: md125: found disk format 4.0.2.
Jan  2 03:32:08 krshina3 kernel: reiser4: md125: format version number
(4.0.2) is greater than release number (4.0.1) of reiser4 kernel
module. Some objects of the volume can be inaccessible.
Jan  2 03:32:08 krshina3 kernel: reiser4: md125: using Hybrid Transaction Model.
Jan  2 04:18:32 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:18:32 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:18:32 krshina3 kernel: Call Trace:
Jan  2 04:18:32 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:18:32 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:18:32 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:18:32 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:18:32 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:18:32 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:18:32 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:18:32 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:18:32 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:18:32 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:18:32 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:18:32 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:18:32 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:18:32 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:18:32 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:18:32 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:18:32 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:18:32 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:18:32 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:18:32 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:18:32 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:18:32 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:18:32 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:18:32 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:18:32 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:18:32 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:18:32 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:18:32 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:18:32 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:18:32 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:18:32 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:18:32 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
Jan  2 04:20:33 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:20:33 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:20:33 krshina3 kernel: Call Trace:
Jan  2 04:20:33 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:20:33 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:20:33 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:20:33 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:20:33 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:20:33 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:20:33 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:20:33 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:20:33 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:20:33 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:20:33 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:20:33 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:20:33 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:20:33 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:20:33 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:20:33 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:20:33 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:20:33 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:20:33 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:20:33 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:20:33 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:20:33 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:20:33 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:20:33 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:20:33 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:20:33 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:20:33 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:20:33 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:20:33 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:20:33 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:20:33 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:20:33 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
Jan  2 04:22:33 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:22:33 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:22:33 krshina3 kernel: Call Trace:
Jan  2 04:22:33 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:22:33 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:22:33 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:22:33 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:22:33 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:22:33 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:22:33 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:22:33 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:22:33 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:22:33 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:22:33 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:22:33 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:22:33 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:22:33 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:22:33 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:22:34 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:22:34 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:22:34 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:22:34 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:22:34 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:22:34 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:22:34 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:22:34 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:22:34 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:22:34 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:22:34 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:22:34 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:22:34 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:22:34 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:22:34 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:22:34 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:22:34 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
Jan  2 04:24:34 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:24:34 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:24:34 krshina3 kernel: Call Trace:
Jan  2 04:24:34 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:24:34 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:24:34 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:24:34 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:24:34 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:24:34 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:24:34 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:24:34 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:24:34 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:24:34 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:24:34 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:24:34 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:24:34 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:24:34 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:24:34 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:24:34 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:24:34 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:24:34 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:24:34 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:24:34 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:24:34 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:24:34 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:24:34 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:24:34 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:24:34 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:24:34 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:24:34 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:24:34 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:24:34 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:24:34 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:24:34 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:24:34 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
Jan  2 04:26:35 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:26:35 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:26:35 krshina3 kernel: Call Trace:
Jan  2 04:26:35 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:26:35 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:26:35 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:26:35 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:26:35 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:26:35 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:26:35 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:26:35 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:26:35 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:26:35 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:26:35 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:26:35 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:26:35 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:26:35 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:26:35 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:26:35 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:26:35 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:26:35 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:26:35 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:26:35 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:26:35 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:26:35 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:26:35 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:26:35 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:26:35 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:26:35 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:26:35 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:26:35 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:26:35 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:26:35 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:26:35 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:26:35 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
Jan  2 04:28:36 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:28:36 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:28:36 krshina3 kernel: Call Trace:
Jan  2 04:28:36 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:28:36 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:28:36 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:28:36 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:28:36 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:28:36 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:28:36 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:28:36 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:28:36 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:28:36 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:28:36 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:28:36 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:28:36 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:28:36 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:28:36 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:28:36 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:28:36 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:28:36 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:28:36 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:28:36 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:28:36 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:28:36 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:28:36 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:28:36 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:28:36 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:28:36 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:28:36 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:28:36 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:28:36 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:28:36 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:28:36 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:28:36 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
Jan  2 04:30:37 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:30:37 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:30:37 krshina3 kernel: Call Trace:
Jan  2 04:30:37 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:30:37 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:30:37 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:30:37 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:30:37 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:30:37 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:30:37 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:30:37 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:30:37 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:30:37 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:30:37 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:30:37 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:30:37 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:30:37 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:30:37 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:30:37 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:30:37 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:30:37 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:30:37 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:30:37 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:30:37 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:30:37 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:30:37 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:30:37 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:30:37 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:30:37 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:30:37 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:30:37 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:30:37 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:30:37 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:30:37 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:30:37 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
Jan  2 04:32:38 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:32:38 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:32:38 krshina3 kernel: Call Trace:
Jan  2 04:32:38 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:32:38 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:32:38 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:32:38 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:32:38 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:32:38 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:32:38 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:32:38 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:32:38 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:32:38 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:32:38 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:32:38 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:32:38 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:32:38 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:32:38 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:32:38 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:32:38 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:32:38 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:32:38 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:32:38 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:32:38 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:32:38 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:32:38 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:32:38 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:32:38 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:32:38 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:32:38 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:32:38 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:32:38 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:32:38 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:32:38 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:32:38 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
Jan  2 04:34:38 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:34:38 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:34:38 krshina3 kernel: Call Trace:
Jan  2 04:34:38 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:34:38 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:34:38 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:34:38 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:34:38 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:34:38 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:34:38 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:34:38 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:34:38 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:34:38 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:34:38 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:34:38 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:34:38 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:34:38 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:34:38 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:34:38 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:34:38 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:34:38 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:34:38 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:34:38 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:34:38 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:34:38 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:34:38 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:34:38 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:34:38 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:34:38 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:34:38 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:34:38 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:34:38 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:34:38 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:34:38 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:34:38 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
Jan  2 04:36:39 krshina3 kernel:       Tainted: G    B
4.12.12-gentoo #2
Jan  2 04:36:39 krshina3 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan  2 04:36:39 krshina3 kernel: Call Trace:
Jan  2 04:36:39 krshina3 kernel:  __schedule+0x2cb/0x8e0
Jan  2 04:36:39 krshina3 kernel:  schedule+0x48/0xd0
Jan  2 04:36:39 krshina3 kernel:  reiser4_go_to_sleep+0x58/0x90
Jan  2 04:36:39 krshina3 kernel:  ? __wake_up_common+0xb0/0xb0
Jan  2 04:36:39 krshina3 kernel:  capture_fuse_wait+0x294/0x2b0
Jan  2 04:36:39 krshina3 kernel:  ? capture_fuse_jnode_lists.isra.19+0x130/0x130
Jan  2 04:36:39 krshina3 kernel:  reiser4_try_capture+0xff0/0x10b0
Jan  2 04:36:39 krshina3 kernel:  longterm_lock_znode+0x5f4/0x780
Jan  2 04:36:39 krshina3 kernel:  ? unwind_get_return_address+0x31/0x50
Jan  2 04:36:39 krshina3 kernel:  traverse_tree+0x20e/0x1170
Jan  2 04:36:39 krshina3 kernel:  reiser4_object_lookup+0x176/0x180
Jan  2 04:36:39 krshina3 kernel:  ? lookup_address+0x3a/0x40
Jan  2 04:36:39 krshina3 kernel:  reiser4_cut_tree_object+0x6d/0x200
Jan  2 04:36:39 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:36:39 krshina3 kernel:  ? do_write_cryptcompress+0x76a/0x870
Jan  2 04:36:39 krshina3 kernel:  ? __asan_storeN+0x12/0x20
Jan  2 04:36:39 krshina3 kernel:  reiser4_cut_tree+0x3d/0x60
Jan  2 04:36:39 krshina3 kernel:  cryptcompress2unixfile.isra.25+0x1b7/0x330
Jan  2 04:36:39 krshina3 kernel:  reiser4_write_dispatch+0x2af/0x570
Jan  2 04:36:39 krshina3 kernel:  __vfs_write+0x55/0x230
Jan  2 04:36:39 krshina3 kernel:  ? __schedule+0x2e3/0x8e0
Jan  2 04:36:39 krshina3 kernel:  ? __sb_start_write+0xae/0xf0
Jan  2 04:36:39 krshina3 kernel:  vfs_write+0xf8/0x260
Jan  2 04:36:39 krshina3 kernel:  SyS_write+0x53/0xb0
Jan  2 04:36:39 krshina3 kernel:  entry_SYSCALL_64_fastpath+0x13/0x94
Jan  2 04:36:39 krshina3 kernel: RIP: 0033:0x7efd295ca3e0
Jan  2 04:36:39 krshina3 kernel: RSP: 002b:00007ffc27303418 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Jan  2 04:36:39 krshina3 kernel: RAX: ffffffffffffffda RBX:
000055adca70c790 RCX: 00007efd295ca3e0
Jan  2 04:36:39 krshina3 kernel: RDX: 0000000000030000 RSI:
000055adca70c790 RDI: 0000000000000001
Jan  2 04:36:39 krshina3 kernel: RBP: 0000000000000000 R08:
00000000fa6a2902 R09: 000055adca6fc780
Jan  2 04:36:39 krshina3 kernel: R10: 00000000f25e57cf R11:
0000000000000246 R12: 0000000000000001
Jan  2 04:36:39 krshina3 kernel: R13: 0000000000008000 R14:
0000000000040000 R15: 0000000000008000
