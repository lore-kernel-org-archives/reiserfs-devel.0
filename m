From: =?iso-8859-2?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: reiser4 crashes
Date: Wed, 28 Sep 2005 19:42:19 +0200
Message-ID: <008001c5c453$fcfbd7a0$0300a8c0@JUICE1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: reiserfs-list@namesys.com

now it is crashing even more often, i will paste more logs, as it seems to
changed a little:

Sep 28 19:28:52 werewolf kernel: reiser4[pure-ftpd-mysql(7092)]:
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
Sep 28 19:28:52 werewolf kernel: WARNING: Wrong level found in node: 1 !=
111
Sep 28 19:28:52 werewolf kernel: reiser4[pure-ftpd-mysql(7092)]: make_space
(fs/reiser4/carry_ops.c:497)[nikita-1065]:
Sep 28 19:28:52 werewolf kernel: WARNING: Error accessing right neighbor: -5
Sep 28 19:28:52 werewolf kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000078
Sep 28 19:28:52 werewolf kernel:  printing eip:
Sep 28 19:28:52 werewolf kernel: c01b02bd
Sep 28 19:28:52 werewolf kernel: *pde = 00000000
Sep 28 19:28:52 werewolf kernel: Oops: 0000 [#1]
Sep 28 19:28:52 werewolf kernel: Modules linked in:
Sep 28 19:28:52 werewolf kernel: CPU:    0
Sep 28 19:28:52 werewolf kernel: EIP:    0060:[carry_on_level+169/188]
Not tainted VLI
Sep 28 19:28:52 werewolf kernel: EFLAGS: 00010246   (2.6.12.3juice-1)
Sep 28 19:28:52 werewolf kernel: EIP is at carry_on_level+0xa9/0xbc
Sep 28 19:28:52 werewolf kernel: eax: d5d53bbc   ebx: d5d53c70   ecx:
e2f9e180   edx: 00000000
Sep 28 19:28:52 werewolf kernel: esi: 00000000   edi: d5d53c74   ebp:
d5d53c78   esp: d5d53bb0
Sep 28 19:28:52 werewolf kernel: ds: 007b   es: 007b   ss: 0068
Sep 28 19:28:52 werewolf kernel: Process pure-ftpd-mysql (pid: 7092,
threadinfo=d5d52000 task=eb970a80)
Sep 28 19:28:52 werewolf kernel: Stack: e2f9e180 d5d53bbc d5d53bf4 d5d53c74
d5d53bf4 00000000 d5d53c74 d5d53bf4
Sep 28 19:28:52 werewolf kernel:        d5d53c20 c01b00ea d5d53c74 d5d53bf4
d5d53d28 d5d53c88 00000002 00000000
Sep 28 19:28:52 werewolf kernel:        00000001 00000000 e9c89dc8 e9c89e48
e9a0543c e9a054a4 e9a05400 00000003
Sep 28 19:28:52 werewolf kernel: Call Trace:
Sep 28 19:28:52 werewolf kernel:  [carry+147/445] carry+0x93/0x1bd
Sep 28 19:28:52 werewolf kernel:  [insert_with_carry_by_coord+184/242]
insert_with_carry_by_coord+0xb8/0xf2
Sep 28 19:28:52 werewolf kernel:  [insert_by_coord+173/287]
insert_by_coord+0xad/0x11f
Sep 28 19:28:52 werewolf kernel:  [insert_new_sd+260/563]
insert_new_sd+0x104/0x233
Sep 28 19:28:52 werewolf kernel:  [write_sd_by_inode_common+41/182]
write_sd_by_inode_common+0x29/0xb6
Sep 28 19:28:52 werewolf kernel:  [create_common+36/63]
create_common+0x24/0x3f
Sep 28 19:28:52 werewolf kernel:  [create_child_common+679/1763]
create_child_common+0x2a7/0x6e3
Sep 28 19:28:52 werewolf kernel:  [invoke_create_method+152/248]
invoke_create_method+0x98/0xf8
Sep 28 19:28:52 werewolf kernel:  [reiser4_create+72/78]
reiser4_create+0x48/0x4e
Sep 28 19:28:52 werewolf kernel:  [vfs_create+189/233] vfs_create+0xbd/0xe9
Sep 28 19:28:52 werewolf kernel:  [open_namei+1310/1476]
open_namei+0x51e/0x5c4
Sep 28 19:28:52 werewolf kernel:  [filp_open+59/97] filp_open+0x3b/0x61
Sep 28 19:28:52 werewolf kernel:  [get_unused_fd+78/174]
get_unused_fd+0x4e/0xae
Sep 28 19:28:52 werewolf kernel:  [sys_open+64/110] sys_open+0x40/0x6e
Sep 28 19:28:52 werewolf kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Sep 28 19:28:52 werewolf kernel: Code: 39 e8 74 30 89 cb 89 14 24 e8 6e 03
00 00 89 c1 66 83 b8 d2 00 00 00 00 75 db 8b 90 80 00 00 00 8d 44 24 0c 89
44 24 04 89 0c 24 <ff> 52 78 89 c6 85 c0 74 c1 89 f0 83 c4 14 5b 5e 5f 5d c3
55 57


i have crash every 1 hour, and i already lost some databases and other
random files....

can you please help me? is there any undelete tool for reiser4 ? (dont think
its possible, but i will ask anyways)

> Hello, my server crashed few times latetly, and the only strange thing i
> found in logs, are reiser4 entries just before every crash:
>
> #1 crash:
>
> kern.log:Sep 27 21:09:06 werewolf kernel: reiser4[pure-ftpd-mysql(18871)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> kern.log:Sep 27 21:09:06 werewolf kernel: reiser4[pure-ftpd-mysql(18871)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> kern.log:Sep 27 21:09:06 werewolf kernel: reiser4[pure-ftpd-mysql(18871)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(15867)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(15867)]:
> cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18812)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18812)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18812)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18883)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18883)]:
> cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18883)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18883)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(15867)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(15867)]:
> cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
> kern.log:Sep 27 21:15:31 werewolf kernel: reiser4[pure-ftpd-mysql(18809)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> kern.log:Sep 27 21:15:31 werewolf kernel: reiser4[pure-ftpd-mysql(18809)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> kern.log:Sep 27 21:15:31 werewolf kernel: reiser4[pure-ftpd-mysql(18809)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
> kern.log:Sep 27 21:26:48 werewolf kernel: reiser4[pure-ftpd-mysql(18685)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> kern.log:Sep 27 21:26:48 werewolf kernel: reiser4[pure-ftpd-mysql(18685)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> kern.log:Sep 27 21:26:48 werewolf kernel: reiser4[pure-ftpd-mysql(18685)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
> kern.log:Sep 27 21:33:16 werewolf kernel: reiser4[pure-ftpd-mysql(18548)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> kern.log:Sep 27 21:33:16 werewolf kernel: reiser4[pure-ftpd-mysql(18548)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> kern.log:Sep 27 21:33:16 werewolf kernel: reiser4[pure-ftpd-mysql(18548)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
>
> #2 crash:
>
> Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(31716)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> Sep 28 13:55:42 werewolf kernel: WARNING: Wrong level found in node: 1 !=
> 227
> Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(31716)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> Sep 28 13:55:42 werewolf kernel: WARNING: Partial conversion of 4774068: 0
> of 1: -5
> Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(31716)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
> Sep 28 13:55:42 werewolf kernel: WARNING: Failed to convert in
> release_unix_file (4774068)
> Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(1826)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> Sep 28 13:55:42 werewolf kernel: WARNING: Wrong level found in node: 1 !=
> 227
> Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(1826)]:
> cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
> Sep 28 13:55:42 werewolf kernel: WARNING: failure: -5
> Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(31745)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> Sep 28 13:56:04 werewolf kernel: WARNING: Wrong level found in node: 1 !=
> 227
> Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(31745)]:
> cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
> Sep 28 13:56:04 werewolf kernel: WARNING: failure: -5
> Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(31745)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> Sep 28 13:56:04 werewolf kernel: WARNING: Partial conversion of 4774081: 0
> of 1: -5
> Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(31745)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
> Sep 28 13:56:04 werewolf kernel: WARNING: Failed to convert in
> release_unix_file (4774081)
> Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(1826)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> Sep 28 13:56:04 werewolf kernel: WARNING: Wrong level found in node: 1 !=
> 227
> Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(1826)]:
> cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
> Sep 28 13:56:04 werewolf kernel: WARNING: failure: -5
> Sep 28 13:57:25 werewolf kernel: reiser4[pure-ftpd-mysql(30789)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> Sep 28 13:57:25 werewolf kernel: WARNING: Wrong level found in node: 1 !=
> 227
> Sep 28 13:57:25 werewolf kernel: reiser4[pure-ftpd-mysql(30789)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> Sep 28 13:57:25 werewolf kernel: WARNING: Partial conversion of 4773762: 0
> of 1: -5
> Sep 28 13:57:25 werewolf kernel: reiser4[pure-ftpd-mysql(30789)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
> Sep 28 13:57:25 werewolf kernel: WARNING: Failed to convert in
> release_unix_file (4773762)
> Sep 28 13:59:06 werewolf kernel: reiser4[pure-ftpd-mysql(30231)]:
> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
> Sep 28 13:59:06 werewolf kernel: WARNING: Wrong level found in node: 1 !=
> 227
> Sep 28 13:59:06 werewolf kernel: reiser4[pure-ftpd-mysql(30231)]:
> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
> Sep 28 13:59:06 werewolf kernel: WARNING: Partial conversion of 4773593: 0
> of 1: -5
> Sep 28 13:59:06 werewolf kernel: reiser4[pure-ftpd-mysql(30231)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
> Sep 28 13:59:06 werewolf kernel: WARNING: Failed to convert in
> release_unix_file (4773593)
>
>
> this is quite traffic-heavy server (free hosting with lots of accounts)
>
> im using reiser4 , kernel 2.6.12.3 with 2.6.12 latest reiser4 patches,
> reiser4progs 1.0.5, and its Debian.
>
> those entries i pasted logged like few minutes (or even less) before every
> crash, and they happen other than these 'crashing' situations..
>
> can you help me?
>
>
>


