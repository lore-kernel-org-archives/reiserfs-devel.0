From: Sean Plaice <splaice@gmail.com>
Subject: Re: reiserfs errors and kernel panic, are they related?
Date: Sat, 28 Aug 2004 04:34:21 -0700
Message-ID: <ae9bd76a040828043424db35a@mail.gmail.com>
References: <ae9bd76a04082615237cd779f3@mail.gmail.com> <ae9bd76a0408261828335c3f1e@mail.gmail.com>
Reply-To: Sean Plaice <splaice@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20978-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ae9bd76a0408261828335c3f1e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 26 Aug 2004 18:28:37 -0700, Sean Plaice <splaice@gmail.com> wrote:
> Hello,
> I just spent the last couple hours in our dev environment simulating
> backing up and restoring reiserfs partitions using dd_rescue. So
> please ignore the questions regarding best practices for repairing
> file system corruption via --rebuild-tree.
> 
> When I have an available outage window I will attempt to repair the
> file system and confirm if the kernel panic can be reproduced. I will
> have a serial console available at that time so I can capture the
> complete panic message.

Hello,
I was able to repair the filesystem that was reporting the corruption
tonight using dd_rescue and --rebuild-tree. Repairing the filesystem
also fixed the problem with the kernel panics. I have not been able to
reproduce the kernel panic since I repaired the filesystem.

Before I repaired the filesystem I was able to get a full copy of the
oops with a serial console.

Below is the full oops, and the oops ran through ksymoops. I have
never used ksymoops before, but these are the best results (least
warnings) I was able to acheive. I am unsure why it complains about
the modules being different, I used the same modules that are
contained in the initrd that my system uses at boot.

I am sure the level of interest for reiserfs 3.6 stuff is at an all
time low with reiserf4 being added the main tree, but if anyone finds
any of this information worth debugging and would like further
information from me please let me know. I still have an image the file
system in its corrupted state if it is needed to debug this problem.

Take care.

Raw oops message:
Unable to handle kernel paging request at virtual address f8000000
 printing eip:
f884c45a
*pde = 00000000
Oops: 0000
tg3 floppy sg microcode reiserfs aacraid sd_mod scsi_mod  
CPU:    0
EIP:    0060:[<f884c45a>]    Not tainted
EFLAGS: 00010203

EIP is at reiserfs_readdir [reiserfs] 0x21a (2.4.22-1.2199.nptlsmp)
eax: 00000000   ebx: ffffddaf   ecx: 3f70013d   edx: 00000000
esi: f7fffffe   edi: f1695758   ebp: ef297ea0   esp: ef297e08
ds: 0068   es: 0068   ss: 0068
Process updatedb (pid: 2113, stackpage=ef297000)
Stack: ef297ec0 ef297ee0 00000000 0db00000 00000000 65636552 00000000 ffff7ee8 
       00000000 00000000 f5c300c0 0db00001 00000000 f5c00228 00002fc3 00000016 
       f729fe00 f70d7880 f729fe00 00000016 f5c00228 00002fb7 f5c00490 00000008 
Call Trace:   [<c015370c>] balance_dirty [kernel] 0xc (0xef297e80)
[<c01544f4>] __block_commit_write [kernel] 0x84 (0xef297e8c)


Code: f3 a5 f6 c3 02 74 02 66 a5 f6 c3 01 74 01 a4 8b 44 24 20 c7 
 <1>Unable to handle kernel paging request at virtual address b7b0f7d7
 printing eip:
c013b540
*pde = 00000000
Oops: 0000
tg3 floppy sg microcode reiserfs aacraid sd_mod scsi_mod  
CPU:    0
EIP:    0060:[<c013b540>]    Not tainted
EFLAGS: 00010286

EIP is at lock_vma_mappings [kernel] 0x10 (2.4.22-1.2199.nptlsmp)
eax: b7b0f7cf   ebx: f68dfd00   ecx: f6dce3b8   edx: 00000000
esi: f6dce380   edi: 00015000   ebp: 0027f000   esp: ef297c98
ds: 0068   es: 0068   ss: 0068
Process updatedb (pid: 2113, stackpage=ef297000)
Stack: c013cd16 f68dfd00 00000000 00000000 f167bb00 f6dce380 f6dce380 ef296000 
       0000000b c0121c6c f6dce380 c0413a00 f6dce380 00000000 ef296000 c0128436 
       f6dce380 00000068 ef297dd4 00004e00 c0004e00 f8000000 c010a224 0000000b 
Call Trace:   [<c013cd16>] exit_mmap [kernel] 0x96 (0xef297c98)
[<c0121c6c>] mmput [kernel] 0x6c (0xef297cbc)
[<c0128436>] do_exit [kernel] 0x136 (0xef297cd4)
[<c010a224>] die [kernel] 0x94 (0xef297cf0)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297d04)
[<c011ed70>] scheduler_tick [kernel] 0x120 (0xef297d38)
[<f8859224>] is_tree_node [reiserfs] 0x74 (0xef297d40)
[<f88597c4>] search_by_key [reiserfs] 0x594 (0xef297d54)
[<c012e90e>] update_process_times [kernel] 0x3e (0xef297d94)
[<c011a97c>] smp_apic_timer_interrupt [kernel] 0x14c (0xef297db0)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297dc0)
[<c0109c18>] error_code [kernel] 0x34 (0xef297dc8)
[<f884c45a>] reiserfs_readdir [reiserfs] 0x21a (0xef297dfc)
[<c015370c>] balance_dirty [kernel] 0xc (0xef297e80)
[<c01544f4>] __block_commit_write [kernel] 0x84 (0xef297e8c)


Code: 8b 40 08 8b 90 c0 00 00 00 85 d2 74 0a f0 fe 4a 2c 0f 88 e3 
 <1>Unable to handle kernel paging request at virtual address 5c20c1cc
 printing eip:
c016d34d
*pde = 00000000
Oops: 0000
tg3 floppy sg microcode reiserfs aacraid sd_mod scsi_mod  
CPU:    0
EIP:    0060:[<c016d34d>]    Not tainted
EFLAGS: 00010286

EIP is at dnotify_flush [kernel] 0x1d (2.4.22-1.2199.nptlsmp)
eax: f108ad80   ebx: f186f600   ecx: f653c880   edx: 5c20c19a
esi: f65d5780   edi: f186f600   ebp: 00000000   esp: ef297b18
ds: 0068   es: 0068   ss: 0068
Process updatedb (pid: 2113, stackpage=ef297000)
Stack: f654c300 f654c300 f186f600 00000000 f65d5780 c015079b f186f600 f65d5780 
       00000003 00000004 f65d5780 00000001 c01276fc f186f600 f65d5780 00000000 
       00000000 ef296000 0000000b c012846a f65d5780 00000068 ef297c64 00000000 
Call Trace:   [<c015079b>] filp_close [kernel] 0x7b (0xef297b2c)
[<c01276fc>] put_files_struct [kernel] 0x6c (0xef297b48)
[<c012846a>] do_exit [kernel] 0x16a (0xef297b64)
[<c010a224>] die [kernel] 0x94 (0xef297b80)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297b94)
[<c01beb41>] scrup [kernel] 0x121 (0xef297bac)
[<c01beb41>] scrup [kernel] 0x121 (0xef297bd8)
[<c01beb41>] scrup [kernel] 0x121 (0xef297c08)
[<c0206863>] vgacon_cursor [kernel] 0xf3 (0xef297c1c)
[<c01c3ce3>] poke_blanked_console [kernel] 0x53 (0xef297c3c)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297c50)
[<c0109c18>] error_code [kernel] 0x34 (0xef297c58)
[<c013b540>] lock_vma_mappings [kernel] 0x10 (0xef297c8c)
[<c013cd16>] exit_mmap [kernel] 0x96 (0xef297c98)
[<c0121c6c>] mmput [kernel] 0x6c (0xef297cbc)
[<c0128436>] do_exit [kernel] 0x136 (0xef297cd4)
[<c010a224>] die [kernel] 0x94 (0xef297cf0)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297d04)
[<c011ed70>] scheduler_tick [kernel] 0x120 (0xef297d38)
[<f8859224>] is_tree_node [reiserfs] 0x74 (0xef297d40)
[<f88597c4>] search_by_key [reiserfs] 0x594 (0xef297d54)
[<c012e90e>] update_process_times [kernel] 0x3e (0xef297d94)
[<c011a97c>] smp_apic_timer_interrupt [kernel] 0x14c (0xef297db0)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297dc0)
[<c0109c18>] error_code [kernel] 0x34 (0xef297dc8)
[<f884c45a>] reiserfs_readdir [reiserfs] 0x21a (0xef297dfc)
[<c015370c>] balance_dirty [kernel] 0xc (0xef297e80)
[<c01544f4>] __block_commit_write [kernel] 0x84 (0xef297e8c)


Code: 0f b7 42 32 25 00 f0 ff ff 66 3d 00 40 74 14 8b 5c 24 08 8b 
 <1>Unable to handle kernel paging request at virtual address 00020503
 printing eip:
c0130a20
*pde = 36509001
*pte = 00000000
Oops: 0002
tg3 floppy sg microcode reiserfs aacraid sd_mod scsi_mod  
CPU:    0
EIP:    0060:[<c0130a20>]    Not tainted
EFLAGS: 00010002

EIP is at do_notify_parent [kernel] 0xb0 (2.4.22-1.2199.nptlsmp)
eax: 0001ffff   ebx: ef296000   ecx: 0000000b   edx: ef296000
esi: 00000011   edi: f7ffa000   ebp: ef296068   esp: ef29790c
ds: 0068   es: 0068   ss: 0068
Process updatedb (pid: 2113, stackpage=ef297000)
Stack: 00000000 00000042 00000001 c01beb41 0001ffff 00000002 00000011 00000000 
       00040002 00000841 00000000 0000000b 0000000b 00000049 00000000 00000001 
       c01c3ce3 c04973b4 0001290e c01c2f76 00000000 c00b9cc0 00000001 00000018 
Call Trace:   [<c01beb41>] scrup [kernel] 0x121 (0xef297918)
[<c01c3ce3>] poke_blanked_console [kernel] 0x53 (0xef29794c)
[<c01c2f76>] vt_console_print [kernel] 0x226 (0xef297958)
[<c012e90e>] update_process_times [kernel] 0x3e (0xef297990)
[<c0127e26>] exit_notify [kernel] 0x266 (0xef2979b4)
[<c0168400>] dput [kernel] 0x30 (0xef2979d0)
[<c012860e>] do_exit [kernel] 0x30e (0xef2979e4)
[<c010a224>] die [kernel] 0x94 (0xef297a00)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297a14)
[<f88637b7>] do_journal_end [reiserfs] 0xd7 (0xef297a2c)
[<f88624d1>] do_journal_begin_r [reiserfs] 0x241 (0xef297a44)
[<f886d8ec>] .LC32 [reiserfs] 0x1e (0xef297a48)
[<f883f927>] _reiserfs_free_block [reiserfs] 0x117 (0xef297a5c)
[<f8862a27>] journal_end [reiserfs] 0x27 (0xef297a8c)
[<f884bba4>] reiserfs_file_release [reiserfs] 0xb4 (0xef297aa0)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297ad0)
[<c0109c18>] error_code [kernel] 0x34 (0xef297ad8)
[<c016d34d>] dnotify_flush [kernel] 0x1d (0xef297b0c)
[<c015079b>] filp_close [kernel] 0x7b (0xef297b2c)
[<c01276fc>] put_files_struct [kernel] 0x6c (0xef297b48)
[<c012846a>] do_exit [kernel] 0x16a (0xef297b64)
[<c010a224>] die [kernel] 0x94 (0xef297b80)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297b94)
[<c01beb41>] scrup [kernel] 0x121 (0xef297bac)
[<c01beb41>] scrup [kernel] 0x121 (0xef297bd8)
[<c01beb41>] scrup [kernel] 0x121 (0xef297c08)
[<c0206863>] vgacon_cursor [kernel] 0xf3 (0xef297c1c)
[<c01c3ce3>] poke_blanked_console [kernel] 0x53 (0xef297c3c)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297c50)
[<c0109c18>] error_code [kernel] 0x34 (0xef297c58)
[<c013b540>] lock_vma_mappings [kernel] 0x10 (0xef297c8c)
[<c013cd16>] exit_mmap [kernel] 0x96 (0xef297c98)
[<c0121c6c>] mmput [kernel] 0x6c (0xef297cbc)
[<c0128436>] do_exit [kernel] 0x136 (0xef297cd4)
[<c010a224>] die [kernel] 0x94 (0xef297cf0)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297d04)
[<c011ed70>] scheduler_tick [kernel] 0x120 (0xef297d38)
[<f8859224>] is_tree_node [reiserfs] 0x74 (0xef297d40)
[<f88597c4>] search_by_key [reiserfs] 0x594 (0xef297d54)
[<c012e90e>] update_process_times [kernel] 0x3e (0xef297d94)
[<c011a97c>] smp_apic_timer_interrupt [kernel] 0x14c (0xef297db0)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297dc0)
[<c0109c18>] error_code [kernel] 0x34 (0xef297dc8)
[<f884c45a>] reiserfs_readdir [reiserfs] 0x21a (0xef297dfc)
[<c015370c>] balance_dirty [kernel] 0xc (0xef297e80)
[<c01544f4>] __block_commit_write [kernel] 0x84 (0xef297e8c)


Code: f0 fe 88 04 05 00 00 0f 88 d5 20 00 00 83 fe 11 0f 84 0d 04

Ksymoops message:
ksymoops 2.4.9 on i686 2.4.22-1.2199.nptlsmp.  Options used
     -v /lib/modules/2.4.22-1.2199.nptlsmp/vmlinux (specified)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.22-1.2199.nptlsmp/ (default)
     -m /boot/System.map-2.4.22-1.2199.nptlsmp (specified)

Warning (read_vmlinux): no kernel symbols in vmlinux, is /lib/modules/2.4.22-1.2
199.nptlsmp/vmlinux a valid vmlinux file?
Warning (expand_objects): object /lib/reiserfs.o for module reiserfs has changed
 since load
Warning (expand_objects): object /lib/aacraid.o for module aacraid has changed s
ince load
Warning (expand_objects): object /lib/sd_mod.o for module sd_mod has changed sin
ce load
Warning (expand_objects): object /lib/scsi_mod.o for module scsi_mod has changed
 since load
Unable to handle kernel paging request at virtual address f8000000
f884c45a
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0060:[<f884c45a>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010203
eax: 00000000   ebx: ffffddaf   ecx: 3f70013d   edx: 00000000
esi: f7fffffe   edi: f1695758   ebp: ef297ea0   esp: ef297e08
ds: 0068   es: 0068   ss: 0068
Process updatedb (pid: 2113, stackpage=ef297000)
Stack: ef297ec0 ef297ee0 00000000 0db00000 00000000 65636552 00000000 ffff7ee8
       00000000 00000000 f5c300c0 0db00001 00000000 f5c00228 00002fc3 00000016
       f729fe00 f70d7880 f729fe00 00000016 f5c00228 00002fb7 f5c00490 00000008
Call Trace:   [<c015370c>] balance_dirty [kernel] 0xc (0xef297e80)
[<c01544f4>] __block_commit_write [kernel] 0x84 (0xef297e8c)
Code: f3 a5 f6 c3 02 74 02 66 a5 f6 c3 01 74 01 a4 8b 44 24 20 c7


>>EIP; f884c45a <[reiserfs]reiserfs_readdir+21a/4e0>   <=====

>>esi; f7fffffe <_end+37b31286/3833e2e8>
>>edi; f1695758 <_end+311c69e0/3833e2e8>
>>ebp; ef297ea0 <_end+2edc9128/3833e2e8>
>>esp; ef297e08 <_end+2edc9090/3833e2e8>

Trace; c015370c <balance_dirty+c/40>
Trace; c01544f4 <__block_commit_write+84/d0>

Code;  f884c45a <[reiserfs]reiserfs_readdir+21a/4e0>
00000000 <_EIP>:
Code;  f884c45a <[reiserfs]reiserfs_readdir+21a/4e0>   <=====
   0:   f3 a5                     repz movsl %ds:(%esi),%es:(%edi)   <=====
Code;  f884c45c <[reiserfs]reiserfs_readdir+21c/4e0>
   2:   f6 c3 02                  test   $0x2,%bl
Code;  f884c45f <[reiserfs]reiserfs_readdir+21f/4e0>
   5:   74 02                     je     9 <_EIP+0x9>
Code;  f884c461 <[reiserfs]reiserfs_readdir+221/4e0>
   7:   66 a5                     movsw  %ds:(%esi),%es:(%edi)
Code;  f884c463 <[reiserfs]reiserfs_readdir+223/4e0>
   9:   f6 c3 01                  test   $0x1,%bl
Code;  f884c466 <[reiserfs]reiserfs_readdir+226/4e0>
   c:   74 01                     je     f <_EIP+0xf>
Code;  f884c468 <[reiserfs]reiserfs_readdir+228/4e0>
   e:   a4                        movsb  %ds:(%esi),%es:(%edi)
Code;  f884c469 <[reiserfs]reiserfs_readdir+229/4e0>
   f:   8b 44 24 20               mov    0x20(%esp,1),%eax
Code;  f884c46d <[reiserfs]reiserfs_readdir+22d/4e0>
  13:   c7 00 00 00 00 00         movl   $0x0,(%eax)

 <1>Unable to handle kernel paging request at virtual address b7b0f7d7
c013b540
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0060:[<c013b540>]    Not tainted
EFLAGS: 00010286
eax: b7b0f7cf   ebx: f68dfd00   ecx: f6dce3b8   edx: 00000000
esi: f6dce380   edi: 00015000   ebp: 0027f000   esp: ef297c98
ds: 0068   es: 0068   ss: 0068
Process updatedb (pid: 2113, stackpage=ef297000)
Stack: c013cd16 f68dfd00 00000000 00000000 f167bb00 f6dce380 f6dce380 ef296000
       0000000b c0121c6c f6dce380 c0413a00 f6dce380 00000000 ef296000 c0128436
       f6dce380 00000068 ef297dd4 00004e00 c0004e00 f8000000 c010a224 0000000b
Call Trace:   [<c013cd16>] exit_mmap [kernel] 0x96 (0xef297c98)
[<c0121c6c>] mmput [kernel] 0x6c (0xef297cbc)
[<c0128436>] do_exit [kernel] 0x136 (0xef297cd4)
[<c010a224>] die [kernel] 0x94 (0xef297cf0)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297d04)
[<c011ed70>] scheduler_tick [kernel] 0x120 (0xef297d38)
[<f8859224>] is_tree_node [reiserfs] 0x74 (0xef297d40)
[<f88597c4>] search_by_key [reiserfs] 0x594 (0xef297d54)
[<c012e90e>] update_process_times [kernel] 0x3e (0xef297d94)
[<c011a97c>] smp_apic_timer_interrupt [kernel] 0x14c (0xef297db0)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297dc0)
[<c0109c18>] error_code [kernel] 0x34 (0xef297dc8)
[<f884c45a>] reiserfs_readdir [reiserfs] 0x21a (0xef297dfc)
[<c015370c>] balance_dirty [kernel] 0xc (0xef297e80)
[<c01544f4>] __block_commit_write [kernel] 0x84 (0xef297e8c)
Code: 8b 40 08 8b 90 c0 00 00 00 85 d2 74 0a f0 fe 4a 2c 0f 88 e3


>>EIP; c013b540 <lock_vma_mappings+10/30>   <=====

>>ebx; f68dfd00 <_end+36410f88/3833e2e8>
>>ecx; f6dce3b8 <_end+368ff640/3833e2e8>
>>esi; f6dce380 <_end+368ff608/3833e2e8>
>>esp; ef297c98 <_end+2edc8f20/3833e2e8>

Trace; c013cd16 <exit_mmap+96/180>
Trace; c0121c6c <mmput+6c/100>
Trace; c0128436 <do_exit+136/380>
Trace; c010a224 <die+94/a0>
Trace; c011cc23 <do_page_fault+2a3/564>
Trace; c011ed70 <scheduler_tick+120/460>
Trace; f8859224 <[reiserfs]is_tree_node+74/80>
Trace; f88597c4 <[reiserfs]search_by_key+594/f70>
Trace; c012e90e <update_process_times+3e/50>
Trace; c011a97c <smp_apic_timer_interrupt+14c/150>
Trace; c011c980 <do_page_fault+0/564>
Trace; c0109c18 <error_code+34/3c>
Trace; f884c45a <[reiserfs]reiserfs_readdir+21a/4e0>
Trace; c015370c <balance_dirty+c/40>
Trace; c01544f4 <__block_commit_write+84/d0>

Code;  c013b540 <lock_vma_mappings+10/30>
00000000 <_EIP>:
Code;  c013b540 <lock_vma_mappings+10/30>   <=====
   0:   8b 40 08                  mov    0x8(%eax),%eax   <=====
Code;  c013b543 <lock_vma_mappings+13/30>
   3:   8b 90 c0 00 00 00         mov    0xc0(%eax),%edx
Code;  c013b549 <lock_vma_mappings+19/30>
   9:   85 d2                     test   %edx,%edx
Code;  c013b54b <lock_vma_mappings+1b/30>
   b:   74 0a                     je     17 <_EIP+0x17>
Code;  c013b54d <lock_vma_mappings+1d/30>
   d:   f0 fe 4a 2c               lock decb 0x2c(%edx)
Code;  c013b551 <lock_vma_mappings+21/30>
  11:   0f 88 e3 00 00 00         js     fa <_EIP+0xfa>

 <1>Unable to handle kernel paging request at virtual address 5c20c1cc
c016d34d
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0060:[<c016d34d>]    Not tainted
EFLAGS: 00010286
eax: f108ad80   ebx: f186f600   ecx: f653c880   edx: 5c20c19a
esi: f65d5780   edi: f186f600   ebp: 00000000   esp: ef297b18
ds: 0068   es: 0068   ss: 0068
Process updatedb (pid: 2113, stackpage=ef297000)
Stack: f654c300 f654c300 f186f600 00000000 f65d5780 c015079b f186f600 f65d5780
       00000003 00000004 f65d5780 00000001 c01276fc f186f600 f65d5780 00000000
       00000000 ef296000 0000000b c012846a f65d5780 00000068 ef297c64 00000000
Call Trace:   [<c015079b>] filp_close [kernel] 0x7b (0xef297b2c)
[<c01276fc>] put_files_struct [kernel] 0x6c (0xef297b48)
[<c012846a>] do_exit [kernel] 0x16a (0xef297b64)
[<c010a224>] die [kernel] 0x94 (0xef297b80)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297b94)
[<c01beb41>] scrup [kernel] 0x121 (0xef297bac)
[<c01beb41>] scrup [kernel] 0x121 (0xef297bd8)
[<c01beb41>] scrup [kernel] 0x121 (0xef297c08)
[<c0206863>] vgacon_cursor [kernel] 0xf3 (0xef297c1c)
[<c01c3ce3>] poke_blanked_console [kernel] 0x53 (0xef297c3c)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297c50)
[<c0109c18>] error_code [kernel] 0x34 (0xef297c58)
[<c013b540>] lock_vma_mappings [kernel] 0x10 (0xef297c8c)
[<c013cd16>] exit_mmap [kernel] 0x96 (0xef297c98)
[<c0121c6c>] mmput [kernel] 0x6c (0xef297cbc)
[<c0128436>] do_exit [kernel] 0x136 (0xef297cd4)
[<c010a224>] die [kernel] 0x94 (0xef297cf0)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297d04)
[<c011ed70>] scheduler_tick [kernel] 0x120 (0xef297d38)
[<f8859224>] is_tree_node [reiserfs] 0x74 (0xef297d40)
[<f88597c4>] search_by_key [reiserfs] 0x594 (0xef297d54)
[<c012e90e>] update_process_times [kernel] 0x3e (0xef297d94)
[<c011a97c>] smp_apic_timer_interrupt [kernel] 0x14c (0xef297db0)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297dc0)
[<c0109c18>] error_code [kernel] 0x34 (0xef297dc8)
[<f884c45a>] reiserfs_readdir [reiserfs] 0x21a (0xef297dfc)
[<c015370c>] balance_dirty [kernel] 0xc (0xef297e80)
[<c01544f4>] __block_commit_write [kernel] 0x84 (0xef297e8c)
Code: 0f b7 42 32 25 00 f0 ff ff 66 3d 00 40 74 14 8b 5c 24 08 8b


>>EIP; c016d34d <dnotify_flush+1d/c0>   <=====

>>eax; f108ad80 <_end+30bbc008/3833e2e8>
>>ebx; f186f600 <_end+313a0888/3833e2e8>
>>ecx; f653c880 <_end+3606db08/3833e2e8>
>>esi; f65d5780 <_end+36106a08/3833e2e8>
>>edi; f186f600 <_end+313a0888/3833e2e8>
>>esp; ef297b18 <_end+2edc8da0/3833e2e8>

Trace; c015079b <filp_close+7b/d0>
Trace; c01276fc <put_files_struct+6c/e0>
Trace; c012846a <do_exit+16a/380>
Trace; c010a224 <die+94/a0>
Trace; c011cc23 <do_page_fault+2a3/564>
Trace; c01beb41 <scrup+121/130>
Trace; c01beb41 <scrup+121/130>
Trace; c01beb41 <scrup+121/130>
Trace; c0206863 <vgacon_cursor+f3/1e0>
Trace; c01c3ce3 <poke_blanked_console+53/70>
Trace; c011c980 <do_page_fault+0/564>
Trace; c0109c18 <error_code+34/3c>
Trace; c013b540 <lock_vma_mappings+10/30>
Trace; c013cd16 <exit_mmap+96/180>
Trace; c0121c6c <mmput+6c/100>
Trace; c0128436 <do_exit+136/380>
Trace; c010a224 <die+94/a0>
Trace; c011cc23 <do_page_fault+2a3/564>
Trace; c011ed70 <scheduler_tick+120/460>
Trace; f8859224 <[reiserfs]is_tree_node+74/80>
Trace; f88597c4 <[reiserfs]search_by_key+594/f70>
Trace; c012e90e <update_process_times+3e/50>
Trace; c011a97c <smp_apic_timer_interrupt+14c/150>
Trace; c011c980 <do_page_fault+0/564>
Trace; c0109c18 <error_code+34/3c>
Trace; f884c45a <[reiserfs]reiserfs_readdir+21a/4e0>
Trace; c015370c <balance_dirty+c/40>
Trace; c01544f4 <__block_commit_write+84/d0>

Code;  c016d34d <dnotify_flush+1d/c0>
00000000 <_EIP>:
Code;  c016d34d <dnotify_flush+1d/c0>   <=====
   0:   0f b7 42 32               movzwl 0x32(%edx),%eax   <=====
Code;  c016d351 <dnotify_flush+21/c0>
   4:   25 00 f0 ff ff            and    $0xfffff000,%eax
Code;  c016d356 <dnotify_flush+26/c0>
   9:   66 3d 00 40               cmp    $0x4000,%ax
Code;  c016d35a <dnotify_flush+2a/c0>
   d:   74 14                     je     23 <_EIP+0x23>
Code;  c016d35c <dnotify_flush+2c/c0>
   f:   8b 5c 24 08               mov    0x8(%esp,1),%ebx
Code;  c016d360 <dnotify_flush+30/c0>
  13:   8b 00                     mov    (%eax),%eax

 <1>Unable to handle kernel paging request at virtual address 00020503
c0130a20
*pde = 36509001
Oops: 0002
CPU:    0
EIP:    0060:[<c0130a20>]    Not tainted
EFLAGS: 00010002
eax: 0001ffff   ebx: ef296000   ecx: 0000000b   edx: ef296000
esi: 00000011   edi: f7ffa000   ebp: ef296068   esp: ef29790c
ds: 0068   es: 0068   ss: 0068
Process updatedb (pid: 2113, stackpage=ef297000)
Stack: 00000000 00000042 00000001 c01beb41 0001ffff 00000002 00000011 00000000
       00040002 00000841 00000000 0000000b 0000000b 00000049 00000000 00000001
       c01c3ce3 c04973b4 0001290e c01c2f76 00000000 c00b9cc0 00000001 00000018
Call Trace:   [<c01beb41>] scrup [kernel] 0x121 (0xef297918)
[<c01c3ce3>] poke_blanked_console [kernel] 0x53 (0xef29794c)
[<c01c2f76>] vt_console_print [kernel] 0x226 (0xef297958)
[<c012e90e>] update_process_times [kernel] 0x3e (0xef297990)
[<c0127e26>] exit_notify [kernel] 0x266 (0xef2979b4)
[<c0168400>] dput [kernel] 0x30 (0xef2979d0)
[<c012860e>] do_exit [kernel] 0x30e (0xef2979e4)
[<c010a224>] die [kernel] 0x94 (0xef297a00)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297a14)
[<f88637b7>] do_journal_end [reiserfs] 0xd7 (0xef297a2c)
[<f88624d1>] do_journal_begin_r [reiserfs] 0x241 (0xef297a44)
[<f886d8ec>] .LC32 [reiserfs] 0x1e (0xef297a48)
[<f883f927>] _reiserfs_free_block [reiserfs] 0x117 (0xef297a5c)
[<f8862a27>] journal_end [reiserfs] 0x27 (0xef297a8c)
[<f884bba4>] reiserfs_file_release [reiserfs] 0xb4 (0xef297aa0)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297ad0)
[<c0109c18>] error_code [kernel] 0x34 (0xef297ad8)
[<c016d34d>] dnotify_flush [kernel] 0x1d (0xef297b0c)
[<c015079b>] filp_close [kernel] 0x7b (0xef297b2c)
[<c01276fc>] put_files_struct [kernel] 0x6c (0xef297b48)
[<c012846a>] do_exit [kernel] 0x16a (0xef297b64)
[<c010a224>] die [kernel] 0x94 (0xef297b80)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297b94)
[<c01beb41>] scrup [kernel] 0x121 (0xef297bac)
[<c01beb41>] scrup [kernel] 0x121 (0xef297bd8)
[<c01beb41>] scrup [kernel] 0x121 (0xef297c08)
[<c0206863>] vgacon_cursor [kernel] 0xf3 (0xef297c1c)
[<c01c3ce3>] poke_blanked_console [kernel] 0x53 (0xef297c3c)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297c50)
[<c0109c18>] error_code [kernel] 0x34 (0xef297c58)
[<c013b540>] lock_vma_mappings [kernel] 0x10 (0xef297c8c)
[<c013cd16>] exit_mmap [kernel] 0x96 (0xef297c98)
[<c0121c6c>] mmput [kernel] 0x6c (0xef297cbc)
[<c0128436>] do_exit [kernel] 0x136 (0xef297cd4)
[<c010a224>] die [kernel] 0x94 (0xef297cf0)
[<c011cc23>] do_page_fault [kernel] 0x2a3 (0xef297d04)
[<c011ed70>] scheduler_tick [kernel] 0x120 (0xef297d38)
[<f8859224>] is_tree_node [reiserfs] 0x74 (0xef297d40)
[<f88597c4>] search_by_key [reiserfs] 0x594 (0xef297d54)
[<c012e90e>] update_process_times [kernel] 0x3e (0xef297d94)
[<c011a97c>] smp_apic_timer_interrupt [kernel] 0x14c (0xef297db0)
[<c011c980>] do_page_fault [kernel] 0x0 (0xef297dc0)
[<c0109c18>] error_code [kernel] 0x34 (0xef297dc8)
[<f884c45a>] reiserfs_readdir [reiserfs] 0x21a (0xef297dfc)
[<c015370c>] balance_dirty [kernel] 0xc (0xef297e80)
[<c01544f4>] __block_commit_write [kernel] 0x84 (0xef297e8c)
Code: f0 fe 88 04 05 00 00 0f 88 d5 20 00 00 83 fe 11 0f 84 0d 04


>>EIP; c0130a20 <do_notify_parent+b0/560>   <=====

>>ebx; ef296000 <_end+2edc7288/3833e2e8>
>>edx; ef296000 <_end+2edc7288/3833e2e8>
>>edi; f7ffa000 <_end+37b2b288/3833e2e8>
>>ebp; ef296068 <_end+2edc72f0/3833e2e8>
>>esp; ef29790c <_end+2edc8b94/3833e2e8>

Trace; c01beb41 <scrup+121/130>
Trace; c01c3ce3 <poke_blanked_console+53/70>
Trace; c01c2f76 <vt_console_print+226/320>
Trace; c012e90e <update_process_times+3e/50>
Trace; c0127e26 <exit_notify+266/740>
Trace; c0168400 <dput+30/1b0>
Trace; c012860e <do_exit+30e/380>
Trace; c010a224 <die+94/a0>
Trace; c011cc23 <do_page_fault+2a3/564>
Trace; f88637b7 <[reiserfs]do_journal_end+d7/b70>
Trace; f88624d1 <[reiserfs]do_journal_begin_r+241/280>
Trace; f886d8ec <[reiserfs].LC32+63a0/a554>
Trace; f883f927 <[reiserfs]_reiserfs_free_block+117/150>
Trace; f8862a27 <[reiserfs]journal_end+27/30>
Trace; f884bba4 <[reiserfs]reiserfs_file_release+b4/490>
Trace; c011c980 <do_page_fault+0/564>
Trace; c0109c18 <error_code+34/3c>
Trace; c016d34d <dnotify_flush+1d/c0>
Trace; c015079b <filp_close+7b/d0>
Trace; c01276fc <put_files_struct+6c/e0>
Trace; c012846a <do_exit+16a/380>
Trace; c010a224 <die+94/a0>
Trace; c011cc23 <do_page_fault+2a3/564>
Trace; c01beb41 <scrup+121/130>
Trace; c01beb41 <scrup+121/130>
Trace; c01beb41 <scrup+121/130>
Trace; c0206863 <vgacon_cursor+f3/1e0>
Trace; c01c3ce3 <poke_blanked_console+53/70>
Trace; c011c980 <do_page_fault+0/564>
Trace; c0109c18 <error_code+34/3c>
Trace; c013b540 <lock_vma_mappings+10/30>
Trace; c013cd16 <exit_mmap+96/180>
Trace; c0121c6c <mmput+6c/100>
Trace; c0128436 <do_exit+136/380>
Trace; c010a224 <die+94/a0>
Trace; c011cc23 <do_page_fault+2a3/564>
Trace; c011ed70 <scheduler_tick+120/460>
Trace; f8859224 <[reiserfs]is_tree_node+74/80>
Trace; f88597c4 <[reiserfs]search_by_key+594/f70>
Trace; c012e90e <update_process_times+3e/50>
Trace; c011a97c <smp_apic_timer_interrupt+14c/150>
Trace; c011c980 <do_page_fault+0/564>
Trace; c0109c18 <error_code+34/3c>
Trace; f884c45a <[reiserfs]reiserfs_readdir+21a/4e0>
Trace; c015370c <balance_dirty+c/40>
Trace; c01544f4 <__block_commit_write+84/d0>

Code;  c0130a20 <do_notify_parent+b0/560>
00000000 <_EIP>:
Code;  c0130a20 <do_notify_parent+b0/560>   <=====
   0:   f0 fe 88 04 05 00 00      lock decb 0x504(%eax)   <=====
Code;  c0130a27 <do_notify_parent+b7/560>
   7:   0f 88 d5 20 00 00         js     20e2 <_EIP+0x20e2>
Code;  c0130a2d <do_notify_parent+bd/560>
   d:   83 fe 11                  cmp    $0x11,%esi
Code;  c0130a30 <do_notify_parent+c0/560>
  10:   0f 84 0d 04 00 00         je     423 <_EIP+0x423>


5 warnings issued.  Results may not be reliable.

-- 
Sean
