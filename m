From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: 2.6.20-rc3-mm1: umount reiser4 FS stuck in D state
Date: Tue, 23 Jan 2007 19:40:57 +0300
Message-ID: <200701231940.58053.vs@namesys.com>
References: <20070104220200.ae4e9a46.akpm@osdl.org> <200701062158.06329.vs@namesys.com> <45A81231.6040104@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932622AbXAWPl3@vger.kernel.org>
In-Reply-To: <45A81231.6040104@free.fr>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com, Kernel development list <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@suse.de>

Hello

On Saturday 13 January 2007 01:56, Laurent Riffard wrote:
> Le 06.01.2007 19:58, Vladimir V. Saveliev a =E9crit :
> > Hello
> >=20
> > On Saturday 06 January 2007 13:58, Laurent Riffard wrote:
> >> Hello,
> >>
> >> got this with 2.6.20-rc3-mm1:
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >> SysRq : Show Blocked State
> >>
> >>                          free                        sibling
> >>   task             PC    stack   pid father child younger older
> >> umount        D C013135E  6044  1168   1150                     (N=
OTLB)
> >>        de591ae4 00000086 de591abc c013135e dff979c8 c012a6fe 00000=
046 00000007=20
> >>        dfd94ac0 128d3000 00000026 00000000 dfd94bcc dff979c8 de591=
ae4 dffda038=20
> >>        00000002 dff979c0 dff979bc dff979c8 de591b10 c012d600 dff97=
9f8 00000000=20
> >> Call Trace:
> >>  [<c012d600>] synchronize_qrcu+0x70/0x8c
> >>  [<c01bede4>] __make_request+0x4c/0x29b
> >>  [<c01bd24b>] generic_make_request+0x1b0/0x1de
> >>  [<c01bf354>] submit_bio+0xda/0xe2
> >>  [<e12674bd>] write_jnodes_to_disk_extent+0x920/0x974 [reiser4]
> >>  [<e12678dd>] update_journal_footer+0x29f/0x2b7 [reiser4]
> >>  [<e1268b65>] write_tx_back+0x149/0x185 [reiser4]
> >>  [<e126a8e7>] reiser4_write_logs+0xea4/0xfd2 [reiser4]
> >>  [<e125626a>] try_commit_txnh+0x7e6/0xa4f [reiser4]
> >>  [<e125661b>] reiser4_txn_end+0x148/0x3cf [reiser4]
> >>  [<e12568ad>] reiser4_txn_restart+0xb/0x1a [reiser4]
> >>  [<e125692f>] reiser4_txn_restart_current+0x73/0x75 [reiser4]
> >>  [<e1256b89>] force_commit_atom+0x258/0x261 [reiser4]
> >>  [<e1257703>] txnmgr_force_commit_all+0x406/0x697 [reiser4]
> >>  [<e12e5e08>] release_format40+0x10c/0x193 [reiser4]
> >>  [<e1279922>] reiser4_put_super+0x134/0x16a [reiser4]
> >>  [<c015c930>] generic_shutdown_super+0x55/0xd8
> >>  [<c015c9d3>] kill_block_super+0x20/0x32
> >>  [<c015ca75>] deactivate_super+0x3f/0x51
> >>  [<c016d903>] mntput_no_expire+0x42/0x5f
> >>  [<c0160f37>] path_release_on_umount+0x15/0x18
> >>  [<c016df77>] sys_umount+0x1a3/0x1cb
> >>  [<c016dfb8>] sys_oldumount+0x19/0x1b
> >>  [<c0103ed2>] sysenter_past_esp+0x5f/0x99
> >>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >>
> >> Scenario:
> >> - umount a reiser4 FS (no need to write something before)
> >=20
> > Hmm, I can not reproduce this with 2.6.20-rc3-mm1. Probably I need =
to config the kernel more close to your system.
> >=20
> >> Earlier kernels were OK.
>=20
> This still happens with 2.6.20-rc4-mm1...
>=20
> Should I open a bug report at http://bugzilla.kernel.org?
>=20

Which device with reiser4 did you try to umount?
Jens wrote that it could be a barrier related. If there are no multidev=
ices involved - please report to bugzilla.
