From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: 'reiser4 panicked cowardly' using 2004.08.04 snapshot
Date: Wed, 4 Aug 2004 22:12:17 +0200
Message-ID: <20040804221217.3ff73b8c.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Today i upgraded to 2.6.8rc2-mm2 with the 2004.08.04-snapshot patch.

I am using reiser4 as rootfs since 3-4 days.

While compiling 2.6.8rc2-mm2, i noticed this message in my syslog:


Aug  4 19:48:56 fuzzy kernel: reiser4[smbd(2143)]: setattr_truncate
(fs/reiser4/plugin/file/file.c:2293)[vs-1588]: Aug  4 19:48:56 fuzzy
kernel: code: -2 at fs/reiser4/search.c:1278 Aug  4 19:48:56 fuzzy
kernel: WARNING: truncate_file failed: oid 74170, old size 8192, new
size 0, retval -2

(I didn't think about it.. the file with inode 74170 was okay..)

After rebooting, my new kernel oopsed:

##################
reiser4[smbd(1803)]: find_file_state
(fs/reiser4/plugin/file/file.c:487)[vs-1074]: code: -2 at
fs/reiser4/search.c:1214 reiser4 panicked cowardly: assertion failed:
ergo(result == 0, uf_info->container !=
UF_CONTAINER_UNKNOWN)------------[ cut here ]------------ kernel BUG at
<bad filename>:1223! invalid operand: 0000 [#1]
SMP 
Modules linked in:
CPU:    0
EIP:    0060:[<c01afc16>]    Not tainted VLI
EFLAGS: 00010246   (2.6.8-rc2-mm2) 
EIP is at reiser4_do_panic+0x1ee/0x290
eax: c05871e0   ebx: c05871e0   ecx: c05871e0   edx: c05871e0
esi: f6ab2d9c   edi: f6ab2e08   ebp: f7ba6f90   esp: f6c25ddc
ds: 007b   es: 007b   ss: 0068
Process smbd (pid: 1803, threadinfo=f6c24000 task=f7718870)
Stack: f7fe2200 00000001 c0438b98 f6c25e04 000004be f6ab2e08 f6ab2d9c
c029091a        c0438b83 c045d6e0 c0446c7b c0422444 c0446abf 000001e7
00002000 00000000        00000000 c0295ae6 f6ab2d9c f6c25e6c c01aff67
000000b8 00000000 f6ab2e08 Call Trace:
 [<c029091a>] find_file_state+0xa5/0x12e
 [<c0295ae6>] mmap_unix_file+0xa8/0x120
 [<c01aff67>] get_current_trace_flags+0xc/0xe4
 [<c0216a76>] reiser4_mmap+0x130/0x2c9
 [<c0144df0>] do_mmap_pgoff+0x328/0x6b9
 [<c015ab0a>] sys_fstat64+0x37/0x39
 [<c010a6e0>] sys_mmap2+0x79/0xa9
 [<c0103ff7>] syscall_call+0x7/0xb
Code: c0 0f 84 44 ff ff ff 8b 11 85 d2 0f 84 3a ff ff ff 8b 00 39 c8 0f
85 30 ff ff ff 39 42 04 0f 85 27 ff ff ff c6 05 e8 71 58 c0 01 <0f> 0b
c7 04 24 4b 56 46 c0 c7 44 24 04 a0 6d 58 c0 e8 b8 ab f6 
###################

My old kernel was also unable to boot anymore..

I ran fsck.reiser4 --fix (0.5.6, from 2004.07.13-internal.testing) and
got such things:

###################
CHECKING SEMANTIC TREE 
FSCK: Node (63438), item (3), [2a:32657865630000:45a2d] (stat40): wrong
bytes (8790016), Should be (0). 
FSCK: Node (63438), item (4), [2a:32720000000000:45a2e] (stat40): wrong
bytes (43839488), Should be (8777728). 
####################

(about 1300x)

It wasn't the first time i got this 'wrong bytes' messages.. i saw them
before..

After the fsck, it's running again.. hmm..

Did anyone have the same problem?
 
 Full dmesg output aviable here:
 http://blinkenlights.ch/reiser4/r4panic.txt

