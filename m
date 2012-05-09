From: tomm <tomm@lime-technology.com>
Subject: ReiserFS 3.6 kernel oops mounting or unmounting
Date: Wed, 9 May 2012 17:45:17 +0000 (UTC)
Message-ID: <loom.20120509T193930-776@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Kernel 3.0.31, but happens with other kernels as well: occasionally mounting or
unmounting a ReiserFS 3.6 file system generates the following oops.  When it
happens, it's primarily during unmount, but I have seen it happen during mount
as well.

May  9 10:16:29 Server kernel: BUG: unable to handle kernel NULL pointer
dereference at   (null)
May  9 10:16:29 Server kernel: IP: [<c1038b65>] queue_delayed_work_on+0x33/0xbf
May  9 10:16:29 Server kernel: *pdpt = 000000003763d001 *pde = 0000000000000000
May  9 10:16:29 Server kernel: Oops: 0000 [#1] SMP
May  9 10:16:29 Server kernel: Modules linked in: md_mod xor i2c_i801 i2c_core
ahci libahci mvsas libsas e1000e scsi_transport_sas [last unloaded: md_mod]
May  9 10:16:29 Server kernel:
May  9 10:16:29 Server kernel: Pid: 24444, comm: emhttp Not tainted
3.0.31-unRAID #1 Supermicro X7SPA-HF/X7SPA-HF
May  9 10:16:29 Server kernel: EIP: 0060:[<c1038b65>] EFLAGS: 00210246 CPU: 3
May  9 10:16:29 Server kernel: EIP is at queue_delayed_work_on+0x33/0xbf
May  9 10:16:29 Server kernel: EAX: fab49138 EBX: ffffffff ECX: fab49134 EDX:
00000000
May  9 10:16:29 Server kernel: ESI: 00000000 EDI: fab49134 EBP: f0f1be40 ESP:
f0f1be34
May  9 10:16:29 Server kernel:  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
May  9 10:16:29 Server kernel: Process emhttp (pid: 24444, ti=f0f1a000
task=f2ccecb0 task.ti=f0f1a000)
May  9 10:16:29 Server kernel: Stack:
May  9 10:16:29 Server kernel:  fab39000 f760c1d4 f760c180 f0f1be4c c1038fe2
0000000a f0f1beb0 c10d9405
May  9 10:16:29 Server kernel:  fab39000 00000012 00000000 f6f5b818 00000000
03bf51c8 00000000 00000010
May  9 10:16:29 Server kernel:  f760c198 00000012 00000004 fab39000 000000b1
00000000 f7bd0000 f34c4ca0
May  9 10:16:29 Server kernel: Call Trace:
May  9 10:16:29 Server kernel:  [<c1038fe2>] queue_delayed_work+0x1b/0x1e
May  9 10:16:29 Server kernel:  [<c10d9405>] do_journal_end+0x747/0x92a
May  9 10:16:29 Server kernel:  [<c10d9643>] journal_end_sync+0x5b/0x63
May  9 10:16:29 Server kernel:  [<c10cd5de>] reiserfs_sync_fs+0x32/0x51
May  9 10:16:29 Server kernel:  [<c109b31f>] __sync_filesystem+0x53/0x65
May  9 10:16:29 Server kernel:  [<c109b3ba>] sync_filesystem+0x2c/0x3f
May  9 10:16:29 Server kernel:  [<c10818d4>] do_remount_sb+0x4c/0xd3
May  9 10:16:29 Server kernel:  [<c10937a1>] do_remount+0x74/0xc6
May  9 10:16:29 Server kernel:  [<c1095026>] do_mount+0x10b/0x1c6
May  9 10:16:29 Server kernel:  [<c1095142>] sys_mount+0x61/0x94
May  9 10:16:29 Server kernel:  [<c130ed05>] syscall_call+0x7/0xb
May  9 10:16:29 Server kernel:  [<c1300000>] ?
pci_bus_release_bridge_resources+0x99/0x152
May  9 10:16:29 Server kernel: Code: d6 53 89 c3 f0 0f ba 29 00 19 d2 31 c0 85
d2 0f 85 9d 00 00 00 83 79 10 00 74 04 0f 0b eb fe 8d 41 04 39 41 04 74 04 0f 0b
eb fe <f6> 06 02 b8 08 00 00 00 75 19 89 c8 e8 ca e4 ff ff 85 c0 74 08
May  9 10:16:29 Server kernel: EIP: [<c1038b65>] queue_delayed_work_on+0x33/0xbf
SS:ESP 0068:f0f1be34
May  9 10:16:29 Server kernel: CR2: 0000000000000000
May  9 10:16:29 Server kernel: ---[ end trace 66cde526a2db6f70 ]---




