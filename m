From: Brian Minton <brian@minton.name>
Subject: reiserfs crash
Date: Sat, 13 Nov 2004 15:38:35 -0500
Message-ID: <20041113203835.GA9979@bminton.is-a-geek.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22375-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


ksymoops 2.4.9 on i686 2.6.8-1-686.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.6.8-1-686/ (default)
     -m /boot/System.map-2.6.8-1-686 (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Error (regular_file): read_ksyms stat /proc/ksyms failed
No modules in ksyms, skipping objects
No ksyms, skipping lsmod
Nov 13 14:36:51 bminton kernel: kernel BUG at fs/reiserfs/journal.c:518!
Nov 13 14:36:51 bminton kernel: invalid operand: 0000 [#1]
Nov 13 14:36:51 bminton kernel: CPU:    0
Nov 13 14:36:51 bminton kernel: EIP:    0060:[__crc_blk_queue_start_tag+3666037/4471782]    Not tainted
Nov 13 14:36:51 bminton kernel: EFLAGS: 00010286   (2.6.8-1-686) 
Nov 13 14:36:51 bminton kernel: eax: 00000000   ebx: d8f3d10c   ecx: 00000c2c   edx: d8f706e8
Nov 13 14:36:51 bminton kernel: esi: 01018000   edi: 00000000   ebp: d7208400   esp: c8371bd8
Nov 13 14:36:51 bminton kernel: ds: 007b   es: 007b   ss: 0068
Nov 13 14:36:51 bminton kernel: Stack: 00000001 00000000 00000001 d5e4e080 00000000 d8f3b018 c8371c60 d7208400 
Nov 13 14:36:51 bminton kernel:        d894123c d7208400 00000203 00000000 00000001 c8371c18 00000000 b75bcfc3 
Nov 13 14:36:51 bminton kernel:        00000000 00000203 c8371c60 00000000 d7208400 d8941514 c8371ebc 00000203 
Nov 13 14:36:51 bminton kernel: Call Trace:
Warning (Oops_read): Code line not seen, dumping what data is available


>>ebx; d8f3d10c <__crc_raise_softirq+ed6f0/241947>
>>edx; d8f706e8 <__crc_raise_softirq+120ccc/241947>
>>esi; 01018000 <__crc_put_tty_driver+15c4/5f1b4>
>>ebp; d7208400 <__crc_complete_all+1e0f73/44e1b7>
>>esp; c8371bd8 <__crc_tcp_destroy_sock+237f99/546fd3>

Nov 13 14:36:51 bminton kernel: Code: 0f 0b 06 02 04 3d 97 d8 b8 01 00 00 00 eb 98 39 68 04 75 dd 
Using defaults from ksymoops -t elf32-i386 -a i386


Code;  00000000 Before first symbol
00000000 <_EIP>:
Code;  00000000 Before first symbol
   0:   0f 0b                     ud2a   
Code;  00000002 Before first symbol
   2:   06                        push   %es
Code;  00000003 Before first symbol
   3:   02 04 3d 97 d8 b8 01      add    0x1b8d897(,%edi,1),%al
Code;  0000000a Before first symbol
   a:   00 00                     add    %al,(%eax)
Code;  0000000c Before first symbol
   c:   00 eb                     add    %ch,%bl
Code;  0000000e Before first symbol
   e:   98                        cwtl   
Code;  0000000f Before first symbol
   f:   39 68 04                  cmp    %ebp,0x4(%eax)
Code;  00000012 Before first symbol
  12:   75 dd                     jne    fffffff1 <_EIP+0xfffffff1>


2 warnings and 1 error issued.  Results may not be reliable.

Here is the original log:

Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in bloc5535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 12 0x0 SD]
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-4080: reiserfs_free_block: free_block (dm-0:2916352)[dev:blocknr]: bit already cleared
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-4080: reiserfs_free_block: free_block (dm-0:14811136)[dev:blocknr]: bit already cleared
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-4080: reiserfs_free_block: free_block (dm-0:8224768)[dev:blocknr]: bit already cleared
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_leaf: item location seems wrong (second one): *3.6* [1260493 1260494 0x0 SD], item_len 45, item_location 1488, free_space(entry_count) 65535
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 2064384. Fsck?
Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_leaf: item location seems wrong (second one): *3.6* [1260489 1260647 0x0 SD], item_len 236, item_location 1488, free_space(entry_count) 65535
Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 2064384. Fsck?
Nov 13 14:36:51 bminton kernel: ReiserFS: dm-0: warning: vs-4080: reiserfs_free_block: free_block (dm-0:16875520)[dev:blocknr]: bit already cleared
Nov 13 14:36:51 bminton kernel: ------------[ cut here ]------------
Nov 13 14:36:51 bminton kernel: kernel BUG at fs/reiserfs/journal.c:518!
Nov 13 14:36:51 bminton kernel: invalid operand: 0000 [#1]
Nov 13 14:36:51 bminton kernel: PREEMPT 
Nov 13 14:36:51 bminton kernel: Modules linked in: ds yenta_socket pcmcia_core nbd deflate zlib_deflate twofish serpent aes_i586 blowfish des sha256 sha1 crypto_null af_key af_packet lp binfmt_misc snd_ymfpci snd_opl3_lib snd_hwdep thermal fan button processor ac battery ipv6 8139cp snd_intel8x0 snd_ac97_codec snd_pcm_oss snd_mixer_oss snd_pcm snd_timer snd_page_alloc snd_mpu401_uart snd_rawmidi snd_seq_device snd soundcore shpchp pciehp pci_hotplug ehci_hcd joydev wacom usbhid sd_mod usb_storage scsi_mod uhci_hcd usbcore intel_agp agpgart floppy tsdev mousedev psmouse analog gameport parport_pc parport pcspkr rtc evdev decnet md dm_mod capability commoncap nvram 8139too mii ne2k_pci 8390 crc32 vfat fat isofs xfs reiserfs ext2 ext3 jbd mbcache ide_generic piix ide_disk ide_core unix font vesafb cfbcopyarea cfbimgblt cfbfillrect
Nov 13 14:36:51 bminton kernel: CPU:    0
Nov 13 14:36:51 bminton kernel: EIP:    0060:[__crc_blk_queue_start_tag+3666037/4471782]    Not tainted
Nov 13 14:36:51 bminton kernel: EFLAGS: 00010286   (2.6.8-1-686) 
Nov 13 14:36:51 bminton kernel: EIP is at reiserfs_in_journal+0x134/0x1a0 [reiserfs]
Nov 13 14:36:51 bminton kernel: eax: 00000000   ebx: d8f3d10c   ecx: 00000c2c   edx: d8f706e8
Nov 13 14:36:51 bminton kernel: esi: 01018000   edi: 00000000   ebp: d7208400   esp: c8371bd8
Nov 13 14:36:51 bminton kernel: ds: 007b   es: 007b   ss: 0068
Nov 13 14:36:51 bminton kernel: Process rsync (pid: 10315, threadinfo=c8370000 task=c0672840)
Nov 13 14:36:51 bminton kernel: Stack: 00000001 00000000 00000001 d5e4e080 00000000 d8f3b018 c8371c60 d7208400 
Nov 13 14:36:51 bminton kernel:        d894123c d7208400 00000203 00000000 00000001 c8371c18 00000000 b75bcfc3 
Nov 13 14:36:51 bminton kernel:        00000000 00000203 c8371c60 00000000 d7208400 d8941514 c8371ebc 00000203 
Nov 13 14:36:51 bminton kernel: Call Trace:
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3515021/4471782] scan_bitmap_block+0x23c/0x280 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3515749/4471782] scan_bitmap+0x1b4/0x230 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3520664/4471782] reiserfs_allocate_blocknrs+0x267/0x5b0 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3573966/4471782] reiserfs_allocate_blocks_for_region+0x24d/0x1620 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3645524/4471782] search_for_position_by_key+0x1d3/0x400 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [add_to_page_cache+104/176] add_to_page_cache+0x68/0xb0
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3549403/4471782] make_cpu_key+0x5a/0x70 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3582874/4471782] reiserfs_prepare_file_region_for_write+0x5f9/0x9e0 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3585251/4471782] reiserfs_file_write+0x562/0x7c0 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3540950/4471782] reiserfs_create+0x145/0x1d0 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [__crc_blk_queue_start_tag+3571737/4471782] reiserfs_setattr+0x1e8/0x230 [reiserfs]
Nov 13 14:36:51 bminton kernel:  [open_namei+166/1536] open_namei+0xa6/0x600
Nov 13 14:36:51 bminton kernel:  [notify_change+443/608] notify_change+0x1bb/0x260
Nov 13 14:36:51 bminton kernel:  [vfs_write+237/352] vfs_write+0xed/0x160
Nov 13 14:36:51 bminton kernel:  [sys_write+81/128] sys_write+0x51/0x80
Nov 13 14:36:51 bminton kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Nov 13 14:36:51 bminton kernel: Code: 0f 0b 06 02 04 3d 97 d8 b8 01 00 00 00 eb 98 39 68 04 75 dd 
Nov 13 14:36:51 bminton kernel:  <4>ReiserFS: dm-7: warning: clm-2100: nesting info a different FS
Nov 13 14:36:51 bminton kernel: ReiserFS: dm-7: warning: clm-2100: nesting info a different FS

-- 
Brian Minton             |    OpenPGP fingerprint:     
brian@minton.name        |    81BE 3A84 A502 ABDD B2CC
http://brian.minton.name |    4BFD 7227 8820 5703 7472   
Live long, and prosper longer!       KeyID: 0x57037472
