From: Ed Tomlinson <tomlins@cam.org>
Subject: [BUG] tons of logging patches
Date: Fri, 7 Jun 2002 23:32:29 -0400
Message-ID: <200206072332.29892.tomlins@cam.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>

Hi,

On pre10-ac2 with your:

01-relocation-3.diff  
02-commit_super-8-relocation.diff  
03-beta-data-logging-7.diff

Adpated for the O(1) scheduler which required replacing code in two places
in journal.c with yield() and with by slab_in_lru patch, I found this in my log:

Jun  7 07:21:33 oscar kernel:  printing eip:
Jun  7 07:21:33 oscar kernel: c016d2ff
Jun  7 07:21:33 oscar kernel: Oops: 0000
Jun  7 07:21:33 oscar kernel: CPU:    0
Jun  7 07:21:33 oscar kernel: EIP:    0010:[flush_commit_list+31/812]    Tainted: P
Jun  7 07:21:33 oscar kernel: EFLAGS: 00010286
Jun  7 07:21:33 oscar kernel: eax: 00000000   ebx: 00000000   ecx: db71a124   edx: e2a910d8
Jun  7 07:21:33 oscar kernel: esi: df2ea000   edi: df2ea000   ebp: c99d99c0   esp: dceb3f20
Jun  7 07:21:33 oscar kernel: ds: 0018   es: 0018   ss: 0018
Jun  7 07:21:33 oscar kernel: Process newsplex (pid: 4524, stackpage=dceb3000)
Jun  7 07:21:33 oscar kernel: Stack: 00000580 df2ea000 000e7995 c99d99c0 000e7995 c66ae000 d1ff24a0 dceb2000
Jun  7 07:21:33 oscar kernel:        00000000 00000000 c017102d df2ea000 00000000 00000001 00000000 c99d99c0
Jun  7 07:21:33 oscar kernel:        00000000 c99d9a2c 00000000 00000000 00000000 000149b0 00000000 00001000
Jun  7 07:21:33 oscar kernel: Call Trace: [reiserfs_commit_for_inode+217/228] [reiserfs_sync_file+66/84] [sys_fsync+98/164] [s
ystem_call+51/64]
Jun  7 07:21:33 oscar kernel:
Jun  7 07:21:33 oscar kernel: Code: 8b 6b 2c 68 1f c7 20 c0 e8 4c fc ff ff 8b 43 14 83 c4 04 85

Ed Tomlinson
