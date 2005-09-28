From: "Augusto" <augusto@dc.ig.com.br>
Subject: reiserFS error
Date: Wed, 28 Sep 2005 12:10:58 -0300
Message-ID: <020a01c5c43e$d4dee100$e432a8c0@ds.ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0207_01C5C425.AF810730"
Return-path: <reiserfs-list-return-26301-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0207_01C5C425.AF810730
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

I have a Raid 5 format in reiserfs with kernel 2.6.13 I lost 2 hard disk =
of raid for the controller I obtained to force 1 of hard disk it =
filesystem dont mounted then I starting reiserfsck with the option -- =
rebuild-tree finished error-free but in the hour to mount they =
filesystem it appears the error "Segmentation fault"

------------[ cut here ]------------
kernel BUG at fs/reiserfs/journal.c:3149!
invalid operand: 0000 [#1]
SMP=20
Modules linked in: edd joydev sg st sr_mod ide_cd cdrom nvram ipv6 raw =
i2c_piix4 ohci_hcd i2c_core ibmasm sworks_agp agpgart evdev tg3 usbcore =
e100 mii reiserfs ext3 jbd ips sd_mod scsi_mod
CPU:    1
EIP:    0060:[<f8c48f72>]    Not tainted VLI
EFLAGS: 00010246   (2.6.13)=20
EIP is at journal_mark_dirty+0x1e2/0x260 [reiserfs]
eax: 00000000   ebx: f5ae0600   ecx: f5a74bdc   edx: f510fe60
esi: f5ae0600   edi: f5a74bdc   ebp: f912f000   esp: f510fdec
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 11758, threadinfo=3Df510e000 task=3Df4481540)
Stack: f5e2fab4 f510fe4c f8c5086e f510fe60 00000000 f510e000 f5ae0600 =
f8c48ce5=20
       00000000 00000000 f510fe60 f5ae0600 f5e2fab4 f510fe4c f510fe60 =
f8c39095=20
       f8c2ca50 f510fe4c f510fe5c f5cc3380 00000000 f4078000 00000000 =
00000000=20
Call Trace:
 [<f8c48ce5>] journal_begin+0x75/0x120 [reiserfs]
 [<f8c39095>] reiserfs_fill_super+0x665/0x760 [reiserfs]
 [<f8c2ca50>] reiserfs_init_locked_inode+0x0/0x10 [reiserfs]
 [<c019779e>] disk_name+0x5e/0xc0
 [<c0164ce2>] get_sb_bdev+0xb2/0x120
 [<f8c39b79>] get_super_block+0x19/0x1e [reiserfs]
 [<f8c38a30>] reiserfs_fill_super+0x0/0x760 [reiserfs]
 [<c0164f8a>] do_kern_mount+0x9a/0x180
 [<c017b80b>] do_new_mount+0x6b/0xc0
 [<c017bf03>] do_mount+0x1b3/0x1f0
 [<c017bc52>] exact_copy_from_user+0x32/0x70
 [<c017bce9>] copy_mount_options+0x59/0xc0
 [<c017c2d9>] sys_mount+0x79/0xc0
 [<c0102f6f>] sysenter_past_esp+0x54/0x75
Code: 14 89 5d 04 31 d2 83 c4 2c 89 d0 5b 5e 5f 5d c3 89 5d 08 eb ec 8d =
74 26 00 83 c0 12 89 42 0c 83 45 2c 12 8b 42 08 e9 50 ff ff ff <0f> 0b =
4d 0c 9d 0c c5 f8 e9 3e fe ff ff 8b 45 30 ba 08 4a c5 f8=20
 Badness in do_exit at kernel/exit.c:787
 [<c01209d6>] do_exit+0x3b6/0x3d0
 [<c01042a1>] die+0x171/0x180
 [<c01045c0>] do_invalid_op+0x0/0xa0
 [<c0104653>] do_invalid_op+0x93/0xa0
 [<c01192b7>] __wake_up_common+0x37/0x70
 [<f8c48f72>] journal_mark_dirty+0x1e2/0x260 [reiserfs]
 [<c0119328>] __wake_up+0x38/0x50
 [<c011e253>] release_console_sem+0xb3/0xc0
 [<c011e068>] vprintk+0x198/0x250
 [<f8c2cb3a>] reiserfs_read_locked_inode+0xda/0x150 [reiserfs]
 [<c0103adf>] error_code+0x4f/0x54
 [<f8c48f72>] journal_mark_dirty+0x1e2/0x260 [reiserfs]
 [<f8c48ce5>] journal_begin+0x75/0x120 [reiserfs]
 [<f8c39095>] reiserfs_fill_super+0x665/0x760 [reiserfs]
 [<f8c2ca50>] reiserfs_init_locked_inode+0x0/0x10 [reiserfs]
 [<c019779e>] disk_name+0x5e/0xc0
 [<c0164ce2>] get_sb_bdev+0xb2/0x120
 [<f8c39b79>] get_super_block+0x19/0x1e [reiserfs]
 [<f8c38a30>] reiserfs_fill_super+0x0/0x760 [reiserfs]
 [<c0164f8a>] do_kern_mount+0x9a/0x180
 [<c017b80b>] do_new_mount+0x6b/0xc0
 [<c017bf03>] do_mount+0x1b3/0x1f0
 [<c017bc52>] exact_copy_from_user+0x32/0x70
 [<c017bce9>] copy_mount_options+0x59/0xc0
 [<c017c2d9>] sys_mount+0x79/0xc0
 [<c0102f6f>] sysenter_past_esp+0x54/0x75

what I make?




------=_NextPart_000_0207_01C5C425.AF810730
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2722" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a Raid 5 format in reiserfs with =
kernel=20
2.6.13 I&nbsp;lost 2&nbsp;hard disk&nbsp;of raid for the controller I =
obtained=20
to force 1 of hard disk it filesystem&nbsp;dont mounted then =
I&nbsp;starting=20
reiserfsck with the option -- rebuild-tree finished error-free but in =
the hour=20
to mount they filesystem it appears the error "Segmentation =
fault"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>------------[ cut here =
]------------<BR>kernel BUG=20
at fs/reiserfs/journal.c:3149!<BR>invalid operand: 0000 [#1]<BR>SMP =
<BR>Modules=20
linked in: edd joydev sg st sr_mod ide_cd cdrom nvram ipv6 raw i2c_piix4 =

ohci_hcd i2c_core ibmasm sworks_agp agpgart evdev tg3 usbcore e100 mii =
reiserfs=20
ext3 jbd ips sd_mod scsi_mod<BR>CPU:&nbsp;&nbsp;&nbsp;=20
1<BR>EIP:&nbsp;&nbsp;&nbsp; 0060:[&lt;f8c48f72&gt;]&nbsp;&nbsp;&nbsp; =
Not=20
tainted VLI<BR>EFLAGS: 00010246&nbsp;&nbsp; (2.6.13) <BR>EIP is at=20
journal_mark_dirty+0x1e2/0x260 [reiserfs]<BR>eax: 00000000&nbsp;&nbsp; =
ebx:=20
f5ae0600&nbsp;&nbsp; ecx: f5a74bdc&nbsp;&nbsp; edx: f510fe60<BR>esi:=20
f5ae0600&nbsp;&nbsp; edi: f5a74bdc&nbsp;&nbsp; ebp: f912f000&nbsp;&nbsp; =
esp:=20
f510fdec<BR>ds: 007b&nbsp;&nbsp; es: 007b&nbsp;&nbsp; ss: =
0068<BR>Process mount=20
(pid: 11758, threadinfo=3Df510e000 task=3Df4481540)<BR>Stack: f5e2fab4 =
f510fe4c=20
f8c5086e f510fe60 00000000 f510e000 f5ae0600 f8c48ce5=20
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000000 00000000 f510fe60 =
f5ae0600=20
f5e2fab4 f510fe4c f510fe60 f8c39095 =
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
f8c2ca50 f510fe4c f510fe5c f5cc3380 00000000 f4078000 00000000 00000000 =
<BR>Call=20
Trace:<BR>&nbsp;[&lt;f8c48ce5&gt;] journal_begin+0x75/0x120=20
[reiserfs]<BR>&nbsp;[&lt;f8c39095&gt;] reiserfs_fill_super+0x665/0x760=20
[reiserfs]<BR>&nbsp;[&lt;f8c2ca50&gt;] =
reiserfs_init_locked_inode+0x0/0x10=20
[reiserfs]<BR>&nbsp;[&lt;c019779e&gt;]=20
disk_name+0x5e/0xc0<BR>&nbsp;[&lt;c0164ce2&gt;]=20
get_sb_bdev+0xb2/0x120<BR>&nbsp;[&lt;f8c39b79&gt;] =
get_super_block+0x19/0x1e=20
[reiserfs]<BR>&nbsp;[&lt;f8c38a30&gt;] reiserfs_fill_super+0x0/0x760=20
[reiserfs]<BR>&nbsp;[&lt;c0164f8a&gt;]=20
do_kern_mount+0x9a/0x180<BR>&nbsp;[&lt;c017b80b&gt;]=20
do_new_mount+0x6b/0xc0<BR>&nbsp;[&lt;c017bf03&gt;]=20
do_mount+0x1b3/0x1f0<BR>&nbsp;[&lt;c017bc52&gt;]=20
exact_copy_from_user+0x32/0x70<BR>&nbsp;[&lt;c017bce9&gt;]=20
copy_mount_options+0x59/0xc0<BR>&nbsp;[&lt;c017c2d9&gt;]=20
sys_mount+0x79/0xc0<BR>&nbsp;[&lt;c0102f6f&gt;]=20
sysenter_past_esp+0x54/0x75<BR>Code: 14 89 5d 04 31 d2 83 c4 2c 89 d0 5b =
5e 5f=20
5d c3 89 5d 08 eb ec 8d 74 26 00 83 c0 12 89 42 0c 83 45 2c 12 8b 42 08 =
e9 50 ff=20
ff ff &lt;0f&gt; 0b 4d 0c 9d 0c c5 f8 e9 3e fe ff ff 8b 45 30 ba 08 4a =
c5 f8=20
<BR>&nbsp;Badness in do_exit at =
kernel/exit.c:787<BR>&nbsp;[&lt;c01209d6&gt;]=20
do_exit+0x3b6/0x3d0<BR>&nbsp;[&lt;c01042a1&gt;]=20
die+0x171/0x180<BR>&nbsp;[&lt;c01045c0&gt;]=20
do_invalid_op+0x0/0xa0<BR>&nbsp;[&lt;c0104653&gt;]=20
do_invalid_op+0x93/0xa0<BR>&nbsp;[&lt;c01192b7&gt;]=20
__wake_up_common+0x37/0x70<BR>&nbsp;[&lt;f8c48f72&gt;]=20
journal_mark_dirty+0x1e2/0x260 [reiserfs]<BR>&nbsp;[&lt;c0119328&gt;]=20
__wake_up+0x38/0x50<BR>&nbsp;[&lt;c011e253&gt;]=20
release_console_sem+0xb3/0xc0<BR>&nbsp;[&lt;c011e068&gt;]=20
vprintk+0x198/0x250<BR>&nbsp;[&lt;f8c2cb3a&gt;]=20
reiserfs_read_locked_inode+0xda/0x150 =
[reiserfs]<BR>&nbsp;[&lt;c0103adf&gt;]=20
error_code+0x4f/0x54<BR>&nbsp;[&lt;f8c48f72&gt;] =
journal_mark_dirty+0x1e2/0x260=20
[reiserfs]<BR>&nbsp;[&lt;f8c48ce5&gt;] journal_begin+0x75/0x120=20
[reiserfs]<BR>&nbsp;[&lt;f8c39095&gt;] reiserfs_fill_super+0x665/0x760=20
[reiserfs]<BR>&nbsp;[&lt;f8c2ca50&gt;] =
reiserfs_init_locked_inode+0x0/0x10=20
[reiserfs]<BR>&nbsp;[&lt;c019779e&gt;]=20
disk_name+0x5e/0xc0<BR>&nbsp;[&lt;c0164ce2&gt;]=20
get_sb_bdev+0xb2/0x120<BR>&nbsp;[&lt;f8c39b79&gt;] =
get_super_block+0x19/0x1e=20
[reiserfs]<BR>&nbsp;[&lt;f8c38a30&gt;] reiserfs_fill_super+0x0/0x760=20
[reiserfs]<BR>&nbsp;[&lt;c0164f8a&gt;]=20
do_kern_mount+0x9a/0x180<BR>&nbsp;[&lt;c017b80b&gt;]=20
do_new_mount+0x6b/0xc0<BR>&nbsp;[&lt;c017bf03&gt;]=20
do_mount+0x1b3/0x1f0<BR>&nbsp;[&lt;c017bc52&gt;]=20
exact_copy_from_user+0x32/0x70<BR>&nbsp;[&lt;c017bce9&gt;]=20
copy_mount_options+0x59/0xc0<BR>&nbsp;[&lt;c017c2d9&gt;]=20
sys_mount+0x79/0xc0<BR>&nbsp;[&lt;c0102f6f&gt;]=20
sysenter_past_esp+0x54/0x75</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>what I make?</DIV>
<DIV><BR></DIV></FONT>
<DIV><BR>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0207_01C5C425.AF810730--

