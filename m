From: Karl.Mistelberger@t-online.de (Karl Mistelberger)
Subject: Error after rebuilding file system tree
Date: Tue, 11 Feb 2003 11:01:55 +0100 (CET)
Message-ID: <Pine.LNX.4.33.0302111049330.1265-100000@nnk.erl.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12683-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello there,

I got the following error on a working file system:

Feb 11 08:02:54 nnk kernel: 3a:04: rw=1, want=26537940, limit=26529792
Feb 11 08:02:54 nnk kernel: attempt to access beyond end of device
Feb 11 08:02:54 nnk kernel: 3a:04: rw=1, want=26537936, limit=26529792
Feb 11 08:02:54 nnk kernel: attempt to access beyond end of device
Feb 11 08:02:54 nnk kernel: 3a:04: rw=1, want=26537932, limit=26529792
Feb 11 08:02:54 nnk kernel: kernel BUG at journal.c:1106!
Feb 11 08:02:54 nnk kernel: invalid operand: 0000 2.4.19-4GB #1 Tue Jan 21
09:48:15 UTC 2003
Feb 11 08:02:54 nnk kernel: CPU:    0
Feb 11 08:02:54 nnk kernel: EIP:
0010:[af_packet:__insmod_af_packet_O/lib/modules/2.4.19-4GB/kernel/net/pack+-24419131/96]
Not taintedFeb 11 08:02:54 nnk kernel: EFLAGS: 00010202
Feb 11 08:02:54 nnk kernel: eax: 00000001   ebx: d0bb4944   ecx: 00000000
edx: d0bb4944
Feb 11 08:02:54 nnk kernel: esi: c4ca47e0   edi: 00000000   ebp: c2448da0
esp: c8df9e00
Feb 11 08:02:54 nnk kernel: ds: 0018   es: 0018   ss: 0018
Feb 11 08:02:54 nnk kernel: Process wget (pid: 1672, stackpage=c8df9000)
Feb 11 08:02:54 nnk kernel: Stack: 00000000 00000000 00000000 c2448da0
00000031 c2e8d5e0 c1acb800 c161eaf5
Feb 11 08:02:54 nnk kernel:        c1acb800 c2448da0 00000001 c24483a0
0003c1e5 c1acb800 3e489fa6 c2e8d120
Feb 11 08:02:54 nnk kernel:        c2e8d5e0 c1621ce4 c1acb800 c2e8d5e0
00002000 00001e4b c16223fd c1acb800
Feb 11 08:02:54 nnk kernel: Call Trace:
[af_packet:__insmod_af_packet_O/lib/modules/2.4.19-4GB/kernel/net/pack+-24417547/96]
[af_packet:_Feb 11 08:02:54 nnk kernel:   [vfs_create+129/256]
[open_namei+1410/1552] [filp_open+55/96] [sys_open+59/128]
[system_call+51/64]
Feb 11 08:02:54 nnk kernel: Modules: [(reiserfs:<c1600060>:<c162f580>)]
Feb 11 08:02:54 nnk kernel: Code: 0f 0b 52 04 6a d3 62 c1 e9 ce fe ff ff
68 60 b3 62 c1 51 e9

Then I ran reiserfsck:

nnk:~ # reiserfsck /dev/system/st
reiserfsck 3.6.2 (2002)
Will read-only check consistency of the filesystem on /dev/system/st
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Tue Feb 11 08:24:59 2003
###########
Replaying journal..
No transactions found
Checking S+tree../  8 (of   8)bad_internal: vpf-10330: block 4888052: has
bad pointer 163: 6633178
whole subtree skipped
ok
Comparing bitmaps..Bad nodes were found, Semantic pass skipped
There were found 1 corruptions which can be fixed only during
--rebuild-tree
###########
reiserfsck finished at Tue Feb 11 08:33:11 2003
###########
free block count 356650 mismatches with a correct one 1951286.
on-disk bitmap does not match to the correct one.
nnk:~ #


Then I ran  "reiserfsck  --rebuild-tree /dev/system/st" and got:



Do you want to run this program?[N/Yes] (note need to type Yes):Replaying
journal..
No transactions found
###########
reiserfsck --rebuild-tree started at Tue Feb 11 08:38:01 2003
###########

Pass 0:
Loading on-disk bitmap .. ok, 6274481 blocks marked used
Skipping 8413 blocks (super block, journal, bitmaps) 6266068 blocks will
be read
0%                                                         left 6266067, 0
/se                                                         left
        "r5" hash is selected
Flushing..done
        Read blocks (but not data blocks) 6266068
                Leaves among those 190395
                        - corrected leaves 10
                pointers in indirect items to wrong area 1044 (zeroed)
                Objectids found 674841

Pass 1 (will try to insert 190395 leaves):
Looking for allocable blocks .. ok
0%                                                          left 190394, 0
/se
leftFlushing..done
        190395 leaves read
                190223 inserted
                172 not inserted

Pass2:
0%                                                             left 343, 0
/se
lFlushing..done
        Leaves inserted item by item 172
Pass 3 (semantic):
Flushing..done
        Files found: 652464
        Directories found: 22376
        Names pointing to nowhere (removed): 39
Pass 3a (looking for lost dir/files):
Looking for lost directories:
               done 0, 0 /se               done 1, 0 /se           done
15154, 8 /se          done 22098, 12 /se          done 25180, 14 /se
done 0, 0 /se              done 80, 0 /se            done 4366, 1 /se
done 9765, 4 /se           done 14092, 6 /se        Objects without names
1
        Empty lost dirs removed 1
        Files linked to /lost+found 1
Pass 4 -                done 0, 0 /se              done 32, 0 /se
done 3496, 1 /se            done 8642, 2 /se           done
128Flushing..done
Syncing..done
###########
reiserfsck finished at Tue Feb 11 10:14:53 2003
###########



Starting the system again resulted in:

<4>reiserfs: found format "3.5" with standard journal
<4>reiserfs: checking transaction log (lvm(58,4)) for (lvm(58,4))
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26532716, limit=26529792
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26532956, limit=26529792
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26530184, limit=26529792
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26533100, limit=26529792
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26533256, limit=26529792
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26533396, limit=26529792
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26533488, limit=26529792
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26533684, limit=26529792
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26533792, limit=26529792
<6>attempt to access beyond end of device
<6>3a:04: rw=1, want=26533964, limit=26529792
<4>journal-1226: REPLAY FAILURE, fsck required! buffer write failed
<4>Replay Failure, unable to mount
<4>sh-2022: reiserfs_read_super: unable to initialize journal space
<4>reiserfs: found format "3.5" with standard journal
<4>reiserfs: checking transaction log (lvm(58,0)) for (lvm(58,0))
<4>reiserfs: using ordered data mode
<4>Using r5 hash to sort names

Do you have any idea?

Karl


