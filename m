From: Anders Widman <andewid@tnonline.net>
Subject: ReiserFS BUG.
Date: Mon, 22 Apr 2002 12:17:57 +0200
Message-ID: <1775613750.20020422121757@tnonline.net>
Reply-To: ReiserFS List <reiserfs-list@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

  I have installed kernel 2.4.19-7 with reiserfstools 3.x.1c-pre2.

  When Running "reiserfsck --fix-fixable" it ends with:
  
<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1c-pre2

Will check consistency of the filesystem on /dev/Server/FTPRoot
Will fix what can be fixed w/o --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --fix-fixable started at Mon Apr 22 10:44:52 2002
###########
Replaying journal..
0 transactions replayed
Checking S+tree..ok                                     
Comparing bitmaps..ok
Checking Semantic tree...
/lost+foundsemantic_rebuild.c 448 get_next_directory_item                      
get_next_directory_item: 2 3921 0x1 DIR (3) is not found
Aborted

----------
When I try to use the fs I get a kerneldump:

  
Apr 22 11:08:10 server kernel: reiserfs: checking transaction log (device 3a:00) ...
Apr 22 11:08:10 server kernel: Using r5 hash to sort names
Apr 22 11:08:10 server kernel: ReiserFS version 3.6.25
Apr 22 11:09:24 server kernel: kernel BUG at namei.c:1160!
Apr 22 11:09:24 server kernel: invalid operand: 0000
Apr 22 11:09:24 server kernel: CPU:    0
Apr 22 11:09:24 server kernel: EIP:    0010:[reiserfs_rename+628/2160]    Not tainted
Apr 22 11:09:24 server kernel: EIP:    0010:[<c018c334>]    Not tainted
Apr 22 11:09:24 server kernel: EFLAGS: 00010297
Apr 22 11:09:24 server kernel: eax: 00000000   ebx: d755bd1c   ecx: 075bba00   edx: d755be0c
Apr 22 11:09:24 server kernel: esi: ffffffff   edi: d755bc7c   ebp: dd8a3580   esp: d755bc40
Apr 22 11:09:24 server kernel: ds: 0018   es: 0018   ss: 0018
Apr 22 11:09:24 server kernel: Process smbd (pid: 2086, stackpage=d755b000)
Apr 22 11:09:24 server kernel: Stack: cbd380c0 c768f08c d755bca8 d755bd48 00000000 00000000 00000000 c027ce28
Apr 22 11:09:24 server kernel:        00000001 00000039 000f6571 d8218400 00000301 00001000 c15dc044 c712dbc0
Apr 22 11:09:24 server kernel:        00000008 d48fa0d8 00000001 d48fa488 00000008 00000002 d48fa5a8 00000000
Apr 22 11:09:24 server kernel: Call Trace: [ide_dmaproc+340/624] [do_rw_disk+993/1376] [start_request+368/560] [ide_do_request+2$
Apr 22 11:09:24 server kernel: Call Trace: [<c01da374>] [<c01e0b91>] [<c01d46b0>] [<c01d48ec>] [<c0141b40>]
Apr 22 11:09:24 server kernel:    [handle_mm_fault+190/208] [vfs_rename+137/144] [cached_lookup+16/80] [lookup_hash+73/144] [sys$
Apr 22 11:09:24 server kernel:    [<c0127ace>] [<c0142129>] [<c013f680>] [<c0140439>] [<c014232a>] [<c013f43d>]
Apr 22 11:09:24 server kernel:    [sys_fcntl64+72/144] [system_call+51/56]
Apr 22 11:09:24 server kernel:    [<c0142f28>] [<c010899b>]
Apr 22 11:09:24 server kernel:
Apr 22 11:09:24 server kernel: Code: 0f 0b 88 04 6e 88 27 c0 8b 84 24 cc 01 00 00 8b 94 c4 d0 01


I forgot to add that I just made a "rebuild-sb, and rebuild-tree" to
recover data from the volume. It created about 50-100 folders. But
when I tried to enter, or move a folder it would disappear (the
kernel-dump). That's why I ran fsck again.

//Anders

