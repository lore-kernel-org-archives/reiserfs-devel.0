From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Tue, 28 Mar 2006 22:19:01 +0200
Message-ID: <44299A35.50800@free.fr>
References: <44206D3C.7050504@free.fr> <4420FFA2.1090908@namesys.com> <44219CC2.3060405@free.fr> <44219FA8.2050606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44219FA8.2050606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>, Alexander Zarochentcev <zam@namesys.com>


Le 22.03.2006 20:04, Hans Reiser a =E9crit :
> Instead of using sync, could you increase the size of the files you
> write so that they are 10x ram size?
>=20
> I have a suspicion we are slow at sync....  I am not sure why, but I
> have seen other data where sync was slow for us, and maybe we need to
> optimize that code path.
>=20
> Hans
>=20

Hello Hans, sorry for the long delay to reply.

I'm not sure this is a problem with _sync_. I had concerns with sync
on reiser4, but I was thinking it was related with the FS policy
which try to do a lot of work in memory, and when syncing time
comes, there is a huge amount of data to write back to disk.

Well, I'm not a File Systems Expert, this is wild guess...

Anyway, I didn't try to "write a file of size 10x ram size". My test
case is a 925M FS with 100M free, and I have 512M ram. And I guess
there is a problem with the Reiser4 internal data. It's an old FS, I
made thousands of kernel builds on it.

I allocated a new logical volume (about same size, same HD), made it
a reiser4 FS and copied all my data on it.

> [root@antares ~]# grep reiser4 /proc/mounts=20
> /dev/hda8 /home/laurent/kernel reiser4 rw,nosuid,nodev,atom_max_size=3D0x=
7e22,atom_max_age=3D0x249f0,atom_min_size=3D0x100,atom_max_flushers=3D0x1,c=
bk_cache_slots=3D0x10 0 0
> /dev/vglinux1/test /mnt/disk reiser4 rw,atom_max_size=3D0x7e22,atom_max_a=
ge=3D0x249f0,atom_min_size=3D0x100,atom_max_flushers=3D0x1,cbk_cache_slots=
=3D0x10 0 0
> [root@antares ~]# grep -e hda8 -e dm-5 /proc/partitions =20
>    3     8     995998 hda8
>  254     5    1003520 dm-5
> [root@antares ~]# cp -pRL /home/laurent/kernel/. /mnt/disk
[cut errors with symbolic links]
> [root@antares ~]# df /home/laurent/kernel /mnt/disk
> Sys. de fich.         Tail. Occ. Disp. %Occ. Mont=E9 sur
> /dev/hda8             925M  822M  103M  89% /home/laurent/kernel
> /dev/mapper/vglinux1-test
>                       932M  800M  132M  86% /mnt/disk

These FS are quite similars. Now guess what ? I filled these FS with
 dd.

Original FS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
# sync
# time dd if=3D/dev/zero of=3Dtoto bs=3D1M count=3D150
103+0 enregistrements lus.
102+0 enregistrements =E9crits.
Command exited with non-zero status 1
0.00user 2.94system 3:32.18elapsed 1%CPU (0avgtext+0avgdata
0maxresident)k
# time sync
0inputs+0outputs (0major+279minor)pagefaults 0swaps
0.00user 0.01system 0:00.18elapsed 6%CPU (0avgtext+0avgdata
0maxresident)k
0inputs+0outputs (0major+191minor)pagefaults 0swaps

Copy FS
=3D=3D=3D=3D=3D=3D=3D
# sync
# time dd if=3D/dev/zero of=3Dtoto bs=3D1M count=3D150
dd: =E9criture de `toto': Aucun espace disponible sur le p=E9riph=E9rique
132+0 enregistrements lus.
131+0 enregistrements =E9crits.
Command exited with non-zero status 1
0.00user 4.08system 0:15.95elapsed 25%CPU (0avgtext+0avgdata
0maxresident)k
0inputs+0outputs (1major+279minor)pagefaults 0swaps
# time sync
0.00user 0.00system 0:00.17elapsed 0%CPU (0avgtext+0avgdata
0maxresident)k
0inputs+0outputs (0major+190minor)pagefaults 0swaps
disk$

See ? 3'30" versus 16".

I packed the metadata of my original FS to a file, you can grab it
from http://laurent.riffard.free.fr/kernel.reiser4.bz2 (6.7M).

Note I was unable to unpack it :
> # bunzip2 -c /tmp/kernel.reiser4.bz2 | debugfs.reiser4 -U /dev/vglinux1/t=
est=20
> debugfs.reiser4 1.0.5
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed b=
y reiser4progs/COPYING.=20
>=20
> Info : The metadata were packed with the reiser4progs 1.0.5.             =
                                                                           =
               =20
> Error: Can't unpack filesystem.                    =20

~~
laurent
