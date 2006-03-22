From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Tue, 21 Mar 2006 23:41:22 -0800
Message-ID: <4420FFA2.1090908@namesys.com>
References: <44206D3C.7050504@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44206D3C.7050504@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>, Alexander Zarochentcev <zam@namesys.com>

Laurent Riffard wrote:

>Hello,
>
>Writing big files is very slow on reiser4 now.=20
>
>"dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; sync"
>
try bs=3D4M, and tell me what happens.  also try an empty fs, and an fs
that is equally full to reiserfs.  Note that reiserfs in your test is
68% full vs. 90% full for V4.  It may be that we need to port some of
the block allocation optimizations from V3 to V4 (Jeff's work) to help
with 90% full filesystems.  Thanks for doing this.  Real users always
teach me a lot when they test things differently from how I did.

Hans

> takes more than 2 minutes on=20
>reiser4 fs, but only 15 seconds on reiserfs fs.
>
>Actually, writing on reiser4 is not uniformly slow, it seems to be blocked=
 for=20
>ages from time to time. I monitored the number of dirty pages from /proc/m=
eminfo=20
>an I hit sysrq-T when the system was stalling: =20
>
>dd            D 000017DE     0 21930  21929                     (NOTLB)
>       d7169c74 e0c98b05 00000246 000017de 00000000 f396aa00 003d1249 d0b6=
8140
>       d0b68030 f396aa00 003d1249 6d519e00 00000002 c0396434 d8bf8e30 d8bf=
8e38
>       00000246 d7169ca0 c0270f08 d0b68030 00000001 d0b68030 c0113b25 d8bf=
8e38
>Call Trace:
> [<c0270f08>] __down+0x81/0xdc
> [<c026f3ba>] __down_failed+0xa/0x10
> [<e0c91a62>] .text.lock.lock+0x15/0x1b [reiser4]
> [<e0c90faf>] longterm_lock_znode+0x5b4/0x7b0 [reiser4]
> [<e0cba16a>] cbk_level_lookup+0x8a/0x954 [reiser4]
> [<e0cbb186>] traverse_tree+0x752/0xa0d [reiser4]
> [<e0cbbbc2>] coord_by_handle+0x781/0x789 [reiser4]
> [<e0cbbdb5>] object_lookup+0x1eb/0x230 [reiser4]
> [<e0cdb201>] find_file_item+0x18d/0x1b7 [reiser4]
> [<e0cdd873>] write_flow+0x208/0x6e1 [reiser4]
> [<e0cde208>] write_unix_file+0x3d9/0x5b0 [reiser4]
> [<c0147d36>] vfs_write+0x8a/0x133
> [<c0148569>] sys_write+0x3b/0x60
> [<c01029bb>] sysenter_past_esp+0x54/0x75
>
>Below are the detailed test I ran. Feel free to ask for more information.
>
>Reiser4 FS
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>Desktop$ cd ~/kernel
>
>kernel$ df .
>Sys. de fich.         Tail. Occ. Disp. %Occ. Mont=E9 sur
>/dev/hda8             925M  825M  101M  90% /home/laurent/kernel
>
>kernel$ grep hda8 /proc/mounts
>/dev/hda8 /home/laurent/kernel reiser4 rw,nosuid,nodev,atom_max_size=3D0x7=
e0c,atom_max_age=3D0x249f0,atom_min_size=3D0x100,atom_max_flushers=3D0x1,cb=
k_cache_slots=3D0x10 0 0
>
>kernel$ sync; time dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; tim=
e sync=20
>102400+0 enregistrements lus.
>102400+0 enregistrements =E9crits.
>0.06user 13.95system 1:42.09elapsed 13%CPU (0avgtext+0avgdata 0maxresident=
)k
>0inputs+0outputs (0major+250minor)pagefaults 0swaps
>0.00user 0.00system 1:22.90elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+191minor)pagefaults 0swaps
>
>kernel$ sync; time dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; tim=
e sync=20
>102400+0 enregistrements lus.
>102400+0 enregistrements =E9crits.
>0.08user 14.01system 1:45.57elapsed 13%CPU (0avgtext+0avgdata 0maxresident=
)k
>0inputs+0outputs (0major+249minor)pagefaults 0swaps
>0.00user 0.00system 0:09.78elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+191minor)pagefaults 0swaps
>
>kernel$ sync; time dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; tim=
e sync=20
>102400+0 enregistrements lus.
>102400+0 enregistrements =E9crits.
>0.06user 14.13system 2:18.27elapsed 10%CPU (0avgtext+0avgdata 0maxresident=
)k
>0inputs+0outputs (0major+251minor)pagefaults 0swaps
>0.00user 0.00system 0:08.48elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+190minor)pagefaults 0swaps
>
>kernel$ sync; time dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; tim=
e sync=20
>102400+0 enregistrements lus.
>102400+0 enregistrements =E9crits.
>0.06user 14.27system 1:56.34elapsed 12%CPU (0avgtext+0avgdata 0maxresident=
)k
>0inputs+0outputs (0major+251minor)pagefaults 0swaps
>0.00user 0.00system 0:10.46elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+190minor)pagefaults 0swaps
>
>
>Reiserfs FS
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>kernel$ cd
>
>~$ df .
>Sys. de fich.         Tail. Occ. Disp. %Occ. Mont=E9 sur
>/dev/mapper/vglinux1-lvhome
>                      7,0G  4,8G  2,3G  68% /home
>[/dev/mapper/vglinux1-lvhome resides on /dev/hda4]
>
>~$ grep lvhome /proc/mounts
>/dev/vglinux1/lvhome /home reiserfs rw 0 0
>
>~$ sync; time dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; time syn=
c=20
>102400+0 enregistrements lus.
>102400+0 enregistrements =E9crits.
>0.04user 1.75system 0:02.05elapsed 87%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+249minor)pagefaults 0swaps
>0.00user 0.10system 0:12.93elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+191minor)pagefaults 0swaps
>
>~$ sync; time dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; time syn=
c=20
>102400+0 enregistrements lus.
>102400+0 enregistrements =E9crits.
>0.04user 1.83system 0:01.98elapsed 94%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+250minor)pagefaults 0swaps
>0.00user 0.16system 0:14.45elapsed 1%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+191minor)pagefaults 0swaps
>
>~$ sync; time dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; time syn=
c=20
>102400+0 enregistrements lus.
>102400+0 enregistrements =E9crits.
>0.04user 1.79system 0:01.95elapsed 93%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+250minor)pagefaults 0swaps
>0.00user 0.10system 0:13.47elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
>0inputs+0outputs (0major+190minor)pagefaults 0swaps
>
>~~
>laurent
>
>
> =20
>

