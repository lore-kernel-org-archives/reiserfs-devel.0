From: Kelvie Wong <kelvie@ieee.org>
Subject: Kernel Panic with reiserfs during a rm command; complains about j_len
 too long during journal_mark_dirty
Date: Sun, 02 Apr 2006 22:31:56 -0700
Message-ID: <4430B34C.9040509@ieee.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000708090405080402020703"
Return-path: <reiserfs-list-return-28439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------000708090405080402020703
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Attached is the relevant dmesg output; I have ran rebuild-tree, and when
I try to rm certain files, I get the same error (a segfault), then it hangs.

Tell me if you need more information; I'd really like to know if this is
a kernel/reiserfs problem, or rather if I need a new hard drive.

Thanks,
Kelvie

--------------000708090405080402020703
Content-Type: text/plain;
 name="dmesg-reiser.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dmesg-reiser.txt"

REISERFS: panic (device hdb1): journal-1413: journal_mark_dirty: j_len (256) is too big

------------[ cut here ]------------
kernel BUG at fs/reiserfs/prints.c:362!
invalid operand: 0000 [#1]
PREEMPT SMP 
Modules linked in: sr_mod rlocate
CPU:    0
EIP:    0060:[<c019360e>]    Not tainted VLI
EFLAGS: 00010292   (2.6.15-gentoo-r1) 
EIP is at reiserfs_panic+0x3f/0x5f
eax: 00000062   ebx: c045ab96   ecx: dd30f050   edx: 00000000
esi: dd2a7e00   edi: dd2a7f68   ebp: dd2a7e00   esp: c7609b6c
ds: 007b   es: 007b   ss: 0068
Process rm (pid: 28708, threadinfo=c7608000 task=ca1c7ab0)
Stack: c045c4e9 dd2a7f68 c059d040 c7609b94 dd2a7e00 ffffffff dfbfb000 c019f4fc 
       dd2a7e00 c045e4dc 00000100 00000002 d8248d38 dd2a7e00 00002000 dfbe2a90 
       016a4388 c018004d c7609f18 dd2a7e00 d8248d38 00000001 cb58731c c7609f18 
Call Trace:
 [<c019f4fc>] journal_mark_dirty+0x10b/0x236
 [<c018004d>] _reiserfs_free_block+0xdc/0x149
 [<c019954d>] prepare_for_delete_or_cut+0x5ac/0x638
 [<c0183f7f>] do_balance+0xc8/0xd1
 [<c019a24d>] reiserfs_cut_from_item+0xdc/0x444
 [<c019f3af>] journal_begin+0x9a/0xdc
 [<c019a966>] reiserfs_do_truncate+0x345/0x4c7
 [<c0199de8>] reiserfs_delete_object+0x32/0x65
 [<c01864db>] reiserfs_delete_inode+0x67/0xbb
 [<c0186474>] reiserfs_delete_inode+0x0/0xbb
 [<c0163222>] generic_delete_inode+0x74/0xe7
 [<c015ac3d>] sys_unlink+0xb4/0xf2
 [<c015ce99>] sys_getdents64+0x63/0xa9
 [<c015cd70>] filldir64+0x0/0xc6
 [<c015ced5>] sys_getdents64+0x9f/0xa9
 [<c01028d7>] sysenter_past_esp+0x54/0x75
Code: 24 1c 8d be 68 01 00 00 e8 f0 fd ff ff 59 5b bb 96 ab 45 c0 85 f6 89 d8 0f 45 c7 68 40 d0 59 c0 50 68 e9 c4 45 c0 e8 66 4c f8 ff <0f> 0b 6a 01 0d c5 45 c0 83 c4 0c 85 f6 68 40 d0 59 c0 0f 45 df 
 Badness in do_exit at kernel/exit.c:796
 [<c011a2bc>] do_exit+0x42/0x2ec
 [<c0103a7e>] do_trap+0x0/0xc2
 [<c0103cf2>] do_invalid_op+0x0/0x98
 [<c0103d7e>] do_invalid_op+0x8c/0x98
 [<c019360e>] reiserfs_panic+0x3f/0x5f
 [<c0438aa7>] preempt_schedule+0x39/0x4f
 [<c01184c5>] vprintk+0x239/0x243
 [<c0103457>] error_code+0x4f/0x54
 [<c019360e>] reiserfs_panic+0x3f/0x5f
 [<c019f4fc>] journal_mark_dirty+0x10b/0x236
 [<c018004d>] _reiserfs_free_block+0xdc/0x149
 [<c019954d>] prepare_for_delete_or_cut+0x5ac/0x638
 [<c0183f7f>] do_balance+0xc8/0xd1
 [<c019a24d>] reiserfs_cut_from_item+0xdc/0x444
 [<c019f3af>] journal_begin+0x9a/0xdc
 [<c019a966>] reiserfs_do_truncate+0x345/0x4c7
 [<c0199de8>] reiserfs_delete_object+0x32/0x65
 [<c01864db>] reiserfs_delete_inode+0x67/0xbb
 [<c0186474>] reiserfs_delete_inode+0x0/0xbb
 [<c0163222>] generic_delete_inode+0x74/0xe7
 [<c015ac3d>] sys_unlink+0xb4/0xf2
 [<c015ce99>] sys_getdents64+0x63/0xa9
 [<c015cd70>] filldir64+0x0/0xc6
 [<c015ced5>] sys_getdents64+0x9f/0xa9
 [<c01028d7>] sysenter_past_esp+0x54/0x75

--------------000708090405080402020703--
