From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Fwd: Re: 2.4.19-rc1-jam2 (-rc1aa2)
Date: Thu, 11 Jul 2002 02:35:22 +0200
Message-ID: <200207110235.22875.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10957-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Andrea Arcangeli <andrea@suse.de>, "J.A. Magallon" <jamagallon@able.es>

Hello Chris,

symbol clash between latest -AA (-jam2, 00-aa-rc1aa2) kernel and your=20
data-logging stuff ;-(

Regards,
	Dieter

----------  Forwarded Message  ----------

Subject: Re: 2.4.19-rc1-jam2 (-rc1aa2)
Date: Thu, 11 Jul 2002 02:26:03 +0200
From: Dieter N=FCtzel <Dieter.Nuetzel@hamburg.de>
To: "J.A. Magallon" <jamagallon@able.es>
Cc: Andrea Arcangeli <andrea@suse.de>

On Thursday 11 July 2002 02:01, J.A. Magallon wrote:
> On 2002.07.11 Dieter N=FCtzel wrote:
> >fs/fs.o(__ksymtab+0x10): multiple definition of `__ksymtab_balance_dirty'
> >kernel/kernel.o(__ksymtab+0x870): first defined here
> >fs/fs.o(.kstrtab+0x47): multiple definition of `__kstrtab_balance_dirty'
> >kernel/kernel.o(.kstrtab+0x23c7): first defined here

[-]

> I think your gcc is making one other definition of balance_dirty from thi=
s:
>
> kernel/ksyms.c:EXPORT_SYMBOL(balance_dirty);
>
> gcc, binutils version ?

Reading specs from /usr/lib/gcc-lib/i486-suse-linux/2.95.3/specs
gcc version 2.95.3 20010315 (SuSE)

GNU ld version 2.11.90.0.29 (with BFD 2.11.90.0.29)

> Are you building with someting like -fnocommon ?

Not that I know.

Same flags as with 2.4.19rc1aa1.

I use latest ReiserFS stuff, but same code works fine with 2.4.19rc1aa1.
Even Page Coloring works.
Only new stuff is -aa2 (XFS, not enabled, I dropped it before 'cause I do n=
ot
use it) and jam2.

SunWave1 src/linux# grep -r balance_dirty kernel fs
kernel/ksyms.c:EXPORT_SYMBOL(balance_dirty);
=DCbereinstimmungen in Bin=E4rdatei kernel/ksyms.o.
=DCbereinstimmungen in Bin=E4rdatei kernel/kernel.o.
fs/xfs/pagebuf/page_buf_io.c:   balance_dirty();
fs/xfs/pagebuf/page_buf_io.c:   int need_balance_dirty =3D 0;
fs/xfs/pagebuf/page_buf_io.c:           need_balance_dirty =3D 1;
fs/xfs/pagebuf/page_buf_io.c:   if (need_balance_dirty) {
fs/xfs/pagebuf/page_buf_io.c:                   balance_dirty();
=DCbereinstimmungen in Bin=E4rdatei fs/fs.o.
=DCbereinstimmungen in Bin=E4rdatei fs/reiserfs/reiserfs.o.
fs/reiserfs/inode.c:    int need_balance_dirty =3D 0 ;
fs/reiserfs/inode.c:                need_balance_dirty =3D 1;
fs/reiserfs/inode.c:    if (need_balance_dirty) {
fs/reiserfs/inode.c:        balance_dirty() ;
fs/reiserfs/inode.c:    int partial =3D 0, need_balance_dirty =3D 0;
fs/reiserfs/inode.c:            need_balance_dirty =3D 1;
fs/reiserfs/inode.c:    if (need_balance_dirty)
fs/reiserfs/inode.c:    balance_dirty();
=DCbereinstimmungen in Bin=E4rdatei fs/reiserfs/inode.o.
fs/reiserfs/do_balan.c:     tb->need_balance_dirty =3D 1;
fs/reiserfs/do_balan.c:    tb->need_balance_dirty =3D 0;
fs/buffer.c:static int balance_dirty_state(void)
fs/buffer.c:void balance_dirty(void)
fs/buffer.c:    int state =3D balance_dirty_state();
fs/buffer.c:EXPORT_SYMBOL(balance_dirty);
fs/buffer.c:/* atomic version, the user must call balance_dirty() by hand
fs/buffer.c:            balance_dirty();
fs/buffer.c:    int partial =3D 0, need_balance_dirty =3D 0;
fs/buffer.c:                            need_balance_dirty =3D 1;
fs/buffer.c:    if (need_balance_dirty)
fs/buffer.c:            balance_dirty();
fs/buffer.c:    if (balance_dirty_state() >=3D 0)
=DCbereinstimmungen in Bin=E4rdatei fs/buffer.o.

Thanks and good night.

-Dieter

-------------------------------------------------------

--=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel@hamburg.de

