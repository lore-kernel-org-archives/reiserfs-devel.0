From: rwhron@earthlink.net
Subject: oops from 2.5.42-mm3 running lilo on reiserfs
Date: Tue, 15 Oct 2002 23:14:40 -0400
Message-ID: <20021016031440.GA257@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11707-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@digeo.com
Cc: reiserfs-list@namesys.com

AMD Athlon 1333
1GB (highmem enabled)
IDE disk
reiserfs filesystems

While running lilo I got this oops:

 kernel BUG at mm/highmem.c:177!
 invalid operand: 0000

 CPU:    0
 EIP:    0060:[<c01325cf>]    Not tainted
 EFLAGS: 00010246
 EIP is at kunmap_high+0xf/0x80
 eax: 00000000   ebx: c195fe70   ecx: c037bb1c   edx: c037bb14
 esi: 00000a00   edi: f6b31df4   ebp: 00001000   esp: f6b63f3c
 ds: 0068   es: 0068   ss: 0068
 Process lilo (pid: 810, threadinfo=f6b62000 task=f7435940)
 Stack: c195fe70 00000a00 c0111f5b c017c633 c195fe70 00000001 f6b31df4 f737d3c0
        00000001 f6b31e50 00000000 c017c560 f6b31df4 f737d3c0 c01448e8 f6b31df4
        f737d3c0 4004cd01 00000001 4004cd01 ffffffe7 f737d3c0 00000001 c0144aeb
 Call Trace:
  [<c0111f5b>] kunmap+0x2b/0x30
  [<c017c633>] reiserfs_unpack+0xc3/0x108
  [<c017c560>] reiserfs_ioctl+0x20/0x30
  [<c01448e8>] file_ioctl+0x148/0x160
  [<c0144aeb>] sys_ioctl+0x1eb/0x220
  [<c0106e0b>] syscall_call+0x7/0xb


-- 
Randy Hron
http://home.earthlink.net/~rwhron/kernel/bigbox.html

