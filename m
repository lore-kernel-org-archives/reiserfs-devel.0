From: Mike Benoit <mikeb@netnation.com>
Subject: Reiser4 kernel panic...
Date: Wed, 24 Sep 2003 11:22:00 -0700
Message-ID: <1064427720.1660.22.camel@mikeb.staff.netnation.com>
Reply-To: mikeb@netnation.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15737-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I simply tried to copy the reiser4.diff to a fresh reiser4 partition:

cp /usr/src/linux/reiser4.diff ./

wheeljack kernel: reiser4 panicked cowardly: assertion failed:
schedulable()
Sep 24 07:16:03 wheeljack kernel: ------------[ cut here ]------------
Sep 24 07:16:03 wheeljack kernel: kernel BUG at
fs/reiser4/plugin/item/extent_item_ops.c:833!
Sep 24 07:16:03 wheeljack kernel: invalid operand: 0000 [#1]
Sep 24 07:16:03 wheeljack kernel: CPU:    0
Sep 24 07:16:03 wheeljack kernel: EIP:   
0060:[check_extent+2458/3024]    Not tainted
Sep 24 07:16:03 wheeljack kernel: EIP:    0060:[<c030a69a>]    Not
tainted
Sep 24 07:16:03 wheeljack kernel: EFLAGS: 00010246
Sep 24 07:16:03 wheeljack kernel: EIP is at check_extent+0x99a/0xbd0
Sep 24 07:16:03 wheeljack kernel: eax: 00000000   ebx: 00000000   ecx:
d41e2000   edx: 00000000
Sep 24 07:16:03 wheeljack kernel: esi: d41e2000   edi: ffffe000   ebp:
d41e2000   esp: d41e352c
Sep 24 07:16:03 wheeljack kernel: ds: 007b   es: 007b   ss: 0068
Sep 24 07:16:03 wheeljack kernel: Process cp (pid: 947,
threadinfo=d41e2000 task=d427e750)
Sep 24 07:16:03 wheeljack kernel: Stack: d4d4881c 00010002 00000000
00000000 d45f2cc0 d41e2000 d41e3658 c02bc289
Sep 24 07:16:03 wheeljack kernel:        00000000 00000000 d4d4881c
00010002 00000000 00000001 00220312 00000000
Sep 24 07:16:03 wheeljack kernel:        00000000 00000000 d46a3028
d46a3028 d45f2cc0 00000001 00000105 d46a3028
Sep 24 07:16:03 wheeljack kernel: Call Trace:
Sep 24 07:16:03 wheeljack kernel:  [is_plugin_id_valid+41/160]
is_plugin_id_valid+0x29/0xa0
Sep 24 07:16:03 wheeljack kernel:  [<c02bc289>]
is_plugin_id_valid+0x29/0xa0
Sep 24 07:16:03 wheeljack kernel:  [check_node40+2885/13536]
check_node40+0xb45/0x34e0
Sep 24 07:16:03 wheeljack kernel:  [<c02d3ab5>]
check_node40+0xb45/0x34e0
Sep 24 07:16:03 wheeljack kernel:  [coord_is_existing_item+137/608]
coord_is_existing_item+0x89/0x260
Sep 24 07:16:03 wheeljack kernel:  [<c023cad9>]
coord_is_existing_item+0x89/0x260
Sep 24 07:16:03 wheeljack kernel:  [znode_is_any_locked+442/848]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:03 wheeljack kernel:  [<c0224f7a>]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:03 wheeljack kernel:  [znode_parent+54/240]
znode_parent+0x36/0xf0
Sep 24 07:16:03 wheeljack kernel:  [<c020c7f6>] znode_parent+0x36/0xf0
Sep 24 07:16:03 wheeljack kernel:  [znode_invariant_f+1496/1648]
znode_invariant_f+0x5d8/0x670
Sep 24 07:16:03 wheeljack kernel:  [<c020ece8>]
znode_invariant_f+0x5d8/0x670
Sep 24 07:16:03 wheeljack kernel:  [item_key_by_coord+161/640]
item_key_by_coord+0xa1/0x280
Sep 24 07:16:03 wheeljack kernel:  [<c03233c1>]
item_key_by_coord+0xa1/0x280
Sep 24 07:16:03 wheeljack kernel:  [znode_is_any_locked+442/848]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:03 wheeljack kernel:  [<c0224f7a>]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:03 wheeljack kernel:  [node_check+223/544]
node_check+0xdf/0x220
Sep 24 07:16:03 wheeljack kernel:  [<c02bf8cf>] node_check+0xdf/0x220
Sep 24 07:16:03 wheeljack kernel:  [unlock_carry_level+345/656]
unlock_carry_level+0x159/0x290
Sep 24 07:16:03 wheeljack kernel:  [<c02189c9>]
unlock_carry_level+0x159/0x290
Sep 24 07:16:03 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:03 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:03 wheeljack kernel:  [done_carry_level+75/976]
done_carry_level+0x4b/0x3d0
Sep 24 07:16:03 wheeljack kernel:  [<c0218b4b>]
done_carry_level+0x4b/0x3d0
Sep 24 07:16:03 wheeljack kernel:  [init_carry_level+72/256]
init_carry_level+0x48/0x100
Sep 24 07:16:03 wheeljack kernel:  [<c0216c58>]
init_carry_level+0x48/0x100
Sep 24 07:16:03 wheeljack kernel:  [preempt_point+23/144]
preempt_point+0x17/0x90
Sep 24 07:16:03 wheeljack kernel:  [<c01f7067>] preempt_point+0x17/0x90
Sep 24 07:16:03 wheeljack kernel:  [carry+689/1104] carry+0x2b1/0x450
Sep 24 07:16:03 wheeljack kernel:  [<c02162e1>] carry+0x2b1/0x450
Sep 24 07:16:03 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:03 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:03 wheeljack kernel:  [insert_with_carry_by_coord+416/736]
insert_with_carry_by_coord+0x1a0/0x2e0
Sep 24 07:16:03 wheeljack kernel:  [<c022c300>]
insert_with_carry_by_coord+0x1a0/0x2e0
Sep 24 07:16:03 wheeljack kernel:  [key_at_node40+139/416]
key_at_node40+0x8b/0x1a0
Sep 24 07:16:03 wheeljack kernel:  [<c02d098b>] key_at_node40+0x8b/0x1a0
Sep 24 07:16:03 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:03 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:03 wheeljack kernel:  [insert_extent_by_coord+182/608]
insert_extent_by_coord+0xb6/0x260
Sep 24 07:16:03 wheeljack kernel:  [<c022cd16>]
insert_extent_by_coord+0xb6/0x260
Sep 24 07:16:03 wheeljack kernel:  [insert_first_block+189/512]
insert_first_block+0xbd/0x200
Sep 24 07:16:03 wheeljack kernel:  [<c030be6d>]
insert_first_block+0xbd/0x200
Sep 24 07:16:03 wheeljack kernel:  [znode_is_write_locked+127/144]
znode_is_write_locked+0x7f/0x90
Sep 24 07:16:03 wheeljack kernel:  [<c022518f>]
znode_is_write_locked+0x7f/0x90
Sep 24 07:16:03 wheeljack kernel:  [make_extent+232/640]
make_extent+0xe8/0x280
Sep 24 07:16:03 wheeljack kernel:  [<c030ccc8>] make_extent+0xe8/0x280
Sep 24 07:16:03 wheeljack kernel:  [index_extent_jnode+708/1680]
index_extent_jnode+0x2c4/0x690
Sep 24 07:16:03 wheeljack kernel:  [<c030dbc4>]
index_extent_jnode+0x2c4/0x690
Sep 24 07:16:03 wheeljack kernel:  [extent_write_flow+650/4144]
extent_write_flow+0x28a/0x1030
Sep 24 07:16:03 wheeljack kernel:  [<c030e26a>]
extent_write_flow+0x28a/0x1030
Sep 24 07:16:03 wheeljack kernel:  [zload_ra+206/672]
zload_ra+0xce/0x2a0
Sep 24 07:16:03 wheeljack kernel:  [<c020af8e>] zload_ra+0xce/0x2a0
Sep 24 07:16:03 wheeljack kernel:  [write_extent+0/80]
write_extent+0x0/0x50
Sep 24 07:16:03 wheeljack kernel:  [<c030f310>] write_extent+0x0/0x50
Sep 24 07:16:03 wheeljack kernel:  [append_and_or_overwrite+709/2672]
append_and_or_overwrite+0x2c5/0xa70
Sep 24 07:16:03 wheeljack kernel:  [<c0346505>]
append_and_or_overwrite+0x2c5/0xa70
Sep 24 07:16:03 wheeljack kernel:  [flow_by_inode_unix_file+157/464]
flow_by_inode_unix_file+0x9d/0x1d0
Sep 24 07:16:03 wheeljack kernel:  [<c03484ad>]
flow_by_inode_unix_file+0x9d/0x1d0
Sep 24 07:16:03 wheeljack kernel:  [write_flow+212/320]
write_flow+0xd4/0x140
Sep 24 07:16:03 wheeljack kernel:  [<c0346d84>] write_flow+0xd4/0x140
Sep 24 07:16:03 wheeljack kernel:  [write_unix_file+448/1072]
write_unix_file+0x1c0/0x430
Sep 24 07:16:03 wheeljack kernel:  [<c0346ff0>]
write_unix_file+0x1c0/0x430
Sep 24 07:16:03 wheeljack kernel:  [read_unix_file+0/5040]
read_unix_file+0x0/0x13b0
Sep 24 07:16:03 wheeljack kernel:  [<c0344e90>]
read_unix_file+0x0/0x13b0
Sep 24 07:16:03 wheeljack kernel:  [reiser4_write+409/1296]
reiser4_write+0x199/0x510
Sep 24 07:16:03 wheeljack kernel:  [<c02adc79>]
reiser4_write+0x199/0x510
Sep 24 07:16:03 wheeljack kernel:  [reiser4_write+0/1296]
reiser4_write+0x0/0x510
Sep 24 07:16:03 wheeljack kernel:  [<c02adae0>] reiser4_write+0x0/0x510
Sep 24 07:16:03 wheeljack kernel:  [vfs_write+252/320]
vfs_write+0xfc/0x140
Sep 24 07:16:03 wheeljack kernel:  [<c014bbcc>] vfs_write+0xfc/0x140
Sep 24 07:16:03 wheeljack kernel:  [sys_write+66/112]
sys_write+0x42/0x70
Sep 24 07:16:03 wheeljack kernel:  [<c014bcc2>] sys_write+0x42/0x70
Sep 24 07:16:03 wheeljack kernel:  [syscall_call+7/11]
syscall_call+0x7/0xb
Sep 24 07:16:03 wheeljack kernel:  [<c010938b>] syscall_call+0x7/0xb
Sep 24 07:16:03 wheeljack kernel:
Sep 24 07:16:03 wheeljack kernel: Code: 0f 0b 41 03 40 0d 58 c0 c7 44 24
08 00 00 00 00 8d 4c 24 50
Sep 24 07:16:03 wheeljack kernel:  <6>note: cp[947] exited with
preempt_count 1
Sep 24 07:16:03 wheeljack kernel: bad: scheduling while atomic!
Sep 24 07:16:03 wheeljack kernel: Call Trace:
Sep 24 07:16:03 wheeljack kernel:  [schedule+1027/1088]
schedule+0x403/0x440
Sep 24 07:16:03 wheeljack kernel:  [<c0113d33>] schedule+0x403/0x440
Sep 24 07:16:03 wheeljack kernel:  [unmap_page_range+75/128]
unmap_page_range+0x4b/0x80
Sep 24 07:16:03 wheeljack kernel:  [<c013bedb>]
unmap_page_range+0x4b/0x80
Sep 24 07:16:03 wheeljack kernel:  [unmap_vmas+544/560]
unmap_vmas+0x220/0x230
Sep 24 07:16:03 wheeljack kernel:  [<c013c130>] unmap_vmas+0x220/0x230
Sep 24 07:16:03 wheeljack kernel:  [exit_mmap+120/448]
exit_mmap+0x78/0x1c0
Sep 24 07:16:03 wheeljack kernel:  [<c0140158>] exit_mmap+0x78/0x1c0
Sep 24 07:16:03 wheeljack kernel:  [mmput+101/192] mmput+0x65/0xc0
Sep 24 07:16:03 wheeljack kernel:  [<c01156f5>] mmput+0x65/0xc0
Sep 24 07:16:03 wheeljack kernel:  [do_exit+286/992] do_exit+0x11e/0x3e0
Sep 24 07:16:04 wheeljack kernel:  [<c01196ae>] do_exit+0x11e/0x3e0
Sep 24 07:16:04 wheeljack kernel:  [do_invalid_op+0/192]
do_invalid_op+0x0/0xc0
Sep 24 07:16:04 wheeljack kernel:  [<c0109f10>] do_invalid_op+0x0/0xc0
Sep 24 07:16:04 wheeljack kernel:  [do_divide_error+0/320]
do_divide_error+0x0/0x140
Sep 24 07:16:04 wheeljack kernel:  [<c0109bf0>]
do_divide_error+0x0/0x140
Sep 24 07:16:04 wheeljack kernel:  [do_invalid_op+160/192]
do_invalid_op+0xa0/0xc0
Sep 24 07:16:04 wheeljack kernel:  [<c0109fb0>] do_invalid_op+0xa0/0xc0
Sep 24 07:16:04 wheeljack kernel:  [check_extent+2458/3024]
check_extent+0x99a/0xbd0
Sep 24 07:16:04 wheeljack kernel:  [<c030a69a>] check_extent+0x99a/0xbd0
Sep 24 07:16:04 wheeljack kernel:  [unit_key_extent+131/480]
unit_key_extent+0x83/0x1e0
Sep 24 07:16:04 wheeljack kernel:  [<c0309ba3>]
unit_key_extent+0x83/0x1e0
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [unit_key_by_coord+577/1616]
unit_key_by_coord+0x241/0x650
Sep 24 07:16:04 wheeljack kernel:  [<c03237e1>]
unit_key_by_coord+0x241/0x650
Sep 24 07:16:04 wheeljack kernel:  [xmemcpy+33/48] xmemcpy+0x21/0x30
Sep 24 07:16:04 wheeljack kernel:  [<c02877e1>] xmemcpy+0x21/0x30
Sep 24 07:16:04 wheeljack kernel:  [error_code+45/56]
error_code+0x2d/0x38
Sep 24 07:16:04 wheeljack kernel:  [<c0109535>] error_code+0x2d/0x38
Sep 24 07:16:04 wheeljack kernel:  [check_extent+2458/3024]
check_extent+0x99a/0xbd0
Sep 24 07:16:04 wheeljack kernel:  [<c030a69a>] check_extent+0x99a/0xbd0
Sep 24 07:16:04 wheeljack kernel:  [is_plugin_id_valid+41/160]
is_plugin_id_valid+0x29/0xa0
Sep 24 07:16:04 wheeljack kernel:  [<c02bc289>]
is_plugin_id_valid+0x29/0xa0
Sep 24 07:16:04 wheeljack kernel:  [check_node40+2885/13536]
check_node40+0xb45/0x34e0
Sep 24 07:16:04 wheeljack kernel:  [<c02d3ab5>]
check_node40+0xb45/0x34e0
Sep 24 07:16:04 wheeljack kernel:  [coord_is_existing_item+137/608]
coord_is_existing_item+0x89/0x260
Sep 24 07:16:04 wheeljack kernel:  [<c023cad9>]
coord_is_existing_item+0x89/0x260
Sep 24 07:16:04 wheeljack kernel:  [znode_is_any_locked+442/848]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:04 wheeljack kernel:  [<c0224f7a>]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:04 wheeljack kernel:  [znode_parent+54/240]
znode_parent+0x36/0xf0
Sep 24 07:16:04 wheeljack kernel:  [<c020c7f6>] znode_parent+0x36/0xf0
Sep 24 07:16:04 wheeljack kernel:  [znode_invariant_f+1496/1648]
znode_invariant_f+0x5d8/0x670
Sep 24 07:16:04 wheeljack kernel:  [<c020ece8>]
znode_invariant_f+0x5d8/0x670
Sep 24 07:16:04 wheeljack kernel:  [item_key_by_coord+161/640]
item_key_by_coord+0xa1/0x280
Sep 24 07:16:04 wheeljack kernel:  [<c03233c1>]
item_key_by_coord+0xa1/0x280
Sep 24 07:16:04 wheeljack kernel:  [znode_is_any_locked+442/848]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:04 wheeljack kernel:  [<c0224f7a>]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:04 wheeljack kernel:  [node_check+223/544]
node_check+0xdf/0x220
Sep 24 07:16:04 wheeljack kernel:  [<c02bf8cf>] node_check+0xdf/0x220
Sep 24 07:16:04 wheeljack kernel:  [unlock_carry_level+345/656]
unlock_carry_level+0x159/0x290
Sep 24 07:16:04 wheeljack kernel:  [<c02189c9>]
unlock_carry_level+0x159/0x290
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [done_carry_level+75/976]
done_carry_level+0x4b/0x3d0
Sep 24 07:16:04 wheeljack kernel:  [<c0218b4b>]
done_carry_level+0x4b/0x3d0
Sep 24 07:16:04 wheeljack kernel:  [init_carry_level+72/256]
init_carry_level+0x48/0x100
Sep 24 07:16:04 wheeljack kernel:  [<c0216c58>]
init_carry_level+0x48/0x100
Sep 24 07:16:04 wheeljack kernel:  [preempt_point+23/144]
preempt_point+0x17/0x90
Sep 24 07:16:04 wheeljack kernel:  [<c01f7067>] preempt_point+0x17/0x90
Sep 24 07:16:04 wheeljack kernel:  [carry+689/1104] carry+0x2b1/0x450
Sep 24 07:16:04 wheeljack kernel:  [<c02162e1>] carry+0x2b1/0x450
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [insert_with_carry_by_coord+416/736]
insert_with_carry_by_coord+0x1a0/0x2e0
Sep 24 07:16:04 wheeljack kernel:  [key_at_node40+139/416]
key_at_node40+0x8b/0x1a0
Sep 24 07:16:04 wheeljack kernel:  [<c02d098b>] key_at_node40+0x8b/0x1a0
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [insert_extent_by_coord+182/608]
insert_extent_by_coord+0xb6/0x260
Sep 24 07:16:04 wheeljack kernel:  [<c022cd16>]
insert_extent_by_coord+0xb6/0x260
Sep 24 07:16:04 wheeljack kernel:  [insert_first_block+189/512]
insert_first_block+0xbd/0x200
Sep 24 07:16:04 wheeljack kernel:  [<c030be6d>]
insert_first_block+0xbd/0x200
Sep 24 07:16:04 wheeljack kernel:  [znode_is_write_locked+127/144]
znode_is_write_locked+0x7f/0x90
Sep 24 07:16:04 wheeljack kernel:  [<c022518f>]
znode_is_write_locked+0x7f/0x90
Sep 24 07:16:04 wheeljack kernel:  [make_extent+232/640]
make_extent+0xe8/0x280
Sep 24 07:16:04 wheeljack kernel:  [<c030ccc8>] make_extent+0xe8/0x280
Sep 24 07:16:04 wheeljack kernel:  [index_extent_jnode+708/1680]
index_extent_jnode+0x2c4/0x690
Sep 24 07:16:04 wheeljack kernel:  [<c030dbc4>]
index_extent_jnode+0x2c4/0x690
Sep 24 07:16:04 wheeljack kernel:  [extent_write_flow+650/4144]
extent_write_flow+0x28a/0x1030
Sep 24 07:16:04 wheeljack kernel:  [<c030e26a>]
extent_write_flow+0x28a/0x1030
Sep 24 07:16:04 wheeljack kernel:  [zload_ra+206/672]
zload_ra+0xce/0x2a0
Sep 24 07:16:04 wheeljack kernel:  [<c020af8e>] zload_ra+0xce/0x2a0
Sep 24 07:16:04 wheeljack kernel:  [write_extent+0/80]
write_extent+0x0/0x50
Sep 24 07:16:04 wheeljack kernel:  [<c030f310>] write_extent+0x0/0x50
Sep 24 07:16:04 wheeljack kernel:  [append_and_or_overwrite+709/2672]
append_and_or_overwrite+0x2c5/0xa70
Sep 24 07:16:04 wheeljack kernel:  [<c0346505>]
append_and_or_overwrite+0x2c5/0xa70
Sep 24 07:16:04 wheeljack kernel:  [flow_by_inode_unix_file+157/464]
flow_by_inode_unix_file+0x9d/0x1d0
Sep 24 07:16:04 wheeljack kernel:  [<c03484ad>]
flow_by_inode_unix_file+0x9d/0x1d0
Sep 24 07:16:04 wheeljack kernel:  [write_flow+212/320]
write_flow+0xd4/0x140
Sep 24 07:16:04 wheeljack kernel:  [<c0346d84>] write_flow+0xd4/0x140
Sep 24 07:16:04 wheeljack kernel:  [write_unix_file+448/1072]
write_unix_file+0x1c0/0x430
Sep 24 07:16:04 wheeljack kernel:  [<c0346ff0>]
write_unix_file+0x1c0/0x430
Sep 24 07:16:04 wheeljack kernel:  [read_unix_file+0/5040]
read_unix_file+0x0/0x13b0
Sep 24 07:16:04 wheeljack kernel:  [<c0344e90>]
read_unix_file+0x0/0x13b0
Sep 24 07:16:04 wheeljack kernel:  [reiser4_write+409/1296]
reiser4_write+0x199/0x510
Sep 24 07:16:04 wheeljack kernel:  [<c02adc79>]
reiser4_write+0x199/0x510
Sep 24 07:16:04 wheeljack kernel:  [reiser4_write+0/1296]
reiser4_write+0x0/0x510
Sep 24 07:16:04 wheeljack kernel:  [<c02adae0>] reiser4_write+0x0/0x510
Sep 24 07:16:04 wheeljack kernel:  [vfs_write+252/320]
vfs_write+0xfc/0x140
Sep 24 07:16:04 wheeljack kernel:  [<c014bbcc>] vfs_write+0xfc/0x140
Sep 24 07:16:04 wheeljack kernel:  [sys_write+66/112]
sys_write+0x42/0x70
Sep 24 07:16:04 wheeljack kernel:  [<c014bcc2>] sys_write+0x42/0x70
Sep 24 07:16:04 wheeljack kernel:  [syscall_call+7/11]
syscall_call+0x7/0xb
Sep 24 07:16:04 wheeljack kernel:  [<c010938b>] syscall_call+0x7/0xb
Sep 24 07:16:04 wheeljack kernel:
Sep 24 07:16:04 wheeljack kernel: in atomic: jnode: 0, tree: 1
(r:1,w:0), dk: 0 (r:0,w:0)
Sep 24 07:16:04 wheeljack kernel: txnh: 0, atom: 0, stack: 0, txnmgr: 0,
ktxnmgrd: 0, fq: 0, reiser4_sb: 0
Sep 24 07:16:04 wheeljack kernel: inode: 0, cbk_cache: 0, epoch: 0,
eflush: 0, zlock: 0
Sep 24 07:16:04 wheeljack kernel: spin: 1, long: 2 inode_sem: (r:0,w:1)
Sep 24 07:16:04 wheeljack kernel: d: 3, x: 6, t: 1
Sep 24 07:16:04 wheeljack kernel:  reiser4[cp(947)]:
get_exclusive_access
(fs/reiser4/plugin/file/tail_conversion.c:41)[nikita-3028]:
Sep 24 07:16:04 wheeljack kernel: code: -2 at fs/reiser4/search.c:1084
Sep 24 07:16:04 wheeljack kernel: reiser4 panicked cowardly: assertion
failed: schedulable()
Sep 24 07:16:04 wheeljack kernel: pins held: jnode: 0, tree: 1
(r:1,w:0), dk: 0 (r:0,w:0)
Sep 24 07:16:04 wheeljack kernel: txnh: 0, atom: 0, stack: 0, txnmgr: 0,
ktxnmgrd: 0, fq: 0, reiser4_sb: 0
Sep 24 07:16:04 wheeljack kernel: inode: 0, cbk_cache: 0, epoch: 0,
eflush: 0, zlock: 0
Sep 24 07:16:04 wheeljack kernel: spin: 1, long: 2 inode_sem: (r:0,w:1)
Sep 24 07:16:04 wheeljack kernel: d: 3, x: 6, t: 1
Sep 24 07:16:04 wheeljack kernel: context: trace_flags: 0
Sep 24 07:16:04 wheeljack kernel: ^Itid: 947
Sep 24 07:16:04 wheeljack kernel: ^Ilocks: jnode: 0, tree: 1 (r:1,w:0),
dk: 0 (r:0,w:0)
Sep 24 07:16:04 wheeljack kernel: txnh: 0, atom: 0, stack: 0, txnmgr: 0,
ktxnmgrd: 0, fq: 0, reiser4_sb: 0
Sep 24 07:16:04 wheeljack kernel: inode: 0, cbk_cache: 0, epoch: 0,
eflush: 0, zlock: 0
Sep 24 07:16:04 wheeljack kernel: spin: 1, long: 2 inode_sem: (r:0,w:1)
Sep 24 07:16:04 wheeljack kernel: d: 3, x: 6, t: 1
Sep 24 07:16:04 wheeljack kernel: pid: 947, comm: cp
Sep 24 07:16:04 wheeljack kernel: ^Ilock stack:
Sep 24 07:16:04 wheeljack kernel: .... nr_signaled 0
Sep 24 07:16:04 wheeljack kernel: .... curpri high
Sep 24 07:16:04 wheeljack kernel: .... current locks:
Sep 24 07:16:04 wheeljack kernel: ...... write: 21
Sep 24 07:16:04 wheeljack kernel: ...... write: 21
Sep 24 07:16:04 wheeljack kernel: ^Iatom: refcount: 2 id: 2 flags: 0
txnh_count: 1 capture_count: 2 stage: 1 start: 897608, flushed: 0
Sep 24 07:16:04 wheeljack kernel: znodes: d45f2de0: state: 20000:
[MISSED_IN_CAPTURE|], level: 0, block: 0, d_count: 0, x_count: 1, pg:
00000000, atom: 00000000, lock: 0:0, type: formatted, c_count: 1,
readers: 0, items: 0
Sep 24 07:16:04 wheeljack kernel: znodes: d45f2cc0: state: 12010d:
[PARSED|LEFT_CONNECTED|RIGHT_CONNECTED|DIRTY|MISSED_IN_CAPTURE|DKSET|],
level: 2, block: 21, d_count: 2, x_count: 5, pg: c1330978, atom:
d436ee80, lock: 0:0, type: formatted, c_count: 1, readers: -2, items: 2
Sep 24 07:16:04 wheeljack kernel: znodes: d45f2ba0: state: 12010d:
[PARSED|LEFT_CONNECTED|RIGHT_CONNECTED|DIRTY|MISSED_IN_CAPTURE|DKSET|],
level: 1, block: 22, d_count: 1, x_count: 2, pg: c1330a90, atom:
d436ee80, lock: 0:0, type: formatted, c_count: 0, readers: 0, items: 5
Sep 24 07:16:04 wheeljack kernel: ------------[ cut here ]------------
Sep 24 07:16:04 wheeljack kernel: kernel BUG at fs/reiser4/debug.c:77!
Sep 24 07:16:04 wheeljack kernel: invalid operand: 0000 [#2]
Sep 24 07:16:04 wheeljack kernel: CPU:    0
Sep 24 07:16:04 wheeljack kernel: EIP:   
0060:[reiser4_do_panic+589/1152]    Not tainted
Sep 24 07:16:04 wheeljack kernel: EIP:    0060:[<c01f6d5d>]    Not
tainted
Sep 24 07:16:04 wheeljack kernel: EFLAGS: 00010202
Sep 24 07:16:04 wheeljack kernel: EIP is at reiser4_do_panic+0x24d/0x480
Sep 24 07:16:04 wheeljack kernel: eax: 00000008   ebx: c067144c   ecx:
00000001   edx: 00000001
Sep 24 07:16:04 wheeljack kernel: esi: d41e3ec8   edi: d43473e4   ebp:
d43472c0   esp: d41e3204
Sep 24 07:16:04 wheeljack kernel: ds: 007b   es: 007b   ss: 0068
Sep 24 07:16:04 wheeljack kernel: Process cp (pid: 947,
threadinfo=d41e2000 task=d427e750)
Sep 24 07:16:04 wheeljack kernel: Stack: c05541d6 d4d4881c c0554213
d41e3230 c05542f4 fffffffe d41e2000 d4347348
Sep 24 07:16:04 wheeljack kernel:        c034956c c05541fe c055424a
c0562bcd c053eb8c c0585140 00000029 d41e2000
Sep 24 07:16:04 wheeljack kernel:        d4347348 c03472a5 d4347348
00000120 c01f747f 0000210e 00000202 c1387000
Sep 24 07:16:04 wheeljack kernel: Call Trace:
Sep 24 07:16:04 wheeljack kernel:  [get_exclusive_access+284/608]
get_exclusive_access+0x11c/0x260
Sep 24 07:16:04 wheeljack kernel:  [<c034956c>]
get_exclusive_access+0x11c/0x260
Sep 24 07:16:04 wheeljack kernel:  [release_unix_file+69/400]
release_unix_file+0x45/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c03472a5>]
release_unix_file+0x45/0x190
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [reiser4_release+282/576]
reiser4_release+0x11a/0x240
Sep 24 07:16:04 wheeljack kernel:  [<c02ae10a>]
reiser4_release+0x11a/0x240
Sep 24 07:16:04 wheeljack kernel:  [poke_blanked_console+115/128]
poke_blanked_console+0x73/0x80
Sep 24 07:16:04 wheeljack kernel:  [<c040dbd3>]
poke_blanked_console+0x73/0x80
Sep 24 07:16:04 wheeljack kernel:  [__fput+282/352] __fput+0x11a/0x160
Sep 24 07:16:04 wheeljack kernel:  [<c014cb5a>] __fput+0x11a/0x160
Sep 24 07:16:04 wheeljack kernel:  [filp_close+89/160]
filp_close+0x59/0xa0
Sep 24 07:16:04 wheeljack kernel:  [<c014aff9>] filp_close+0x59/0xa0
Sep 24 07:16:04 wheeljack kernel:  [put_files_struct+98/208]
put_files_struct+0x62/0xd0
Sep 24 07:16:04 wheeljack kernel:  [<c0118a12>]
put_files_struct+0x62/0xd0
Sep 24 07:16:04 wheeljack kernel:  [do_exit+343/992] do_exit+0x157/0x3e0
Sep 24 07:16:04 wheeljack kernel:  [<c01196e7>] do_exit+0x157/0x3e0
Sep 24 07:16:04 wheeljack kernel:  [do_invalid_op+0/192]
do_invalid_op+0x0/0xc0
Sep 24 07:16:04 wheeljack kernel:  [<c0109f10>] do_invalid_op+0x0/0xc0
Sep 24 07:16:04 wheeljack kernel:  [do_divide_error+0/320]
do_divide_error+0x0/0x140
Sep 24 07:16:04 wheeljack kernel:  [<c0109bf0>]
do_divide_error+0x0/0x140
Sep 24 07:16:04 wheeljack kernel:  [do_invalid_op+160/192]
do_invalid_op+0xa0/0xc0
Sep 24 07:16:04 wheeljack kernel:  [<c0109fb0>] do_invalid_op+0xa0/0xc0
Sep 24 07:16:04 wheeljack kernel:  [check_extent+2458/3024]
check_extent+0x99a/0xbd0
Sep 24 07:16:04 wheeljack kernel:  [unit_key_extent+131/480]
unit_key_extent+0x83/0x1e0
Sep 24 07:16:04 wheeljack kernel:  [<c0309ba3>]
unit_key_extent+0x83/0x1e0
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [unit_key_by_coord+577/1616]
unit_key_by_coord+0x241/0x650
Sep 24 07:16:04 wheeljack kernel:  [<c03237e1>]
unit_key_by_coord+0x241/0x650
Sep 24 07:16:04 wheeljack kernel:  [xmemcpy+33/48] xmemcpy+0x21/0x30
Sep 24 07:16:04 wheeljack kernel:  [<c02877e1>] xmemcpy+0x21/0x30
Sep 24 07:16:04 wheeljack kernel:  [error_code+45/56]
error_code+0x2d/0x38
Sep 24 07:16:04 wheeljack kernel:  [<c0109535>] error_code+0x2d/0x38
Sep 24 07:16:04 wheeljack kernel:  [check_extent+2458/3024]
check_extent+0x99a/0xbd0
Sep 24 07:16:04 wheeljack kernel:  [<c030a69a>] check_extent+0x99a/0xbd0
Sep 24 07:16:04 wheeljack kernel:  [is_plugin_id_valid+41/160]
is_plugin_id_valid+0x29/0xa0
Sep 24 07:16:04 wheeljack kernel:  [<c02bc289>]
is_plugin_id_valid+0x29/0xa0
Sep 24 07:16:04 wheeljack kernel:  [check_node40+2885/13536]
check_node40+0xb45/0x34e0
Sep 24 07:16:04 wheeljack kernel:  [<c02d3ab5>]
check_node40+0xb45/0x34e0
Sep 24 07:16:04 wheeljack kernel:  [coord_is_existing_item+137/608]
coord_is_existing_item+0x89/0x260
Sep 24 07:16:04 wheeljack kernel:  [<c023cad9>]
coord_is_existing_item+0x89/0x260
Sep 24 07:16:04 wheeljack kernel:  [znode_is_any_locked+442/848]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:04 wheeljack kernel:  [<c0224f7a>]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:04 wheeljack kernel:  [znode_parent+54/240]
znode_parent+0x36/0xf0
Sep 24 07:16:04 wheeljack kernel:  [<c020c7f6>] znode_parent+0x36/0xf0
Sep 24 07:16:04 wheeljack kernel:  [znode_invariant_f+1496/1648]
znode_invariant_f+0x5d8/0x670
Sep 24 07:16:04 wheeljack kernel:  [<c020ece8>]
znode_invariant_f+0x5d8/0x670
Sep 24 07:16:04 wheeljack kernel:  [item_key_by_coord+161/640]
item_key_by_coord+0xa1/0x280
Sep 24 07:16:04 wheeljack kernel:  [<c03233c1>]
item_key_by_coord+0xa1/0x280
Sep 24 07:16:04 wheeljack kernel:  [znode_is_any_locked+442/848]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:04 wheeljack kernel:  [<c0224f7a>]
znode_is_any_locked+0x1ba/0x350
Sep 24 07:16:04 wheeljack kernel:  [node_check+223/544]
node_check+0xdf/0x220
Sep 24 07:16:04 wheeljack kernel:  [<c02bf8cf>] node_check+0xdf/0x220
Sep 24 07:16:04 wheeljack kernel:  [unlock_carry_level+345/656]
unlock_carry_level+0x159/0x290
Sep 24 07:16:04 wheeljack kernel:  [<c02189c9>]
unlock_carry_level+0x159/0x290
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [done_carry_level+75/976]
done_carry_level+0x4b/0x3d0
Sep 24 07:16:04 wheeljack kernel:  [<c0218b4b>]
done_carry_level+0x4b/0x3d0
Sep 24 07:16:04 wheeljack kernel:  [init_carry_level+72/256]
init_carry_level+0x48/0x100
Sep 24 07:16:04 wheeljack kernel:  [<c0216c58>]
init_carry_level+0x48/0x100
Sep 24 07:16:04 wheeljack kernel:  [preempt_point+23/144]
preempt_point+0x17/0x90
Sep 24 07:16:04 wheeljack kernel:  [<c01f7067>] preempt_point+0x17/0x90
Sep 24 07:16:04 wheeljack kernel:  [carry+689/1104] carry+0x2b1/0x450
Sep 24 07:16:04 wheeljack kernel:  [<c02162e1>] carry+0x2b1/0x450
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [insert_with_carry_by_coord+416/736]
insert_with_carry_by_coord+0x1a0/0x2e0
Sep 24 07:16:04 wheeljack kernel:  [<c022c300>]
insert_with_carry_by_coord+0x1a0/0x2e0
Sep 24 07:16:04 wheeljack kernel:  [key_at_node40+139/416]
key_at_node40+0x8b/0x1a0
Sep 24 07:16:04 wheeljack kernel:  [<c02d098b>] key_at_node40+0x8b/0x1a0
Sep 24 07:16:04 wheeljack kernel:  [get_current_trace_flags+15/400]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [<c01f747f>]
get_current_trace_flags+0xf/0x190
Sep 24 07:16:04 wheeljack kernel:  [insert_extent_by_coord+182/608]
insert_extent_by_coord+0xb6/0x260
Sep 24 07:16:04 wheeljack kernel:  [<c022cd16>]
insert_extent_by_coord+0xb6/0x260
Sep 24 07:16:04 wheeljack kernel:  [insert_first_block+189/512]
insert_first_block+0xbd/0x200
Sep 24 07:16:04 wheeljack kernel:  [<c030be6d>]
insert_first_block+0xbd/0x200
Sep 24 07:16:04 wheeljack kernel:  [znode_is_write_locked+127/144]
znode_is_write_locked+0x7f/0x90
Sep 24 07:16:04 wheeljack kernel:  [<c022518f>]
znode_is_write_locked+0x7f/0x90
Sep 24 07:16:04 wheeljack kernel:  [make_extent+232/640]
make_extent+0xe8/0x280
Sep 24 07:16:04 wheeljack kernel:  [<c030ccc8>] make_extent+0xe8/0x280
Sep 24 07:16:04 wheeljack kernel:  [index_extent_jnode+708/1680]
index_extent_jnode+0x2c4/0x690
Sep 24 07:16:04 wheeljack kernel:  [<c030dbc4>]
index_extent_jnode+0x2c4/0x690
Sep 24 07:16:04 wheeljack kernel:  [extent_write_flow+650/4144]
extent_write_flow+0x28a/0x1030
Sep 24 07:16:04 wheeljack kernel:  [<c030e26a>]
extent_write_flow+0x28a/0x1030
Sep 24 07:16:04 wheeljack kernel:  [zload_ra+206/672]
zload_ra+0xce/0x2a0
Sep 24 07:16:04 wheeljack kernel:  [<c020af8e>] zload_ra+0xce/0x2a0
Sep 24 07:16:04 wheeljack kernel:  [write_extent+0/80]
write_extent+0x0/0x50
Sep 24 07:16:04 wheeljack kernel:  [<c030f310>] write_extent+0x0/0x50
Sep 24 07:16:04 wheeljack kernel:  [append_and_or_overwrite+709/2672]
append_and_or_overwrite+0x2c5/0xa70
Sep 24 07:16:04 wheeljack kernel:  [<c0346505>]
append_and_or_overwrite+0x2c5/0xa70
Sep 24 07:16:04 wheeljack kernel:  [flow_by_inode_unix_file+157/464]
flow_by_inode_unix_file+0x9d/0x1d0
Sep 24 07:16:04 wheeljack kernel:  [<c03484ad>]
flow_by_inode_unix_file+0x9d/0x1d0
Sep 24 07:16:04 wheeljack kernel:  [write_flow+212/320]
write_flow+0xd4/0x140
Sep 24 07:16:04 wheeljack kernel:  [<c0346d84>] write_flow+0xd4/0x140
Sep 24 07:16:04 wheeljack kernel:  [write_unix_file+448/1072]
write_unix_file+0x1c0/0x430
Sep 24 07:16:04 wheeljack kernel:  [<c0346ff0>]
write_unix_file+0x1c0/0x430
Sep 24 07:16:04 wheeljack kernel:  [read_unix_file+0/5040]
read_unix_file+0x0/0x13b0
Sep 24 07:16:04 wheeljack kernel:  [<c0344e90>]
read_unix_file+0x0/0x13b0
Sep 24 07:16:04 wheeljack kernel:  [reiser4_write+409/1296]
reiser4_write+0x199/0x510
Sep 24 07:16:04 wheeljack kernel:  [<c02adc79>]
reiser4_write+0x199/0x510
Sep 24 07:16:04 wheeljack kernel:  [reiser4_write+0/1296]
reiser4_write+0x0/0x510
Sep 24 07:16:04 wheeljack kernel:  [<c02adae0>] reiser4_write+0x0/0x510
Sep 24 07:16:04 wheeljack kernel:  [vfs_write+252/320]
vfs_write+0xfc/0x140
Sep 24 07:16:04 wheeljack kernel:  [<c014bbcc>] vfs_write+0xfc/0x140
Sep 24 07:16:04 wheeljack kernel:  [sys_write+66/112]
sys_write+0x42/0x70
Sep 24 07:16:04 wheeljack kernel:  [<c014bcc2>] sys_write+0x42/0x70
Sep 24 07:16:04 wheeljack kernel:  [syscall_call+7/11]
syscall_call+0x7/0xb
Sep 24 07:16:04 wheeljack kernel:  [<c010938b>] syscall_call+0x7/0xb
Sep 24 07:16:04 wheeljack kernel:
Sep 24 07:16:04 wheeljack kernel: Code: 0f 0b 4d 00 c3 41 55 c0 c7 44 24
04 40 0f 67 c0 c7 04 24 0a
Sep 24 07:16:04 wheeljack kernel:  <6>note: cp[947] exited with
preempt_count 1



-- 
Best Regards,
 
Mike Benoit
NetNation Communications Inc.
Systems Engineer
Tel: 604-684-6892 or 888-983-6600
 ---------------------------------------
 
 Disclaimer: Opinions expressed here are my own and not 
 necessarily those of my employer

