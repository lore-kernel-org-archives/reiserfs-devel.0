From: "Selzner, Peter \(KRZ\)" <P.Selzner@KRZ.DE>
Subject: ReiserFS problem ?
Date: Mon, 7 Nov 2005 13:17:02 +0100
Message-ID: <4B24A8042312F24B8E4F3DFC7FA8331B211845@s600mx01.krz.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5E395.2920D8E4"
Return-path: <reiserfs-list-return-26793-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------_=_NextPart_001_01C5E395.2920D8E4
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

given situation:

HP DL580 G2 / SuSE SLES8 / ReiserFS3=20

Last friday the server stops with the following massage:

Nov  4 09:26:44  kernel: journal-1996: do_journal_end, could not get a
list bitmap
Nov  4 09:26:44  kernel: kernel BUG at prints.c:334!
Nov  4 09:26:44  kernel: invalid operand: 0000 2.4.21-292-smp #1 SMP Tue
May 24 16:59:12 UTC 2005
Nov  4 09:26:44  kernel: CPU:    1
Nov  4 09:26:44  kernel: EIP:
0010:[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers
+-55611672/96]    Tainted: P
Nov  4 09:26:44  kernel: EIP:    0010:[<ce156ee8>]    Tainted: P
Nov  4 09:26:44  kernel: EFLAGS: 00010296
Nov  4 09:26:44  kernel: eax: 0000003d   ebx: cdd59800   ecx: 00000046
edx: c0331968
Nov  4 09:26:44  kernel: esi: 00000000   edi: 00000000   ebp: de2da660
esp: f6e05e88
Nov  4 09:26:44  kernel: ds: 0018   es: 0018   ss: 0018
Nov  4 09:26:44  kernel: Process db2sysc (pid: 15060,
stackpage=3Df6e05000)
Nov  4 09:26:44  kernel: Stack: ce174e16 ce1758c0 00000000 cdd59800
ce1684ff cdd59800 ce173fc0 00001000
Nov  4 09:26:44  kernel:        00000006 ce162701 f6e04000 00000004
00000002 00000000 d2659420 00000004
Nov  4 09:26:44  kernel:        00000000 00000001 00001a69 dadb2820
dadb2620 e1b4b000 db669000 f92e274c
Nov  4 09:26:44  kernel: Call Trace:
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers+-554
89002/96] (04)
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers+-554
86272/96] (12)
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers+-555
40481/96] (08)
Nov  4 09:26:44  kernel: Call Trace:         [<ce174e16>] (04)
[<ce1758c0>] (12) [<ce1684ff>] (08)
Nov  4 09:26:44  kernel:
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers+-554
92672/96] (12)
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers+-555
64543/96] (76)
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers+-555
45414/96] (28)
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers+-555
43250/96] (44)
Nov  4 09:26:44  kernel:   [<ce173fc0>] (12) [<ce162701>] (76)
[<ce1671ba>] (28) [<ce167a2e>] (44)
Nov  4 09:26:45  kernel:   [generic_file_write+383/416] (20)
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers+-555
43133/96] (24)
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers+-556
43128/96] (32) [sys_pwrite+202/376] (52)
Nov  4 09:26:45  kernel:   [<c014416f>] (20) [<ce167aa3>] (24)
[<ce14f408>] (32) [<c0156e6a>] (52)
Nov  4 09:26:45  kernel:   [system_call+51/56] (60)
Nov  4 09:26:45  kernel:   [<c0109727>] (60)
Nov  4 09:26:45  kernel: Modules: [(reiserfs:<ce140060>:<ce177274>)]
Nov  4 09:26:45  kernel: Code: 0f 0b 4e 01 1c 4e 17 ce 85 db 74 0e 0f b7
43 08 89 04 24 e8
Nov  4 09:26:45  kernel: klogd 1.4.1, ---------- state change ----------
Nov  4 09:26:45  kernel: Inspecting /boot/System.map-2.4.21-292-smp
Nov  4 09:26:45  kernel: Loaded 22038 symbols from
/boot/System.map-2.4.21-292-smp.
Nov  4 09:26:45  kernel: Symbols match kernel version 2.4.21.
Nov  4 09:26:45  kernel: Loaded 487 symbols from 13 modules.

An reboot of the machine stops with:

kernel BUG at journal.c:782!
invalid operand: 000 2.4.21-292-smp #1 SMP Tue May 24 16:59:12 UTC 2005
CPU:    2
EIP:    0010:[<ce122cec>]       Not tainted
EEFLAGS:00010246
eax: 00000000   ebx: 00000000   ecx: ce15cf24   edx: f92820d8
esi: ce15cee0   edi: 00000000   ebp: d0958c00   esp: cded1e98
ds: 0018   es: 0018   ss: 0018
Prozess init (pid: 1, stackpage=3Dcded1000)
Stack: d0958c00 00000000 c0159078 00000286 00001a70 f9282078 ce15cef8
00000286
       00000000 00000000 00000000 f92820f0 00000000 ce15cee0 ce1284e6
d0958c00
       ce15cee0 00000001 00000006 ce126635 cded0000 00000000 00000002
00000000
Call Trace:         [<c0159078>] (48) [<ce1284e6>] (20) [<ce126635>]
(72)
  [<ce1137a0>] (04) [<ce1271ba>] (28) [<ce11383c>] (60) [<c015d826>]
(28)
  [<c01582a7>] (20) [<c01583cf>] (08) [<c0109727>] (60)
Modules: [(reiserfs:<ce1583cf>:<ce137274>)]
Code: 0f 0b 0e 03 59 50 13 ce 83 7e 64 01 0f 8e 19 04 00 00 8b 46
 <0>Kernel panic: Attempted to kill init!

Any suggestions? Need more Infos?
Thanks.

------_=_NextPart_001_01C5E395.2920D8E4
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6617.27">
<TITLE>ReiserFS problem ?</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi all,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">given situation:</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">HP DL580 G2 / SuSE SLES8 / ReiserFS3 =
</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Last friday the server stops with the =
following massage:</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
journal-1996: do_journal_end, could not get a list bitmap</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
kernel BUG at prints.c:334!</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
invalid operand: 0000 2.4.21-292-smp #1 SMP Tue May 24 16:59:12 UTC =
2005</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
CPU:&nbsp;&nbsp;&nbsp; 1</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
EIP:&nbsp;&nbsp;&nbsp; =
0010:[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&=
#43-55611672/96]&nbsp;&nbsp;&nbsp; Tainted: P</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
EIP:&nbsp;&nbsp;&nbsp; 0010:[&lt;ce156ee8&gt;]&nbsp;&nbsp;&nbsp; =
Tainted: P</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
EFLAGS: 00010296</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
eax: 0000003d&nbsp;&nbsp; ebx: cdd59800&nbsp;&nbsp; ecx: =
00000046&nbsp;&nbsp; edx: c0331968</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
esi: 00000000&nbsp;&nbsp; edi: 00000000&nbsp;&nbsp; ebp: =
de2da660&nbsp;&nbsp; esp: f6e05e88</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: ds: =
0018&nbsp;&nbsp; es: 0018&nbsp;&nbsp; ss: 0018</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
Process db2sysc (pid: 15060, stackpage=3Df6e05000)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
Stack: ce174e16 ce1758c0 00000000 cdd59800 ce1684ff cdd59800 ce173fc0 =
00001000</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; =
kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000006 ce162701 =
f6e04000 00000004 00000002 00000000 d2659420 00000004</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; =
kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000000 00000001 =
00001a69 dadb2820 dadb2620 e1b4b000 db669000 f92e274c</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: =
Call Trace:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&#43-5=
5489002/96] (04) =
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&#43-5=
5486272/96] (12) =
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&#43-5=
5540481/96] (08)</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; kernel: Call =
Trace:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
[&lt;ce174e16&gt;] (04) [&lt;ce1758c0&gt;] (12) [&lt;ce1684ff&gt;] =
(08)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; =
kernel:&nbsp;&nbsp; =
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&#43-5=
5492672/96] (12) =
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&#43-5=
5564543/96] (76) =
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&#43-5=
5545414/96] (28) =
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&#43-5=
5543250/96] (44)</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:44&nbsp; =
kernel:&nbsp;&nbsp; [&lt;ce173fc0&gt;] (12) [&lt;ce162701&gt;] (76) =
[&lt;ce1671ba&gt;] (28) [&lt;ce167a2e&gt;] (44)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; =
kernel:&nbsp;&nbsp; [generic_file_write&#43383/416] (20) =
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&#43-5=
5543133/96] (24) =
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.21-292-smp/kernel/drivers&#43-5=
5643128/96] (32) [sys_pwrite&#43202/376] (52)</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; =
kernel:&nbsp;&nbsp; [&lt;c014416f&gt;] (20) [&lt;ce167aa3&gt;] (24) =
[&lt;ce14f408&gt;] (32) [&lt;c0156e6a&gt;] (52)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; =
kernel:&nbsp;&nbsp; [system_call&#4351/56] (60)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; =
kernel:&nbsp;&nbsp; [&lt;c0109727&gt;] (60)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; kernel: =
Modules: [(reiserfs:&lt;ce140060&gt;:&lt;ce177274&gt;)]</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; kernel: =
Code: 0f 0b 4e 01 1c 4e 17 ce 85 db 74 0e 0f b7 43 08 89 04 24 e8</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; kernel: =
klogd 1.4.1, ---------- state change ----------</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; kernel: =
Inspecting /boot/System.map-2.4.21-292-smp</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; kernel: =
Loaded 22038 symbols from /boot/System.map-2.4.21-292-smp.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; kernel: =
Symbols match kernel version 2.4.21.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Nov&nbsp; 4 09:26:45&nbsp; kernel: =
Loaded 487 symbols from 13 modules.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">An reboot of the machine stops =
with:</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">kernel BUG at journal.c:782!</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">invalid operand: 000 2.4.21-292-smp #1 =
SMP Tue May 24 16:59:12 UTC 2005</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">CPU:&nbsp;&nbsp;&nbsp; 2</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">EIP:&nbsp;&nbsp;&nbsp; =
0010:[&lt;ce122cec&gt;]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Not =
tainted</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">EEFLAGS:00010246</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">eax: 00000000&nbsp;&nbsp; ebx: =
00000000&nbsp;&nbsp; ecx: ce15cf24&nbsp;&nbsp; edx: f92820d8</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">esi: ce15cee0&nbsp;&nbsp; edi: =
00000000&nbsp;&nbsp; ebp: d0958c00&nbsp;&nbsp; esp: cded1e98</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">ds: 0018&nbsp;&nbsp; es: =
0018&nbsp;&nbsp; ss: 0018</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Prozess init (pid: 1, =
stackpage=3Dcded1000)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Stack: d0958c00 00000000 c0159078 =
00000286 00001a70 f9282078 ce15cef8 00000286</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
00000000 00000000 00000000 f92820f0 00000000 ce15cee0 ce1284e6 =
d0958c00</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ce15cee0 00000001 00000006 ce126635 cded0000 00000000 00000002 =
00000000</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Call =
Trace:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
[&lt;c0159078&gt;] (48) [&lt;ce1284e6&gt;] (20) [&lt;ce126635&gt;] =
(72)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; [&lt;ce1137a0&gt;] (04) =
[&lt;ce1271ba&gt;] (28) [&lt;ce11383c&gt;] (60) [&lt;c015d826&gt;] =
(28)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; [&lt;c01582a7&gt;] (20) =
[&lt;c01583cf&gt;] (08) [&lt;c0109727&gt;] (60)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Modules: =
[(reiserfs:&lt;ce1583cf&gt;:&lt;ce137274&gt;)]</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Code: 0f 0b 0e 03 59 50 13 ce 83 7e 64 =
01 0f 8e 19 04 00 00 8b 46</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&lt;0&gt;Kernel panic: Attempted =
to kill init!</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Any suggestions? Need more =
Infos?</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Thanks.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C5E395.2920D8E4--
