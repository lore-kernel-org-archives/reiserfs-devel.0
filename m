From: Redeeman <redeeman@metanurb.dk>
Subject: Re: Reiser4 / Reiserfs bonnie++ performance comparison
Date: Fri, 09 Jul 2004 22:54:43 +0200
Message-ID: <1089406483.10745.3.camel@localhost>
References: <20040709165924.27fabe63@philou.gramoulle.local>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19564-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040709165924.27fabe63@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

My benchmarks.. (if you can call it that)
reiser4

root@redeeman: /mnt/fstest# time tar -xjf /miscbinds/work/linux-
2.6.5.tar.bz2

real    0m18.834s
user    0m14.785s
sys     0m2.516s

root@redeeman: /mnt/fstest# time cp -a linux-2.6.5 linux

real    0m12.936s
user    0m0.067s
sys     0m2.137s

root@redeeman: /mnt/fstest# time rm -fr linux

real    0m3.596s
user    0m0.012s
sys     0m1.237s

-------------------------------------

reiserfs:

root@redeeman: /mnt/fstest# time tar -xjf /miscbinds/work/linux-
2.6.5.tar.bz2

real    0m31.078s
user    0m15.232s
sys     0m2.099s

root@redeeman: /mnt/fstest# time cp -a linux-2.6.5 linux

real    0m50.763s
user    0m0.134s
sys     0m2.935s

root@redeeman: /mnt/fstest# time rm -fr linux

real    0m1.493s
user    0m0.013s
sys     0m0.722s

---------------------------------------

xfs

root@redeeman: /mnt/fstest# time tar -xjf /miscbinds/work/linux-
2.6.5.tar.bz2

real    0m36.432s
user    0m15.202s
sys     0m1.727s

root@redeeman: /mnt/fstest# time cp -a linux-2.6.5 linux

real    1m10.314s
user    0m0.162s
sys     0m3.428s

root@redeeman: /mnt/fstest# time rm -fr linux

real    0m22.153s
user    0m0.042s
sys     0m1.618s

---------------------------------------------------------------------------=
---

ext3

root@redeeman: /mnt/fstest# time tar -xjf /miscbinds/work/linux-
2.6.5.tar.bz2

real    0m32.082s
user    0m15.190s
sys     0m1.519s

root@redeeman: /mnt/fstest# time cp -a linux-2.6.5 linux

real    0m39.479s
user    0m0.095s
sys     0m2.059s

root@redeeman: /mnt/fstest# time rm -fr linux

real    0m0.846s
user    0m0.012s
sys     0m0.369s

---------------------------------------------------------------------------=
-----

ext2

root@redeeman: /mnt/fstest# time tar -xjf /miscbinds/work/linux-
2.6.5.tar.bz2

real    0m30.046s
user    0m15.165s
sys     0m1.025s

root@redeeman: /mnt/fstest# time cp -a linux-2.6.5 linux

real    0m18.344s
user    0m0.104s
sys     0m1.454s

root@redeeman: /mnt/fstest# time rm -fr linux

real    0m1.367s
user    0m0.009s
sys     0m0.226s

---------------------------------------------------------------------------=
------

fat32

root@redeeman: /mnt/fstest# time tar -xjf /miscbinds/work/linux-
2.6.5.tar.bz2

real    0m45.634s
user    0m25.625s
sys     0m6.361s


root@redeeman: /mnt/fstest# time cp -a linux-2.6.5 linux

real    0m59.151s
user    0m9.098s
sys     0m17.761s

root@redeeman: /mnt/fstest# time rm -fr linux

real    0m2.449s
user    0m0.009s
sys     0m1.121s

On Fri, 2004-07-09 at 16:59 +0200, Philippe Gramoull=E9 wrote:
>  Hello,
>=20
> Below are results from bonnie++ done on reiser4 and reiserfs.
> Each result is an average of 5 runs.
>=20
> For Reiser4 i used default mkfs options and -o formatting=3Dextents
> For Reisefs i used default mount options and -o notails
>=20
> Assuming that default behavior of bonnie++ is to use twice the RAM of the=
 server,
> no reboot was done between consecutive runs
>=20
> Bonnie++ was run like this : bonnie++ -x 5 -d bonnie
>=20
> Hardware: Dell PowerEdge 2550 1GHz SMP, 1Go RAM, SCSI 15K RPM U160 Seagat=
e Cheetah X15 Disk
> Software: Debian Sid + 2004.07.02 Reiser4 auto snapshot ( 2.6.7-mm4 )
> .config file available here if interested: http://philou.org/linux/reiser=
4/config-2.6.7-mm4
>=20
> Biggest regression seems to be in deletes.
>=20
> I will gladly redo my benchmarks if you feel i did or missed something ob=
viously important,
> or you'd like me to test other FSes as well
>=20
> Comments are welcome.
>=20
> Thanks,
>=20
> Philippe
>=20
> --
> Lycos Europe Noc
>=20
>=20
>=20
> Average of 5 runs with reiser4 ( no special mkfs options )
>=20
> Version  1.03       ------Sequential Output------ --Sequential Input- --R=
andom-
>                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --S=
eeks--
> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /s=
ec %CP
> localbox         2G 15357  93 29126  24	17855  24 15994	 93 40185  26   3=
22   1
>                     ------Sequential Create------ --------Random Create--=
------
>                     -Create-- --Read--- -Delete-- -Create-- --Read--- -De=
lete--
>               files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /s=
ec %CP
>                  16 19839  99 +++++ +++  7394 99.8 7632	100  +++++ +++ 73=
26 99.8
>=20
>=20
> Average of 5 runs with reiser4 ( mkfs option -o formatting=3Dextents)
>=20
> Version  1.03       ------Sequential Output------ --Sequential Input- --R=
andom-
>                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --S=
eeks--
> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /s=
ec %CP
> localbox         2G 15221  92 30467  25	17341  23 16059  94 40183  26   3=
19   1
>                     ------Sequential Create------ --------Random Create--=
------
>                     -Create-- --Read--- -Delete-- -Create-- --Read--- -De=
lete--
>               files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /s=
ec %CP
>                  16 19728  99 +++++ +++  7361 99.8 7576	 99 +++++ +++  72=
65 99.8
> 		=20
>=20
> Average of 5 runs with reiserfs ( no special mount options )
>=20
> Version  1.03       ------Sequential Output------ --Sequential Input- --R=
andom-
>                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --S=
eeks--
> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /s=
ec %CP
> localbox         2G 16207  97 30432  30 16978  16 15100  91 38487  22   3=
49   1
>                     ------Sequential Create------ --------Random Create--=
------
>                     -Create-- --Read--- -Delete-- -Create-- --Read--- -De=
lete--
>               files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /s=
ec %CP
>                  16 12433  99 +++++ +++	10349  96 11836	 99 +++++ +++  92=
48 99.8
> 		=20
> 		=20
> Average of 5 runs with reiserfs ( mount option -o notails)
>=20
> Version  1.03       ------Sequential Output------ --Sequential Input- --R=
andom-
>                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --S=
eeks--
> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /s=
ec %CP
> localbox         2G 16029  96 33199  33	16201  15 15226  91 38606  22   3=
48   1
>                     ------Sequential Create------ --------Random Create--=
------
>                     -Create-- --Read--- -Delete-- -Create-- --Read--- -De=
lete--
>               files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /s=
ec %CP
>                  16 12423  99 +++++ +++ 10719  99 11767  99 +++++ +++	924=
1 99.4
>=20
>=20
--=20
Redeeman <redeeman@metanurb.dk>

