From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: data-logging-20  BUG?!
Date: Sat, 27 Jul 2002 12:10:01 +0200
Message-ID: <3D427179.2070401@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11087-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi all!

I'm currently using:
2.4.19-rc3
+ reiserfs-pending: 01.change_help_wording.diff
                     02.change_menu_wording.diff
                     03.confusing_journal_replay_warning_removal.diff
                     05.hash_on_empty_fs-1.diff
+ mason: 01-relocation-4.diff
          02-commit_super-8-relocation.diff
          03-beta-data-logging-20.diff
          04-write_times.diff
          05-search_reada-4.diff
+ rml: preempt-kernel-rml-2.4.19-rc3-1.patch


After having upgraded from data-logging -19 to -20 and using it for some 
hours I keep getting this bug (kernel BUG at journal.c:724!):


ksymoops 2.4.0 on i686 2.4.19-rc3.  Options used
      -V (specified)
      -k /proc/ksyms (default)
      -l /proc/modules (default)
      -o /lib/modules/2.4.19-rc3/ (default)
      -m /boot/System.map (specified)

Warning (compare_maps): mismatch on symbol packet_socks_nr  , af_packet 
says e09e7124, /lib/modules/2.4.19-rc3/kernel/net/packet/af_packet.o 
says e09e7044.  Ignoring 
/lib/modules/2.4.19-rc3/kernel/net/packet/af_packet.o entry
Warning (compare_maps): mismatch on symbol proc_scsi  , scsi_mod says 
e08f5c10, /lib/modules/2.4.19-rc3/kernel/drivers/scsi/scsi_mod.o says 
e08f5554.  Ignoring 
/lib/modules/2.4.19-rc3/kernel/drivers/scsi/scsi_mod.o entry
Warning (compare_maps): mismatch on symbol scsi_devicelist  , scsi_mod 
says e08f5c3c, /lib/modules/2.4.19-rc3/kernel/drivers/scsi/scsi_mod.o 
says e08f5580.  Ignoring 
/lib/modules/2.4.19-rc3/kernel/drivers/scsi/scsi_mod.o entry
Warning (compare_maps): mismatch on symbol scsi_hostlist  , scsi_mod 
says e08f5c38, /lib/modules/2.4.19-rc3/kernel/drivers/scsi/scsi_mod.o 
says e08f557c.  Ignoring 
/lib/modules/2.4.19-rc3/kernel/drivers/scsi/scsi_mod.o entry
Warning (compare_maps): mismatch on symbol scsi_hosts  , scsi_mod says 
e08f5c40, /lib/modules/2.4.19-rc3/kernel/drivers/scsi/scsi_mod.o says 
e08f5584.  Ignoring 
/lib/modules/2.4.19-rc3/kernel/drivers/scsi/scsi_mod.o entry
kernel BUG at journal.c:724!
invalid operand: 0000
CPU:    0
EIP:    0010:[<c0176f8a>]    Tainted: PF
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010202
eax: df51ea34   ebx: df51e9e0   ecx: e090d060   edx: c15c0400
esi: 00000000   edi: c15c0400   ebp: 00000c89   esp: ccd9fda4
ds: 0018   es: 0018   ss: 0018
Process kdeinit (pid: 2639, stackpage=ccd9f000)
Stack: 00000014 00000000 00000014 df51e9e0 df51e9e0 c0177485 c15c0400 
00000282
        00000000 00000000 c017768d c15c0400 df51e9e0 00000001 df51e9e0 
00000000
        00000014 df51e9e0 ce798f74 ce798f64 00000000 00000000 00000000 
c0177fc7
Call Trace:    [<c0177485>] [<c017768d>] [<c0177fc7>] [<c017b048>] 
[<c017b90a>]
   [<c017a676>] [<c01608ec>] [<c0140f74>] [<c014111b>] [<c0135c4b>] 
[<c0135f9b>]
   [<c0108843>]
Code: 0f 0b d4 02 55 ea 21 c0 e9 1a 03 00 00 83 7b 08 00 75 13 0f

 >>EIP; c0176f8a <flush_commit_list+42/374>   <=====
Trace; c0177485 <update_journal_header_block+15/2c>
Trace; c017768d <flush_journal_list+e9/534>
Trace; c0177fc7 <flush_used_journal_lists+97/a4>
Trace; c017b048 <flush_old_journal_lists+34/40>
Trace; c017b90a <do_journal_end+8b6/a54>
Trace; c017a676 <journal_end+ba/c4>
Trace; c01608ec <reiserfs_create+150/160>
Trace; c0140f74 <vfs_create+94/f0>
Trace; c014111b <open_namei+14b/558>
Trace; c0135c4b <filp_open+3b/5c>
Trace; c0135f9b <sys_open+37/98>
Trace; c0108843 <system_call+33/38>
Code;  c0176f8a <flush_commit_list+42/374>
00000000 <_EIP>:
Code;  c0176f8a <flush_commit_list+42/374>   <=====
    0:   0f 0b                     ud2a      <=====
Code;  c0176f8c <flush_commit_list+44/374>
    2:   d4 02                     aam    $0x2
Code;  c0176f8e <flush_commit_list+46/374>
    4:   55                        push   %ebp
Code;  c0176f8f <flush_commit_list+47/374>
    5:   ea 21 c0 e9 1a 03 00      ljmp   $0x3,$0x1ae9c021
Code;  c0176f96 <flush_commit_list+4e/374>
    c:   00 83 7b 08 00 75         add    %al,0x7500087b(%ebx)
Code;  c0176f9c <flush_commit_list+54/374>
   12:   13 0f                     adc    (%edi),%ecx


5 warnings issued.  Results may not be reliable.


The processes triggering the bug vary from time to time but it always 
leads to a completely unusable system some minutes after hitting the bug.

I didn't have these problems with the same set of patches and 
data-logging-19 (or the previous versions).

It seems I should go back immediately?! ;-)


Best wishes,

Manuel

