From: Oliver Heering <Heering@edo.uni-dortmund.de>
Subject: Problem with Kernel 2.4.19, reiser on sw-raid5 and rsync
Date: Wed, 5 Mar 2003 13:23:56 +0100
Message-ID: <833151992.20030305132356@edo.uni-dortmund.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

we've got a big problem with one of our servers using Kernel 2.4.19
(SuSE 8.1 standard kernel), rsync and reiserfs on a software-raid5
array consisting of 6x75GB (=3D 375GB usable capacity) harddrives.

The installation of SuSE works flawlessly, but when we try to copy
several thousand files from another server to this one (via rsync), we
get the following kernel-crash:

--------------- snip ---------------
kernel: kernel BUG at journal.c:592!
kernel: invalid operand: 0000 2.4.19-4GB #1 Fri Sep 13 13:19:15 UTC 2002
kernel: CPU:    0
kernel: EIP:    0010:[joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kerne=
l/drivers/inp+-32654158/96]    Not tainted
kernel: EIP:    0010:[<c1ddfcb2>]    Not tainted
kernel: EFLAGS: 00010282
kernel: eax: e2931fc8   ebx: 00000900   ecx: e28cb000   edx: 00001964
kernel: esi: 00000001   edi: 012c8000   ebp: 00000000   esp: d1459c20
kernel: ds: 0018   es: 0018   ss: 0018
kernel: Process rsync (pid: 1098, stackpage=3Dd1459000)
kernel: Stack: 00000000 e28cb000 00001000 00008000 00000259 09008ccc 000010=
00 00000000
kernel:        00000000 00000000 c1dc03a5 c1b66800 00000900 012c8000 000010=
00 00000001
kernel:        d1459c78 00000000 00001000 00008000 c2de89c0 00000259 000000=
00 c1b66800
kernel: Call Trace:    [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/ker=
nel/drivers/inp+-32783451/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-=
4GB/kernel/drivers/inp+-32783121/96] [joydev:__insmod_joydev_O/lib/modules/=
2.4.19-4GB/kernel/drivers/inp+-32782641/96] [joydev:__insmod_joydev_O/lib/m=
odules/2.4.19-4GB/kernel/drivers/inp+-32781493/96] [joydev:__insmod_joydev_=
O/lib/modules/2.4.19-4GB/kernel/drivers/inp+-32750223/96]
kernel: Call Trace:    [<c1dc03a5>] [<c1dc04ef>] [<c1dc06cf>] [<c1dc0b4b>] =
[<c1dc8571>]
kernel:   [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/i=
np+-32745617/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/dr=
ivers/inp+-32678239/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/ke=
rnel/drivers/inp+-32744544/96] [__block_prepare_write+399/800] [block_prepa=
re_write+57/144] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/dr=
ivers/inp+-32751312/96]
kernel:   [<c1dc976f>] [<c1dd9ea1>] [<c1dc9ba0>] [<c01480df>] [<c01489b9>] =
[<c1dc8130>]
kernel:   [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/i=
np+-32736026/96] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/dr=
ivers/inp+-32751312/96] [do_generic_file_write+963/1936] [generic_file_writ=
e+154/208] [joydev:__insmod_joydev_O/lib/modules/2.4.19-4GB/kernel/drivers/=
inp+-32731463/96] [sys_write+163/304]
kernel:   [<c1dcbce6>] [<c1dc8130>] [<c01366b3>] [<c0136b1a>] [<c1dcceb9>] =
[<c0145523>]
kernel:   [system_call+51/56]
kernel:   [<c010907f>]
kernel: Modules: [(reiserfs:<c1dc0060>:<c1def390>)]
kernel: Code: 0f 0b 50 02 64 d2 de c1 b8 01 00 00 00 eb 9f 31 c0 eb 9b 0f
kernel: klogd 1.4.1, ---------- state change ----------
kernel: Inspecting /boot/System.map-2.4.19-4GB
kernel: Loaded 14220 symbols from /boot/System.map-2.4.19-4GB.
kernel: Symbols match kernel version 2.4.19.
kernel: Loaded 483 symbols from 14 modules.
--------------- snip ---------------

What could have gone wrong? We tried several newinstalls and changing
of kernel-version to 2.4.20 and nothing helped.

We're virtually out of ideas right now but if you take a look at...
http://groups.google.com/groups?hl=3Den&lr=3D&ie=3DUTF-8&oe=3Dutf-8&threadm=
=3Davuid5%242kgl%241%40FreeBSD.csie.NCTU.edu.tw&rnum=3D1&prev=3D/groups%3Fq=
%3Dsoftware%2Braid%2Breiserfs%2Bkernel%2Bpanic%26hl%3Den%26lr%3D%26ie%3DUTF=
-8%26oe%3Dutf-8%26selm%3Davuid5%25242kgl%25241%2540FreeBSD.csie.NCTU.edu.tw=
%26rnum%3D1
...there must be some other people who have the same problem.

The last suspect I have is, that 2 of the 6 harddrivers are different
models but with around the same (a bit more) capacity. Could this be
the cause, too?

Or are there any known bugs when using rsync in combination with
reiserfs and software-raid5 ?

Thanks for answers.. :)

Oliver Heering
Medienzentrum - Universit=E4t Dortmund
http://www.medienzentrum.uni-dortmund.de


