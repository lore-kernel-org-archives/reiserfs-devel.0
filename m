From: berthiaume_wayne@emc.com
Subject: Reiserfs oops
Date: Thu, 10 Apr 2003 13:56:05 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D007AA83FC@CORPUSMX1>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C2FF8A.751DEB60"
Return-path: <reiserfs-list-return-13632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: green@namesys.com
Cc: reiserfs-list@namesys.com

------_=_NextPart_000_01C2FF8A.751DEB60
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2FF8A.751DEB60"


------_=_NextPart_001_01C2FF8A.751DEB60
Content-Type: text/plain;
	charset="iso-8859-1"

        Oleg, I'm seeing the attached oops's when a hard drive failure is
encountered. There are four drives in RAID 1. Is it normal for reiserfs to
oops when a drive fails?
Attached oops file...
 
Regards,

Wayne 
"One man can make a difference, and every man should try."  - JFK 

 

------_=_NextPart_001_01C2FF8A.751DEB60
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 5.50.4923.2500" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=179544717-10042003><FONT face=Arial 
size=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Oleg, I'm seeing the attached 
oops's when a hard drive failure is encountered. There are four drives in RAID 
1. Is it normal for reiserfs to oops when a drive fails?</FONT></SPAN></DIV>
<DIV><SPAN class=179544717-10042003><FONT face=Arial size=2>Attached oops 
file...</FONT></SPAN></DIV>
<DIV><SPAN class=179544717-10042003><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=179544717-10042003><FONT face=Arial 
size=2>Regards,</FONT></SPAN></DIV>
<P><B><I><FONT face=Script color=#008080 size=5>Wayne</FONT></I></B> 
<BR><I><FONT face="MS Serif" color=#008080 size=1>"One man can make a 
difference, and every man should try."&nbsp; - JFK</FONT></I> </P>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C2FF8A.751DEB60--

------_=_NextPart_000_01C2FF8A.751DEB60
Content-Type: text/plain;
	name="oopses.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="oopses.txt"

ksymoops 2.4.4 on i686 2.4.19-prod-1.15.1.  Options used=0A=
     -V (default)=0A=
     -k /proc/ksyms (default)=0A=
     -l /proc/modules (default)=0A=
     -o /lib/modules/2.4.19-prod-1.15.1/ (default)=0A=
     -m /boot/System.map (specified)=0A=
=0A=
Warning (compare_maps): mismatch on symbol READ_SUPERIO_CONFIG  , =
neismbus says d08b75a8, =
/lib/modules/2.4.19-prod-1.15.1/kernel/misc/neismbus.o says d08b6af8.  =
Ignoring /lib/modules/2.4.19-prod-1.15.1/kernel/misc/neismbus.o =
entry=0A=
Warning (compare_maps): mismatch on symbol WRITE_SUPERIO_CONFIG  , =
neismbus says d08b75e8, =
/lib/modules/2.4.19-prod-1.15.1/kernel/misc/neismbus.o says d08b6b08.  =
Ignoring /lib/modules/2.4.19-prod-1.15.1/kernel/misc/neismbus.o =
entry=0A=
Apr  8 04:42:06 centera kernel: cpu: 0, clocks: 1336323, slice: =
668161=0A=
Apr  8 07:38:55 centera kernel: 0000000, vendor =3D 0=0A=
Apr  8 07:38:55 centera kernel: cpu: 0, clocks: 1336324, slice: =
668162=0A=
Apr  8 23:18:37 centera kernel: Unable to handle kernel NULL pointer =
dereference at virtual address 00000018=0A=
Apr  8 23:18:37 centera kernel: c0184024=0A=
Apr  8 23:18:37 centera kernel: *pde =3D 00000000=0A=
Apr  8 23:18:37 centera kernel: Oops: 0000=0A=
Apr  8 23:18:37 centera kernel: CPU:    0=0A=
Apr  8 23:18:37 centera kernel: EIP:    0010:[<c0184024>]    Not =
tainted=0A=
Using defaults from ksymoops -t elf32-i386 -a i386=0A=
Apr  8 23:18:37 centera kernel: EFLAGS: 00010206=0A=
Apr  8 23:18:37 centera kernel: eax: 0000000a   ebx: cb57a000   ecx: =
00000000   edx: d0a7f000=0A=
Apr  8 23:18:37 centera kernel: esi: 0000000a   edi: 00000004   ebp: =
d0a7f28c   esp: cf2f3e40=0A=
Apr  8 23:18:37 centera kernel: ds: 0018   es: 0018   ss: 0018=0A=
Apr  8 23:18:37 centera kernel: Process java (pid: 2304, =
stackpage=3Dcf2f3000)=0A=
Apr  8 23:18:37 centera kernel: Stack: c0131c60 00000002 d0a7f584 =
cc5f2d80 cb57a000 0000000a 00000001 c0184125 =0A=
Apr  8 23:18:37 centera kernel:        cb57a000 00000004 0000000a =
00000000 c01845fc cb57a000 00000004 0000000a =0A=
Apr  8 23:18:37 centera kernel:        00000000 0000000b 00000000 =
d0aa16e4 c0132868 0000210a 00000058 00000280 =0A=
Apr  8 23:18:37 centera kernel: Call Trace:    [<c0131c60>] =
[<c0184125>] [<c01845fc>] [<c0132868>] [<c0187aad>]=0A=
Apr  8 23:18:37 centera kernel:   [<c01862bb>] [<c0186995>] =
[<c0187073>] [<c011c15d>] [<c0173123>] [<c0130f42>]=0A=
Apr  8 23:18:37 centera kernel:   [<c0132071>] [<c010881b>]=0A=
Apr  8 23:18:37 centera kernel: Code: f6 41 18 04 74 29 8b 41 18 83 e0 =
04 74 0d 51 e8 a8 db fa ff =0A=
=0A=
>>EIP; c0184024 <_update_journal_header_block+24/110>   =
<=3D=3D=3D=3D=3D=0A=
Trace; c0131c60 <__wait_on_buffer+80/90>=0A=
Trace; c0184125 <update_journal_header_block+15/30>=0A=
Trace; c01845fc <flush_journal_list+35c/3c0>=0A=
Trace; c0132868 <getblk+18/40>=0A=
Trace; c0187aad <do_journal_end+96d/ad0>=0A=
Trace; c01862bb <do_journal_begin_r+20b/220>=0A=
Trace; c0186995 <journal_end_sync+45/50>=0A=
Trace; c0187073 <reiserfs_commit_for_inode+53/80>=0A=
Trace; c011c15d <do_timer+3d/70>=0A=
Trace; c0173123 <reiserfs_sync_file+43/60>=0A=
Trace; c0130f42 <sys_write+e2/f0>=0A=
Trace; c0132071 <sys_fsync+61/a0>=0A=
Trace; c010881b <system_call+33/38>=0A=
Code;  c0184024 <_update_journal_header_block+24/110>=0A=
00000000 <_EIP>:=0A=
Code;  c0184024 <_update_journal_header_block+24/110>   =
<=3D=3D=3D=3D=3D=0A=
   0:   f6 41 18 04               testb  $0x4,0x18(%ecx)   =
<=3D=3D=3D=3D=3D=0A=
Code;  c0184028 <_update_journal_header_block+28/110>=0A=
   4:   74 29                     je     2f <_EIP+0x2f> c0184053 =
<_update_journal_header_block+53/110>=0A=
Code;  c018402a <_update_journal_header_block+2a/110>=0A=
   6:   8b 41 18                  mov    0x18(%ecx),%eax=0A=
Code;  c018402d <_update_journal_header_block+2d/110>=0A=
   9:   83 e0 04                  and    $0x4,%eax=0A=
Code;  c0184030 <_update_journal_header_block+30/110>=0A=
   c:   74 0d                     je     1b <_EIP+0x1b> c018403f =
<_update_journal_header_block+3f/110>=0A=
Code;  c0184032 <_update_journal_header_block+32/110>=0A=
   e:   51                        push   %ecx=0A=
Code;  c0184033 <_update_journal_header_block+33/110>=0A=
   f:   e8 a8 db fa ff            call   fffadbbc <_EIP+0xfffadbbc> =
c0131be0 <__wait_on_buffer+0/90>=0A=
=0A=
Apr  9 01:03:47 centera kernel: Unable to handle kernel NULL pointer =
dereference at virtual address 00000018=0A=
Apr  9 01:03:47 centera kernel: c0184024=0A=
Apr  9 01:03:47 centera kernel: *pde =3D 00000000=0A=
Apr  9 01:03:47 centera kernel: Oops: 0000=0A=
Apr  9 01:03:47 centera kernel: CPU:    0=0A=
Apr  9 01:03:47 centera kernel: EIP:    0010:[<c0184024>]    Not =
tainted=0A=
Apr  9 01:03:47 centera kernel: EFLAGS: 00010206=0A=
Apr  9 01:03:47 centera kernel: eax: 0000000a   ebx: cb919000   ecx: =
00000000   edx: d0a7f000=0A=
Apr  9 01:03:47 centera kernel: esi: 0000000a   edi: 00000004   ebp: =
d0a7f28c   esp: cf767e40=0A=
Apr  9 01:03:47 centera kernel: ds: 0018   es: 0018   ss: 0018=0A=
Apr  9 01:03:47 centera kernel: Process java (pid: 2328, =
stackpage=3Dcf767000)=0A=
Apr  9 01:03:47 centera kernel: Stack: c0131c60 00000002 d0a802e0 =
cd897440 cb919000 0000000a 00000001 c0184125 =0A=
Apr  9 01:03:47 centera kernel:        cb919000 00000004 0000000a =
00000000 c01845fc cb919000 00000004 0000000a =0A=
Apr  9 01:03:47 centera kernel:        00000000 00000038 00000000 =
d0aa26c8 c0132868 0000210a 0000012c 00000280 =0A=
Apr  9 01:03:47 centera kernel: Call Trace:    [<c0131c60>] =
[<c0184125>] [<c01845fc>] [<c0132868>] [<c0187aad>]=0A=
Apr  9 01:03:47 centera kernel:   [<c01862bb>] [<c0186995>] =
[<c0187073>] [<c01aa419>] [<c0173123>] [<c0130f42>]=0A=
Apr  9 01:03:47 centera kernel:   [<c0132071>] [<c010881b>]=0A=
Apr  9 01:03:47 centera kernel: Code: f6 41 18 04 74 29 8b 41 18 83 e0 =
04 74 0d 51 e8 a8 db fa ff =0A=
=0A=
>>EIP; c0184024 <_update_journal_header_block+24/110>   =
<=3D=3D=3D=3D=3D=0A=
Trace; c0131c60 <__wait_on_buffer+80/90>=0A=
Trace; c0184125 <update_journal_header_block+15/30>=0A=
Trace; c01845fc <flush_journal_list+35c/3c0>=0A=
Trace; c0132868 <getblk+18/40>=0A=
Trace; c0187aad <do_journal_end+96d/ad0>=0A=
Trace; c01862bb <do_journal_begin_r+20b/220>=0A=
Trace; c0186995 <journal_end_sync+45/50>=0A=
Trace; c0187073 <reiserfs_commit_for_inode+53/80>=0A=
Trace; c01aa419 <ide_intr+e9/110>=0A=
Trace; c0173123 <reiserfs_sync_file+43/60>=0A=
Trace; c0130f42 <sys_write+e2/f0>=0A=
Trace; c0132071 <sys_fsync+61/a0>=0A=
Trace; c010881b <system_call+33/38>=0A=
Code;  c0184024 <_update_journal_header_block+24/110>=0A=
00000000 <_EIP>:=0A=
Code;  c0184024 <_update_journal_header_block+24/110>   =
<=3D=3D=3D=3D=3D=0A=
   0:   f6 41 18 04               testb  $0x4,0x18(%ecx)   =
<=3D=3D=3D=3D=3D=0A=
Code;  c0184028 <_update_journal_header_block+28/110>=0A=
   4:   74 29                     je     2f <_EIP+0x2f> c0184053 =
<_update_journal_header_block+53/110>=0A=
Code;  c018402a <_update_journal_header_block+2a/110>=0A=
   6:   8b 41 18                  mov    0x18(%ecx),%eax=0A=
Code;  c018402d <_update_journal_header_block+2d/110>=0A=
   9:   83 e0 04                  and    $0x4,%eax=0A=
Code;  c0184030 <_update_journal_header_block+30/110>=0A=
   c:   74 0d                     je     1b <_EIP+0x1b> c018403f =
<_update_journal_header_block+3f/110>=0A=
Code;  c0184032 <_update_journal_header_block+32/110>=0A=
   e:   51                        push   %ecx=0A=
Code;  c0184033 <_update_journal_header_block+33/110>=0A=
   f:   e8 a8 db fa ff            call   fffadbbc <_EIP+0xfffadbbc> =
c0131be0 <__wait_on_buffer+0/90>=0A=
=0A=
Apr  9 04:48:35 centera kernel: Unable to handle kernel NULL pointer =
dereference at virtual address 00000018=0A=
Apr  9 04:48:35 centera kernel: c0184024=0A=
Apr  9 04:48:35 centera kernel: *pde =3D 00000000=0A=
Apr  9 04:48:35 centera kernel: Oops: 0000=0A=
Apr  9 04:48:35 centera kernel: CPU:    0=0A=
Apr  9 04:48:35 centera kernel: EIP:    0010:[<c0184024>]    Not =
tainted=0A=
Apr  9 04:48:35 centera kernel: EFLAGS: 00010206=0A=
Apr  9 04:48:35 centera kernel: eax: 0000000a   ebx: cba23000   ecx: =
00000000   edx: d0a7f000=0A=
Apr  9 04:48:35 centera kernel: esi: 0000000a   edi: 00000004   ebp: =
d0a7f28c   esp: cf4fbe40=0A=
Apr  9 04:48:35 centera kernel: ds: 0018   es: 0018   ss: 0018=0A=
Apr  9 04:48:35 centera kernel: Process java (pid: 2312, =
stackpage=3Dcf4fb000)=0A=
Apr  9 04:48:35 centera kernel: Stack: c0131c60 00000002 d0a80540 =
cdb09920 cba23000 0000000a 00000001 c0184125 =0A=
Apr  9 04:48:35 centera kernel:        cba23000 00000004 0000000a =
00000000 c01845fc cba23000 00000004 0000000a =0A=
Apr  9 04:48:35 centera kernel:        00000000 00000040 00000000 =
d0aa23d4 c0132868 0000210a 00000132 00001580 =0A=
Apr  9 04:48:35 centera kernel: Call Trace:    [<c0131c60>] =
[<c0184125>] [<c01845fc>] [<c0132868>] [<c0187b03>]=0A=
Apr  9 04:48:35 centera kernel:   [<c01862bb>] [<c0186995>] =
[<c0187073>] [<c01aa399>] [<c0173123>] [<c0130f42>]=0A=
Apr  9 04:48:35 centera kernel:   [<c0132071>] [<c010881b>]=0A=
Apr  9 04:48:35 centera kernel: Code: f6 41 18 04 74 29 8b 41 18 83 e0 =
04 74 0d 51 e8 a8 db fa ff =0A=
=0A=
>>EIP; c0184024 <_update_journal_header_block+24/110>   =
<=3D=3D=3D=3D=3D=0A=
Trace; c0131c60 <__wait_on_buffer+80/90>=0A=
Trace; c0184125 <update_journal_header_block+15/30>=0A=
Trace; c01845fc <flush_journal_list+35c/3c0>=0A=
Trace; c0132868 <getblk+18/40>=0A=
Trace; c0187b03 <do_journal_end+9c3/ad0>=0A=
Trace; c01862bb <do_journal_begin_r+20b/220>=0A=
Trace; c0186995 <journal_end_sync+45/50>=0A=
Trace; c0187073 <reiserfs_commit_for_inode+53/80>=0A=
Trace; c01aa399 <ide_intr+69/110>=0A=
Trace; c0173123 <reiserfs_sync_file+43/60>=0A=
Trace; c0130f42 <sys_write+e2/f0>=0A=
Trace; c0132071 <sys_fsync+61/a0>=0A=
Trace; c010881b <system_call+33/38>=0A=
Code;  c0184024 <_update_journal_header_block+24/110>=0A=
00000000 <_EIP>:=0A=
Code;  c0184024 <_update_journal_header_block+24/110>   =
<=3D=3D=3D=3D=3D=0A=
   0:   f6 41 18 04               testb  $0x4,0x18(%ecx)   =
<=3D=3D=3D=3D=3D=0A=
Code;  c0184028 <_update_journal_header_block+28/110>=0A=
   4:   74 29                     je     2f <_EIP+0x2f> c0184053 =
<_update_journal_header_block+53/110>=0A=
Code;  c018402a <_update_journal_header_block+2a/110>=0A=
   6:   8b 41 18                  mov    0x18(%ecx),%eax=0A=
Code;  c018402d <_update_journal_header_block+2d/110>=0A=
   9:   83 e0 04                  and    $0x4,%eax=0A=
Code;  c0184030 <_update_journal_header_block+30/110>=0A=
   c:   74 0d                     je     1b <_EIP+0x1b> c018403f =
<_update_journal_header_block+3f/110>=0A=
Code;  c0184032 <_update_journal_header_block+32/110>=0A=
   e:   51                        push   %ecx=0A=
Code;  c0184033 <_update_journal_header_block+33/110>=0A=
   f:   e8 a8 db fa ff            call   fffadbbc <_EIP+0xfffadbbc> =
c0131be0 <__wait_on_buffer+0/90>=0A=
=0A=
2003.04.08 07:33:36 UTC Cluster Handlers        CLUSTER_PACKET from =
03e80428-1dd2-11b2-bd5f-c41825ecc8a4 #9142 ClusterManager  STApr  9 =
05:12:02 centera syslogd 1.4.1: restart.=0A=
Apr  9 05:13:59 centera kernel: Unable to handle kernel NULL pointer =
dereference at virtual address 00000018=0A=
Apr  9 05:13:59 centera kernel: c0184024=0A=
Apr  9 05:13:59 centera kernel: *pde =3D 00000000=0A=
Apr  9 05:13:59 centera kernel: Oops: 0000=0A=
Apr  9 05:13:59 centera kernel: CPU:    0=0A=
Apr  9 05:13:59 centera kernel: EIP:    0010:[<c0184024>]    Not =
tainted=0A=
Apr  9 05:13:59 centera kernel: EFLAGS: 00010206=0A=
Apr  9 05:13:59 centera kernel: eax: 0000000a   ebx: cb8e0000   ecx: =
00000000   edx: d0a7f000=0A=
Apr  9 05:13:59 centera kernel: esi: 0000000a   edi: 00000004   ebp: =
d0a7f28c   esp: cf335e40=0A=
Apr  9 05:13:59 centera kernel: ds: 0018   es: 0018   ss: 0018=0A=
Apr  9 05:13:59 centera kernel: Process java (pid: 2269, =
stackpage=3Dcf335000)=0A=
Apr  9 05:13:59 centera kernel: Stack: c0131c60 00000002 d0a80540 =
cd7afe60 cb8e0000 0000000a 00000001 c0184125 =0A=
Apr  9 05:13:59 centera kernel:        cb8e0000 00000004 0000000a =
00000000 c01845fc cb8e0000 00000004 0000000a =0A=
Apr  9 05:13:59 centera kernel:        00000000 00000040 00000000 =
d0aa25cc c0132868 0000210a 0000012f 00001580 =0A=
Apr  9 05:13:59 centera kernel: Call Trace:    [<c0131c60>] =
[<c0184125>] [<c01845fc>] [<c0132868>] [<c0187b03>]=0A=
Apr  9 05:13:59 centera kernel:   [<c01862bb>] [<c0186995>] =
[<c0187073>] [<c0173123>] [<c0130f42>] [<c0132071>]=0A=
Apr  9 05:13:59 centera kernel:   [<c010881b>]=0A=
Apr  9 05:13:59 centera kernel: Code: f6 41 18 04 74 29 8b 41 18 83 e0 =
04 74 0d 51 e8 a8 db fa ff =0A=
=0A=
>>EIP; c0184024 <_update_journal_header_block+24/110>   =
<=3D=3D=3D=3D=3D=0A=
Trace; c0131c60 <__wait_on_buffer+80/90>=0A=
Trace; c0184125 <update_journal_header_block+15/30>=0A=
Trace; c01845fc <flush_journal_list+35c/3c0>=0A=
Trace; c0132868 <getblk+18/40>=0A=
Trace; c0187b03 <do_journal_end+9c3/ad0>=0A=
Trace; c01862bb <do_journal_begin_r+20b/220>=0A=
Trace; c0186995 <journal_end_sync+45/50>=0A=
Trace; c0187073 <reiserfs_commit_for_inode+53/80>=0A=
Trace; c0173123 <reiserfs_sync_file+43/60>=0A=
Trace; c0130f42 <sys_write+e2/f0>=0A=
Trace; c0132071 <sys_fsync+61/a0>=0A=
Trace; c010881b <system_call+33/38>=0A=
Code;  c0184024 <_update_journal_header_block+24/110>=0A=
00000000 <_EIP>:=0A=
Code;  c0184024 <_update_journal_header_block+24/110>   =
<=3D=3D=3D=3D=3D=0A=
   0:   f6 41 18 04               testb  $0x4,0x18(%ecx)   =
<=3D=3D=3D=3D=3D=0A=
Code;  c0184028 <_update_journal_header_block+28/110>=0A=
   4:   74 29                     je     2f <_EIP+0x2f> c0184053 =
<_update_journal_header_block+53/110>=0A=
Code;  c018402a <_update_journal_header_block+2a/110>=0A=
   6:   8b 41 18                  mov    0x18(%ecx),%eax=0A=
Code;  c018402d <_update_journal_header_block+2d/110>=0A=
   9:   83 e0 04                  and    $0x4,%eax=0A=
Code;  c0184030 <_update_journal_header_block+30/110>=0A=
   c:   74 0d                     je     1b <_EIP+0x1b> c018403f =
<_update_journal_header_block+3f/110>=0A=
Code;  c0184032 <_update_journal_header_block+32/110>=0A=
   e:   51                        push   %ecx=0A=
Code;  c0184033 <_update_journal_header_block+33/110>=0A=
   f:   e8 a8 db fa ff            call   fffadbbc <_EIP+0xfffadbbc> =
c0131be0 <__wait_on_buffer+0/90>=0A=
=0A=
=0A=
2 warnings issued.  Results may not be reliable.=0A=

------_=_NextPart_000_01C2FF8A.751DEB60--
