From: Steve Barton <steve@cruzio.com>
Subject: bug narrowed to softraid partitions
Date: Sun, 2 Nov 2003 12:10:20 -0800 (PST)
Message-ID: <Pine.LNX.4.53.0311021147160.16702@gigor.chez_moi.net>
Reply-To: boulevardier@wastrel.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: umka@namesys.com
Cc: reiserfs-list@namesys.com

hi, gents,

sorry to be so late getting you feedback on the latest snapshot.  i was
busy making akpm miserable over some ext3 bug.  :-)

this time i tried something i had not tried on the previous snapshot.
i tried both a SCSI partition and a softraid partition.  the former
mkfs'ed and mounted w/o problem, the latter is still sick:

root@mongo-invictus:/home/admin# mkfs.reiser4 /dev/md0
mkfs.reiser4 0.4.18
Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Block size 4096 will be used.
Linux 2.6.0-test7-reiser4 is detected.
Uuid c9d91fc2-9f97-4976-a91f-c4b1d800c616 will be used.
Reiser4 is going to be created on /dev/md0.
(Yes/No): Yes
Creating reiser4 on /dev/md0...done
root@mongo-invictus:/home/admin# mount /dev/md0 /usr/local
Segmentation fault

syslog shows:

Nov  2 11:43:52 mongo-invictus kernel: Unable to handle kernel NULL
pointer dereference at virtual address 00000000
Nov  2 11:43:52 mongo-invictus kernel:  printing eip:
Nov  2 11:43:52 mongo-invictus kernel: c02c8396
Nov  2 11:43:52 mongo-invictus kernel: *pde = 00000000
Nov  2 11:43:52 mongo-invictus kernel: Oops: 0000 [#1]
Nov  2 11:43:52 mongo-invictus kernel: CPU:    1
Nov  2 11:43:52 mongo-invictus kernel: EIP:    0060:[<c02c8396>]
Not tainted
Nov  2 11:43:52 mongo-invictus kernel: EFLAGS: 00010282
Nov  2 11:43:52 mongo-invictus kernel: EIP is at check_struct_allocator_bitmap+0x36/0x144
Nov  2 11:43:52 mongo-invictus kernel: eax: 00001750   ebx: 00000000 ecx: d8a18000   edx: 00000000
Nov  2 11:43:52 mongo-invictus kernel: esi: 00000000   edi: 00000000 ebp: d8a19d70   esp: d8a19d40
Nov  2 11:43:52 mongo-invictus kernel: ds: 007b   es: 007b   ss: 0068
Nov  2 11:43:52 mongo-invictus kernel: Process mount (pid: 238, threadinfo=d8a18000 task=dcea79b0)
Nov  2 11:43:52 mongo-invictus kernel: Stack: de523df8 00000000 00000000 00000000 00000000 00000000 00001750 00000000
Nov  2 11:43:52 mongo-invictus kernel:        00000000 de523df8 00000000 d8a19db0 d8a19d84 c02c8ce0 d8682814 de523df8
Nov  2 11:43:52 mongo-invictus kernel:        de523df8 d8a19d98 c02a5e52 de523df8 00000000 0000000b d8a19e6c c02a6213
Nov  2 11:43:52 mongo-invictus kernel: Call Trace:
Nov  2 11:43:52 mongo-invictus kernel:  [<c02c8ce0>] check_mount_format40+0x20/0x30
Nov  2 11:43:52 mongo-invictus kernel:  [<c02a5e52>] _init_disk_format+0x42/0x50
Nov  2 11:43:52 mongo-invictus kernel:  [<c02a6213>] reiser4_fill_super+0x33/0xa0
Nov  2 11:43:52 mongo-invictus kernel:  [<c0196bc4>] sb_set_blocksize+0x24/0x50
Nov  2 11:43:52 mongo-invictus kernel:  [<c01965b1>] get_sb_bdev+0x121/0x160
Nov  2 11:43:52 mongo-invictus kernel:  [<c029bf4e>] reiser4_get_sb+0x2e/0x30
Nov  2 11:43:52 mongo-invictus kernel:  [<c02a61e0>] reiser4_fill_super+0x0/0xa0
Nov  2 11:43:52 mongo-invictus kernel:  [<c01967fe>] do_kern_mount+0x5e/0x100
Nov  2 11:43:52 mongo-invictus kernel:  [<c02e93f4>] capable+0x24/0x70
Nov  2 11:43:52 mongo-invictus kernel:  [<c01bd094>] do_add_mount+0x74/0x180
Nov  2 11:43:52 mongo-invictus kernel:  [<c01bd41c>] do_mount+0x16c/0x1c0
Nov  2 11:43:52 mongo-invictus kernel:  [<c01bd23e>] copy_mount_options+0x9e/0x110
Nov  2 11:43:52 mongo-invictus kernel:  [<c01bda65>] sys_mount+0x105/0x2b0
Nov  2 11:43:52 mongo-invictus kernel:  [<c018a22f>] sys_read+0x3f/0x60
Nov  2 11:43:52 mongo-invictus kernel:  [<c010a95b>] syscall_call+0x7/0xb
Nov  2 11:43:52 mongo-invictus kernel:
Nov  2 11:43:52 mongo-invictus kernel: Code: 03 1a 89 1c 24 e8 d0 ec
ff ff 85 c0 75 4a 8b 55 0c 8b 42 0c

i find further that trying to turn assertions on in the reiser4 code
results in a kernel that will not boot.  :-P

please let me know if there is any further information that i might
gather that you might find useful.  in the absence of that i'll go
back to using reiser3 and awaiting the next snapshot announcement.

best regards,

				-steve

p.s. a further suggestion: would it be possible to have future
snapshots modify the uname string in include/linux/version.h to
indicate the snapshot # ?  this might help y'all feel reassured that
the user is using the snapshot of interest.  -s
