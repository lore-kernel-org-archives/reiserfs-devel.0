From: "Alec Burney" <madbull@gmail.com>
Subject: possible reiser4 bug
Date: Thu, 23 Feb 2006 19:35:48 -1000
Message-ID: <2bbb1c940602232135jff393fbm2175052026237ce9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

i have been experiencing hard locks (preceded by intense 5< load
averages, disk i/o timeouts, and processes gone astray) that seem to
be related to a possible bug in reiser4.
here is the information that i think is important:

 a sample dmesg from right before a hardlock:
------------[ cut here ]------------
kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:29!
invalid opcode: 0000 [#1]
SMP
last sysfs file: /class/vc/vcsa7/dev
Modules linked in: snd_rtctimer
CPU:    0
EIP:    0060:[<c019c3bb>]    Not tainted VLI
EFLAGS: 00210282   (2.6.16-rc3-mm1 #1)
EIP is at get_exclusive_access+0x1b/0x44
eax: eec1b1ac   ebx: ecda70d8   ecx: ecda7140   edx: 00000000
esi: addee000   edi: eec1b160   ebp: 00000000   esp: dfd89f38
ds: 007b   es: 007b   ss: 0068
Process soffice.bin (pid: 11208, threadinfo=3Ddfd89000 task=3De1193a70)
Stack: <0>00000001 c019b956 c013f613 eecbfb74 e8daa560 00000001
00005600 00000000
       ecda70d8 ecda7140 addee000 ea8ea7c0 00005600 d06d2740 00005600 ea8ea=
7c0
       c03b0e10 00000000 c014bbf3 dfd89fa4 addee000 ea8ea7c0 fffffff7 bfb4a=
870
Call Trace:
 <c019b956> write_unix_file+0x2a4/0x44b   <c013f613> vma_link+0xa2/0xbc
 <c014bbf3> vfs_write+0xab/0x14c   <c014bd32> sys_write+0x3c/0x62
 <c01025bf> sysenter_past_esp+0x54/0x75
Code: 8d 43 10 e8 5c 54 1a 00 e9 f8 fc ff ff 90 90 90 53 89 c3 b8 00
f0 ff ff 21 e0 8b 00 8b 80 c8 04 00 00 8b 40 48 83 78 0c 00 74 08 <0f>
0b 1d 00 e0 58 36 c0 e8 28 61 1a 00 ba 01 00 ff ff 89 d8 f0

my uname -a:
Linux helix 2.6.16-rc3-mm1 #1 SMP Sun Feb 19 21:46:21 HST 2006 i686
AMD Athlon(tm) MP 2600+ AuthenticAMD GNU/Linux

my fsck.reiser4 -V
fsck.reiser4 1.0.5
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing
governed by reiser4progs/COPYING.

my fsck.reiser4 -p from a drive known to be causing trouble
Default profiles:
format:     "format40" (id:0x0 type:0x8)
journal:    "journal40" (id:0x0 type:0xf)
oid:        "oid40" (id:0x0 type:0x9)
alloc:      "alloc40" (id:0x0 type:0xe)
key:        "key_large" (id:0x1 type:0x10)
node:       "node40" (id:0x0 type:0x2)
statdata:   "stat40" (id:0x0 type:0x1)
nodeptr:    "nodeptr40" (id:0x3 type:0x1)
direntry:   "cde40" (id:0x2 type:0x1)
tail:       "plain40" (id:0x6 type:0x1)
extent:     "extent40" (id:0x5 type:0x1)
acl:        "absent (id:0x4 type:0x1)"
permission: "absent (id:0x0 type:0x6)"
regular:    "reg40" (id:0x0 type:0x0)
directory:  "dir40" (id:0x1 type:0x0)
symlink:    "sym40" (id:0x2 type:0x0)
special:    "spl40" (id:0x3 type:0x0)
hash:       "r5_hash" (id:0x1 type:0x3)
fibration:  "ext_1_fibre" (id:0x2 type:0x4)
formatting: "smart" (id:0x2 type:0x5)


the partition in question is 232903996 kilobytes large (that's 223
gigabytes), and does not fail badblocks or fsck.reiser4 testing. my
system holds up to memtest86, and does not crash if the drive is not
mounted and used.


my question: can this be fixed, has it been fixed, or can i convert
this drive online to reiserfs.
sorry for such a long message, but this is very important to me. thank you!
