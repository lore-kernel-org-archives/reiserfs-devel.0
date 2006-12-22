From: Joachim Wagner <jwagner@computing.dcu.ie>
Subject: reiserfs panic with kernel 2.6.19
Date: Fri, 22 Dec 2006 19:44:23 +0000
Message-ID: <200612222044.23690.jwagner@computing.dcu.ie>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_XWDjFSR99GXPxp5"
Return-path: <reiserfs-list-return-30339-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_XWDjFSR99GXPxp5
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I got this reiserfs panic a few weeks ago, but couldn't reproduce the error 
with a new filesystem. The error occurred on a 1.8 TB filesystem running the 
vanilla kernel 2.6.19. The last 3 steps were:
1.) rsync -avP a directory containing files with scattered sparse section to a 
reiser filesystem on a different machine (important for step 3), omitting the 
-S option
2.) touch the destination file to an old date (touch -r some_old_file *)
3.) rsync -avSP with same locations
The panic occurred with the 19th of 24 files of the transfer (approx 7GB in 
total). A fsck (--fix-fixable) and a resize (from 1.5 TB to 1.8 TB) had been 
run a few days before.

Repeating the steps above with a newly created target filesystem (just 16 GB), 
I was not able to reproduce the error. This is why the report is a little 
late.

Accidently, or luckely, CONFIG_REISERFS_CHECK was switched on in my kernel 
configuration. 

Regards,
Joachim

Attachments:
 * fgrep reiserfs_panic -C 20 /var/log/messages >reiserfs_panic.txt
 * text screenshot of running reiserfsck 3.6.19 _after_ the panic
 * kernel messages from last two mounts, showing version 3.6

--Boundary-00=_XWDjFSR99GXPxp5
Content-Type: text/plain;
  charset="us-ascii";
  name="reiserfs_panic.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfs_panic.txt"

Dec  5 09:07:46 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  5 09:37:46 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  5 10:00:43 localhost kernel: ReiserFS: hda14: found reiserfs format "3.6" with standard journal
Dec  5 10:00:43 localhost kernel: ReiserFS: hda14: warning: CONFIG_REISERFS_CHECK is set ON
Dec  5 10:00:43 localhost kernel: ReiserFS: hda14: warning: - it is slow mode for debugging.
Dec  5 10:00:43 localhost kernel: ReiserFS: hda14: using ordered data mode
Dec  5 10:00:43 localhost kernel: ReiserFS: hda14: journal params: device hda14, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
Dec  5 10:00:43 localhost kernel: ReiserFS: hda14: checking transaction log (hda14)
Dec  5 10:00:43 localhost kernel: ReiserFS: hda14: Using r5 hash to sort names
Dec  5 10:00:44 localhost kernel: SELinux: initialized (dev hda14, type reiserfs), uses genfs_contexts
Dec  5 10:07:51 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  5 10:31:03 localhost kernel: REISERFS: panic (device Null superblock): reiserfs[6532]: assertion !( n_file_size > (((n_new_file_size)+(8LL)-1u) & ~((8LL)-1u)) ) failed at fs/reiserfs/stree.c:1907:reiserfs_do_truncate: PAP-5680: truncate did not finish: new_file_size 0, current 110587904, oid 1744950
Dec  5 10:31:03 localhost kernel: 
Dec  5 10:31:03 localhost kernel: ------------[ cut here ]------------
Dec  5 10:31:03 localhost kernel: kernel BUG at fs/reiserfs/prints.c:361!
Dec  5 10:31:03 localhost kernel: invalid opcode: 0000 [#1]
Dec  5 10:31:03 localhost kernel: Modules linked in: sunrpc nvram evdev serio_raw ata_generic generic piix dm_snapshot dm_zero dm_mirror aic7xxx
Dec  5 10:31:03 localhost kernel: CPU:    0
Dec  5 10:31:03 localhost kernel: EIP:    0060:[<c01d29ae>]    Not tainted VLI
Dec  5 10:31:03 localhost kernel: EFLAGS: 00010296   (2.6.19test2 #4)
Dec  5 10:31:03 localhost kernel: EIP is at reiserfs_panic+0x4e/0x80
Dec  5 10:31:03 localhost kernel: eax: 00000117   ebx: c071990e   ecx: c07ee1e0   edx: c07ee1e0
Dec  5 10:31:03 localhost kernel: esi: 00000000   edi: 00000128   ebp: f26e6018   esp: cec73d94
Dec  5 10:31:03 localhost kernel: ds: 007b   es: 007b   ss: 0068
Dec  5 10:31:03 localhost kernel: Process rsync (pid: 6532, ti=cec72000 task=f4855030 task.ti=cec72000)
Dec  5 10:31:03 localhost kernel: Stack: c0726088 c071990e c0932900 cec73dbc 00000000 00000000 e58fc810 c01de793 
Dec  5 10:31:03 localhost kernel:        00000000 c072b958 00001984 00000773 c06c060a 00000000 00000000 06977000 
Dec  5 10:31:03 localhost kernel:        00000000 001aa036 00000000 cec73e84 06977000 00000000 00000000 00000000 
Dec  5 10:31:03 localhost kernel: Call Trace:
Dec  5 10:31:03 localhost kernel:  [<c01de793>] reiserfs_do_truncate+0x6a3/0x710
Dec  5 10:31:03 localhost kernel:  [<c01de83a>] reiserfs_delete_object+0x3a/0x90
Dec  5 10:31:03 localhost kernel:  [<c01c55ac>] reiserfs_delete_inode+0xac/0x100
Dec  5 10:31:03 localhost kernel:  [<c01c5500>] reiserfs_delete_inode+0x0/0x100
Dec  5 10:31:03 localhost kernel:  [<c0177222>] generic_delete_inode+0x72/0x110
Dec  5 10:31:03 localhost kernel:  [<c01768dc>] iput+0x5c/0x70
Dec  5 10:31:03 localhost kernel:  [<c01756e9>] dput+0xc9/0x120
Dec  5 10:31:03 localhost kernel:  [<c016df17>] sys_renameat+0x1c7/0x1f0
Dec  5 10:31:03 localhost kernel:  [<c016df67>] sys_rename+0x27/0x30
Dec  5 10:31:03 localhost kernel:  [<c0102e75>] sysenter_past_esp+0x56/0x79
Dec  5 10:31:03 localhost kernel:  =======================
Dec  5 10:31:03 localhost kernel: Code: 18 e8 67 f9 ff ff 89 d8 85 f6 8d be 28 01 00 00 0f 45 c7 c7 44 24 08 00 29 93 c0 89 44 24 04 c7 04 24 88 60 72 c0 e8 52 c0 f4 ff <0f> 0b 69 01 0e 9d 71 c0 85 f6 0f 45 df c7 44 24 08 00 29 93 c0 
Dec  5 10:31:03 localhost kernel: EIP: [<c01d29ae>] reiserfs_panic+0x4e/0x80 SS:ESP 0068:cec73d94
Dec  5 10:31:03 localhost kernel:  BUG: warning at kernel/exit.c:859/do_exit()
Dec  5 10:31:03 localhost kernel:  [<c0121092>] do_exit+0x722/0x810
Dec  5 10:31:03 localhost kernel:  [<c011ea1b>] printk+0x1b/0x20
Dec  5 10:31:03 localhost kernel:  [<c01039f3>] die+0x273/0x290
Dec  5 10:31:03 localhost kernel:  [<c0104330>] do_invalid_op+0x0/0xb0
Dec  5 10:31:03 localhost kernel:  [<c01043d2>] do_invalid_op+0xa2/0xb0
Dec  5 10:31:03 localhost kernel:  [<c01d29ae>] reiserfs_panic+0x4e/0x80
Dec  5 10:31:03 localhost kernel:  [<c011e597>] release_console_sem+0x1e7/0x200
Dec  5 10:31:03 localhost kernel:  [<c01dc4a1>] search_for_position_by_key+0x51/0x420
Dec  5 10:31:03 localhost kernel:  [<c06b7249>] error_code+0x39/0x40
Dec  5 10:31:03 localhost kernel:  [<c01d29ae>] reiserfs_panic+0x4e/0x80
Dec  5 10:31:03 localhost kernel:  [<c01de793>] reiserfs_do_truncate+0x6a3/0x710
Dec  5 10:31:03 localhost kernel:  [<c01de83a>] reiserfs_delete_object+0x3a/0x90
Dec  5 10:31:03 localhost kernel:  [<c01c55ac>] reiserfs_delete_inode+0xac/0x100
Dec  5 10:31:03 localhost kernel:  [<c01c5500>] reiserfs_delete_inode+0x0/0x100
Dec  5 10:31:03 localhost kernel:  [<c0177222>] generic_delete_inode+0x72/0x110
Dec  5 10:31:03 localhost kernel:  [<c01768dc>] iput+0x5c/0x70
Dec  5 10:31:03 localhost kernel:  [<c01756e9>] dput+0xc9/0x120
Dec  5 10:31:03 localhost kernel:  [<c016df17>] sys_renameat+0x1c7/0x1f0
Dec  5 10:31:03 localhost kernel:  [<c016df67>] sys_rename+0x27/0x30
Dec  5 10:31:04 localhost kernel:  [<c0102e75>] sysenter_past_esp+0x56/0x79
Dec  5 10:31:04 localhost kernel:  =======================
Dec  5 10:37:46 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  5 10:45:26 localhost shutdown[6778]: shutting down for system reboot
Dec  5 10:50:42 localhost shutdown[6782]: shutting down for system halt
Dec  5 10:51:41 localhost kernel: sky2 eth0: Link is down.
Dec  5 20:30:19 localhost syslogd 1.4.1: restart.
Dec  5 20:30:19 localhost kernel: klogd 1.4.1, log source = /proc/kmsg started.
Dec  5 20:30:19 localhost kernel: 0, CMD=ff, ADD=5c, DAT0=0d, DAT1=00
Dec  5 20:30:20 localhost kernel: pc87360: PC8736x not detected, module not inserted.
Dec  5 20:30:21 localhost kernel: md: linear personality registered for level -1

--Boundary-00=_XWDjFSR99GXPxp5
Content-Type: text/plain;
  charset="us-ascii";
  name="reiserfs_fsck.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfs_fsck.txt"

[root@localhost ~]# reiserfsck --fix-fixable /dev/mapper/media
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

Will check consistency of the filesystem on /dev/mapper/media
and will fix what can be fixed without --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
###########
reiserfsck --fix-fixable started at Tue Dec  5 20:59:27 2006
###########
Replaying journal..
Reiserfs journal '/dev/mapper/media' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 791033
        Internal nodes 5316
        Directories 357057
        Other files 3536206
        Data block pointers 444243209 (7748337 of them are zero)
        Safe links 1
###########
reiserfsck finished at Wed Dec  6 00:51:28 2006
###########

--Boundary-00=_XWDjFSR99GXPxp5
Content-Type: text/plain;
  charset="us-ascii";
  name="reiserfs_mount.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfs_mount.txt"

Dec  4 21:37:47 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  4 22:07:46 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  4 22:37:46 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  4 22:56:56 localhost kernel: ReiserFS: dm-1: found reiserfs format "3.6" with standard journal
Dec  4 22:56:56 localhost kernel: ReiserFS: dm-1: warning: CONFIG_REISERFS_CHECK is set ON
Dec  4 22:56:56 localhost kernel: ReiserFS: dm-1: warning: - it is slow mode for debugging.
Dec  4 22:56:56 localhost kernel: ReiserFS: dm-1: using ordered data mode
Dec  4 22:56:56 localhost kernel: ReiserFS: dm-1: journal params: device dm-1, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
Dec  4 22:56:56 localhost kernel: ReiserFS: dm-1: checking transaction log (dm-1)
Dec  4 22:56:57 localhost kernel: ReiserFS: dm-1: Using r5 hash to sort names
Dec  4 22:56:57 localhost kernel: SELinux: initialized (dev dm-1, type reiserfs), uses genfs_contexts
Dec  4 23:07:46 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  4 23:37:47 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  5 00:07:47 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  5 00:37:48 localhost smartd[4029]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
--
Dec  5 20:51:16 localhost kernel:  disk 4, o:1, dev:sdf1
Dec  5 20:51:16 localhost kernel:  disk 5, o:1, dev:sdg1
Dec  5 20:51:16 localhost kernel:  disk 6, o:1, dev:sda1
Dec  5 20:57:03 localhost kernel: ReiserFS: dm-1: found reiserfs format "3.6" with standard journal
Dec  5 20:57:03 localhost kernel: ReiserFS: dm-1: warning: CONFIG_REISERFS_CHECK is set ON
Dec  5 20:57:03 localhost kernel: ReiserFS: dm-1: warning: - it is slow mode for debugging.
Dec  5 20:57:03 localhost kernel: ReiserFS: dm-1: using ordered data mode
Dec  5 20:57:04 localhost kernel: ReiserFS: dm-1: journal params: device dm-1, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
Dec  5 20:57:04 localhost kernel: ReiserFS: dm-1: checking transaction log (dm-1)
Dec  5 20:57:38 localhost kernel: ReiserFS: dm-1: replayed 144 transactions in 34 seconds
Dec  5 20:57:38 localhost kernel: ReiserFS: dm-1: Using r5 hash to sort names
Dec  5 20:57:38 localhost kernel: SELinux: initialized (dev dm-1, type reiserfs), uses genfs_contexts
Dec  5 21:01:44 localhost smartd[4033]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  5 21:31:45 localhost smartd[4033]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 
Dec  5 22:01:45 localhost smartd[4033]: Device: /dev/hda, 1 Currently unreadable (pending) sectors 

--Boundary-00=_XWDjFSR99GXPxp5--
