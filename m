From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Oops with in nfsd - 2.4.19-pre6
Date: Tue, 29 Oct 2002 15:59:07 +0100
Message-ID: <20021029155907.74f4b3ac.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>


Hi,

Is this still the infamous NFSD/inode race ?

Thanks,

Philippe.


root@smembf08:~# cat reiser-oops | ksymoops -m /boot/System.map-2.4.19-pre6 
ksymoops 2.4.5 on i686 2.4.19-pre6.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.19-pre6/ (default)
     -m /boot/System.map-2.4.19-pre6 (specified)

kernel BUG at prints.c:334!
invalid operand: 0000
CPU:    0
EIP:    0010:[<c0194899>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010286
eax: 0000003d   ebx: c0268640   ecx: ffffffff   edx: 00000002
esi: f781c400   edi: 00000019   ebp: 00000000   esp: f6125af4
ds: 0018   es: 0018   ss: 0018
Process nfsd (pid: 288, stackpage=f6125000)
Stack: c02650da c031f5e0 c0268640 f6125b18 f6125ec8 f6fbad20 c01a1bcc f781c400 
       c0268640 00000400 f781c400 000007b1 f6125ec8 03d8eefe ffffffff 00000000 
       c0184144 f6125ec8 f781c400 f6fbad20 f6125ec8 03d8eefe 00000001 e1ae7de0 
Call Trace: [<c01a1bcc>] [<c0184144>] [<c0184283>] [<c019b23b>] [<c019c08f>] 
   [<c019c879>] [<c019bcbf>] [<c018a09a>] [<c0189fd0>] [<c014bd67>] [<c0149fb6>] 
   [<c014279d>] [<c0175d6b>] [<c0179dee>] [<c0170d63>] [<c0238405>] [<c0170b5f>] 
   [<c0106ff4>] 
Code: 0f 0b 4e 01 e0 50 26 c0 68 e0 f5 31 c0 85 f6 74 16 0f b7 46 


>>EIP; c0194899 <reiserfs_panic+29/60>   <=====

>>ebx; c0268640 <MAX_KEY+2220/4aa8>
>>ecx; ffffffff <END_OF_CODE+76caea0/????>
>>esi; f781c400 <_end+374d4c24/385e7824>
>>esp; f6125af4 <_end+35dde318/385e7824>

Trace; c01a1bcc <journal_mark_dirty+160/320>
Trace; c0184144 <_reiserfs_free_block+b4/1cc>
Trace; c0184283 <reiserfs_free_block+27/30>
Trace; c019b23b <prepare_for_delete_or_cut+663/70c>
Trace; c019c08f <reiserfs_cut_from_item+97/520>
Trace; c019c879 <reiserfs_do_truncate+2fd/42c>
Trace; c019bcbf <reiserfs_delete_object+23/50>
Trace; c018a09a <reiserfs_delete_inode+ca/13c>
Trace; c0189fd0 <reiserfs_delete_inode+0/13c>
Trace; c014bd67 <iput+163/268>
Trace; c0149fb6 <d_delete+62/a0>
Trace; c014279d <vfs_unlink+1e9/220>
Trace; c0175d6b <nfsd_unlink+193/1e0>
Trace; c0179dee <nfsd3_proc_remove+c6/d4>
Trace; c0170d63 <nfsd_dispatch+d3/19a>
Trace; c0238405 <svc_process+28d/4d4>
Trace; c0170b5f <nfsd+1f7/328>
Trace; c0106ff4 <kernel_thread+28/38>

Code;  c0194899 <reiserfs_panic+29/60>
00000000 <_EIP>:
Code;  c0194899 <reiserfs_panic+29/60>   <=====
   0:   0f 0b                     ud2a      <=====
Code;  c019489b <reiserfs_panic+2b/60>
   2:   4e                        dec    %esi
Code;  c019489c <reiserfs_panic+2c/60>
   3:   01 e0                     add    %esp,%eax
Code;  c019489e <reiserfs_panic+2e/60>
   5:   50                        push   %eax
Code;  c019489f <reiserfs_panic+2f/60>
   6:   26 c0 68 e0 f5            shrb   $0xf5,%es:0xffffffe0(%eax)
Code;  c01948a4 <reiserfs_panic+34/60>
   b:   31 c0                     xor    %eax,%eax
Code;  c01948a6 <reiserfs_panic+36/60>
   d:   85 f6                     test   %esi,%esi
Code;  c01948a8 <reiserfs_panic+38/60>
   f:   74 16                     je     27 <_EIP+0x27> c01948c0 <reiserfs_panic+50/60>
Code;  c01948aa <reiserfs_panic+3a/60>
  11:   0f b7 46 00               movzwl 0x0(%esi),%eax
