From: Nick Burrett <nick@dsvr.net>
Subject: kernel memory limits
Date: Thu, 13 Nov 2003 13:13:21 +0000
Message-ID: <3FB38371.60101@dsvr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>



Hi,

I'm running standard 2.4.22 kernel, 2xP4 Xeon with 2Gb RAM.

After reaching 127 filesystems on the server, all formatted as reiserfs, 
I now find the following errors are occurring:


reiserfs: found format "3.6" with standard journal
reiserfs: using ordered data mode
loop(7,124):clm-2000, unable to allocate bitmaps for journal lists
Unable to handle kernel NULL pointer dereference at virtual address 00000000
  printing eip:
c01d5397
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c01d5397>]    Not tainted
EFLAGS: 00010202
eax: 00000000   ebx: fdfe6100   ecx: fdfe6100   edx: e977c000
esi: 00000001   edi: 00000000   ebp: f1b37400   esp: d7d7fd88
ds: 0018   es: 0018   ss: 0018
Process mount (pid: 11157, stackpage=d7d7f000)
Stack: c91f3780 fdfe6100 00000001 f1b37400 fdfe6100 c01d5445 f1b37400 
fdfe6100
        00000008 00000001 00000000 c01d558a f1b37400 fdfe60e8 00000163 
00000001
        00000003 fdfe6000 e977c000 00000001 f1b37400 c01d8fb7 f1b37400 
fdfe60e8
Call Trace:    [<c01d5445>] [<c01d558a>] [<c01d8fb7>] [<c011c240>] 
[<c01c8902>]
   [<c0144afa>] [<c0145508>] [<c0145891>] [<c015b4f3>] [<c015b820>] 
[<c015b669>]
   [<c015bd0f>] [<c010770f>]

Code: 8b 34 b8 85 f6 74 59 8b 85 08 01 00 00 ff 88 bc 00 00 00 8b
  reiserfs: found format "3.6" with standard journal
reiserfs: using ordered data mode
loop(7,125):journal-1256: unable to get memory for journal structure
loop(7,125):sh-2022: reiserfs_read_super: unable to initialize journal space


Unfortunately I cannot decode the OOPS because kernel symbols don't 
appear to be exported on kernels with no loadable module support.

I also start to see errors like:

$ iptables -F
iptables: Memory allocation problem

I was hoping to mount 254 filesystems on this server.  Another server 
running ext2 successfully runs with over 1000 filesystems and another 
with ext3 runs 220 filesystems.

This is 100% reproducable. Is there anything I can do about this ?


Regards,


Nick.


-- 
Nick Burrett
Network Engineer, Designer Servers Ltd.   http://www.dsvr.co.uk

