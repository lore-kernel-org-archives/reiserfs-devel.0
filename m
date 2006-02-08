From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: journal-1413: journal_mark_dirty: j_len (1024) is too big
Date: Wed, 08 Feb 2006 09:47:55 +0300
Message-ID: <1139381275.6216.14.camel@tribesman.namesys.com>
References: <9D15A798843E614AB379904106AF5A16779DC5@COMAIL3.corp.idanalytics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28043-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9D15A798843E614AB379904106AF5A16779DC5@COMAIL3.corp.idanalytics.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Jeff Thayer <jthayer@idanalytics.com>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2006-02-07 at 10:49 -0800, Jeff Thayer wrote:
> Getting this error on a SUSE SLES 9.0 box.  Here=E2=80=99s some relevant =
info
> and the error is below.
>=20
> =20
>=20
> Any ideas?  Thanks in advance!
>=20
> =20
>=20
> Jeff Thayer
>=20
> Linux Administrator
>=20
> -------------------------------------------------------------------------=
-----------
>=20
> =20
>=20
> # mkreiserfs -V
>=20
> mkreiserfs 3.6.19 (2003 www.namesys.com)
>=20
> =20
>=20
> # uname -a
>=20
> Linux host1 2.6.5-7.191-smp #1 SMP Tue Jun 28 14:58:56 UTC 2005 i686
> i686 i386 GNU/Linux
>=20
> =20
>=20
> # cat /etc/*rel*
>=20
> SUSE LINUX Enterprise Server 9 (i586)
>=20
> VERSION =3D 9
>=20
> PATCHLEVEL =3D 2
>=20
> =20
>=20
> Feb  6 14:08:20 host1 kernel: REISERFS: panic (device cciss/c0d0p6):
> journal-1413: journal_mark_dirty: j_len (1024) is too big
>=20

please check whether this patch helps you.
http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D112300831729572&w=3D2


> Feb  6 14:08:20 host1 kernel:
>=20
> Feb  6 14:08:20 host1 kernel: ------------[ cut here ]------------
>=20
> Feb  6 14:08:20 host1 kernel: kernel BUG at fs/reiserfs/prints.c:362!
>=20
> Feb  6 14:08:20 host1 kernel: invalid operand: 0000 [#1]
>=20
> Feb  6 14:08:20 host1 kernel: SMP
>=20
> Feb  6 14:08:20 host1 kernel: CPU:    1
>=20
> Feb  6 14:08:20 host1 kernel: EIP:    0060:[<f88cc0ad>]    Not tainted
>=20
> Feb  6 14:08:20 host1 kernel: EFLAGS: 00010296   (2.6.5-7.191-smp
> SLES9_SP2_BRANCH-200506281458560000)
>=20
> Feb  6 14:08:20 host1 kernel: EIP is at reiserfs_panic+0x3d/0x70
> [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel: eax: 00000065   ebx: f76fbc00   ecx:
> c03a96dc   edx: c03a96dc
>=20
> Feb  6 14:08:20 host1 kernel: esi: f76fbc00   edi: f59ee4f4   ebp:
> f8bc7000   esp: e5955ac4
>=20
> Feb  6 14:08:20 host1 kernel: ds: 007b   es: 007b   ss: 0068
>=20
> Feb  6 14:08:20 host1 kernel: Process rm (pid: 11107,
> threadinfo=3De5954000 task=3De4940010)
>=20
> Feb  6 14:08:20 host1 kernel: Stack: f88e6174 f76fbd3c f88f2e20
> f88e6fb8 f88d8ba8 f76fbc00 f88e6fb8 00000400
>=20
> Feb  6 14:08:20 host1 kernel:       00000000 e5955eec f76fbc00
> f8bc70cc 05effffa f88d8e22 00000000 e5955eec
>=20
> Feb  6 14:08:20 host1 kernel:       00007ffa f76fbc00 05effffa
> 00000bdf f88b36d1 f8bc7100 00000000 f8bc7000
>=20
> Feb  6 14:08:20 host1 kernel: Call Trace:
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88d8ba8>] journal_mark_dirty
> +0x248/0x260 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88d8e22>] journal_mark_freed
> +0x1c2/0x310 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88b36d1>] _reiserfs_free_block
> +0x111/0x1b0 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88d4bd5>] prepare_for_delete_or_cut
> +0x425/0x7b0 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88d5389>] reiserfs_cut_from_item
> +0xb9/0x990 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<c015b184>] mark_page_accessed
> +0x34/0x40
>=20
> Feb  6 14:08:20 host1 kernel:  [<c01779b1>] __find_get_block
> +0xa1/0x1b0
>=20
> Feb  6 14:08:20 host1 kernel:  [<c0178666>] wake_up_buffer+0x6/0x30
>=20
> Feb  6 14:08:20 host1 kernel:  [<c0178719>] ll_rw_block+0x49/0x90
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88d5f4b>] reiserfs_do_truncate
> +0x2eb/0x5f0 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88d6280>] reiserfs_delete_object
> +0x30/0x70 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88c0fae>] reiserfs_delete_inode
> +0xde/0x138 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88df64f>] reiserfs_permission
> +0xf/0x20 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<f88c0ed0>] reiserfs_delete_inode
> +0x0/0x138 [reiserfs]
>=20
> Feb  6 14:08:20 host1 kernel:  [<c0192414>] generic_delete_inode
> +0xa4/0x160
>=20
> Feb  6 14:08:20 host1 kernel:  [<c01917ce>] iput+0x5e/0x90
>=20
> Feb  6 14:08:20 host1 kernel:  [<c0187b76>] sys_unlink+0x166/0x1d0
>=20
> Feb  6 14:08:20 host1 kernel:  [<c0110a35>] do_mmap2+0x105/0x160
>=20
> Feb  6 14:08:20 host1 kernel:  [<c01091d9>] sysenter_past_esp
> +0x52/0x79
>=20
> Feb  6 14:08:20 host1 kernel:
>=20
> Feb  6 14:08:20 host1 kernel: Code: 0f 0b 6a 01 2b 3c 8e f8 85 db b8
> 1b 3c 8e f8 74 06 8d 83 3c
>=20
> =20
>=20
>=20

