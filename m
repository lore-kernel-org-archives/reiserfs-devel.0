From: "jds" <jds@soltis.cc>
Subject: Problems with reiserfs when start OpenAFS 1.2.11-fc1 Segmentation fault with kernel 2.4.22-1.2174.nptl
Date: Wed, 3 Mar 2004 19:00:06 -0600
Message-ID: <20040304005913.M1858@soltis.cc>
References: <20040304005117.M99283@soltis.cc>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040304005117.M99283@soltis.cc>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi: Iam compile OpenAFS 1.2.11-fc1 with kernel 2.4.22-1.2174.nptl is OK

problems with reiserfs 3.6 and Fedora Core 1
the problems is when start the client AFS recive the messages:

[root@angelinux modload]# service afs start
Found libafs-2.4.22-1.2174.nptl-i686.o from SymTable... Loading...
Starting AFS services.....
/etc/init.d/afs: line 305:  3300 Segmentation fault      /usr/vice/etc/afsd
${AFSD_OPTIONS}
[root@angelinux modload]# lsmod
Module                  Size  Used by    Tainted: PF
libafs-2.4.22-1.2174.nptl-i686  483360   0  (unused)
parport_pc             18756   1  (autoclean)
etc,etc

In log messages:
Starting AFS cache scan...Can't open inode 135536
Unable to handle kernel paging request at virtual address ffffffff
printing eip:
f093e1b0
*pde = 00002067
*pte = 00000000
Oops: 0002
libafs-2.4.22-1.2174.nptl-i686 parport_pc lp parport autofs tg3 floppy sg
keybdev hid ehci-hcd usb-uhci usbcore mousedev input i830 agpgart reiserfs
ata_piix
CPU:    0
EIP:    0060:[<f093e1b0>]    Tainted: PF
EFLAGS: 00010282

EIP is at osi_Panic [libafs-2.4.22-1.2174.nptl-i686] 0x20
(2.4.22-1.2174.nptl)
eax: 00000018   ebx: e7bd2580   ecx: 00000001   edx: e80d6000
esi: ea666b80   edi: ea666c08   ebp: 00000400   esp: e80d7c14
ds: 0068   es: 0068   ss: 0068
Process afsd (pid: 3300, stackpage=e80d7000)
Stack: f095c03c 00021170 c0341640 c0341640 ea666b80 ea666c08 c19b4800
f0948130
     f095c03c 00021170 c0341640 c0341640 ef724c10 00000000 00000000
00000000
     f0b5b000 00000000 00000001 f090e52d 00021170 00000000 00000ce4
00000ce4
Call Trace:   [<f095c03c>] .rodata.str1.1 [libafs-2.4.22-1.2174.nptl-i686]
0xe0c (0xe80d7c14)
[<f0948130>] osi_UFSOpen [libafs-2.4.22-1.2174.nptl-i686] 0x120 (0xe80d7c30)
[<f095c03c>] .rodata.str1.1 [libafs-2.4.22-1.2174.nptl-i686] 0xe0c
(0xe80d7c34)
[<f090e52d>] afs_InitCacheFile [libafs-2.4.22-1.2174.nptl-i686] 0x10d
(0xe80d7c60)
[<f006d260>] reiserfs_file_operations [reiserfs] 0x0 (0xe80d7c7c)
[<f006d260>] reiserfs_file_operations [reiserfs] 0x0 (0xe80d7c80)
[<f0910efb>] afs_InitVolumeInfo [libafs-2.4.22-1.2174.nptl-i686] 0x5b
(0xe80d7c90)
[<f094c7de>] afs_syscall_call [libafs-2.4.22-1.2174.nptl-i686] 0x5ce
(0xe80d7cb0)
[<c013a94b>] activate_page [kernel] 0xab (0xe80d7ce4)
[<c0146189>] getblk [kernel] 0x59 (0xe80d7d00)
[<c0146460>] bread [kernel] 0x20 (0xe80d7d24)
[<f0054b74>] is_tree_node [reiserfs] 0x74 (0xe80d7d40)
[<f0055131>] search_by_key [reiserfs] 0x5b1 (0xe80d7d54)
[<f005e2b7>] journal_end [reiserfs] 0x27 (0xe80d7d94)
[<f004ca3e>] reiserfs_dirty_inode [reiserfs] 0x7e (0xe80d7da
[<f00405a8>] search_by_entry_key [reiserfs] 0xc8 (0xe80d7dd4)
[<f0054861>] pathrelse [reiserfs] 0x21 (0xe80d7df4)
[<f0048077>] reiserfs_readdir [reiserfs] 0x3c7 (0xe80d7e04)
[<c013c2f4>] __alloc_pages [kernel] 0x64 (0xe80d7e44)
[<c013c2f4>] __alloc_pages [kernel] 0x64 (0xe80d7e68)
[<c0131013>] vm_enough_memory [kernel] 0x33 (0xe80d7e84)
[<c026762f>] rb_insert_color [kernel] 0x8f (0xe80d7ea0)
[<c013043d>] do_wp_page [kernel] 0x4d (0xe80d7ebc)
[<c0130dd9>] handle_mm_fault [kernel] 0xf9 (0xe80d7ee0)
[<c0117bf8>] do_page_fault [kernel] 0x138 (0xe80d7f0c)
[<f094cec0>] afs_syscall [libafs-2.4.22-1.2174.nptl-i686] 0x190 (0xe80d7f40)
[<c0117ac0>] do_page_fault [kernel] 0x0 (0xe80d7fb0)
[<c0109747>] system_call [kernel] 0x33 (0xe80d7fc0)

Code: c6 05 ff ff ff ff 2a 83 c4 1c c3 90    74 26 00 b8 1e bd 95

with kernel 2.4.22-2166 and is the same version OpenAFS working good and
startup client AFS good.

Helpme please.
------- End of Forwarded Message -------

