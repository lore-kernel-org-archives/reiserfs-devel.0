From: Jochen Haemmerle <thehammer@gmx.net>
Subject: Re: Segmentation Fault when mounting ataraid
Date: Wed, 29 Jan 2003 19:32:31 +0100
Message-ID: <3E381E3F.7080609@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12543-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

So, here it comes again!
Don't care about the warning this is the machine the errror occures!

I hope someone understands that sh*** because I don't!!!

Yesterday I've patched my Kernel to 2.4.21-pre3. The "bug" does not appear!
It seems to be only a "bug" of the 2.4.20 (on 2.4.19 it works too...as I 
allready mentioned here)
For me so far, is the way it works, ok, but if the abitions of someone 
have no limit, your welcome to mail me if you need informations about my PC.

Thx for all helping answers!!

Bye
Jochen Haemmerle




========================================================================
ksymoops 2.4.6 on i686 2.4.20.  Options used
      -V (default)
      -k /proc/ksyms (default)
      -l /proc/modules (default)
      -o /lib/modules/2.4.20/ (default)
      -m /boot/System.map-2.4.20 (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Unable to handle kernel NULL pointer dereference at vitual address 00000004
c01a62c0
*pde = 00000000
Oops: 0002
CPU:   0
EIP:     0010:[<c01a62c0>]        Tainted: P
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010012
eax: 00000000   ebx: c03324f8  ecx: dff188a0   edx: c03324fc
esi: 00000000   edi: c03324f8  ebp: 00000008   esp: d7839d98
Process mount (pid: 327, stackpage=d7839000)
       007c0000 098a9f2d c0332518 00000800 c0332520 c0332518 00000080 
00000000
       003e003f 00000000 c01a6c6c c03324f8 00000000 d7cc54a0 00000008 
00000000
Call Trace:   [<c01a698d>] [<c01a6c6c>][<c01a6ccc>] [<c01a6e27>] 
[<c0172671>]
[<c0173188>] [<c013c712>] [<c014d546>][<c013c8fd>] [<c014e589>] [<c014e842>]
[<c014e6ad>] [<c014ec6f>] [<c0106f17>]
Code: 89 50 04 89 02 c7 01 00 00 00 00 c7 41 04 00 00 00 00 ff 0b


 >>EIP; c01a62c0 <get_request+24/54>   <=====

 >>ebx; c03324f8 <ide_hwifs+858/21e8>
 >>ecx; dff188a0 <_end+1fbca488/20962c48>
 >>edx; c03324fc <ide_hwifs+85c/21e8>
 >>edi; c03324f8 <ide_hwifs+858/21e8>
 >>esp; d7839d98 <_end+174eb980/20962c48>

Trace; c01a698d <__make_request+3f5/5b4>
Trace; c01a6c6c <generic_make_request+120/130>
Trace; c01a6ccc <submit_bh+50/70>
Trace; c01a6e27 <ll_rw_block+13b/1a4>
Trace; c0172671 <read_bitmaps+c1/1ac>
Trace; c0173188 <reiserfs_read_super+120/4a4>
Trace; c013c712 <get_sb_bdev+1de/258>
Trace; c014d546 <alloc_vfsmnt+76/a0>
Trace; c013c8fd <do_kern_mount+55/104>
Trace; c014e589 <do_add_mount+69/138>
Trace; c014e842 <do_mount+146/160>
Trace; c014e6ad <copy_mount_options+55/a4>
Trace; c014ec6f <sys_mount+af/110>
Trace; c0106f17 <system_call+33/38>

Code;  c01a62c0 <get_request+24/54>
00000000 <_EIP>:
Code;  c01a62c0 <get_request+24/54>   <=====
    0:   89 50 04                  mov    %edx,0x4(%eax)   <=====
Code;  c01a62c3 <get_request+27/54>
    3:   89 02                     mov    %eax,(%edx)
Code;  c01a62c5 <get_request+29/54>
    5:   c7 01 00 00 00 00         movl   $0x0,(%ecx)
Code;  c01a62cb <get_request+2f/54>
    b:   c7 41 04 00 00 00 00      movl   $0x0,0x4(%ecx)
Code;  c01a62d2 <get_request+36/54>
   12:   ff 0b                     decl   (%ebx)


1 warning issued.  Results may not be reliable.

