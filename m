From: Jochen Haemmerle <thehammer@gmx.net>
Subject: Re: Re: Segmentation Fault when mounting ataraid
Date: Tue, 28 Jan 2003 21:49:29 +0100
Message-ID: <3E36ECD9.6080103@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Well, down there it is!!
thx for the quick answers

Bye,

Jochen



Manuel Krause wrote:

 > On 01/27/2003 11:30 PM, Jochen Haemmerle wrote:
 >
 >> Hello!
 >>
 >> When I try to mount my reiserfs partition on a HPT370 Stripe I get a 
Segmentation Fault. All other partitions (reiserfs of cource) work fine.
 >>
 >> My kernel is the 2.4.20 from Kernel.org
 >> The PC is a Dual PIII 866 with Via-Apollo Chipset
 >> The Harddisks are 2 Maxtor 80GB
 >> ACPI is turned off !
 >>
 >> I don't know if this error depends on reiserfs, but maybe someone 
can help me!
 >>
 >> Best Regards
 >>
 >> Jochen Haemmerle
 >>
 >
 > Can you process it through something like:
 > "cat this-segfault.txt | ksymoops -m 
/boot/System.map-you.had@segfault" and post the result ... while 
awaiting the developers' answer?!
 >
 > This would provide essentially more info for them (even if they knew 
the BUG already), AFAIK.
 >
 > Bye,
 >
 > Manuel
 >



guardian@viking:~$ cat segfault.txt | ksymoops -m /boot/System.map-2.4.20
ksymoops 2.4.6 on i686 2.4.20.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.20/ (default)
     -m /boot/System.map-2.4.20 (specified)

Unable to handle kernel NULL pointer dereference at vitual address 00000004
c01a62c0
*pde = 00000000
Oops: 0002
CPU:   0
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
Using defaults from ksymoops -t elf32-i386 -a i386


 >>ebx; c03324f8 <parse_options+124/1c8>
 >>edx; c03324fc <parse_options+128/1c8>
 >>edi; c03324f8 <parse_options+124/1c8>

Trace; c01a698d <reiserfs_super_in_proc+69/254>
Trace; c01a6c6c <reiserfs_per_level_in_proc+f4/134>
Trace; c01a6ccc <reiserfs_bitmap_in_proc+20/a0>
Trace; c01a6e27 <reiserfs_on_disk_super_in_proc+db/f0>
Trace; c0172671 <nlm_shutdown_hosts+e9/11c>
Trace; c0173188 <nlmsvc_lock+c8/340>
Trace; c013c712 <sys_getdents64+7e/b3>
Trace; c014d546 <notesize+1e/2c>
Trace; c013c8fd <max_select_fd+9d/a4>
Trace; c014e589 <handle_ide_mess+25/194>
Trace; c014e842 <msdos_partition+14a/2f8>
Trace; c014e6ad <handle_ide_mess+149/194>
Trace; c014ec6f <__load_block_bitmap+17f/198>
Trace; c0106f17 <show_stack+7/78>

Code;  00000000 Before first symbol
00000000 <_EIP>:
Code;  00000000 Before first symbol
   0:   89 50 04                  mov    %edx,0x4(%eax)
Code;  00000003 Before first symbol
   3:   89 02                     mov    %eax,(%edx)
Code;  00000005 Before first symbol
   5:   c7 01 00 00 00 00         movl   $0x0,(%ecx)
Code;  0000000b Before first symbol
   b:   c7 41 04 00 00 00 00      movl   $0x0,0x4(%ecx)
Code;  00000012 Before first symbol
  12:   ff 0b                     decl   (%ebx)









