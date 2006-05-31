From: Francesco Biscani <biscani@pd.astro.it>
Subject: Re: reiser4 for 2.6.16 (version 3)
Date: Wed, 31 May 2006 18:40:58 +0200
Message-ID: <200605311840.58433.biscani@pd.astro.it>
References: <1148923857.6482.12.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28705-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1148923857.6482.12.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Monday 29 May 2006 19:30, Vladimir V. Saveliev wrote:
> Hello
>
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-3.pat=
ch
>.gz contains the most recent reiser4 code which is considered stable inside
> Namesys. This code is supposed to be in mm kernel next to 2.6.17-rc4-mm3.
>
> Please try it. Any feedback is welcome.

Hi,

I'm using the 4th version and after a while I got this bug:

=2D---------------------

reiser4[kio_http(28952)]: delete_object_unix_file=20
(fs/reiser4/plugin/file/file.c:2615)[]:
WARNING: failed to truncate file (50954396) on removal: -2
reiser4[kio_http(28951)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-353=
3]:
WARNING: Keys are inconsistent. Fsck?
Unable to handle kernel NULL pointer dereference at virtual address 00000008
 printing eip:
c0194824
*pde =3D 00000000
Oops: 0000 [#1]
Modules linked in: ehci_hcd uhci_hcd isofs iptable_nat ip_nat iptable_mangl=
e=20
xt_state ip_conntrack xt_tcpudp iptable_filter ip_tables x_tables radeon dr=
m=20
usb_storage snd_usb_audio snd_usb_lib snd_hwdep usbhid fuse loop 8250=20
serial_core ircomm_tty ircomm irtty_sir sir_dev irda
CPU:    0
EIP:    0060:[<c0194824>]    Not tainted VLI
EFLAGS: 00010287   (2.6.16-morph4 #2)
EIP is at try_capture+0x109/0x552
eax: 00000000   ebx: cd40f1c0   ecx: dbab9e80   edx: c8fdb324
esi: c3d00b80   edi: c8fdb310   ebp: c0c34cc0   esp: c1c1d9d8
ds: 007b   es: 007b   ss: 0068
Process kio_http (pid: 28957, threadinfo=3Dc1c1c000 task=3Dcfda6a70)
Stack: <0>cd40f1c4 c1c1da1c 00000008 dbab9ef0 00000000 c1c1c000 c0c34c80=20
c0c34c84
       00000000 c3d00b80 dbab9e80 c018f3c5 dbab9e80 00000002 00000000 00000=
002
       c1c1dbfc 01118bf4 00000000 00000000 00000000 dbab9ee0 c0c34cc0 dbab9=
e80
Call Trace:
 [<c018f3c5>] longterm_lock_znode+0x26c/0x34e
 [<c01a043f>] lock_neighbor+0x65/0xab
 [<c01a0abc>] reiser4_get_neighbor+0xad/0x4a1
 [<c01bdcc7>] lookup_tail+0x0/0xbe
 [<c019067c>] kill_node_content+0x137/0x960
 [<c01a270a>] formatted_readahead+0x54/0x29a
 [<c018f51d>] longterm_unlock_znode+0x76/0x171
 [<c018eea1>] move_lh_internal+0x5b/0xe3
 [<c0191518>] cut_tree_worker_common+0x41/0x469
 [<c01914d7>] cut_tree_worker_common+0x0/0x469
 [<c018f8ab>] cut_tree_object+0x117/0x1f6
 [<c0193107>] reiser4_grab_space+0x3d/0x7c
 [<c01a01ff>] reiser4_decode_fh+0x66/0xf7
 [<c01a986c>] cut_file_items+0xe4/0x208
 [<c01a9d11>] truncate_file_body+0xbc/0x450
 [<c01aa88a>] update_file_size+0x0/0x84
 [<c01bc828>] store_black_box+0x90/0x98
 [<c01a43a6>] safe_link_add+0x76/0xbb
 [<c0194f85>] txn_end+0x256/0x4d8
 [<c0192fe5>] grabbed2free+0x27/0x37
 [<c0193687>] all_grabbed2free+0x35/0x39
 [<c0189626>] preempt_point+0x5/0x1b
 [<c019521c>] txn_restart+0x15/0x22
 [<c0193fc8>] txn_begin+0x1e/0x30
 [<c01aa7f4>] delete_object_unix_file+0x46/0xdc
 [<c0193fc8>] txn_begin+0x1e/0x30
 [<c0191b00>] _init_context+0x6b/0x8e
 [<c019f0c9>] reiser4_delete_inode+0x6c/0xbe
 [<c019f05d>] reiser4_delete_inode+0x0/0xbe
 [<c016dbd7>] generic_delete_inode+0x5c/0xca
 [<c016d70f>] iput+0x41/0x7d
 [<c0165e9f>] do_unlinkat+0xe4/0x141
 [<c011ac9d>] __do_softirq+0x42/0x8e
 [<c0102c7b>] sysenter_past_esp+0x54/0x75
Code: 14 8d 7a ec 8b 47 14 0f 18 00 90 3b 54 24 0c 0f 84 40 ff ff ff 8b 47 =
04=20
89 04 24 e8 27 d1 ff ff 89 c3 39 44 24 18 74 d6 8b 40 3c <3b> 70 08 74 ce 8=
b=20
47 04 89 04 24 e8 30 a5 ff ff 8b 53 3c 8b 5a

=2D---------------------

Various versions of reiser4 in the past have had this problem, always=20
triggered by kio_http (a component of the konqueror web browser). At a=20
certain point the bug disappeared, but now it is back.

After the bug happened it was impossible to sync or write anything to the=20
disk. Rebooted and fscked, no corruptions found.

Hope that helps!

  Francesco

=2D-=20
Dr. Francesco Biscani
Dipartimento di Astronomia
Universit=E0 di Padova
biscani@pd.astro.it
