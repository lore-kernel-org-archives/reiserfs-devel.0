From: Ingo Bormuth <ibormuth@efil.de>
Subject: kernel BUG at fs/inode.c:253!
Date: Fri, 5 May 2006 18:59:17 +0200
Message-ID: <20060505165916.GA10759@kruemel>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi,

while compiling xorg, the parititon ran out of space.

I got  a segmentation fault and quite strange behaviour afterwards:
Whenever I typed 'sync' or 'unmount ...' the terminal froze for ever.
Ctrl-C, kill, shutdown, Ctrl-Alt-Del all did not work.
I played this game until all virtual terminals were locked.
I had to cold reset the computer. The filesystem seems to be consistent.

dmesg:

[17482033.208000] ------------[ cut here ]------------
[17482033.208000] kernel BUG at fs/inode.c:253!
[17482033.208000] invalid opcode: 0000 [#1]
[17482033.208000] CPU:    0
[17482033.208000] EIP:    0060:[<c016786d>]    Not tainted VLI
[17482033.208000] EFLAGS: 00010202   (2.6.16.9-reiser4-r2 #1)
[17482033.208000] EIP is at clear_inode+0x1d/0xe0
[17482033.208000] eax: 00000000   ebx: c93f38ac   ecx: 00000000   edx: 00000004
[17482033.208000] esi: cf5142a0   edi: c93f38ac   ebp: c15f1f58   esp: c15f1f00
[17482033.208000] ds: 007b   es: 007b   ss: 0068
[17482033.208000] Process rm (pid: 28093, threadinfo=c15f0000 task=ce7baab0)
[17482033.208000] Stack: <0>c15f1f58 c93f38ac cf5142a0 c019cb8f 66000000 00000000 00000000 00000000
[17482033.208000]        c4cbf380 cb81a4cc c93f391c c0168701 c019cb50 c93f38ac c0168524 c93f38ac
[17482033.208000]        c4889000 c0168723 00000000 c015f6c6 c15f1f58 c4cbf380 cbc8d514 cfff40a0
[17482033.208000] Call Trace:
[17482033.208000]  [<c019cb8f>] reiser4_delete_inode+0x3f/0xd0
[17482033.208000]  [<c0168701>] iput+0x31/0x70
[17482033.208000]  [<c019cb50>] reiser4_delete_inode+0x0/0xd0
[17482033.208000]  [<c0168524>] generic_delete_inode+0x54/0xb0
[17482033.208000]  [<c0168723>] iput+0x53/0x70
[17482033.208000]  [<c015f6c6>] do_unlinkat+0xc6/0x120
[17482033.208000]  [<c0161a11>] sys_getdents64+0xc1/0xe0
[17482033.208000]  [<c0102e99>] syscall_call+0x7/0xb
[17482033.208000] Code: ff 0d 48 a5 4d c0 5b c3 8d b6 00 00 00 00 56 53 83 ec 04 89 c3 e8 44 9a 24 00 89 d8 e8 dd ac fe ff 8b 93 c4 00 00 00 85 d2 74 08 <0f> 0b fd 00 23
62 3d c0 8b 83 08 01 00 00 a8 10 75 08 0f 0b ff
[17482033.208000]  <4><4>reiser4[rm(28093)]: release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
[17482033.212000] WARNING: out of memory?
[17482033.212000] <4>reiser4[rm(28093)]: release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
[17482033.212000] WARNING: out of memory?
[17482033.212000] <4>reiser4[rm(28093)]: release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
[17482033.212000] WARNING: out of memory?
[17482033.212000] <4>reiser4[rm(28093)]: release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
[17482033.212000] WARNING: out of memory?

-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517       '(~o-o~)'
public key 86326EC9, http://ibormuth.efil.de/contact   --ooO--(.)--Ooo--

