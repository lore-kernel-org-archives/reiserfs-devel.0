From: Devel <devel@integra-sc.it>
Subject: reiserfs crash
Date: Thu, 4 May 2006 19:06:03 +0200
Message-ID: <20060504190603.0274354b@atena>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28556-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi All,
i'm testing reiser4 on a linux box kernel 2.6.16. This linux box write a lot of images on the partiion with reiser4 and after delete them.
After a while all goes wrong and dmesg give me this oops:


<4>reiser4[image_eraser.pl(2374)]: cbk_level_lookup (fs/reiser4/search.c:971)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
<4>reiser4[image_eraser.pl(2374)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]: WARNING:
Error for inode 47326534 (-5) Unable to handle kernel NULL pointer
dereference at virtual address 00000000 printing eip:
00000000
*pde = 00000000
Oops: 0000 [#1]
Modules linked in: bttv video_buf firmware_class compat_ioctl32
i2c_algo_bit v4l2_common btcx_risc ir_common tveeprom i2c_core videodev
video CPU:    0 EIP:    0060:[<00000000>]    Not tainted VLI
EFLAGS: 00010282   (2.6.16.5 #1)
EIP is at rest_init+0x3feffde0/0x1e
eax: 00000000   ebx: d80c3d84   ecx: da670afc   edx: c03ee8e0
esi: 00000000   edi: 00000000   ebp: c01b74f1   esp: d80c3b58
ds: 007b   es: 007b   ss: 0068
Process image_eraser.pl (pid: 2374, threadinfo=d80c2000 task=df863a30)
Stack: <0>c01b74b5 d80c3d84 00000000 00000000 da670afc d80c3e38
d80c3bbc d80c3bbc c01b746c d80c3c18 c01b750e d80c3d84 00000000 00000000
da670afc d80c3e38 d80c3bbc c01b77a4 d80c3d84 da670afc d80c3e38 d80c3bbc
00000002 00000000 Call Trace:
 [<c01b74b5>] kill_units+0x49/0x53
 [<c01b746c>] kill_units+0x0/0x53
 [<c01b750e>] kill_head+0x1d/0x24
 [<c01b77a4>] prepare_for_compact+0x1e2/0x406
 [<c01a3c00>] reiser4_get_neighbor+0x75/0x261
 [<c01903ea>] jload_gfp+0x112/0x124
 [<c01b79eb>] kill_node40+0x23/0x9a
 [<c0192582>] lock_carry_node_tail+0x16/0x18
 [<c0193d76>] carry_cut+0x3f/0x53
 [<c0191f7c>] carry_on_level+0x30/0xaa
 [<c0191e5c>] carry+0x79/0x169
 [<c01960a7>] kill_node_content+0x125/0x13e
 [<c0196591>] cut_tree_worker_common+0x196/0x2e8
 [<c01963fb>] cut_tree_worker_common+0x0/0x2e8
 [<c0196791>] cut_tree_object+0xae/0x149
 [<c01b6aba>] create_item_node40+0x1fc/0x258
 [<c0199c4e>] znode_make_dirty+0x40/0x50
 [<c01abad2>] cut_file_items+0xdb/0x174
 [<c01abba4>] shorten_file+0x29/0x1d7
 [<c01ab996>] update_file_size+0x0/0x61
 [<c01abe0b>] truncate_file_body+0x63/0x6f
 [<c01ae1ac>] delete_object_unix_file+0x33/0xa6
 [<c01a23ae>] reiser4_delete_inode+0x83/0x9d
 [<c01a232b>] reiser4_delete_inode+0x0/0x9d
 [<c0155796>] generic_delete_inode+0x56/0xb4
 [<c015597c>] iput+0x63/0x66
 [<c014e22e>] do_unlinkat+0xb4/0xf9
 [<c014e2ae>] sys_unlink+0xb/0xe
 [<c0102977>] sysenter_past_esp+0x54/0x75
Code:  Bad EIP value.

If i reboot the machine this error repeat again!
i have to do fsck to resolve this error?
thanks
