From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [BUG] reiser4-for-2.6.27
Date: Sun, 19 Oct 2008 12:02:34 +0400
Message-ID: <48FAE99A.3060009@gmail.com>
References: <9bb377710810181808w5bb8b512l24cf7db8ddfcebaf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <9bb377710810181808w5bb8b512l24cf7db8ddfcebaf@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brandon Berhent <cheater1034@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Brandon Berhent wrote:
> Hi, i've  been reported problems with 2 people i know who have used
> the reiser4-for-2.6.27 patch (the only people i know who have used
> it). I have not got around to trying it myself however.
>
>   

Interesting.
Also would you please, ask them for .config, if possible?

Thanks,
Edward.

> Anyway, the first person gets lots of these:
> Oct 18 15:59:20 locl BUG: using smp_processor_id() in preemptible
> [00000000] code: syslog-ng/1624
> Oct 18 15:59:20 locl caller is __inc_zone_state+0x18/0x90
> Oct 18 15:59:20 locl Pid: 1624, comm: syslog-ng Not tainted
> 2.6.27-zen2-06166-gd647f94 #33
> Oct 18 15:59:20 locl
> Oct 18 15:59:20 locl Call Trace:
> Oct 18 15:59:20 locl [<ffffffff80382b54>] debug_smp_processor_id+0xd4/0xe0
> Oct 18 15:59:20 locl [<ffffffff802804d8>] __inc_zone_state+0x18/0x90
> Oct 18 15:59:20 locl [<ffffffff8030e5ff>]
> reiser4_set_page_dirty_internal+0x4f/0xf0
> Oct 18 15:59:20 locl [<ffffffff80327ff6>] write_cryptcompress+0x6c6/0x8a0
> Oct 18 15:59:20 locl [<ffffffff80321cd8>] reiser4_write_careful+0x108/0x4b0
> Oct 18 15:59:20 locl [<ffffffff802a4144>] cp_new_stat+0xe4/0x100
> Oct 18 15:59:20 locl [<ffffffff802a082b>] vfs_write+0xcb/0x190
> Oct 18 15:59:20 locl [<ffffffff802a09f3>] sys_write+0x53/0xa0
> Oct 18 15:59:20 locl [<ffffffff8020bc8b>] system_call_fastpath+0x16/0x1b
>
> And the second person gets much of the same:
>
> 7>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.469585] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.469588] [<ffffffff8034c9aa>] carry_shift_data+0x6a/0x80
> [ 8509.469590] [<ffffffff8034d302>] carry_insert_flow+0x222/0x580
> [ 8509.469593] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.469595] [<ffffffff8034bbab>] reiser4_post_carry+0x6b/0xf0
> [ 8509.469600] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.469604] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.469608] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.469612] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.469617] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.469621] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.469626] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.469630] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.469634] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.469638] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.469642] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.469646] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.469650] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.469654] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.469659] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.469663] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.469667] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.469670] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.469673]
> [ 8509.469683] BUG: using smp_processor_id() in preemptible [00000000]
> code: ktxnmgrd:dm-2:r/16654
> [ 8509.469688] caller is __inc_zone_state+0x18/0x90
> [ 8509.469692] Pid: 16654, comm: ktxnmgrd:dm-2:r Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8509.469696]
> [ 8509.469697] Call Trace:
> [ 8509.469700] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8509.469704] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8509.469709] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.469713] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.469718] [<ffffffff8034d3e2>] carry_insert_flow+0x302/0x580
> [ 8509.469722] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.469726] [<ffffffff8034bbab>] reiser4_post_carry+0x6b/0xf0
> [ 8509.469730] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.469734] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.469738] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.469743] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.469747] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.469751] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.469755] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.469759] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.469763] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.469767] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.469771] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.469775] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.469779] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.469783] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.469787] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.469791] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.469794] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.469798] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.469801]
> [ 8509.469837] BUG: using smp_processor_id() in preemptible [00000000]
> code: ktxnmgrd:dm-2:r/16654
> [ 8509.469842] caller is __inc_zone_state+0x18/0x90
> [ 8509.469846] Pid: 16654, comm: ktxnmgrd:dm-2:r Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8509.469850]
> [ 8509.469850] Call Trace:
> [ 8509.469853] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8509.469858] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8509.469862] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.469867] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.469871] [<ffffffff8034c9aa>] carry_shift_data+0x6a/0x80
> [ 8509.469875] [<ffffffff8034ddaf>] insert_paste_common+0x40f/0x810
> [ 8509.469880] [<ffffffff803508da>] find_child_ptr+0x1aa/0x1c0
> [ 8509.469884] [<ffffffff80356c81>] znode_make_dirty+0x71/0xa0
> [ 8509.469888] [<ffffffff8034d827>] carry_update+0x137/0x250
> [ 8509.469892] [<ffffffff8034e828>] carry_insert+0x58/0xd0
> [ 8509.469896] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.469900] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.469904] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.469908] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.469913] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.469917] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.469921] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.469925] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.469929] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.469933] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.469937] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.469941] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.469945] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.469949] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.469953] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.469957] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.469961] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.469964] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.469968] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.469971]
> [ 8509.470247] BUG: using smp_processor_id() in preemptible [00000000]
> code: ktxnmgrd:dm-2:r/16654
> [ 8509.470250] caller is __inc_zone_state+0x18/0x90
> [ 8509.470252] Pid: 16654, comm: ktxnmgrd:dm-2:r Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8509.470254]
> [ 8509.470254] Call Trace:
> [ 8509.470256] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8509.470259] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8509.470261] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.470263] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.470266] [<ffffffff8034c9aa>] carry_shift_data+0x6a/0x80
> [ 8509.470268] [<ffffffff8034d302>] carry_insert_flow+0x222/0x580
> [ 8509.470270] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.470272] [<ffffffff8034bbab>] reiser4_post_carry+0x6b/0xf0
> [ 8509.470274] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.470277] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.470279] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.470281] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.470283] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.470285] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.470287] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.470289] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.470292] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470293] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.470296] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.470298] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470300] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.470302] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470304] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.470305] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.470307] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.470309] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.470310]
> [ 8509.470319] BUG: using smp_processor_id() in preemptible [00000000]
> code: ktxnmgrd:dm-2:r/16654
> [ 8509.470322] caller is __inc_zone_state+0x18/0x90
> [ 8509.470323] Pid: 16654, comm: ktxnmgrd:dm-2:r Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8509.470325]
> [ 8509.470325] Call Trace:
> [ 8509.470327] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8509.470330] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8509.470332] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.470334] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.470336] [<ffffffff8034d3e2>] carry_insert_flow+0x302/0x580
> [ 8509.470339] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.470341] [<ffffffff8034bbab>] reiser4_post_carry+0x6b/0xf0
> [ 8509.470343] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.470345] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.470347] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.470349] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.470352] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.470354] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.470356] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.470358] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.470360] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470362] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.470364] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.470366] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470368] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.470370] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470372] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.470374] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.470376] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.470378] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.470379]
> [ 8509.470384] BUG: using smp_processor_id() in preemptible [00000000]
> code: ktxnmgrd:dm-2:r/16654
> [ 8509.470387] caller is __inc_zone_state+0x18/0x90
> [ 8509.470389] Pid: 16654, comm: ktxnmgrd:dm-2:r Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8509.470390]
> [ 8509.470391] Call Trace:
> [ 8509.470393] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8509.470395] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8509.470397] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.470400] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.470402] [<ffffffff8034d3e2>] carry_insert_flow+0x302/0x580
> [ 8509.470404] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.470406] [<ffffffff8034bbab>] reiser4_post_carry+0x6b/0xf0
> [ 8509.470408] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.470410] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.470413] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.470415] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.470417] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.470419] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.470421] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.470423] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.470425] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470427] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.470429] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.470432] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470434] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.470436] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470438] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.470440] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.470441] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.470443] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.470444]
> [ 8509.470761] BUG: using smp_processor_id() in preemptible [00000000]
> code: ktxnmgrd:dm-2:r/16654
> [ 8509.470764] caller is __inc_zone_state+0x18/0x90
> [ 8509.470766] Pid: 16654, comm: ktxnmgrd:dm-2:r Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8509.470767]
> [ 8509.470767] Call Trace:
> [ 8509.470769] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8509.470771] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8509.470775] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.470778] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.470782] [<ffffffff8034c9aa>] carry_shift_data+0x6a/0x80
> [ 8509.470785] [<ffffffff8034d302>] carry_insert_flow+0x222/0x580
> [ 8509.470788] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.470792] [<ffffffff8034bbab>] reiser4_post_carry+0x6b/0xf0
> [ 8509.470795] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.470798] [<ffffffff8070d42e>] _write_lock+0xe/0x30
> [ 8509.470801] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.470804] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.470807] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.470810] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.470814] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.470817] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.470820] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.470823] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470826] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.470829] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.470832] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470835] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.470839] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470841] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.470844] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.470847] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.470849] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.470851]
> [ 8509.470861] BUG: using smp_processor_id() in preemptible [00000000]
> code: ktxnmgrd:dm-2:r/16654
> [ 8509.470864] caller is __inc_zone_state+0x18/0x90
> [ 8509.470866] Pid: 16654, comm: ktxnmgrd:dm-2:r Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8509.470867]
> [ 8509.470868] Call Trace:
> [ 8509.470869] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8509.470871] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8509.470873] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.470875] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.470877] [<ffffffff8034d3e2>] carry_insert_flow+0x302/0x580
> [ 8509.470879] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.470882] [<ffffffff8034bbab>] reiser4_post_carry+0x6b/0xf0
> [ 8509.470885] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.470889] [<ffffffff8070d42e>] _write_lock+0xe/0x30
> [ 8509.470892] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.470895] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.470898] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.470902] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.470905] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.470908] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.470911] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.470914] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470917] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.470920] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.470923] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470926] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.470929] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.470932] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.470935] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.470938] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.470941] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.470942]
> [ 8509.470948] BUG: using smp_processor_id() in preemptible [00000000]
> code: ktxnmgrd:dm-2:r/16654
> [ 8509.470952] caller is __inc_zone_state+0x18/0x90
> [ 8509.470954] Pid: 16654, comm: ktxnmgrd:dm-2:r Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8509.470956]
> [ 8509.470956] Call Trace:
> [ 8509.470958] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8509.470961] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8509.470965] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.470969] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.470972] [<ffffffff8034d3e2>] carry_insert_flow+0x302/0x580
> [ 8509.470975] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.470978] [<ffffffff8034bbab>] reiser4_post_carry+0x6b/0xf0
> [ 8509.470982] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.470985] [<ffffffff8070d42e>] _write_lock+0xe/0x30
> [ 8509.470988] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.470991] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.470994] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.470997] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.471001] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.471004] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.471007] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.471010] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.471013] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.471016] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.471019] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.471022] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.471025] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.471028] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.471031] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.471034] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.471036] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.471038]
> [ 8509.471353] BUG: using smp_processor_id() in preemptible [00000000]
> code: ktxnmgrd:dm-2:r/16654
> [ 8509.471356] caller is __inc_zone_state+0x18/0x90
> [ 8509.471358] Pid: 16654, comm: ktxnmgrd:dm-2:r Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8509.471359]
> [ 8509.471360] Call Trace:
> [ 8509.471362] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8509.471364] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8509.471367] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8509.471369] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8509.471371] [<ffffffff8034c9aa>] carry_shift_data+0x6a/0x80
> [ 8509.471374] [<ffffffff8034d302>] carry_insert_flow+0x222/0x580
> [ 8509.471376] [<ffffffff8034c68b>] reiser4_carry+0x10b/0x2d0
> [ 8509.471378] [<ffffffff8034bbab>] reiser4_post_carry+0x6b/0xf0
> [ 8509.471380] [<ffffffff80386b3b>] convert_ctail+0x6cb/0xaf0
> [ 8509.471382] [<ffffffff8070d42e>] _write_lock+0xe/0x30
> [ 8509.471384] [<ffffffff80359a99>] convert_node+0x79/0x1a0
> [ 8509.471386] [<ffffffff8035b048>] handle_pos_on_formatted+0xd8/0x3d0
> [ 8509.471388] [<ffffffff803568a8>] jnode_get_atom+0x38/0x110
> [ 8509.471391] [<ffffffff8035b359>] handle_pos_on_leaf+0x9/0x30
> [ 8509.471393] [<ffffffff8035c289>] flush_current_atom+0xa19/0xb90
> [ 8509.471395] [<ffffffff8070ae18>] thread_return+0xa3/0x68b
> [ 8509.471397] [<ffffffff803574a8>] reiser4_txn_end+0x308/0x600
> [ 8509.471399] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.471401] [<ffffffff803577a9>] reiser4_txn_restart+0x9/0x20
> [ 8509.471403] [<ffffffff80357f9a>] commit_some_atoms+0x1ea/0x220
> [ 8509.471405] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.471407] [<ffffffff8036230e>] ktxnmgrd+0x17e/0x1a0
> [ 8509.471409] [<ffffffff80362190>] ktxnmgrd+0x0/0x1a0
> [ 8509.471411] [<ffffffff80259257>] kthread+0x47/0x90
> [ 8509.471413] [<ffffffff8020d489>] child_rip+0xa/0x11
> [ 8509.471415] [<ffffffff80259210>] kthread+0x0/0x90
> [ 8509.471417] [<ffffffff8020d47f>] child_rip+0x0/0x11
> [ 8509.471418]
> [ 8575.859394] __ratelimit: 30990 callbacks suppressed
> [ 8575.859398] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.859404] caller is __inc_zone_state+0x18/0x90
> [ 8575.859408] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.859411]
> [ 8575.859411] Call Trace:
> [ 8575.859427] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.859429] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.859433] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.859435] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8575.859438] [<ffffffff80376ad9>] find_disk_cluster+0x389/0x3a0
> [ 8575.859440] [<ffffffff8028d113>] find_lock_page+0x23/0x80
> [ 8575.859443] [<ffffffff8037a6c0>] flow_by_inode_cryptcompress+0x0/0x30
> [ 8575.859446] [<ffffffff8070d960>] _spin_unlock+0x10/0x30
> [ 8575.859448] [<ffffffff8037716c>] prepare_logical_cluster+0xcc/0x790
> [ 8575.859450] [<ffffffff8037516f>] set_window+0x6f/0xc0
> [ 8575.859452] [<ffffffff8037866c>] write_cryptcompress+0x55c/0x8b0
> [ 8575.859455] [<ffffffff80352664>] _reiser4_init_context+0x74/0xb0
> [ 8575.859457] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.859460] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.859462] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.859464] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.859467] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.859468]
> [ 8575.859473] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.859476] caller is __inc_zone_state+0x18/0x90
> [ 8575.859477] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.859479]
> [ 8575.859479] Call Trace:
> [ 8575.859481] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.859483] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.859486] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.859488] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8575.859490] [<ffffffff80376ad9>] find_disk_cluster+0x389/0x3a0
> [ 8575.859492] [<ffffffff8028d113>] find_lock_page+0x23/0x80
> [ 8575.859494] [<ffffffff8037a6c0>] flow_by_inode_cryptcompress+0x0/0x30
> [ 8575.859496] [<ffffffff8070d960>] _spin_unlock+0x10/0x30
> [ 8575.859499] [<ffffffff8037716c>] prepare_logical_cluster+0xcc/0x790
> [ 8575.859500] [<ffffffff8037516f>] set_window+0x6f/0xc0
> [ 8575.859502] [<ffffffff8037866c>] write_cryptcompress+0x55c/0x8b0
> [ 8575.859505] [<ffffffff80352664>] _reiser4_init_context+0x74/0xb0
> [ 8575.859507] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.859509] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.859511] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.859513] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.859515] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.859516]
> [ 8575.859520] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.859522] caller is __inc_zone_state+0x18/0x90
> [ 8575.859524] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.859525]
> [ 8575.859526] Call Trace:
> [ 8575.859528] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.859530] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.859532] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.859535] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8575.859537] [<ffffffff80376ad9>] find_disk_cluster+0x389/0x3a0
> [ 8575.859539] [<ffffffff8028d113>] find_lock_page+0x23/0x80
> [ 8575.859541] [<ffffffff8037a6c0>] flow_by_inode_cryptcompress+0x0/0x30
> [ 8575.859543] [<ffffffff8070d960>] _spin_unlock+0x10/0x30
> [ 8575.859545] [<ffffffff8037716c>] prepare_logical_cluster+0xcc/0x790
> [ 8575.859547] [<ffffffff8037516f>] set_window+0x6f/0xc0
> [ 8575.859549] [<ffffffff8037866c>] write_cryptcompress+0x55c/0x8b0
> [ 8575.859552] [<ffffffff80352664>] _reiser4_init_context+0x74/0xb0
> [ 8575.859554] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.859556] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.859558] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.859560] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.859562] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.859563]
> [ 8575.859566] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.859569] caller is __inc_zone_state+0x18/0x90
> [ 8575.859570] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.859572]
> [ 8575.859572] Call Trace:
> [ 8575.859574] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.859576] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.859579] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.859581] [<ffffffff8037874a>] write_cryptcompress+0x63a/0x8b0
> [ 8575.859583] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.859585] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.859588] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.859589] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.859591] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.859593]
> [ 8575.859646] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.859649] caller is __inc_zone_state+0x18/0x90
> [ 8575.859651] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.859652]
> [ 8575.859652] Call Trace:
> [ 8575.859654] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.859657] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.859659] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.859661] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8575.859663] [<ffffffff80376ad9>] find_disk_cluster+0x389/0x3a0
> [ 8575.859666] [<ffffffff8028d113>] find_lock_page+0x23/0x80
> [ 8575.859668] [<ffffffff8037a6c0>] flow_by_inode_cryptcompress+0x0/0x30
> [ 8575.859670] [<ffffffff8070d960>] _spin_unlock+0x10/0x30
> [ 8575.859672] [<ffffffff8037716c>] prepare_logical_cluster+0xcc/0x790
> [ 8575.859674] [<ffffffff8037516f>] set_window+0x6f/0xc0
> [ 8575.859676] [<ffffffff8037866c>] write_cryptcompress+0x55c/0x8b0
> [ 8575.859678] [<ffffffff80352664>] _reiser4_init_context+0x74/0xb0
> [ 8575.859681] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.859683] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.859685] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.859687] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.859689] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.859690]
> [ 8575.859694] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.859696] caller is __inc_zone_state+0x18/0x90
> [ 8575.859698] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.859699]
> [ 8575.859700] Call Trace:
> [ 8575.859701] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.859704] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.859706] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.859708] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8575.859710] [<ffffffff80376ad9>] find_disk_cluster+0x389/0x3a0
> [ 8575.859713] [<ffffffff8028d113>] find_lock_page+0x23/0x80
> [ 8575.859715] [<ffffffff8037a6c0>] flow_by_inode_cryptcompress+0x0/0x30
> [ 8575.859717] [<ffffffff8070d960>] _spin_unlock+0x10/0x30
> [ 8575.859719] [<ffffffff8037716c>] prepare_logical_cluster+0xcc/0x790
> [ 8575.859721] [<ffffffff8037516f>] set_window+0x6f/0xc0
> [ 8575.859723] [<ffffffff8037866c>] write_cryptcompress+0x55c/0x8b0
> [ 8575.859725] [<ffffffff80352664>] _reiser4_init_context+0x74/0xb0
> [ 8575.859727] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.859730] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.859732] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.859734] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.859736] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.859737]
> [ 8575.859740] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.859742] caller is __inc_zone_state+0x18/0x90
> [ 8575.859744] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.859746]
> [ 8575.859746] Call Trace:
> [ 8575.859748] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.859750] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.859752] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.859755] [<ffffffff80356c70>] znode_make_dirty+0x60/0xa0
> [ 8575.859757] [<ffffffff80376ad9>] find_disk_cluster+0x389/0x3a0
> [ 8575.859759] [<ffffffff8028d113>] find_lock_page+0x23/0x80
> [ 8575.859761] [<ffffffff8037a6c0>] flow_by_inode_cryptcompress+0x0/0x30
> [ 8575.859763] [<ffffffff8070d960>] _spin_unlock+0x10/0x30
> [ 8575.859765] [<ffffffff8037716c>] prepare_logical_cluster+0xcc/0x790
> [ 8575.859767] [<ffffffff8037516f>] set_window+0x6f/0xc0
> [ 8575.859769] [<ffffffff8037866c>] write_cryptcompress+0x55c/0x8b0
> [ 8575.859771] [<ffffffff80352664>] _reiser4_init_context+0x74/0xb0
> [ 8575.859773] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.859776] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.859778] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.859780] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.859782] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.859783]
> [ 8575.859785] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.859788] caller is __inc_zone_state+0x18/0x90
> [ 8575.859789] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.859791]
> [ 8575.859791] Call Trace:
> [ 8575.859793] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.859795] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.859798] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.859800] [<ffffffff8037874a>] write_cryptcompress+0x63a/0x8b0
> [ 8575.859802] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.859804] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.859806] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.859808] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.859810] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.859812]
> [ 8575.860516] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.860519] caller is __inc_zone_state+0x18/0x90
> [ 8575.860521] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.860522]
> [ 8575.860523] Call Trace:
> [ 8575.860525] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.860527] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.860530] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.860532] [<ffffffff8037874a>] write_cryptcompress+0x63a/0x8b0
> [ 8575.860534] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.860537] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.860539] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.860541] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.860543] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.860544]
> [ 8575.862795] BUG: using smp_processor_id() in preemptible [00000000]
> code: syslog-ng/3739
> [ 8575.862798] caller is __inc_zone_state+0x18/0x90
> [ 8575.862800] Pid: 3739, comm: syslog-ng Tainted: P
> 2.6.27-zen2-06142-g71346c3 #2
> [ 8575.862802]
> [ 8575.862802] Call Trace:
> [ 8575.862804] [<ffffffff804c7ed4>] debug_smp_processor_id+0xd4/0xe0
> [ 8575.862807] [<ffffffff8029b428>] __inc_zone_state+0x18/0x90
> [ 8575.862809] [<ffffffff80360c17>] reiser4_set_page_dirty_internal+0x47/0x100
> [ 8575.862811] [<ffffffff8037874a>] write_cryptcompress+0x63a/0x8b0
> [ 8575.862814] [<ffffffff80374558>] reiser4_write_careful+0x108/0x4b0
> [ 8575.862816] [<ffffffff802bf404>] cp_new_stat+0xe4/0x100
> [ 8575.862818] [<ffffffff802bbfab>] vfs_write+0xcb/0x190
> [ 8575.862820] [<ffffffff802bc173>] sys_write+0x53/0xa0
> [ 8575.862822] [<ffffffff8020c4fb>] system_call_fastpath+0x16/0x1b
> [ 8575.862823]
>
> ---
>
> I have not upgraded my kernel yet with the reiser4-for-2.6.27 patch,
> however i will later tonight and see if i can reproduce the same
> thing.
>
> ---
> CU,
> BB
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

