From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: why hang-up on sync?
Date: Mon, 16 Jan 2006 18:27:48 -0700
Message-ID: <1137461268.6375.24.camel@tribesman.namesys.com>
References: <43BB2AD8.6050304@ursynow.2a.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43BB2AD8.6050304@ursynow.2a.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Artur =?ISO-8859-1?Q?Mak=F3wka?= <juice@ursynow.2a.pl>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-01-04 at 02:54 +0100, Artur Mak=C3=B3wka wrote:
> Whats up with sync ? this is what happens when i run hdparm -t /dev/hda=20
> ( i tested /dev/hda with testdisk tool, and everything seems fine)
>=20
> # df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/hda1             3.0G  2.5G  326M  89% /
> /dev/hda2             139G   72G   68G  52% /home
> tmpfs                 443M     0  443M   0% /dev/shm
> # mount
> /dev/hda1 on / type ext3 (rw,errors=3Dremount-ro)
> /dev/hda2 on /home type reiser4 (rw,noatime,nodiratime)
> proc on /proc type proc (rw)
> sysfs on /sys type sysfs (rw)
> devpts on /dev/pts type devpts (rw,gid=3D5,mode=3D620)
> tmpfs on /dev/shm type tmpfs (rw)
>=20
> Linux 2.6.14.3 with latest reiser4 patch.
>=20
> I'm attaching strace from hdparm -t /dev/hda
>=20
> plain text document attachment (strace1.log)
> execve("/sbin/hdparm", ["hdparm", "-t", "/dev/hda"], [/* 20 vars */]) =3D=
 0
> uname({sys=3D"Linux", node=3D"werewolf.cba.pl", ...}) =3D 0
> brk(0)                                  =3D 0x8056000
> access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or di=
rectory)
> access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or di=
rectory)
> old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,=
 0) =3D 0xb7fb0000
> open("/etc/ld.so.cache", O_RDONLY)      =3D 3
> fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D34708, ...}) =3D 0
> old_mmap(NULL, 34708, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xb7fa7000
> close(3)                                =3D 0
> access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or di=
rectory)
> open("/lib/tls/libc.so.6", O_RDONLY)    =3D 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320O\1"..., 512)=
 =3D 512
> fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1266800, ...}) =3D 0
> old_mmap(NULL, 1272764, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3=
, 0) =3D 0xb7e70000
> old_mmap(0xb7f9d000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|M=
AP_DENYWRITE, 3, 0x12d000) =3D 0xb7f9d000
> old_mmap(0xb7fa5000, 7100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MA=
P_ANONYMOUS, -1, 0) =3D 0xb7fa5000
> close(3)                                =3D 0
> old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,=
 0) =3D 0xb7e6f000
> mprotect(0xb7f9d000, 20480, PROT_READ)  =3D 0
> set_thread_area({entry_number:-1 -> 6, base_addr:0xb7e6f6c0, limit:104857=
5, seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_pre=
sent:0, useable:1}) =3D 0
> munmap(0xb7fa7000, 34708)               =3D 0
> open("/dev/hda", O_RDONLY|O_NONBLOCK)   =3D 3
> fstat64(1, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(136, 0), ...}) =3D 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)=
 =3D 0xb7faf000
> write(1, "\n", 1)                       =3D 1
> write(1, "/dev/hda:\n", 10)             =3D 10
> ioctl(3, BLKGETSIZE64, 0xbfbc3600)      =3D 0
> shmget(IPC_PRIVATE, 2097152, 0600)      =3D 0
> shmctl(0, IPC_64|SHM_LOCK, 0)           =3D 0
> shmat(0, 0, 0)                          =3D 0xb7c6f000
> shmctl(0, IPC_64|IPC_RMID, 0)           =3D 0
> sync(

Does it ever finish?


