From: Brian Marr <cabernet@internode.on.net>
Subject: Kernel Error
Date: Tue, 1 Oct 2002 07:04:15 +0930
Message-ID: <200210010704.15161.cabernet@internode.on.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11582-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>


Suse 8.0 kernel 2.4.18 AMD 1530Mhz cpu
Can anyone enlighten me on the possible cause of this problem ? The syste=
m=20
continues to run ok - but I would value your feedback.
Brian Marr

Sep 29 11:27:18 linux kernel: invalid operand: 0000
Sep 29 11:27:18 linux kernel: CPU:    0
Sep 29 11:27:18 linux kernel: EIP:    0010:[__free_pages_ok+43/660]   =20
Tainted: P
Sep 29 11:27:18 linux kernel: EFLAGS: 00210286
Sep 29 11:27:18 linux kernel: eax: c02a95e0   ebx: c11192c0   ecx: c02a94=
40  =20
edx: c02a93c0
Sep 29 11:27:18 linux kernel: esi: c11192c0   edi: 00000000   ebp: 000001=
d0  =20
esp: cdfd9f28
Sep 29 11:27:18 linux kernel: ds: 0018   es: 0018   ss: 0018
Sep 29 11:27:18 linux kernel: Process kswapd (pid: 5, stackpage=3Dcdfd900=
0)
Sep 29 11:27:18 linux kernel: Stack: c52817e0 c11192c0 00000015 000001d0=20
c11192c0 000001d0 c52817e0 c11192c0
Sep 29 11:27:18 linux kernel:        c012c503 c012d6f9 c012c53c 0000001f=20
c02a9510 000001d0 c02a9510 cdfd8000
Sep 29 11:27:18 linux kernel:        00000c80 00016f33 c02a9510 c012c859=20
cdfd9fa8 00000014 000001d0 00000020
Sep 29 11:27:18 linux kernel: Call Trace: [shrink_cache+475/816]=20
[__free_pages+29/32] [shrink_cache+532/816] [shrink_caches+93/104]=20
[try_to_free_pages+92/240]
