From: ms419@freezone.co.uk
Subject: reiser4 formatted initrd
Date: Tue, 24 May 2005 10:46:54 -0700 (PDT)
Message-ID: <27009.24.86.194.63.1116956814.squirrel@rof>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-24128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I built into my kernel support for only the reiser4 filesystem, so when I
needed an initrd for booting a raid root partition, I formated it using
reiser4

Unfortuantely, I got this error booting my reiser4 formated initrd -


[...]
RAMDISK: Compressed image found at block 0
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(1,0)
 <0>Rebooting in 180 seconds..<3>BUG: soft lockup detected on CPU#0!
NIP: C000692C LR: C00198A0 SP: DFFC3EC0 REGS: dffc3e10 TRAP: 0901    Not
tainted
MSR: 00009032 EE: 1 PR: 0 ME: 1 IR/DR: 11
TASK = dffc1730[1] 'swapper' THREAD: dffc2000
Last syscall: 120
GPR00: 00000000 DFFC3EC0 DFFC1730 000657D0 00000000 DFFCE720 00000008
GPR08: 00000009 C03A0000 DFFFD010 C0320000 82000024
NIP [c000692c] __delay+0xc/0x14
LR [c00198a0] panic+0x10c/0x16c
Call trace:
 [c03a2b34] mount_block_root+0xbc/0x11c
 [c03a2da0] prepare_namespace+0x74/0x13c
 [c0003eec] init+0xec/0xf4
 [c000720c] kernel_thread+0x44/0x60


I since built ext2 support into my kernel & booting the same initrd -
formatted using ext2 - works no problem

Though I now boot successfully, I'm curious to debug this problem with
reiser4 formatted initrds - I eventually want to eliminate ext2 support
altogether

Might there be a problem with my initrd image / kernel configuration? or
are reiser4 formatted initrds fundamentally unsupported?

Many thanks for all your work on the greatest filesystem!

Jack

