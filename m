From: Paul Pluzhnikov <ppluzhnikov@gmail.com>
Subject: "reiserfsck --fix-fixable" says corrected; but doesn't
Date: Sat, 15 Apr 2006 20:48:54 -0700
Message-ID: <4441BEA6.3020103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Greetings,

I had recent corruption of my (rather old) reiserfs filesystem.

Attempt to check it with 'reiserfsck' finds errors and says I
should run with '--fix-fixable'.

Running with '--fix-fixable' finds the same errors, and says
that it fixed them; but running again finds the same problem again.

Doing 'ls' in the directory where I think corrupted file exists
causes this message in /var/log/messages:
  Apr 15 17:26:29 amoeba kernel: ReiserFS: hdb7: warning: PAP-5660: 
reiserfs_do_truncate: wrong result 1 of search for [134215 570890 
0xffffffff DIRECT]

At that point the 'ls' process becomes hung, and I can't 'kill -9' it.
Subsequent 'sync' or shutdown all hang.

Any clues on how to debug this further, or how to fix my /home filesystem?

Gory details:

This is happening on Fedora Core 2 (but the partition and FS on it
were originally created using SuSE 7.3).

$ cat /proc/version
Linux version 2.6.5-1.358 (bhcompile@bugs.build.redhat.com) (gcc version 
3.3.3 20040412 (Red Hat Linux 3.3.3-7)) #1 Sat May 8 09:04:50 EDT 2004

# Also happens with updated kernel 2.6.10-1.771_FC2smp

[root@amoeba reiserfsprogs-3.6.19]# ./fsck/reiserfsck --log 
/tmp/fix4.log --fix-fixable /dev/hdb7
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will check consistency of the filesystem on /dev/hdb7
and will fix what can be fixed without --rebuild-tree
Will put log info to '/tmp/fix4.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --fix-fixable started at Sat Apr 15 20:51:52 2006
###########
Replaying journal..
Reiserfs journal '/dev/hdb7' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 146981
        Internal nodes 974
        Directories 42350
        Other files 530328
        Data block pointers 13950883 (1748 of them are zero)
        Safe links 0
###########
reiserfsck finished at Sat Apr 15 20:59:49 2006
###########
[root@amoeba reiserfsprogs-3.6.19]# cat /tmp/fix4.log
vpf-10670: The file [134215 570890] has the wrong size in the StatData 
(0) - corrected to (4294967296)
vpf-10670: The file [570841 570847] has the wrong size in the StatData 
(2219311104) - corrected to (2219311104)
vpf-10670: The file [570855 570856] has the wrong size in the StatData 
(2189426688) - corrected to (2189426688)

Repeated runs produce the same log, so does running reiserfsck-v2.6.13 ...

I also have this in /var/log/messages (but this happened only once):

Apr 14 20:42:10 amoeba kernel: ReiserFS: hdb7: warning: PAP-5660: 
reiserfs_do_truncate: wrong result 1 of search for [1342
15 570890 0xffffffff DIRECT]
Apr 14 20:42:10 amoeba kernel: ------------[ cut here ]------------
Apr 14 20:42:10 amoeba kernel: kernel BUG at fs/reiserfs/inode.c:1257!
Apr 14 20:42:10 amoeba kernel: invalid operand: 0000 [#1]
Apr 14 20:42:10 amoeba kernel: SMP
Apr 14 20:42:10 amoeba kernel: Modules linked in: loop nls_utf8 
tda9887(U) msp3400(U) saa7115(U) tuner(U) tveeprom(U) ivtv
(U) i2c_algo_bit i2c_core videodev md5 ipv6 parport_pc lp parport 
autofs4 sunrpc 3c59x floppy sg microcode reiserfs uhci_h
cd ext3 jbd dm_mod aic7xxx sd_mod scsi_mod
Apr 14 20:42:10 amoeba kernel: CPU:    0
Apr 14 20:42:11 amoeba kernel: EIP:    0060:[<de1ab997>]    Tainted: 
GF     VLI
Apr 14 20:42:11 amoeba kernel: EFLAGS: 00010246   (2.6.10-1.771_FC2smp)
Apr 14 20:42:11 amoeba kernel: EIP is at 
reiserfs_update_sd_size+0x40/0x189 [reiserfs]
Apr 14 20:42:11 amoeba kernel: eax: 00000000   ebx: c853bcb4   ecx: 
00000000   edx: d1f8cde8
Apr 14 20:42:11 amoeba kernel: esi: de1c8b30   edi: d1f8cda0   ebp: 
c853bcb4   esp: d1f8cd30
Apr 14 20:42:11 amoeba kernel: ds: 007b   es: 007b   ss: 0068
Apr 14 20:42:11 amoeba kernel: Process a.out (pid: 11053, 
threadinfo=d1f8c000 task=d4d4b560)
Apr 14 20:42:11 amoeba kernel: Stack: 00000000 00000000 d1f8cde8 
0008b60a 00000001 00000000 d1f8cdec 0000c8aa
Apr 14 20:42:11 amoeba kernel:        c12680a0 00020c47 0008b60a 
00000001 00000000 00000000 00000000 00000000
Apr 14 20:42:11 amoeba kernel:        00000000 00000000 00000000 
00000000 00000000 00000000 00000000 00000000
Apr 14 20:42:11 amoeba kernel: Call Trace:
Apr 14 20:42:11 amoeba kernel:  [<de1c282b>] journal_begin+0x8d/0xce 
[reiserfs]
Apr 14 20:42:11 amoeba kernel:  [<de1b3e5c>] 
reiserfs_dirty_inode+0x52/0x71 [reiserfs]
Apr 14 20:42:11 amoeba kernel:  [<c016ef54>] __mark_inode_dirty+0x28/0x176
Apr 14 20:42:11 amoeba kernel:  [<c0168b83>] inode_setattr+0x114/0x11e
Apr 14 20:42:11 amoeba kernel:  [<de1adad5>] 
reiserfs_setattr+0x16f/0x1a4 [reiserfs]
Apr 14 20:42:11 amoeba kernel:  [<c01463ae>] do_no_page+0x2b5/0x2d4
Apr 14 20:42:11 amoeba kernel:  [<c0168cef>] notify_change+0x10c/0x1dd
Apr 14 20:42:11 amoeba kernel:  [<c01513b9>] do_truncate+0x74/0xa6
Apr 14 20:42:11 amoeba kernel:  [<c016693c>] __d_lookup+0xda/0xfa
Apr 14 20:42:11 amoeba kernel:  [<de1c776a>] reiserfs_permission+0x7/0x9 
[reiserfs]
Apr 14 20:42:11 amoeba kernel:  [<c015d76c>] permission+0x43/0x48
Apr 14 20:42:11 amoeba kernel:  [<c015ef55>] may_open+0x1b5/0x200
Apr 14 20:42:11 amoeba kernel:  [<c015f242>] open_namei+0x2a2/0x595
Apr 14 20:42:11 amoeba kernel:  [<c0152148>] filp_open+0x23/0x3c
Apr 14 20:42:11 amoeba kernel:  [<c0152460>] sys_open+0x31/0x7d
Apr 14 20:42:11 amoeba kernel:  [<c0103ccb>] syscall_call+0x7/0xb
Apr 14 20:42:11 amoeba kernel: Code: 00 8b 94 24 b4 00 00 00 89 44 24 08 
8d 7c 24 2c 8b 84 24 b0 00 00 00 fc 89 54 24 04 8
9 04 24 f3 a5 8b 54 24 08 83 7a 10 00 75 08 <0f> 0b e9 04 23 9b 1c de 8d 
44 24 7c 89 ea 6a 03 6a 00 6a 00 6a
Apr 14 23:21:40 amoeba syslogd 1.4.1: restart.





