From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 190071] The patch "reiserfs: switch to
 generic_{get,set,remove}xattr()" introduced with 4.4.27 causes kernel panic
 on root mount
Date: Fri, 30 Dec 2016 21:25:15 +0000
Message-ID: <bug-190071-695-Is9rJNLxgY@https.bugzilla.kernel.org/>
References: <bug-190071-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-190071-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=190071

dflogeras2@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dflogeras2@gmail.com

--- Comment #1 from dflogeras2@gmail.com ---
I think I am seeing the same thing in ARM.  I updated from 4.4.26 to 4.4.39 and
when I tried to access a partition (rsync) using reiserfs I got the following:


Dec 30 03:10:10 cubie kernel: Unable to handle kernel NULL pointer dereference
at virtual address 00000000
Dec 30 03:10:10 cubie kernel: pgd = ea608000
Dec 30 03:10:10 cubie kernel: [00000000] *pgd=6a603831, *pte=00000000,
*ppte=00000000
Dec 30 03:10:10 cubie kernel: Internal error: Oops: 17 [#1] SMP ARM
Dec 30 03:10:10 cubie kernel: Modules linked in: ipt_REJECT nf_reject_ipv4
xt_tcpudp iptable_filter ip_tables x_tables reiserfs dm_mod sun4i_codec
snd_soc_core snd_pcm_dmaengine snd_pcm dwmac_sunxi stmmac_platform stmmac ptp
of_mdio libphy snd_timer snd i2c_mv64xxx soundcore i2c_core sunxi_wdt leds_gpio
Dec 30 03:10:10 cubie kernel: CPU: 0 PID: 5174 Comm: rsync Not tainted
4.4.39-gentoo #1
Dec 30 03:10:10 cubie kernel: Hardware name: Allwinner sun7i (A20) Family
Dec 30 03:10:10 cubie kernel: task: e5977440 ti: e101e000 task.ti: e101e000
Dec 30 03:10:10 cubie kernel: PC is at xattr_resolve_name+0x10/0x98
Dec 30 03:10:10 cubie kernel: LR is at generic_getxattr+0x2c/0x5c
Dec 30 03:10:10 cubie kernel: pc : [<c0108cb8>]    lr : [<c0108d6c>]    psr:
a00f0013\x0asp : e101fe00  ip : e101fe1c  fp : 00000006
Dec 30 03:10:10 cubie kernel: r10: d82a847c  r9 : e5aa5cc0  r8 : e101ff1c
Dec 30 03:10:10 cubie kernel: r7 : e101ff1c  r6 : c04b59e8  r5 : 00000000  r4 :
d82857f8
Dec 30 03:10:10 cubie kernel: r3 : 00000000  r2 : 00000000  r1 : e101fe1c  r0 :
00000000
Dec 30 03:10:10 cubie kernel: Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA
ARM  Segment none
Dec 30 03:10:10 cubie kernel: Control: 10c5387d  Table: 6a60806a  DAC: 00000051
Dec 30 03:10:10 cubie kernel: Process rsync (pid: 5174, stack limit =
0xe101e210)
Dec 30 03:10:10 cubie kernel: Stack: (0xe101fe00 to 0xe1020000)
Dec 30 03:10:10 cubie kernel: fe00: d82857f8 00000000 00000000 c0108d6c
ef7c60e8 efa392c0 5209675f c04b59e8
Dec 30 03:10:10 cubie kernel: fe20: d82857f8 00000000 00000000 c01e442c
d82a83a8 c00ff910 d82a83a8 d82857f8
Dec 30 03:10:10 cubie kernel: fe40: d82a83a8 c00ff9cc e5b07528 c00cd134
00000049 ea608000 00000055 0000004d
Dec 30 03:10:10 cubie kernel: fe60: ea60ad38 00000134 000b4e4c 00000000
00000001 00000000 00000000 e105b0b0
Dec 30 03:10:10 cubie kernel: fe80: e5977440 e101ff30 e5aa5cc0 c00a87a8
e105b108 00000041 b4e8d000 e101ffb0
Dec 30 03:10:10 cubie kernel: fea0: e5977440 edf93500 e105b108 e101ff30
d82a8418 e5aa5cc0 e101ff1c 00001ae9
Dec 30 03:10:10 cubie kernel: fec0: 000001ff 00000000 00000006 c00a8a78
e105b0c0 00000000 00000800 00000000
Dec 30 03:10:10 cubie kernel: fee0: 00000000 e5aa5cc0 00001ae9 00000000
00000000 e101ff88 e101e000 00000000
Dec 30 03:10:10 cubie kernel: ff00: 00000006 c00e6c28 00001ae9 c000929c
00000000 b4e4c008 00001ae9 00000001
Dec 30 03:10:10 cubie kernel: ff20: 00000000 00001ae9 e101ff14 00000001
e5aa5cc0 00000000 00000000 00000000
Dec 30 03:10:10 cubie kernel: ff40: 00000000 00000000 00000000 00000000
e5aa5cc0 00001ae9 b4e4c008 e101ff88
Dec 30 03:10:10 cubie kernel: ff60: c000f6c4 c00e73b0 b6ef0000 c00bd4e4
e5aa5cc0 e5aa5cc0 00001ae9 b4e4c008
Dec 30 03:10:10 cubie kernel: ff80: c000f6c4 c00e7bd8 00000000 00000000
00040008 00000000 b4e4c008 00091fb0
Dec 30 03:10:10 cubie kernel: ffa0: 00000004 c000f500 00000000 b4e4c008
00000006 b4e4c008 00001ae9 00001ae9
Dec 30 03:10:10 cubie kernel: ffc0: 00000000 b4e4c008 00091fb0 00000004
00001ae9 00000000 00091d78 00000006
Dec 30 03:10:10 cubie kernel: ffe0: 00000000 bec5bb74 000484a4 b6e7f260
600f0010 00000006 00000000 00000000
Dec 30 03:10:10 cubie kernel: [<c0108cb8>] (xattr_resolve_name) from
[<c0108d6c>] (generic_getxattr+0x2c/0x5c)
Dec 30 03:10:11 cubie kernel: [<c0108d6c>] (generic_getxattr) from [<c01e442c>]
(cap_inode_need_killpriv+0x2c/0x44)
Dec 30 03:10:11 cubie kernel: [<c01e442c>] (cap_inode_need_killpriv) from
[<c00ff910>] (dentry_needs_remove_privs.part.6+0x18/0x2c)
Dec 30 03:10:11 cubie kernel: [<c00ff910>] (dentry_needs_remove_privs.part.6)
from [<c00ff9cc>] (file_remove_privs+0x8c/0xe8)
Dec 30 03:10:11 cubie kernel: [<c00ff9cc>] (file_remove_privs) from
[<c00a87a8>] (__generic_file_write_iter+0x5c/0x1ec)
Dec 30 03:10:11 cubie kernel: [<c00a87a8>] (__generic_file_write_iter) from
[<c00a8a78>] (generic_file_write_iter+0x140/0x25c)
Dec 30 03:10:11 cubie kernel: [<c00a8a78>] (generic_file_write_iter) from
[<c00e6c28>] (__vfs_write+0xa8/0xd8)
Dec 30 03:10:11 cubie kernel: [<c00e6c28>] (__vfs_write) from [<c00e73b0>]
(vfs_write+0x90/0x164)
Dec 30 03:10:11 cubie kernel: [<c00e73b0>] (vfs_write) from [<c00e7bd8>]
(SyS_write+0x44/0x9c)
Dec 30 03:10:11 cubie kernel: [<c00e7bd8>] (SyS_write) from [<c000f500>]
(ret_fast_syscall+0x0/0x3c)
Dec 30 03:10:11 cubie kernel: Code: e92d4070 e5916000 e3560000 0a00001f
(e5904000)
Dec 30 03:10:11 cubie kernel: ---[ end trace 325de232048f8448 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.
