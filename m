From: studdugie <studdugie@gmail.com>
Subject: Bug report
Date: Mon, 11 Apr 2005 10:07:48 -0400
Message-ID: <5a59ce530504110707e0a4791@mail.gmail.com>
Reply-To: studdugie <studdugie@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-mailing-list <reiserfs-list@namesys.com>

Hello. I've just joined the reiserfs mailing list today because I need
to report a bug in reiser4. If this list is not the appropriate place
to report bugs, firstly, my apologies. Finally, I would appreciate
some guidance about the appropriate outlet.

I'm in quasi testing of reiser4 mode insofar as this box is concerned
and the specific app that trigged the failure but eventually I'm going
to need the app to complete w/o failure. If you (the reiser gurus)
think this is the sort of thing that has already been solved or can be
wrapped up in a short amount of time I would be glad to continue
pounding reiser4 and giving feedback.

<bug-report>
------------[ cut here ]------------
kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:32!
invalid operand: 0000 [#1]
SMP
Modules linked in:
CPU:    0
EIP:    0060:[<c021107f>]    Not tainted VLI
EFLAGS: 00010282   (2.6.11-mm2)
EIP is at get_exclusive_access+0x2f/0x40
eax: f2d5035c   ebx: f2d503c4   ecx: f73c3c98   edx: e5946e80
esi: f2d5035c   edi: f7df1d68   ebp: f7df1f3c   esp: f7df1d34
ds: 007b   es: 007b   ss: 0068
Process pdflush (pid: 111, threadinfo=f7df0000 task=c43a3020)
Stack: c0210be1 f2d5035c f7df1f3c c0208148 c04c8ba0 f2d503c4 c01ea5b1 f2d503c4
       f7344c00 f7df1e6c 00000000 00000000 00000008 00000000 00000000 00000000
       00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
Call Trace:
 [<c0210be1>] pre_delete_unix_file+0x21/0x50
 [<c0208148>] kill_cursors+0x18/0x20
 [<c01ea5b1>] delete_inode_common+0x191/0x200
 [<c01ea679>] drop_common+0x49/0x50
 [<c01e1a30>] reiser4_drop_inode+0x20/0x40
 [<c0177ff3>] iput+0x63/0x90
 [<c0180f97>] generic_sync_sb_inodes+0x217/0x2d0
 [<c0141e60>] pdflush+0x0/0x30
 [<c01e1b7c>] reiser4_sync_inodes+0x4c/0xa0
 [<c018107e>] sync_sb_inodes+0x2e/0x40
 [<c018117c>] writeback_inodes+0xec/0x100
 [<c01413d6>] wb_kupdate+0x96/0x110
 [<c0141d8b>] __pdflush+0xbb/0x190
 [<c0141e86>] pdflush+0x26/0x30
 [<c0141340>] wb_kupdate+0x0/0x110
 [<c0141e60>] pdflush+0x0/0x30
 [<c01308da>] kthread+0xba/0xc0
 [<c0130820>] kthread+0x0/0xc0
 [<c01009f5>] kernel_thread_helper+0x5/0x10
Code: ff 8b 44 24 04 21 e2 8b 12 8b 92 b8 04 00 00 8b 52 44 8b 52 0c
85 d2 75 12 ba 01 00 ff ff f0 0f c1 10 85 d2 0f 85 0c 11 00 00 c3 <0f>
0b 20 00 c0 81 47 c0 eb e4 8d b4 26 00 00 00 00 8b 44 24 04
</bug-report>

Here is some miscellaneous output from the dmesg command that
may/maynot have a bearing on the issue.
<dmesg>
reiser4[java(7213)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[java(7213)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 32768
reiser4[java(7213)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 65536
reiser4[java(7599)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[java(7599)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 32768
reiser4[java(7599)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 65536
reiser4[ent:dm-0!(4791)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ent:dm-0!(4791)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 32768
reiser4[ent:dm-0!(4791)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 65536
reiser4[ktxnmgrd:dm-0:r(4790)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ent:dm-0!(4791)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ent:dm-0!(4791)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 32768
reiser4[java(7858)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[java(7858)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 32768
reiser4[java(7858)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 65536
reiser4[java(10888)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[java(10888)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 32768
reiser4[java(10888)]: commit_current_atom
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 65536
</dmesg>

Below are some miscellaneous stuff that may be usefull
<misc>
mount flags: rw,noatime,nodiratime,trace=0x0,log=0x0,debug=0x0,atom_max_size=0x5f1fb
0 0

io scheduler/elevator: as
</misc>.

<system-info>
Linux cavasa 2.6.11-mm2 #4 SMP Fri Apr 8 20:26:21 EDT 2005 i686
Intel(R) Xeon(TM) CPU 3.06GHz GenuineIntel GNU/Linux

GCC 3.3.5

GNU C Library 20040808 release version 2.3.4, by Roland McGrath et al.
Compiled by GNU CC version 3.3.5  (Gentoo Linux 3.3.5-r1, ssp-3.3.2-3,
pie-8.7.7.1).
Compiled on a Linux 2.6.8 system on 2005-02-26.
Available extensions:
        GNU libio by Per Bothner
        crypt add-on version 2.1 by Michael Glad and others
        Native POSIX Threads Library by Ulrich Drepper et al
        BIND-8.2.3-T5B
        NIS(YP)/NIS+ NSS modules 0.19 by Thorsten Kukuk
Thread-local storage support included.
</system-info>

Dane
