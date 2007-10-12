From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: 2.6.23-mm1
Date: Fri, 12 Oct 2007 14:00:23 -0700
Message-ID: <20071012140023.30e5b30e.akpm@linux-foundation.org>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org>
	<470FDB41.2000102@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760393AbXJLVBV@vger.kernel.org>
In-Reply-To: <470FDB41.2000102@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>

On Fri, 12 Oct 2007 22:38:25 +0200
Laurent Riffard <laurent.riffard@free.fr> wrote:

> Le 12.10.2007 06:31, Andrew Morton a =E9crit :
> > ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.2=
3/2.6.23-mm1/
>=20
> Mounting reiser4 fs does hang with these messages in dmesg:
>=20
>   Loading Reiser4. See www.namesys.com for a description of Reiser4.
>   reiser4[swapper(0)]: end_bio_single_page_read (fs/reiser4/page_cach=
e.c:331)[nikita-3332]:
>   WARNING: Truncated single page read: 4096
>=20
> Hitting SysRq-W produces this output:
>=20
>   SysRq : Show Blocked State
>     task                PC stack   pid father
>   mount         D c20d6b70  1592  2509   2495
>          c229bbd8 00000046 c239d684 c20d6b70 e0824b8d c229bc10 000000=
00 c229bc18=20
>          c229bbe0 c02ac14e c229bbe8 c0141b7b c229bc04 c02ac344 c0141b=
45 c1402654=20
>          c1045f60 c1045f60 c229bc10 c229bc30 c0141d6e 00000002 c1045f=
60 00000000=20
>   Call Trace:
>    [<c02ac14e>] io_schedule+0xe/0x16
>    [<c0141b7b>] sync_page+0x36/0x3a
>    [<c02ac344>] __wait_on_bit+0x36/0x5d
>    [<c0141d6e>] wait_on_page_bit+0x55/0x5b
>    [<e1c0e1a6>] jload_gfp+0x73/0x163 [reiser4]
>    [<e1c1c7f8>] load_journal_control_block+0x4d/0x77 [reiser4]
>    [<e1c1c86e>] reiser4_init_journal_info+0x2b/0x54 [reiser4]
>    [<e1c454e6>] init_format_format40+0x79/0x4ab [reiser4]
>    [<e1c21cf8>] fill_super+0xce/0x1ee [reiser4]
>    [<c015f731>] get_sb_bdev+0xe0/0x11e
>    [<e1c21a8f>] reiser4_get_sb+0x13/0x15 [reiser4]
>    [<c015f336>] vfs_kern_mount+0x3b/0x76
>    [<c0171621>] do_mount+0x68a/0x7a3
>    [<c01717a2>] sys_mount+0x68/0xa4
>    [<c0103dee>] sysenter_past_esp+0x5f/0x99
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

ho hum.  Maybe reiser4 needs updating for the git-block changes.

I don't recall having seen a useful description of what's going on
in git-block so some reverse-engineering might be needed.
