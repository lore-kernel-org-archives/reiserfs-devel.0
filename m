From: Joachim Bremer <joachim.bremer@ricardo.de>
Subject: Re: Segmentation Fault when mounting ataraid
Date: Mon, 27 Jan 2003 23:55:27 +0100 (MET)
Message-ID: <200301272255.h0RMtRW25238@chekov.ricardo.de>
References: <3E35B2F8.10806@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12519-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E35B2F8.10806@gmx.net> from Jochen Haemmerle at "Jan 27, 2003
 11:30:16 pm"
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jochen Haemmerle <thehammer@gmx.net>
Cc: reiserfs-list@namesys.com

Hello,

please feed this oops through ksymoops cause the data
you postet is useless for all others but you.

Joachim

> Hello!
> 
> When I try to mount my reiserfs partition on a HPT370 Stripe I get a 
> Segmentation Fault. All other partitions (reiserfs of cource) work fine.
> 
> My kernel is the 2.4.20 from Kernel.org
> The PC is a Dual PIII 866 with Via-Apollo Chipset
> The Harddisks are 2 Maxtor 80GB
> ACPI is turned off !
> 
> 
> I don't know if this error depends on reiserfs, but maybe someone can 
> help me!
> 
> 
> Best Regards
> 
> Jochen Haemmerle
> 
> 
> 
> vampire:~# mount /dev/ataraid/d0p1 /mnt/ataraid
> 
> Unable to handle kernel NULL pointer dereference at vitual address 00000004
> printin eip:
> c01a62c0
> *pde = 00000000
> Oops: 0002
> CPU:   0
> EIP     0010:[<c01a62c0>]        Tainted: P
> EFLAGS: 00010012
> eax: 00000000   ebx: c03324f8  ecx: dff188a0   edx: c03324fc
> esi: 00000000   edi: c03324f8  ebp: 00000008   esp: d7839d98
> ds:0018  es: 0018  ss: 0018
> 
> Process mount (pid: 327, stackpage=d7839000)
> Stack 00000000 d7cc54a0 dff187e0 c01a698d c03324f8 00000000 00002140 
> d7cc54a0
>        007c0000 098a9f2d c0332518 00000800 c0332520 c0332518 00000080 
> 00000000
>        003e003f 00000000 c01a6c6c c03324f8 00000000 d7cc54a0 00000008 
> 00000000
> 
> Call Trace:   [<c01a698d>] [<c01a6c6c>][<c01a6ccc>] [<c01a6e27>] 
> [<c0172671>]
> [<c0173188>] [<c013c712>] [<c014d546>][<c013c8fd>] [<c014e589>] [<c014e842>]
> [<c014e6ad>] [<c014ec6f>] [<c0106f17>]
> 
> Code: 89 50 04 89 02 c7 01 00 00 00 00 c7 41 04 00 00 00 00 ff 0b
>    Segmentation fault
> 

