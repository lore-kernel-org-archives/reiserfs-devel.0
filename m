From: "Jozef Ivanecky" <IVANECKY@de.ibm.com>
Subject: 2.4.22. crash
Date: Thu, 25 Sep 2003 17:38:56 +0200
Message-ID: <OF8ECF454E.812B658D-ONC1256DAC.00557BB3-C1256DAC.0055F677@de.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-list@namesys.com


Hi everybody,

since I moved to 2.4.22 I have problem with reiserFS partition. It happ=
ened
on different machine with the same config several times. Probably when
bigger file is going to be created. Can anyone help me with the problem=
?

here is oops otuput:

Sep 23 14:38:39 clue10 kernel: sd(8,1):PAP-5710: reiserfs_paste_into_it=
em:
entry or pasted byte ([547518 547629 0x4bc001 IND]) exists
Sep 23 14:38:39 clue10 last message repeated 2 times
Sep 25 10:15:34 clue10 kernel: sd(8,3):PAP-5710: reiserfs_paste_into_it=
em:
entry or pasted byte ([259 161692 0x54a001 IND]) exists
Sep 25 10:26:08 clue10 kernel: sd(8,3):PAP-5710: reiserfs_paste_into_it=
em:
entry or pasted byte ([259 161692 0x926001 IND]) exists
Sep 25 10:31:14 clue10 kernel: sd(8,3):PAP-5710: reiserfs_paste_into_it=
em:
entry or pasted byte ([259 53458 0x1708001 IND]) exists
Sep 25 10:31:14 clue10 last message repeated 6 times
Sep 25 10:33:41 clue10 kernel: sd(8,3):PAP-5710: reiserfs_paste_into_it=
em:
entry or pasted byte ([259 161692 0xb98001 IND]) exists
Sep 25 15:41:55 clue10 kernel: sd(8,3):PAP-5710: reiserfs_paste_into_it=
em:
entry or pasted byte ([154030 161764 0x1ca001 IND]) exists
Sep 25 15:41:55 clue10 last message repeated 4 times
Sep 25 15:43:46 clue10 kernel: sd(8,3):PAP-5710: reiserfs_paste_into_it=
em:
entry or pasted byte ([154030 161766 0x6d4001 IND]) exists
Sep 25 15:43:51 clue10 kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000004
Sep 25 15:43:51 clue10 kernel: c019cd8f
Sep 25 15:43:51 clue10 kernel: *pde =3D 00000000
Sep 25 15:43:51 clue10 kernel: Oops: 0002
Sep 25 15:43:51 clue10 kernel: CPU:    0
Sep 25 15:43:51 clue10 kernel: EIP:    0010:[<c019cd8f>]    Not tainted=

Using defaults from ksymoops -t elf32-i386 -a i386
Sep 25 15:43:51 clue10 kernel: EFLAGS: 00010246
Sep 25 15:43:51 clue10 kernel: eax: 00000000   ebx: c4711b00   ecx:
00000002   edx: 00000000
Sep 25 15:43:51 clue10 kernel: esi: 000dd9ec   edi: c339ff8c   ebp:
3f72f117   esp: c339fef8
Sep 25 15:43:51 clue10 kernel: ds: 0018   es: 0018   ss: 0018
Sep 25 15:43:51 clue10 kernel: Process kupdated (pid: 7,
stackpage=3Dc339f000)
Sep 25 15:43:51 clue10 kernel: Stack: f8af03e4 c339ff8c 0000002b c019cd=
f3
c339ff8c c4711b00 00000006 c339ff8c
Sep 25 15:43:51 clue10 kernel:        c01bbb85 c339ff8c c339ff8c f6e784=
00
0000002b 3f72f117 f6e78400 0000002b
Sep 25 15:43:51 clue10 kernel:        3f72f117 00000004 00000002 000000=
00
3f72f117 ffffffff 00000000 c01bb3f1
Sep 25 15:43:51 clue10 kernel: Call Trace:    [<c019cdf3>] [<c01bbb85>]=

[<c01bb3f1>] [<c01bb3ff>] [<c01ab3f4>]
Sep 25 15:43:51 clue10 kernel:   [<c0148b82>] [<c0147c28>] [<c0147ff5>]=

[<c0105684>]
Sep 25 15:43:51 clue10 kernel: Code: 89 50 04 89 02 c7 83 58 01 00 00 0=
0 00
00 00 c7 83 5c 01 00


>>EIP; c019cd8f <__discard_prealloc+57/74>   <=3D=3D=3D=3D=3D

>>ebx; c4711b00 <END_OF_CODE+42f1144/????>
>>esi; 000dd9ec Before first symbol
>>edi; c339ff8c <END_OF_CODE+2f7f5d0/????>
>>ebp; 3f72f117 Before first symbol
>>esp; c339fef8 <END_OF_CODE+2f7f53c/????>

Trace; c019cdf3 <reiserfs_discard_all_prealloc+2b/38>
Trace; c01bbb85 <do_journal_end+115/ad4>
Trace; c01bb3f1 <flush_old_commits+119/140>
Trace; c01bb3ff <flush_old_commits+127/140>
Trace; c01ab3f4 <reiserfs_write_super+38/6c>
Trace; c0148b82 <sync_supers+fa/154>
Trace; c0147c28 <sync_old_buffers+34/a0>
Trace; c0147ff5 <kupdate+179/19c>
Trace; c0105684 <arch_kernel_thread+28/38>

Code;  c019cd8f <__discard_prealloc+57/74>
00000000 <_EIP>:
Code;  c019cd8f <__discard_prealloc+57/74>   <=3D=3D=3D=3D=3D
   0:   89 50 04                  mov    %edx,0x4(%eax)   <=3D=3D=3D=3D=
=3D
Code;  c019cd92 <__discard_prealloc+5a/74>
   3:   89 02                     mov    %eax,(%edx)
Code;  c019cd94 <__discard_prealloc+5c/74>
   5:   c7 83 58 01 00 00 00      movl   $0x0,0x158(%ebx)
Code;  c019cd9b <__discard_prealloc+63/74>
   c:   00 00 00
Code;  c019cd9e <__discard_prealloc+66/74>
   f:   c7 83 5c 01 00 00 00      movl   $0x0,0x15c(%ebx)
Code;  c019cda5 <__discard_prealloc+6d/74>
  16:   00 00 00


Thanks in advance for the help

Jozef


********************************************
Jozef Ivanecky
IBM Speech Systems
European Speech Research
Gottlieb-Daimler-Stra=DFe 12, D-68165 Mannheim
Email: ivanecky@de.ibm.com
Phone: +49 621 469686
********************************************=


