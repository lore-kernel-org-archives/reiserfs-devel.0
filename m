From: "Alexey Polyakov" <alexey.polyakov@gmail.com>
Subject: reiser4 causing: kernel: general protection fault
Date: Wed, 26 Jul 2006 23:57:53 +0400
Message-ID: <b5d90b2a0607261257g6e270f3auc91f4cf232ff5b2e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29219-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi!
I'm using vanilla 2.6.17.1 x86_64 with reiser4-for-2.6.16-4.patch (no
other patches besides pom-ng).
It was working fine for about a month, but recently I got the
following error in log:

Jul 26 12:37:49 titanic kernel: general protection fault: 0000 [1] SMP
Jul 26 12:37:49 titanic kernel: CPU 3
Jul 26 12:37:49 titanic kernel: Modules linked in: oprofile
Jul 26 12:37:49 titanic kernel: Pid: 1499, comm: ktxnmgrd:i2o/hd Not
tainted 2.6.17.1 #1
Jul 26 12:37:49 titanic kernel: RIP: 0010:[<ffffffff80354ecb>]
<ffffffff80354ecb>{load_and_lock_bnode+27}
Jul 26 12:37:49 titanic kernel: RSP: 0018:ffff8100f5a0b9e8  EFLAGS: 00010296
Jul 26 12:37:49 titanic kernel: RAX: 00058cef7d4fa141 RBX:
002c297bea9b4a08 RCX: ffff8101fbca2cc0
Jul 26 12:37:49 titanic kernel: RDX: ffffc200001e4000 RSI:
ffff8100f5a0ba38 RDI: 002c297bea9b4a08
Jul 26 12:37:49 titanic kernel: RBP: 002c297bea9b4a08 R08:
ffff8100f5a0ba44 R09: 0000000080078071
Jul 26 12:37:49 titanic kernel: R10: 0000000000000000 R11:
ffffffff80247ab0 R12: ffff8100f5a0bad8
Jul 26 12:37:49 titanic kernel: R13: ffff8101fc748000 R14:
ffff810139d5bd80 R15: ffffffff80355b40
Jul 26 12:37:49 titanic kernel: FS:  00002b68be055a40(0000)
GS:ffff810100186840(0000) knlGS:0000000000000000
Jul 26 12:37:49 titanic kernel: CS:  0010 DS: 0018 ES: 0018 CR0:
000000008005003b
Jul 26 12:37:49 titanic kernel: CR2: 00002affd237f000 CR3:
000000019a015000 CR4: 00000000000006e0
Jul 26 12:37:49 titanic kernel: Process ktxnmgrd:i2o/hd (pid: 1499,
threadinfo ffff8100f5a0a000, task ffff810100313830)
Jul 26 12:37:49 titanic kernel: Stack: 0000000000000688
0000000000000000 ffff8101f9c3b978 ffffffffffffff00
Jul 26 12:37:49 titanic kernel:        ffffffff80354dd1
002c297bea9b4a08 0000000000000000 ffff8100f5a0bad8
Jul 26 12:37:49 titanic kernel:        ffff8101fc748000 ffffffff80355bb6
Jul 26 12:37:49 titanic kernel: Call Trace:
<ffffffff80354dd1>{reiser4_adler32+49}
<ffffffff80355bb6>{apply_dset_to_commit_bmap+118}
Jul 26 12:37:49 titanic kernel:
<ffffffff8032db79>{blocknr_set_iterator+89}
<ffffffff80355deb>{pre_commit_hook_bitmap+411}
Jul 26 12:37:49 titanic kernel:
<ffffffff80249f3b>{try_to_wake_up+1003}
<ffffffff80321179>{pre_commit_hook+9}
Jul 26 12:37:49 titanic kernel:
<ffffffff803287df>{reiser4_write_logs+79}
<ffffffff80286480>{__wake_up_common+64}
Jul 26 12:37:49 titanic kernel:
<ffffffff8022e6f3>{__wake_up+67} <ffffffff80265c2c>{__up_wakeup+53}
Jul 26 12:37:49 titanic kernel:
<ffffffff80247ab0>{mempool_free_slab+0}
<ffffffff8031b826>{.text.lock.lock+5}
Jul 26 12:37:49 titanic kernel:
<ffffffff80321efe>{atom_send_event+110}
<ffffffff80247ab0>{mempool_free_slab+0}
Jul 26 12:37:49 titanic kernel:
<ffffffff80321659>{txnh_get_atom+41}
<ffffffff803216ed>{get_current_atom_locked_nocheck+29}
Jul 26 12:37:49 titanic kernel:        <ffffffff80322325>{txn_end+949}
<ffffffff80322519>{txn_restart+9}
Jul 26 12:37:49 titanic kernel:
<ffffffff80322689>{commit_some_atoms+313}
<ffffffff8032d6c4>{ktxnmgrd+452}
Jul 26 12:37:49 titanic kernel:
<ffffffff8029a740>{autoremove_wake_function+0}
<ffffffff80286480>{__wake_up_common+64}
Jul 26 12:37:49 titanic kernel:
<ffffffff8029a740>{autoremove_wake_function+0}
<ffffffff8029a3f0>{keventd_create_kthread+0}
Jul 26 12:37:49 titanic kernel:        <ffffffff8032d500>{ktxnmgrd+0}
<ffffffff8029a3f0>{keventd_create_kthread+0}
Jul 26 12:37:49 titanic kernel:        <ffffffff80233719>{kthread+217}
<ffffffff80261fce>{child_rip+8}
Jul 26 12:37:49 titanic kernel:
<ffffffff8029a3f0>{keventd_create_kthread+0}
<ffffffff8026120b>{sysret_signal+28}
Jul 26 12:37:49 titanic kernel:        <ffffffff80233640>{kthread+0}
<ffffffff80261fc6>{child_rip+0}
Jul 26 12:37:49 titanic kernel:
Jul 26 12:37:49 titanic kernel: Code: 8b 47 34 85 c0 74 10 f0 ff 0f 0f
88 60 03 00 00 31 c0 e9 40
Jul 26 12:37:49 titanic kernel: RIP
<ffffffff80354ecb>{load_and_lock_bnode+27} RSP <ffff8100f5a0b9e8>

After that, most processes got stuck in D state and I had to to hard reset.
Is it a known reiser4 bug? Do I need to provide additional information
to help fixing it?


-- 
Alexey Polyakov
