From: markw@osdl.org
Subject: Re: resier4 performance with dbt-2
Date: Fri, 13 Feb 2004 15:51:14 -0800 (PST)
Message-ID: <200402132351.i1DNpOE27923@mail.osdl.org>
References: <200402140048.11119.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16791-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402140048.11119.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="iso-8859-1"
To: Dieter.Nuetzel@hamburg.de
Cc: reiserfs-list@namesys.com

On 14 Feb, Dieter N=FCtzel wrote:
> Am Freitag, 13. Februar 2004 18:31 schrieb markw@osdl.org:
>> http://developer.osdl.org/markw/fs/dbt2_stp_results.html
>>
>> I have some data (at the link above) with the reiser4 2004.02.06
>> snapshot applied to linux-2.6.2 with our DBT-2 (OLTP) workload on 4-way
>> and 8-way systems.  On the 4-way systems, the results of the workload
>> seem comparable to other filesystems.  On the 8-way systems, the results
>> of the workload drop about 28%.
>>
>> I have readprofile and oprofile (w/ annotated assembly) data with the
>> results.  If there's anything else I can provide let me know.
>=20
> Where are the ReiserFS 3.xx plus data-logging results?
> Several sites have them in production.

Unfortunitely we've been running into linux kernel problems that we
think is more of the fault of the aacraid driver on our systems than the
reiserfs 3.xx, so I don't have any results for that.  It's just odd that
only reiserfs 3.xx triggers it.  I'll copy that here for reference:

Unable to handle kernel NULL pointer dereference at virtual address 00000000
 printing eip:                                                             =
=20
00000000     =20
*pde =3D 373ce001
*pte =3D 00000000
Oops: 0000 [#1]
CPU:    2     =20
EIP:    0060:[<00000000>]    Not tainted
EFLAGS: 00010046                       =20
EIP is at 0x0  =20
eax: f782e820   ebx: f7f9c000   ecx: f6f0c800   edx: c3afa6a0
esi: f782e800   edi: 00000086   ebp: 00000096   esp: f7f9ded0
ds: 007b   es: 007b   ss: 0068                              =20
Process swapper (pid: 0, threadinfo=3Df7f9c000 task=3Dc38d2ca0)
Stack: f8919c7a c3afa6a0 f6fa1db0 f6f0c800 f782e9d0 f891df6d c3afa6a0 f6fa1=
db0=20
       00000004 f782e800 f7f9c000 f7f9c000 f7f9c000 00000001 00000000 f6fba=
b88=20
       f782e9d0 24000001 00000000 f7f9df80 f891e88b f7a9f180 c011c496 f71c8=
980=20
Call Trace:                                                                =
   =20
 [<f8919c7a>] aac_io_done+0x3a/0x80 [aacraid]
 [<f891df6d>] aac_response_normal+0x18d/0x240 [aacraid]
 [<f891e88b>] aac_sa_intr+0x9b/0x120 [aacraid]        =20
 [<c011c496>] rebalance_tick+0x46/0xe0       =20
 [<c010bad9>] handle_IRQ_event+0x49/0x80
 [<c010becf>] do_IRQ+0xbf/0x1b0        =20
 [<c0106e70>] default_idle+0x0/0x40
 [<c0109f38>] common_interrupt+0x18/0x20
 [<c0106e70>] default_idle+0x0/0x40    =20
 [<c0106e9d>] default_idle+0x2d/0x40
 [<c0106f36>] cpu_idle+0x46/0x50   =20
 [<c0122768>] printk+0x178/0x1d0
 [<c040f0e6>] print_cpu_info+0x86/0xe0
                                     =20
Code:  Bad EIP value.
 <0>Kernel panic: Fatal exception in interrupt
In interrupt handler - not syncing

