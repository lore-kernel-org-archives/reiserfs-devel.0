From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 21092] New: Kernel 2.6.36 Bug during quotaon on reiserfs
Date: Sun, 24 Oct 2010 16:57:10 GMT
Message-ID: <bug-21092-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=21092

           Summary: Kernel 2.6.36 Bug during quotaon on reiserfs
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.36
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: markus.gapp@gmx.net
        Regression: Yes


I get this bug during boot at enabling usrquta for a reiser(3)fs since 2.6.36.
The kernel is a x86_64 smp. The reiserfs reisdes on a dm raid level 5. The same
setup worked with kernel version 2.6.35.7, of course there was no other
configuratrion change between 2.6.35.7 and 2.6.36.

REISERFS warning (device dm-4): reiserfs-2500 finish_unfinished: cannot turn on
journaled quota: error -3
------------[ cut here ]------------
kernel BUG at fs/reiserfs/lock.c:43!
invalid opcode: 0000 [#1] SMP 
last sysfs file: /sys/devices/virtual/vc/vcsa12/uevent
CPU 5 
Modules linked in: snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq
snd_seq_device snd_pcm_oss snd_mixer_oss quota_v2 quota_tree
snd_hda_codec_atihdmi snd_hda_codec_realtek snd_hda_intel snd_hda_codec snd_pcm
psmouse snd_timer evdev firewire_ohci snd pcspkr soundcore processor
firewire_core thermal snd_page_alloc button crc_itu_t i5k_amb
scsi_transport_iscsi tg3 libphy fuse nfs auth_rpcgss fscache lockd sunrpc
dm_crypt dm_mirror dm_region_hash dm_log scsi_wait_scan uhci_hcd usb_storage
ehci_hcd sr_mod cdrom sg

Pid: 3916, comm: quotaon Not tainted 2.6.36_hope3-xw6600 #1 0A9Ch/HP xw6600
Workstation
RIP: 0010:[<ffffffff811581a3>]  [<ffffffff811581a3>]
reiserfs_write_unlock+0x43/0x50
RSP: 0018:ffff880127a5dd78  EFLAGS: 00010203
RAX: ffff880129cef3e0 RBX: ffff8801298115d0 RCX: 000000000000006e
RDX: ffff88012090c540 RSI: 0000000000000000 RDI: ffff88012a838000
RBP: ffff880127a5dd78 R08: 000000000000000b R09: ffff8801298115d0
R10: 00007f5abe320580 R11: 0000000000000246 R12: ffff880129811540
R13: ffff880129811680 R14: ffff88012adc3400 R15: 0000000000001000
FS:  00007f5abd54c700(0000) GS:ffff880001940000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5abd5924c5 CR3: 000000012a741000 CR4: 00000000000006e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Process quotaon (pid: 3916, threadinfo ffff880127a5c000, task ffff880129cef3e0)
Stack:
 ffff880127a5ddc8 ffffffff81155d6f ffff880127a5dda8 ffffffff810d505c
<0> 0000000000000002 ffff880127a5de28 ffff88012adc3400 0000000000000000
<0> 0000000000000002 ffff88012adc3400 ffff880127a5de68 ffffffff81141071
Call Trace:
 [<ffffffff81155d6f>] reiserfs_unpack+0x6f/0x160
 [<ffffffff810d505c>] ? path_put+0x2c/0x40
 [<ffffffff81141071>] reiserfs_quota_on+0x171/0x1d0
 [<ffffffff810d8056>] ? do_path_lookup+0x36/0x60
 [<ffffffff81237245>] ? strncpy_from_user+0x45/0x90
 [<ffffffff81119ac5>] do_quotactl+0x4d5/0x520
 [<ffffffff810d505c>] ? path_put+0x2c/0x40
 [<ffffffff8142b181>] ? down_read+0x11/0x30
 [<ffffffff81119bbe>] sys_quotactl+0xae/0x120                                   
 [<ffffffff81002d2b>] system_call_fastpath+0x16/0x1b                            
Code: 75 29 8b 47 50 ff c8 89 47 50 83 f8 ff 74 09 c9 c3 0f 1f 80 00 00 00 00
48 c7 47 48 00 00 00 00 48 83 c7 28 e8 5f 26 2d 00 c9 c3 <0f> 0b eb fe 66 0f 1f
84 00 00 00 00 00 55 83 fe ff 48 89 e5 74                                       
RIP  [<ffffffff811581a3>] reiserfs_write_unlock+0x43/0x50                       
 RSP <ffff880127a5dd78>                                                         
---[ end trace 488c3fb0de5127fd ]---  


Despite the bug the fs in question is accessible, quota of course dont'work.
Any susequent try to enable quota result in a stalled quotaon command without
any output on console or dmesg.


Thank you, Markus

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
