From: "Selzner, Peter \(KRZ\)" <P.Selzner@KRZ.DE>
Subject: kernel BUG at prints.c:334!
Date: Tue, 8 Nov 2005 08:28:50 +0100
Message-ID: <4B24A8042312F24B8E4F3DFC7FA8331B17DBAA@s600mx01.krz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

SORRY for the first html mail!

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


