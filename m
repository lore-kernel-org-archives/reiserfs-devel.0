From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: 2.6.2 + datalogging: oops when filling partition
Date: Tue, 17 Feb 2004 09:04:38 +0100
Message-ID: <20040217090438.4db8b96f.petchema@concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Kernel: 2.6.2 + 2.6.1 datalogging patches (all but
04-reiserfs-balance_dirty)

Audacity suddenly filled /tmp, mount-binded to /var/tmp, which resulted in

Message from syslogd@rayanne at Tue Feb 17 02:50:59 2004 ...
rayanne kernel: journal-1577: handle trans id 3251852 != current trans id
3251853

Message from syslogd@rayanne at Tue Feb 17 02:50:59 2004 ...
rayanne kernel: journal-1577: handle trans id 3251852 != current trans id
3251853

in console and

Feb 17 02:50:59 rayanne kernel: ------------[ cut here ]------------
Feb 17 02:50:59 rayanne kernel: kernel BUG at fs/reiserfs/prints.c:338!
Feb 17 02:50:59 rayanne kernel: invalid operand: 0000 [#1]
Feb 17 02:50:59 rayanne kernel: CPU:    0
Feb 17 02:50:59 rayanne kernel: EIP:    0060:[reiserfs_panic+52/112]    Tainted: P  
Feb 17 02:50:59 rayanne kernel: EFLAGS: 00210282
Feb 17 02:50:59 rayanne kernel: EIP is at reiserfs_panic+0x34/0x70
Feb 17 02:50:59 rayanne kernel: eax: 00000045   ebx: df800e00   ecx: c0347440   edx: c02c9c18
Feb 17 02:50:59 rayanne kernel: esi: c87e3ec4   edi: df95a430   ebp: df800e00   esp: c87e3d90
Feb 17 02:50:59 rayanne kernel: ds: 007b   es: 007b   ss: 0068
Feb 17 02:50:59 rayanne kernel: Process audacity (pid: 17589, threadinfo=c87e2000 task=c9e8ad80)
Feb 17 02:50:59 rayanne kernel: Stack: c02976d5 c0350c00 00000000 00000000 c01b0d85 df800e00 c02a2440 00319e8c 
Feb 17 02:50:59 rayanne kernel:        00319e8d c014f6bf df95a430 c014f70c df95a430 00000000 00000000 c87e3ec4 
Feb 17 02:50:59 rayanne kernel:        c87e2000 00000001 c01b254b c87e3ec4 df800e00 df95a430 00000001 00000000 
Feb 17 02:50:59 rayanne kernel: Call Trace:
Feb 17 02:50:59 rayanne kernel:  [journal_mark_dirty+613/672] journal_mark_dirty+0x265/0x2a0
Feb 17 02:50:59 rayanne kernel:  [wake_up_buffer+15/48] wake_up_buffer+0xf/0x30
Feb 17 02:50:59 rayanne kernel:  [unlock_buffer+44/80] unlock_buffer+0x2c/0x50
Feb 17 02:50:59 rayanne kernel:  [do_journal_end+2731/2784] do_journal_end+0xaab/0xae0
Feb 17 02:50:59 rayanne kernel:  [journal_end+72/192] journal_end+0x48/0xc0
Feb 17 02:50:59 rayanne kernel:  [reiserfs_file_write+1636/1934] reiserfs_file_write+0x664/0x78e
Feb 17 02:50:59 rayanne kernel:  [handle_mm_fault+224/384] handle_mm_fault+0xe0/0x180
Feb 17 02:50:59 rayanne kernel:  [do_page_fault+828/1326] do_page_fault+0x33c/0x52e
Feb 17 02:50:59 rayanne kernel:  [do_mmap_pgoff+1439/1712] do_mmap_pgoff+0x59f/0x6b0
Feb 17 02:50:59 rayanne kernel:  [vfs_write+184/304] vfs_write+0xb8/0x130
Feb 17 02:50:59 rayanne kernel:  [sys_write+66/112] sys_write+0x42/0x70
Feb 17 02:50:59 rayanne kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Feb 17 02:50:59 rayanne kernel: 
Feb 17 02:50:59 rayanne kernel: Code: 0f 0b 52 01 5d b1 29 c0 c7 04 24 e0 fc 29 c0 b8 dc ad 29 c0 

in logs.

Hope it helps,
Pierre.
