From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Processes dying?
Date: Fri, 4 Jun 2004 23:41:49 +0300
Message-ID: <20040604204149.GG4990@nysv.org>
References: <20040604203925.GF4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040604203925.GF4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Fri, Jun 04, 2004 at 11:39:25PM +0300, Markus T=F6rnqvist wrote:
>Hello

Here's another strace, for what it's worth...

mjt@shrike:~$ sudo strace  apt-get install bonnie++ > foo 2>&1


execve("/usr/bin/apt-get", ["apt-get", "install", "bonnie++"], [/* 25 vars =
*/]) =3D 0
uname({sys=3D"Linux", node=3D"shrike", ...}) =3D 0
brk(0)                                  =3D 0x8066000
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x40017000
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/etc/ld.so.preload", O_RDONLY)    =3D -1 ENOENT (No such file or dire=
ctory)
open("/etc/ld.so.cache", O_RDONLY)      =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D46307, ...}) =3D 0
old_mmap(NULL, 46307, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40018000
close(3)                                =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/usr/lib/libapt-pkg-libc6.3-5.so.3.3", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0 \220\1"..., 512) =
=3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D561600, ...}) =3D 0
old_mmap(NULL, 565148, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x400240=
00
old_mmap(0x400a2000, 49152, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,=
 0x7d000) =3D 0x400a2000
close(3)                                =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/usr/lib/libstdc++.so.5", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@\262\3"..., 512) =
=3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D734712, ...}) =3D 0
old_mmap(NULL, 754336, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x400ae0=
00
old_mmap(0x4014c000, 90112, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,=
 0x9e000) =3D 0x4014c000
old_mmap(0x40162000, 17056, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_ANONYMOUS, -1, 0) =3D 0x40162000
close(3)                                =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/tls/libm.so.6", O_RDONLY)    =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\0006\0"..., 512) =
=3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D141312, ...}) =3D 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x40167000
old_mmap(NULL, 139712, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x401680=
00
old_mmap(0x4018a000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, =
0x22000) =3D 0x4018a000
close(3)                                =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/libgcc_s.so.1", O_RDONLY)    =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@\25\0\000"..., 512=
) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D31548, ...}) =3D 0
old_mmap(NULL, 30464, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x4018b000
old_mmap(0x40192000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, =
0x7000) =3D 0x40192000
close(3)                                =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/tls/libc.so.6", O_RDONLY)    =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\340X\1"..., 512) =
=3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D1279044, ...}) =3D 0
old_mmap(NULL, 1289356, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x40193=
000
old_mmap(0x402c3000, 36864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,=
 0x12f000) =3D 0x402c3000
old_mmap(0x402cc000, 7308, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
ANONYMOUS, -1, 0) =3D 0x402cc000
close(3)                                =3D 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x402ce000
set_thread_area({entry_number:-1 -> 6, base_addr:0x402ce080, limit:1048575,=
 seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_prese=
nt:0, useable:1}) =3D 0
munmap(0x40018000, 46307)               =3D 0
brk(0)                                  =3D 0x8066000
brk(0x8087000)                          =3D 0x8087000
open("/dev/null", O_WRONLY|O_CREAT|O_TRUNC, 0666) =3D 3
stat64("/var/lib/apt/.", {st_mode=3DS_IFDIR|0755, st_size=3D3, ...}) =3D 0
stat64("/etc/apt/apt.conf.d/", {st_mode=3DS_IFDIR|0755, st_size=3D3, ...}) =
=3D 0
open("/etc/apt/apt.conf.d/", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) =
=3D 4
fstat64(4, {st_mode=3DS_IFDIR|0755, st_size=3D3, ...}) =3D 0
fcntl64(4, F_SETFD, FD_CLOEXEC)         =3D 0
getdents64(4, /* 3 entries */, 65536)   =3D 80
stat64("/etc/apt/apt.conf.d/70debconf", {st_mode=3DS_IFREG|0644, st_size=3D=
182, ...}) =3D 0
getdents64(4, /* 0 entries */, 65536)   =3D 0
close(4)                                =3D 0
open("/etc/apt/apt.conf.d/70debconf", O_RDONLY) =3D 4
fstat64(4, {st_mode=3DS_IFREG|0644, st_size=3D182, ...}) =3D 0
mmap2(NULL, 65536, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x402cf000
read(4, "// Pre-configure all packages wi"..., 65536) =3D 182
read(4, "", 65536)                      =3D 0
read(4, "", 65536)                      =3D 0
close(4)                                =3D 0
munmap(0x402cf000, 65536)               =3D 0
stat64("/etc/apt/apt.conf", 0xbffff47c) =3D -1 ENOENT (No such file or dire=
ctory)
stat64("/var/lib/dpkg/status", {st_mode=3DS_IFREG|0644, st_size=3D763684, .=
..}) =3D 0
stat64("/usr/bin/dpkg", {st_mode=3DS_IFREG|0755, st_size=3D174040, ...}) =
=3D 0
stat64("/etc/debian_version", {st_mode=3DS_IFREG|0644, st_size=3D17, ...}) =
=3D 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbffff620) =3D -1 ENOSYS (Function=
 not implemented)
rt_sigaction(SIGPIPE, {SIG_IGN}, {SIG_DFL}, 8) =3D 0
rt_sigaction(SIGWINCH, {0x805d2d0, [WINCH], SA_RESTART}, {SIG_DFL}, 8) =3D 0
ioctl(1, TIOCGWINSZ, 0xbffff6a0)        =3D -1 ENOSYS (Function not impleme=
nted)
open("/var/lib/dpkg/lock", O_RDWR|O_CREAT|O_TRUNC, 0640 <unfinished ...>

--=20
mjt

