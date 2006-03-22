From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Wed, 22 Mar 2006 18:48:53 +0100
Message-ID: <44218E05.1090109@free.fr>
References: <44206D3C.7050504@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070601000209060504030604"
Return-path: <reiserfs-list-return-28314-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44206D3C.7050504@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>

--------------070601000209060504030604
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

[this is a second post, the first post seemed to never reach the list]

Le 21.03.2006 22:16, Laurent Riffard a =E9crit :
> Hello,
>=20
> Writing big files is very slow on reiser4 now.=20
>=20
> "dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; sync" takes more tha=
n 2 minutes on=20
> reiser4 fs, but only 15 seconds on reiserfs fs.

Oops! My tests were not fair: my reiser4 FS was almost full while my
reiserfs FS
had plenty of free space.

> kernel$ df .
> Sys. de fich.         Tail. Occ. Disp. %Occ. Mont=E9 sur
> /dev/hda8             925M  825M  101M  90% /home/laurent/kernel
> kernel$ grep hda8 /proc/mounts
> /dev/hda8 /home/laurent/kernel reiser4 rw,nosuid,nodev,atom_max_size=3D0x=
7e0c,atom_max_age=3D0x249f0,atom_min_size=3D0x100,atom_max_flushers=3D0x1,c=
bk_cache_slots=3D0x10 0 0
[snip]
> ~$ df .
> Sys. de fich.         Tail. Occ. Disp. %Occ. Mont=E9 sur
> /dev/mapper/vglinux1-lvhome
>                       7,0G  4,8G  2,3G  68% /home
> ~$ grep lvhome /proc/mounts
> /dev/vglinux1/lvhome /home reiserfs rw 0 0

So I did some tests with a 2GB logical volume. I formatted it
(reiserfs/ext2/reiser4fs), I untared a copy of a kernel tree on this FS
and I wrote a 100 MB file 3 times.

FS        Elapsed time for dd + sync
reiserfs: 14.22s
ext2:     11.12s
reiser4:  19.71s

I won't discuss why reiser4 is slow here. Maybe my tests are not so
good. The
interesting point of this thread is that reiser4 seems not to like
the situations
with little space available. I should replay these tests with 90%
full FS (but it's
time to go to bed now...).

Below is attached the full logs of my tests.
~~
laurent


--------------070601000209060504030604
Content-Type: text/plain;
 name="typescript"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="typescript"

Le script a d���but��� sur mar 21 mar 2006 22:40:11 CET
[root@antares ~]# lvdisplay /dev/vglinux1/test
  --- Logical volume ---
  LV Name                /dev/vglinux1/test
  VG Name                vglinux1
  LV UUID                1IdmIn-9Ne8-IZDS-PUYF-IyLP-Xz54-c50H2E
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2,00 GB
  Current LE             512
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:5
   
[root@antares ~]# mkfs.reiserfs /dev/vglinux1/test 
mkfs.reiserfs 3.6.19 (2003 www.namesys.com)

A pair of credits:
Yury Umanets  (aka Umka)  developed  libreiser4,  userspace  plugins,  and  all
userspace tools (reiser4progs) except of fsck.

Hans Reiser was the project initiator,  source of all funding for the first 5.5
years. He is the architect and official maintainer.


Guessing about desired format.. Kernel 2.6.16-rc6-mm2 is running.
Format 3.6 with standard journal
Count of blocks on the device: 524288
Number of blocks consumed by mkreiserfs formatting process: 8227
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: 9f9b271b-1ed6-4ffb-9cde-243d3859b221
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
	ALL DATA WILL BE LOST ON '/dev/vglinux1/test'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

Tell your friends to use a kernel based on 2.4.18 or later, and especially not a
kernel based on 2.4.9, when you use reiserFS. Have fun.

ReiserFS is successfully created on /dev/vglinux1/test.
[root@antares ~]# mount /dev/vglinux1/test /mnt/disk 
[root@antares ~]# cd /mnt/disk
[root@antares disk]# tar -xjf  ~laurent/.ketchup/linux-2.6.15.tar.bz2
[root@antares disk]# df .
Sys. de fich.         Tail. Occ. Disp. %Occ. Mont��� sur
/dev/mapper/vglinux1-test
                      2,0G  260M  1,8G  13% /mnt/disk
[root@antares disk]# ls
linux-2.6.15
[root@antares disk]#  sync; time dd if=/dev/zero of=toto bs=1k count=102400; time sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.04user 1.60system 0:01.73elapsed 94%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+250minor)pagefaults 0swaps
0.00user 0.06system 0:15.53elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+191minor)pagefaults 0swaps

[root@antares disk]#  sync; time dd if=/dev/zero of=toto bs=1k count=102400; time sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.02user 1.60system 0:01.65elapsed 98%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+251minor)pagefaults 0swaps
0.00user 0.04system 0:09.72elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+190minor)pagefaults 0swaps

[root@antares disk]#  sync; time dd if=/dev/zero of=toto bs=1k count=102400; time sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.04user 1.63system 0:01.69elapsed 99%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+250minor)pagefaults 0swaps
0.00user 0.06system 0:15.58elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+192minor)pagefaults 0swaps

[root@antares disk]#  sync; time dd if=/dev/zero of=toto bs=1k count=102400; time sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.03user 1.64system 0:01.70elapsed 98%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+251minor)pagefaults 0swaps
0.00user 0.05system 0:09.49elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+190minor)pagefaults 0swaps

[root@antares disk]# cd 
[root@antares ~]# umount /mnt/disk
[root@antares ~]# 
[root@antares ~]# mkfs.ext2 /dev/vglinux1/test
mke2fs 1.38 (30-Jun-2005)
���tiquette de syst���me de fichiers=
Type de syst���me d'exploitation: Linux
Taille de bloc=4096 (log=2)
Taille de fragment=4096 (log=2)
262144 inodes, 524288 blocs
26214 blocs (5.00%) r���serv��� pour le super usager
Premier bloc de donn���es=0
16 bloc de groupes
32768 blocs par groupe, 32768 fragments par groupe
16384 inodes par groupe
Archive du superbloc stock���e sur les blocs: 
	32768, 98304, 163840, 229376, 294912

���criture des tables d'inodes:  0/16 1/16 2/16 3/16 4/16 5/16 6/16 7/16 8/16 9/1610/1611/1612/1613/1614/1615/16compl���t���                        
���criture des superblocs et de l'information de comptabilit��� du syst���me de fichiers: compl���t���

Le syst���me de fichiers sera automatiquement v���rifi��� tous les 35 montages ou apr���s
180 jours, selon la premi���re ���ventualit���.  Utiliser tune2fs -c ou -i pour ���craser la valeur.
[root@antares ~]# mount /dev/vglinux1/test /mnt/disk
[root@antares ~]# cd /mnt/disk
[root@antares disk]# tar -xjf  ~laurent/.ketchup/linux-2.6.15.tar.bz2
[root@antares disk]# df .
Sys. de fich.         Tail. Occ. Disp. %Occ. Mont��� sur
/dev/mapper/vglinux1-test
                      2,0G  253M  1,7G  14% /mnt/disk
[root@antares disk]# sync; time dd if=/dev/zero of=toto bs=1k count=102400; time sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.05user 0.68system 0:00.78elapsed 93%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+250minor)pagefaults 0swaps
0.00user 0.03system 0:10.43elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+190minor)pagefaults 0swaps

[root@antares disk]# sync; time dd if=/dev/zero of=toto bs=1k count=102400; time sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.04user 0.67system 0:00.72elapsed 99%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+251minor)pagefaults 0swaps
0.00user 0.02system 0:10.47elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+191minor)pagefaults 0swaps

[root@antares disk]# sync; time dd if=/dev/zero of=toto bs=1k count=102400; time sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.01user 0.69system 0:00.71elapsed 98%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+252minor)pagefaults 0swaps
0.00user 0.02system 0:10.26elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+190minor)pagefaults 0swaps

[root@antares disk]# grep /mnt/disk /proc/mounts
/dev/vglinux1/test /mnt/disk ext2 rw 0 0
[root@antares disk]# cd -
[root@antares disk]# umount /mnt/disk
[root@antares ~]# mkfs.reiser4 /dev/vglinux1/test 
mkfs.reiser4 1.0.5
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by 
reiser4progs/COPYING. 

                                                                              Block size 4096 will be used. 
                                                                              Linux 2.6.16-rc6-mm2 is detected. 
                                                                              Uuid 500241b7-0035-4254-91f4-cd6fb6c556a0 will be used. 
                                                                              Reiser4 is going to be created on /dev/vglinux1/test. 
(Yes/No): [K(Yes/No): Y[K(Yes/No): Ye[K(Yes/No): Yes[K(Yes/No): Yes
                                                                              Creating reiser4 on /dev/vglinux1/test ...                                                                               Creating reiser4 on /dev/vglinux1/test ... done
[root@antares ~]# mount /dev/vglinux1/test /mnt/disk
[root@antares ~]# cd /mnt/disk
[root@antares disk]# tar -xjf  ~laurent/.ketchup/linux-2.6.15.tar.bz2
[root@antares disk]# grep /mnt/disk /proc/mounts
/dev/vglinux1/test /mnt/disk reiser4 rw,atom_max_size=0x7e0c,atom_max_age=0x249f0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10 0 0
[root@antares disk]# df .
Sys. de fich.         Tail. Occ. Disp. %Occ. Mont��� sur
/dev/mapper/vglinux1-test
                      2,0G  220M  1,7G  12% /mnt/disk
[root@antares disk]# time dd if=/dev/zero of=toto bs=1k count=102400; time  sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.10user 13.06system 0:18.88elapsed 69%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+250minor)pagefaults 0swaps
0.00user 0.05system 0:03.42elapsed 1%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+191minor)pagefaults 0swaps

[root@antares disk]# time dd if=/dev/zero of=toto bs=1k count=102400; time  sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.08user 12.88system 0:13.19elapsed 98%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+249minor)pagefaults 0swaps
0.00user 0.00system 0:05.19elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+191minor)pagefaults 0swaps

[root@antares disk]# time dd if=/dev/zero of=toto bs=1k count=102400; time  sync
102400+0 enregistrements lus.
102400+0 enregistrements ���crits.
0.09user 12.88system 0:13.17elapsed 98%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+251minor)pagefaults 0swaps
0.00user 0.00system 0:05.29elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+191minor)pagefaults 0swaps

[root@antares disk]# 
[root@antares disk]# 
[root@antares disk]# exit

Script compl���t��� sur mar 21 mar 2006 22:58:31 CET


--------------070601000209060504030604--
