From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 104851] New: kernel BUG at fs/reiserfs/prints.c:371
Date: Mon, 21 Sep 2015 10:43:31 +0000
Message-ID: <bug-104851-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=104851

            Bug ID: 104851
           Summary: kernel BUG at fs/reiserfs/prints.c:371
           Product: File System
           Version: 2.5
    Kernel Version: 3.18.21 3.14.52
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: rafal.sanocki@gmail.com
        Regression: No

Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./Q77M-D2H,
BIOS F2 12/20/2012
[316829.544234]  0000000000000000 ffff880004123798 ffffffff81a0bec5
0000000000000015
[316829.544236]  ffffffff81e452c4 ffff880004123818 ffffffff81238666
ffff8800041238b8
[316829.544237]  ffff880000000030 ffff880004123828 ffff8800041237c8
ffff880004123970
[316829.544239] Call Trace:
[316829.544243]  [<ffffffff81a0bec5>] dump_stack+0x46/0x58
[316829.544247]  [<ffffffff81238666>] __reiserfs_panic+0x46/0xc0
[316829.544248]  [<ffffffff8122188e>] check_internal_node+0x17e/0x180
[316829.544250]  [<ffffffff8122558a>] do_balance+0x27a/0x660
[316829.544252]  [<ffffffff8124424a>] reiserfs_paste_into_item+0x41a/0x4e0
[316829.544254]  [<ffffffff811a3092>] ? kmem_cache_alloc+0xe2/0x130
[316829.544258]  [<ffffffff811c3803>] ? __d_lookup+0x3/0x150
[316829.544259]  [<ffffffff81226d0a>] reiserfs_add_entry+0x33a/0x490
[316829.544261]  [<ffffffff811c3803>] ? __d_lookup+0x3/0x150
[316829.544263]  [<ffffffff8124f49f>] ? reiserfs_write_lock_nested+0x1f/0x40
[316829.544264]  [<ffffffff8124b4a4>] ? do_journal_begin_r+0x174/0x420
[316829.544266]  [<ffffffff812276bc>] reiserfs_link+0x9c/0x190
[316829.544268]  [<ffffffff811b63d8>] vfs_link+0x1b8/0x280
[316829.544270]  [<ffffffff811bc718>] SyS_link+0x1d8/0x250
[316829.544273]  [<ffffffff81a163b2>] system_call_fastpath+0x12/0x17
[316829.544274] REISERFS panic: assertion failure check_internal_node: (!(!bh))
at fs/reiserfs/do_balan.c:27614:(null): PAP-12336: bh == 0

[316829.544280] ------------[ cut here ]------------
[316829.544298] kernel BUG at fs/reiserfs/prints.c:371!
[316829.544312] invalid opcode: 0000 [#1] SMP
[316829.544325] Modules linked in: x86_pkg_temp_thermal crc32_pclmul
crc32c_intel ghash_clmulni_intel aesni_intel aes_x86_64 lrw e1000e glue_helper
ablk_helper cryptd
[316829.544376] CPU: 4 PID: 27614 Comm: rsync Not tainted 3.18.21 #1
[316829.544392] Hardware name: Gigabyte Technology Co., Ltd. To be filled by
O.E.M./Q77M-D2H, BIOS F2 12/20/2012
[316829.544417] task: ffff880213692c60 ti: ffff880004120000 task.ti:
ffff880004120000
[316829.544437] RIP: 0010:[<ffffffff8123869c>]  [<ffffffff8123869c>]
__reiserfs_panic+0x7c/0xc0
[316829.544461] RSP: 0018:ffff8800041237a8  EFLAGS: 00010292
[316829.544476] RAX: 000000000000007b RBX: ffffffff81e452c4 RCX:
00000000000000b6
[316829.544494] RDX: 0000000000000099 RSI: 0000000000000246 RDI:
ffffffff8228fce8
[316829.544513] RBP: ffff880004123818 R08: 000000000000000a R09:
0000000000000000
[316829.544532] R10: 000000000000035c R11: ffff88000412348e R12:
0000000000000000
[316829.544550] R13: ffffffff81c479d0 R14: ffff880004123980 R15:
0000000000000000
[316829.544569] FS:  00007f406395d700(0000) GS:ffff88021e300000(0000)
knlGS:0000000000000000
[316829.544590] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[316829.544606] CR2: 00007f406388d000 CR3: 00000001b6d92000 CR4:
00000000001407e0
[316829.544624] Stack:
[316829.544631]  ffff8800041238b8 ffff880000000030 ffff880004123828
ffff8800041237c8
[316829.544654]  ffff880004123970 ffff880004123cf0 ffff880004123970
ffff88014b014c98
[316829.544677]  0000000000006bde 000000000000065b ffff880004123970
ffff880004123980
[316829.544700] Call Trace:
[316829.544708]  [<ffffffff8122188e>] check_internal_node+0x17e/0x180
[316829.544725]  [<ffffffff8122558a>] do_balance+0x27a/0x660
[316829.544741]  [<ffffffff8124424a>] reiserfs_paste_into_item+0x41a/0x4e0
[316829.544759]  [<ffffffff811a3092>] ? kmem_cache_alloc+0xe2/0x130
[316829.544776]  [<ffffffff811c3803>] ? __d_lookup+0x3/0x150
[316829.544791]  [<ffffffff81226d0a>] reiserfs_add_entry+0x33a/0x490
[316829.544808]  [<ffffffff811c3803>] ? __d_lookup+0x3/0x150
[316829.544823]  [<ffffffff8124f49f>] ? reiserfs_write_lock_nested+0x1f/0x40
[316829.544841]  [<ffffffff8124b4a4>] ? do_journal_begin_r+0x174/0x420
[316829.544859]  [<ffffffff812276bc>] reiserfs_link+0x9c/0x190
[316829.544874]  [<ffffffff811b63d8>] vfs_link+0x1b8/0x280
[316829.544889]  [<ffffffff811bc718>] SyS_link+0x1d8/0x250
[316829.544904]  [<ffffffff81a163b2>] system_call_fastpath+0x12/0x17

-- 
You are receiving this mail because:
You are the assignee for the bug.
