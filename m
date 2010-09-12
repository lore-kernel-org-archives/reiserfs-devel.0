From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: problem with GNOME 2.30
Date: Sun, 12 Sep 2010 20:30:10 +0300
Message-ID: <4C8D0E22.1010300@gentoo.org>
References: <4BC15348.80205@gentoo.org> <alpine.DEB.2.01.1004121819080.29272@bogon.housecafe.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040808030009090106040502"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.1004121819080.29272@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Christian Kujau <lists@nerdbynature.de>, Edward Shishkin <edward.shishkin@gmail.com>, tbzatek@redhat.com

This is a multi-part message in MIME format.
--------------040808030009090106040502
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-04-2010 04:23, Christian Kujau wrote:
> So, I assume that other programs (Firefox? Openoffice? vi?) can still 
> create files on this reiser4 partition. It'd be interesting how Gnome is 
> trying to create files. strace(1) comes to mind, I know it will be messy 
> to catch all the Gnome processes, but mabe you're lucky...
With the help of upstream, my little example program and and strace I
got some ideas on what might be the issue.

Glib started to use *splice* for copying files (changelog and upstream
says, strace output proves)

I'm attaching the example program and strace outputs with glib 2.22 and 2.24

- -- 
Sincerely,
Serkan KABA
Gentoo Developer
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkyNDiIACgkQRh6X64ivZaLIOwCfSIrKMj3sEdR5NVNndf3sPTm3
LHEAnAoNXpCuE/GACXrUllzbb2AT4vkT
=VgOi
-----END PGP SIGNATURE-----

--------------040808030009090106040502
Content-Type: text/plain;
 name="strace-glib-2.24.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="strace-glib-2.24.txt"

execve("./copy3", ["./copy3"], [/* 57 vars */]) = 0
brk(0)                                  = 0x602000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83cbc000
open("/usr/lib64/libv4l/v4l1compat.so", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\t\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=5888, ...}) = 0
mmap(NULL, 2101336, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb8389e000
mprotect(0x7fcb8389f000, 2093056, PROT_NONE) = 0
mmap(0x7fcb83a9e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x7fcb83a9e000
close(3)                                = 0
open("/usr/lib64/libv4l/v4l2convert.so", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\220\t\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=5976, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83cbb000
mmap(NULL, 2101352, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb8369c000
mprotect(0x7fcb8369d000, 2093056, PROT_NONE) = 0
mmap(0x7fcb8389c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x7fcb8389c000
close(3)                                = 0
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=143383, ...}) = 0
mmap(NULL, 143383, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fcb83c97000
close(3)                                = 0
open("/usr/lib/libgio-2.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 \306\1\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=718696, ...}) = 0
mmap(NULL, 2818224, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb833eb000
mprotect(0x7fcb83498000, 2093056, PROT_NONE) = 0
mmap(0x7fcb83697000, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xac000) = 0x7fcb83697000
mmap(0x7fcb8369b000, 176, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb8369b000
close(3)                                = 0
open("/usr/lib/libgobject-2.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\250\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=285896, ...}) = 0
mmap(NULL, 2384264, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb831a4000
mprotect(0x7fcb831e8000, 2097152, PROT_NONE) = 0
mmap(0x7fcb833e8000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x44000) = 0x7fcb833e8000
mmap(0x7fcb833ea000, 392, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb833ea000
close(3)                                = 0
open("/usr/lib/libgmodule-2.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\23\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14376, ...}) = 0
mmap(NULL, 2109912, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb82fa0000
mprotect(0x7fcb82fa3000, 2093056, PROT_NONE) = 0
mmap(0x7fcb831a2000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7fcb831a2000
close(3)                                = 0
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 |\1\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1015856, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83c96000
mmap(NULL, 3113304, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb82ca7000
mprotect(0x7fcb82d9e000, 2093056, PROT_NONE) = 0
mmap(0x7fcb82f9d000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf6000) = 0x7fcb82f9d000
mmap(0x7fcb82f9f000, 344, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb82f9f000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\354\1\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1399984, ...}) = 0
mmap(NULL, 3508264, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb8294e000
mprotect(0x7fcb82a9d000, 2097152, PROT_NONE) = 0
mmap(0x7fcb82c9d000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x14f000) = 0x7fcb82c9d000
mmap(0x7fcb82ca2000, 18472, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb82ca2000
close(3)                                = 0
open("/usr/lib/libv4l1.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260\20\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=20112, ...}) = 0
mmap(NULL, 2115504, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb82749000
mprotect(0x7fcb8274d000, 2093056, PROT_NONE) = 0
mmap(0x7fcb8294c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7fcb8294c000
close(3)                                = 0
open("/usr/lib/libv4l2.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\30\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=45680, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83c95000
mmap(NULL, 2141072, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb8253e000
mprotect(0x7fcb82545000, 2093056, PROT_NONE) = 0
mmap(0x7fcb82744000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0x7fcb82744000
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300Y\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=130888, ...}) = 0
mmap(NULL, 2208640, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb82322000
mprotect(0x7fcb82339000, 2093056, PROT_NONE) = 0
mmap(0x7fcb82538000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) = 0x7fcb82538000
mmap(0x7fcb8253a000, 13184, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb8253a000
close(3)                                = 0
open("/lib/libresolv.so.2", O_RDONLY)   = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\3208\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=80528, ...}) = 0
mmap(NULL, 2185864, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb8210c000
mprotect(0x7fcb8211f000, 2093056, PROT_NONE) = 0
mmap(0x7fcb8231e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x12000) = 0x7fcb8231e000
mmap(0x7fcb82320000, 6792, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb82320000
close(3)                                = 0
open("/lib/libz.so.1", O_RDONLY)        = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@ \0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=88368, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83c94000
mmap(NULL, 2183664, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb81ef6000
mprotect(0x7fcb81f0b000, 2093056, PROT_NONE) = 0
mmap(0x7fcb8210a000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x14000) = 0x7fcb8210a000
close(3)                                = 0
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\220\27\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=18696, ...}) = 0
mmap(NULL, 2114136, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb81cf1000
mprotect(0x7fcb81cf5000, 2093056, PROT_NONE) = 0
mmap(0x7fcb81ef4000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7fcb81ef4000
close(3)                                = 0
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360\r\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14512, ...}) = 0
mmap(NULL, 2109696, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb81aed000
mprotect(0x7fcb81aef000, 2097152, PROT_NONE) = 0
mmap(0x7fcb81cef000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7fcb81cef000
close(3)                                = 0
open("/usr/lib/libv4lconvert.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300\"\0\0\0\0\0\0"..., 832) = 832
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83c93000
fstat(3, {st_mode=S_IFREG|0755, st_size=112880, ...}) = 0
mmap(NULL, 2536560, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb81881000
mprotect(0x7fcb8189a000, 2097152, PROT_NONE) = 0
mmap(0x7fcb81a9a000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19000) = 0x7fcb81a9a000
mmap(0x7fcb81a9d000, 324720, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb81a9d000
close(3)                                = 0
open("/lib/librt.so.1", O_RDONLY)       = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\"\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=35656, ...}) = 0
mmap(NULL, 2132976, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb81678000
mprotect(0x7fcb81680000, 2093056, PROT_NONE) = 0
mmap(0x7fcb8187f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x7fcb8187f000
close(3)                                = 0
open("/lib/libm.so.6", O_RDONLY)        = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200>\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=526456, ...}) = 0
mmap(NULL, 2621656, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fcb813f7000
mprotect(0x7fcb81477000, 2093056, PROT_NONE) = 0
mmap(0x7fcb81676000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7f000) = 0x7fcb81676000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83c92000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83c91000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83c90000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83c8f000
arch_prctl(ARCH_SET_FS, 0x7fcb83c90700) = 0
mprotect(0x7fcb81676000, 4096, PROT_READ) = 0
mprotect(0x7fcb8187f000, 4096, PROT_READ) = 0
mprotect(0x7fcb81a9a000, 8192, PROT_READ) = 0
mprotect(0x7fcb81cef000, 4096, PROT_READ) = 0
mprotect(0x7fcb81ef4000, 4096, PROT_READ) = 0
mprotect(0x7fcb8210a000, 4096, PROT_READ) = 0
mprotect(0x7fcb8231e000, 4096, PROT_READ) = 0
mprotect(0x7fcb82538000, 4096, PROT_READ) = 0
mprotect(0x7fcb82744000, 4096, PROT_READ) = 0
mprotect(0x7fcb8294c000, 4096, PROT_READ) = 0
mprotect(0x7fcb82c9d000, 16384, PROT_READ) = 0
mprotect(0x7fcb82f9d000, 4096, PROT_READ) = 0
mprotect(0x7fcb831a2000, 4096, PROT_READ) = 0
mprotect(0x7fcb833e8000, 4096, PROT_READ) = 0
mprotect(0x7fcb83697000, 8192, PROT_READ) = 0
mprotect(0x7fcb8389c000, 4096, PROT_READ) = 0
mprotect(0x7fcb83a9e000, 4096, PROT_READ) = 0
mprotect(0x600000, 4096, PROT_READ)     = 0
mprotect(0x7fcb83cbd000, 4096, PROT_READ) = 0
munmap(0x7fcb83c97000, 143383)          = 0
set_tid_address(0x7fcb83c909d0)         = 8008
set_robust_list(0x7fcb83c909e0, 0x18)   = 0
futex(0x7fff8bcbe9dc, FUTEX_WAKE_PRIVATE, 1) = 0
futex(0x7fff8bcbe9dc, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NULL, 7fcb83c90700) = -1 ENOSYS (Function not implemented)
rt_sigaction(SIGRTMIN, {0x7fcb82327840, [], SA_RESTORER|SA_SIGINFO, 0x7fcb82330fd0}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {0x7fcb823278d0, [], SA_RESTORER|SA_RESTART|SA_SIGINFO, 0x7fcb82330fd0}, NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
sched_getparam(8008, { 0 })             = 0
sched_getscheduler(8008)                = 0 (SCHED_OTHER)
clock_getres(CLOCK_MONOTONIC, {0, 4000250}) = 0
sched_get_priority_min(SCHED_OTHER)     = 0
sched_get_priority_max(SCHED_OTHER)     = 0
sched_get_priority_max(SCHED_OTHER)     = 0
brk(0)                                  = 0x602000
brk(0x623000)                           = 0x623000
open("/usr/lib64/charset.alias", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/share/locale/locale.alias", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=2570, ...}) = 0
mmap(NULL, 65536, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83cab000
read(3, "# Locale name alias data base.\n#"..., 65536) = 2570
read(3, "", 65536)                      = 0
close(3)                                = 0
munmap(0x7fcb83cab000, 65536)           = 0
open("/usr/lib64/gio/modules", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3
fcntl(3, F_GETFD)                       = 0x1 (flags FD_CLOEXEC)
stat("/usr/lib64/gio/modules/giomodule.cache", 0x7fff8bcbe810) = -1 ENOENT (No such file or directory)
getdents(3, /* 11 entries */, 32768)    = 416
stat("/usr/lib64/gio/modules/libgiofam.so", {st_mode=S_IFREG|0755, st_size=14344, ...}) = 0
futex(0x7fcb81cf00ec, FUTEX_WAKE_PRIVATE, 2147483647) = 0
open("/usr/lib64/gio/modules/libgiofam.so", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260\21\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=14344, ...}) = 0
mmap(NULL, 2109856, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb811f3000
mprotect(0x7fcb811f6000, 2093056, PROT_NONE) = 0
mmap(0x7fcb813f5000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x2000) = 0x7fcb813f5000
close(4)                                = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143383, ...}) = 0
mmap(NULL, 143383, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7fcb83c97000
close(4)                                = 0
open("/usr/lib/libfam.so.0", O_RDONLY)  = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0000\32\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=27088, ...}) = 0
mmap(NULL, 2122424, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80fec000
mprotect(0x7fcb80ff2000, 2093056, PROT_NONE) = 0
mmap(0x7fcb811f1000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x5000) = 0x7fcb811f1000
close(4)                                = 0
mprotect(0x7fcb811f1000, 4096, PROT_READ) = 0
mprotect(0x7fcb813f5000, 4096, PROT_READ) = 0
munmap(0x7fcb83c97000, 143383)          = 0
munmap(0x7fcb811f3000, 2109856)         = 0
munmap(0x7fcb80fec000, 2122424)         = 0
stat("/usr/lib64/gio/modules/libgiogconf.so", {st_mode=S_IFREG|0755, st_size=10160, ...}) = 0
open("/usr/lib64/gio/modules/libgiogconf.so", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\f\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=10160, ...}) = 0
mmap(NULL, 2105552, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb811f4000
mprotect(0x7fcb811f6000, 2093056, PROT_NONE) = 0
mmap(0x7fcb813f5000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x1000) = 0x7fcb813f5000
close(4)                                = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143383, ...}) = 0
mmap(NULL, 143383, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7fcb83c97000
close(4)                                = 0
open("/usr/lib/libgconf-2.so.4", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\2602\1\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=262048, ...}) = 0
mmap(NULL, 2357712, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80fb4000
mprotect(0x7fcb80fef000, 2097152, PROT_NONE) = 0
mmap(0x7fcb811ef000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x3b000) = 0x7fcb811ef000
close(4)                                = 0
open("/usr/lib/libORBit-2.so.0", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\240\242\2\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=460192, ...}) = 0
mmap(NULL, 2557416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80d43000
mprotect(0x7fcb80da1000, 2097152, PROT_NONE) = 0
mmap(0x7fcb80fa1000, 73728, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x5e000) = 0x7fcb80fa1000
mmap(0x7fcb80fb3000, 1512, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb80fb3000
close(4)                                = 0
open("/usr/lib/libdbus-glib-1.so.2", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\242\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=143768, ...}) = 0
mmap(NULL, 2239432, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80b20000
mprotect(0x7fcb80b42000, 2093056, PROT_NONE) = 0
mmap(0x7fcb80d41000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x21000) = 0x7fcb80d41000
close(4)                                = 0
open("/usr/lib/libdbus-1.so.3", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\202\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=261472, ...}) = 0
mmap(NULL, 2357544, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb808e0000
mprotect(0x7fcb8091f000, 2093056, PROT_NONE) = 0
mmap(0x7fcb80b1e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x3e000) = 0x7fcb80b1e000
close(4)                                = 0
open("/lib/libutil.so.1", O_RDONLY)     = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 \16\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=10464, ...}) = 0
mmap(NULL, 2105608, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb806dd000
mprotect(0x7fcb806df000, 2093056, PROT_NONE) = 0
mmap(0x7fcb808de000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x1000) = 0x7fcb808de000
close(4)                                = 0
mprotect(0x7fcb808de000, 4096, PROT_READ) = 0
mprotect(0x7fcb80b1e000, 4096, PROT_READ) = 0
mprotect(0x7fcb80d41000, 4096, PROT_READ) = 0
mprotect(0x7fcb80fa1000, 61440, PROT_READ) = 0
mprotect(0x7fcb811ef000, 8192, PROT_READ) = 0
mprotect(0x7fcb813f5000, 4096, PROT_READ) = 0
munmap(0x7fcb83c97000, 143383)          = 0
munmap(0x7fcb811f4000, 2105552)         = 0
munmap(0x7fcb80fb4000, 2357712)         = 0
munmap(0x7fcb80d43000, 2557416)         = 0
munmap(0x7fcb80b20000, 2239432)         = 0
munmap(0x7fcb808e0000, 2357544)         = 0
munmap(0x7fcb806dd000, 2105608)         = 0
stat("/usr/lib64/gio/modules/libgvfsdbus.so", {st_mode=S_IFREG|0755, st_size=172984, ...}) = 0
open("/usr/lib64/gio/modules/libgvfsdbus.so", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0P\233\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=172984, ...}) = 0
mmap(NULL, 2269312, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb811cc000
mprotect(0x7fcb811f5000, 2093056, PROT_NONE) = 0
mmap(0x7fcb813f4000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x28000) = 0x7fcb813f4000
mmap(0x7fcb813f6000, 128, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb813f6000
close(4)                                = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143383, ...}) = 0
mmap(NULL, 143383, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7fcb83c97000
close(4)                                = 0
open("/usr/lib/libgvfscommon.so.0", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0P\241\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=98944, ...}) = 0
mmap(NULL, 2194488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80fb4000
mprotect(0x7fcb80fcb000, 2093056, PROT_NONE) = 0
mmap(0x7fcb811ca000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x16000) = 0x7fcb811ca000
close(4)                                = 0
open("/usr/lib/libdbus-1.so.3", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\202\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=261472, ...}) = 0
mmap(NULL, 2357544, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80d74000
mprotect(0x7fcb80db3000, 2093056, PROT_NONE) = 0
mmap(0x7fcb80fb2000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x3e000) = 0x7fcb80fb2000
close(4)                                = 0
open("/lib/libudev.so.0", O_RDONLY)     = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0.\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=51616, ...}) = 0
mmap(NULL, 2149024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80b67000
mprotect(0x7fcb80b73000, 2093056, PROT_NONE) = 0
mmap(0x7fcb80d72000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0xb000) = 0x7fcb80d72000
close(4)                                = 0
open("/lib/libutil.so.1", O_RDONLY)     = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 \16\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=10464, ...}) = 0
mmap(NULL, 2105608, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80964000
mprotect(0x7fcb80966000, 2093056, PROT_NONE) = 0
mmap(0x7fcb80b65000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x1000) = 0x7fcb80b65000
close(4)                                = 0
mprotect(0x7fcb80b65000, 4096, PROT_READ) = 0
mprotect(0x7fcb80d72000, 4096, PROT_READ) = 0
mprotect(0x7fcb80fb2000, 4096, PROT_READ) = 0
mprotect(0x7fcb811ca000, 4096, PROT_READ) = 0
mprotect(0x7fcb813f4000, 4096, PROT_READ) = 0
munmap(0x7fcb83c97000, 143383)          = 0
stat("/usr/lib64/gio/modules/libgioremote-volume-monitor.so", {st_mode=S_IFREG|0755, st_size=80920, ...}) = 0
open("/usr/lib64/gio/modules/libgioremote-volume-monitor.so", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300B\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=80920, ...}) = 0
mmap(NULL, 2176920, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80750000
mprotect(0x7fcb80763000, 2093056, PROT_NONE) = 0
mmap(0x7fcb80962000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x12000) = 0x7fcb80962000
close(4)                                = 0
mprotect(0x7fcb80962000, 4096, PROT_READ) = 0
open("/usr/share/gvfs/remote-volume-monitors", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 4
brk(0x644000)                           = 0x644000
getdents(4, /* 3 entries */, 32768)     = 80
open("/usr/share/gvfs/remote-volume-monitors/hal.monitor", O_RDONLY) = 5
fstat(5, {st_mode=S_IFREG|0644, st_size=123, ...}) = 0
read(5, "[RemoteVolumeMonitor]\nName=GProx"..., 4096) = 123
read(5, "", 4096)                       = 0
close(5)                                = 0
getdents(4, /* 0 entries */, 32768)     = 0
close(4)                                = 0
getdents(3, /* 0 entries */, 32768)     = 0
close(3)                                = 0
clock_getres(CLOCK_MONOTONIC, {0, 4000250}) = 0
socket(PF_FILE, SOCK_STREAM, 0)         = 3
connect(3, {sa_family=AF_FILE, path=@"/tmp/dbus-XsZw4bhzJW"}, 23) = 0
fcntl(3, F_GETFL)                       = 0x2 (flags O_RDWR)
fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK)    = 0
fcntl(3, F_GETFD)                       = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
geteuid()                               = 1000
rt_sigaction(SIGPIPE, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7fcb829800c0}, {SIG_DFL, [], 0}, 8) = 0
poll([{fd=3, events=POLLOUT}], 1, 0)    = 1 ([{fd=3, revents=POLLOUT}])
write(3, "\0", 1)                       = 1
write(3, "AUTH EXTERNAL 31303030\r\n", 24) = 24
poll([{fd=3, events=POLLIN}], 1, -1)    = 1 ([{fd=3, revents=POLLIN}])
read(3, "OK 8fa31bb364ac2a23dac40e150000a"..., 2048) = 37
poll([{fd=3, events=POLLOUT}], 1, -1)   = 1 ([{fd=3, revents=POLLOUT}])
write(3, "BEGIN\r\n", 7)                = 7
poll([{fd=3, events=POLLIN|POLLOUT}], 1, -1) = 1 ([{fd=3, revents=POLLOUT}])
writev(3, [{"l\1\0\1\0\0\0\0\1\0\0\0n\0\0\0\1\1o\0\25\0\0\0/org/fre"..., 128}, {"", 0}], 2) = 128
poll([{fd=3, events=POLLIN}], 1, 25000) = 1 ([{fd=3, revents=POLLIN}])
read(3, "l\2\1\1\n\0\0\0\1\0\0\0=\0\0\0\6\1s\0\5\0\0\0:1.62\0\0\0"..., 2048) = 260
read(3, 0x60ec10, 2048)                 = -1 EAGAIN (Resource temporarily unavailable)
rt_sigaction(SIGPIPE, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7fcb829800c0}, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7fcb829800c0}, 8) = 0
writev(3, [{"l\1\0\1\0\0\0\0\2\0\0\0\212\0\0\0\1\1o\0\31\0\0\0/org/gtk"..., 160}, {"", 0}], 2) = 160
poll([{fd=3, events=POLLIN}], 1, 60000) = 1 ([{fd=3, revents=POLLIN}])
read(3, "l\2\1\1\24\2\0\0001\0\0\0005\0\0\0\6\1s\0\5\0\0\0:1.62\0\0\0"..., 2048) = 604
read(3, 0x60ec10, 2048)                 = -1 EAGAIN (Resource temporarily unavailable)
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 4
connect(4, {sa_family=AF_FILE, path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
close(4)                                = 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 4
connect(4, {sa_family=AF_FILE, path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
close(4)                                = 0
open("/etc/nsswitch.conf", O_RDONLY)    = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=508, ...}) = 0
mmap(NULL, 65536, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fcb83cab000
read(4, "# /etc/nsswitch.conf:\n# $Header:"..., 65536) = 508
read(4, "", 65536)                      = 0
close(4)                                = 0
munmap(0x7fcb83cab000, 65536)           = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143383, ...}) = 0
mmap(NULL, 143383, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7fcb83c97000
close(4)                                = 0
open("/lib/libnss_compat.so.2", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 \23\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=31432, ...}) = 0
mmap(NULL, 2127088, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80548000
mprotect(0x7fcb8054f000, 2093056, PROT_NONE) = 0
mmap(0x7fcb8074e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x6000) = 0x7fcb8074e000
close(4)                                = 0
open("/lib/libnsl.so.1", O_RDONLY)      = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320@\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=88880, ...}) = 0
mmap(NULL, 2194128, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80330000
mprotect(0x7fcb80345000, 2093056, PROT_NONE) = 0
mmap(0x7fcb80544000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x14000) = 0x7fcb80544000
mmap(0x7fcb80546000, 6864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fcb80546000
close(4)                                = 0
mprotect(0x7fcb80544000, 4096, PROT_READ) = 0
mprotect(0x7fcb8074e000, 4096, PROT_READ) = 0
munmap(0x7fcb83c97000, 143383)          = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143383, ...}) = 0
mmap(NULL, 143383, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7fcb83c97000
close(4)                                = 0
open("/lib/libnss_nis.so.2", O_RDONLY)  = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200 \0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=43376, ...}) = 0
mmap(NULL, 2139352, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb80125000
mprotect(0x7fcb8012f000, 2093056, PROT_NONE) = 0
mmap(0x7fcb8032e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x9000) = 0x7fcb8032e000
close(4)                                = 0
open("/lib/libnss_files.so.2", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0p!\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=47432, ...}) = 0
mmap(NULL, 2143632, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7fcb7ff19000
mprotect(0x7fcb7ff24000, 2093056, PROT_NONE) = 0
mmap(0x7fcb80123000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0xa000) = 0x7fcb80123000
close(4)                                = 0
mprotect(0x7fcb80123000, 4096, PROT_READ) = 0
mprotect(0x7fcb8032e000, 4096, PROT_READ) = 0
munmap(0x7fcb83c97000, 143383)          = 0
open("/etc/passwd", O_RDONLY|O_CLOEXEC) = 4
fcntl(4, F_GETFD)                       = 0x1 (flags FD_CLOEXEC)
lseek(4, 0, SEEK_CUR)                   = 0
fstat(4, {st_mode=S_IFREG|0644, st_size=1286, ...}) = 0
mmap(NULL, 1286, PROT_READ, MAP_SHARED, 4, 0) = 0x7fcb83cba000
lseek(4, 1286, SEEK_SET)                = 1286
munmap(0x7fcb83cba000, 1286)            = 0
close(4)                                = 0
getuid()                                = 1000
uname({sys="Linux", node="firari", ...}) = 0
pipe2([4, 5], O_CLOEXEC)                = 0
open("/usr/lib64/gvfs/modules", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
open("/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) = 6
fstat(6, {st_mode=S_IFREG|0644, st_size=26050, ...}) = 0
mmap(NULL, 26050, PROT_READ, MAP_SHARED, 6, 0) = 0x7fcb83cb4000
close(6)                                = 0
futex(0x7fcb82ca1f60, FUTEX_WAKE_PRIVATE, 2147483647) = 0
lstat("/home/firari/cia.jpg", {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
open("/home/firari/cia.jpg", O_RDONLY)  = 6
fstat(6, {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
open("/home/firari/cia2.jpg", O_WRONLY|O_CREAT|O_EXCL, 0666) = 7
pipe([8, 9])                            = 0
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 65536
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0x10000, 0x4) = 65536
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 57912
splice(0x8, 0, 0x7, 0x7fff8bcbe910, 0xe238, 0x4) = 57912
splice(0x6, 0x7fff8bcbe918, 0x9, 0, 0x10000, 0x4) = 0
close(8)                                = 0
close(9)                                = 0
close(6)                                = 0
fstat(7, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
close(7)                                = 0
lstat("/home/firari/cia.jpg", {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
listxattr("/home/firari/cia.jpg", (nil), 0) = 0
stat("/home/firari", {st_mode=S_IFDIR|0755, st_size=169, ...}) = 0
lstat("/home/firari", {st_mode=S_IFDIR|0755, st_size=169, ...}) = 0
lstat("/home", {st_mode=S_IFDIR|0777, st_size=3, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0755, st_size=29, ...}) = 0
lstat("/home/firari", {st_mode=S_IFDIR|0755, st_size=169, ...}) = 0
lstat("/home", {st_mode=S_IFDIR|0777, st_size=3, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0755, st_size=29, ...}) = 0
statfs("/home/firari/.local/share/gvfs-metadata", {f_type=0x52345362, f_bsize=4096, f_blocks=5232034, f_bfree=2701747, f_bavail=2701747, f_files=0, f_ffree=0, f_fsid={0, 0}, f_namelen=3976, f_frsize=4096}) = 0
open("/home/firari/.local/share/gvfs-metadata/home", O_RDONLY) = 6
fstat(6, {st_mode=S_IFREG|0600, st_size=24900, ...}) = 0
mmap(NULL, 24900, PROT_READ, MAP_SHARED, 6, 0) = 0x7fcb83cad000
open("/home/firari/.local/share/gvfs-metadata/home-2940c6fc.log", O_RDONLY) = 7
fstat(7, {st_mode=S_IFREG|0644, st_size=32768, ...}) = 0
mmap(NULL, 32768, PROT_READ, MAP_SHARED, 7, 0) = 0x7fcb83ca5000
lstat("/home/firari/cia2.jpg", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
chmod("/home/firari/cia2.jpg", 0100644) = 0
stat("/home/firari/cia2.jpg", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
utimes("/home/firari/cia2.jpg", {{1284311677, 297419}, {1268545884, 0}}) = 0
lstat("/home/firari/cia2.jpg", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
lstat("/home/firari", {st_mode=S_IFDIR|0755, st_size=169, ...}) = 0
lstat("/home", {st_mode=S_IFDIR|0777, st_size=3, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0755, st_size=29, ...}) = 0
socket(PF_FILE, SOCK_STREAM, 0)         = 8
connect(8, {sa_family=AF_FILE, path=@"/tmp/dbus-XsZw4bhzJW"}, 23) = 0
fcntl(8, F_GETFL)                       = 0x2 (flags O_RDWR)
fcntl(8, F_SETFL, O_RDWR|O_NONBLOCK)    = 0
fcntl(8, F_GETFD)                       = 0
fcntl(8, F_SETFD, FD_CLOEXEC)           = 0
geteuid()                               = 1000
rt_sigaction(SIGPIPE, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7fcb829800c0}, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7fcb829800c0}, 8) = 0
poll([{fd=8, events=POLLOUT}], 1, 0)    = 1 ([{fd=8, revents=POLLOUT}])
write(8, "\0", 1)                       = 1
write(8, "AUTH EXTERNAL 31303030\r\n", 24) = 24
poll([{fd=8, events=POLLIN}], 1, -1)    = 1 ([{fd=8, revents=POLLIN}])
read(8, "OK 8fa31bb364ac2a23dac40e150000a"..., 2048) = 37
poll([{fd=8, events=POLLOUT}], 1, -1)   = 1 ([{fd=8, revents=POLLOUT}])
write(8, "BEGIN\r\n", 7)                = 7
poll([{fd=8, events=POLLIN|POLLOUT}], 1, -1) = 1 ([{fd=8, revents=POLLOUT}])
writev(8, [{"l\1\0\1\0\0\0\0\1\0\0\0n\0\0\0\1\1o\0\25\0\0\0/org/fre"..., 128}, {"", 0}], 2) = 128
poll([{fd=8, events=POLLIN}], 1, 25000) = 1 ([{fd=8, revents=POLLIN}])
read(8, "l\2\1\1\n\0\0\0\1\0\0\0=\0\0\0\6\1s\0\5\0\0\0:1.63\0\0\0"..., 2048) = 260
read(8, 0x6209b0, 2048)                 = -1 EAGAIN (Resource temporarily unavailable)
writev(8, [{"l\1\0\1u\0\0\0\2\0\0\0~\0\0\0\1\1o\0\25\0\0\0/org/gtk"..., 144}, {",\0\0\0/home/firari/.local/share/gv"..., 117}], 2) = 261
poll([{fd=8, events=POLLIN}], 1, 60000) = 1 ([{fd=8, revents=POLLIN}])
read(8, "l\2\1\1\0\0\0\0\304\0\0\0&\0\0\0\6\1s\0\5\0\0\0:1.63\0\0\0"..., 2048) = 56
read(8, 0x6209b0, 2048)                 = -1 EAGAIN (Resource temporarily unavailable)
exit_group(1)                           = ?

--------------040808030009090106040502
Content-Type: text/plain;
 name="strace-glib-2.22.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="strace-glib-2.22.txt"

execve("./copy3", ["./copy3"], [/* 57 vars */]) = 0
brk(0)                                  = 0x602000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d4732000
open("/usr/lib64/libv4l/v4l1compat.so", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\t\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=5888, ...}) = 0
mmap(NULL, 2101336, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d4314000
mprotect(0x7f21d4315000, 2093056, PROT_NONE) = 0
mmap(0x7f21d4514000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x7f21d4514000
close(3)                                = 0
open("/usr/lib64/libv4l/v4l2convert.so", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\220\t\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=5976, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d4731000
mmap(NULL, 2101352, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d4112000
mprotect(0x7f21d4113000, 2093056, PROT_NONE) = 0
mmap(0x7f21d4312000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x7f21d4312000
close(3)                                = 0
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=143588, ...}) = 0
mmap(NULL, 143588, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f21d470d000
close(3)                                = 0
open("/usr/lib/libgio-2.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\240\262\1\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=685768, ...}) = 0
mmap(NULL, 2785168, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d3e6a000
mprotect(0x7f21d3f0e000, 2097152, PROT_NONE) = 0
mmap(0x7f21d410e000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xa4000) = 0x7f21d410e000
mmap(0x7f21d4111000, 3984, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d4111000
close(3)                                = 0
open("/usr/lib/libgobject-2.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\243\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=281704, ...}) = 0
mmap(NULL, 2379976, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d3c24000
mprotect(0x7f21d3c67000, 2097152, PROT_NONE) = 0
mmap(0x7f21d3e67000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x43000) = 0x7f21d3e67000
mmap(0x7f21d3e69000, 200, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d3e69000
close(3)                                = 0
open("/usr/lib/libgmodule-2.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\23\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14376, ...}) = 0
mmap(NULL, 2109912, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d3a20000
mprotect(0x7f21d3a23000, 2093056, PROT_NONE) = 0
mmap(0x7f21d3c22000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f21d3c22000
close(3)                                = 0
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@W\1\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=925712, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d470c000
mmap(NULL, 3022992, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d373d000
mprotect(0x7f21d381e000, 2093056, PROT_NONE) = 0
mmap(0x7f21d3a1d000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xe0000) = 0x7f21d3a1d000
mmap(0x7f21d3a1f000, 144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d3a1f000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\354\1\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1399984, ...}) = 0
mmap(NULL, 3508264, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d33e4000
mprotect(0x7f21d3533000, 2097152, PROT_NONE) = 0
mmap(0x7f21d3733000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x14f000) = 0x7f21d3733000
mmap(0x7f21d3738000, 18472, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d3738000
close(3)                                = 0
open("/usr/lib/libv4l1.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260\20\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=20112, ...}) = 0
mmap(NULL, 2115504, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d31df000
mprotect(0x7f21d31e3000, 2093056, PROT_NONE) = 0
mmap(0x7f21d33e2000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f21d33e2000
close(3)                                = 0
open("/usr/lib/libv4l2.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\30\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=45680, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d470b000
mmap(NULL, 2141072, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d2fd4000
mprotect(0x7f21d2fdb000, 2093056, PROT_NONE) = 0
mmap(0x7f21d31da000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0x7f21d31da000
close(3)                                = 0
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360\r\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14512, ...}) = 0
mmap(NULL, 2109696, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d2dd0000
mprotect(0x7f21d2dd2000, 2097152, PROT_NONE) = 0
mmap(0x7f21d2fd2000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f21d2fd2000
close(3)                                = 0
open("/lib/libresolv.so.2", O_RDONLY)   = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\3208\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=80528, ...}) = 0
mmap(NULL, 2185864, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d2bba000
mprotect(0x7f21d2bcd000, 2093056, PROT_NONE) = 0
mmap(0x7f21d2dcc000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x12000) = 0x7f21d2dcc000
mmap(0x7f21d2dce000, 6792, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d2dce000
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300Y\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=130888, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d470a000
mmap(NULL, 2208640, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d299e000
mprotect(0x7f21d29b5000, 2093056, PROT_NONE) = 0
mmap(0x7f21d2bb4000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) = 0x7f21d2bb4000
mmap(0x7f21d2bb6000, 13184, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d2bb6000
close(3)                                = 0
open("/usr/lib/libv4lconvert.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300\"\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=112880, ...}) = 0
mmap(NULL, 2536560, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d2732000
mprotect(0x7f21d274b000, 2097152, PROT_NONE) = 0
mmap(0x7f21d294b000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19000) = 0x7f21d294b000
mmap(0x7f21d294e000, 324720, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d294e000
close(3)                                = 0
open("/lib/librt.so.1", O_RDONLY)       = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\"\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=35656, ...}) = 0
mmap(NULL, 2132976, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d2529000
mprotect(0x7f21d2531000, 2093056, PROT_NONE) = 0
mmap(0x7f21d2730000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x7f21d2730000
close(3)                                = 0
open("/lib/libm.so.6", O_RDONLY)        = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200>\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=526456, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d4709000
mmap(NULL, 2621656, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f21d22a8000
mprotect(0x7f21d2328000, 2093056, PROT_NONE) = 0
mmap(0x7f21d2527000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7f000) = 0x7f21d2527000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d4708000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d4707000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d4706000
arch_prctl(ARCH_SET_FS, 0x7f21d4707700) = 0
mprotect(0x7f21d2527000, 4096, PROT_READ) = 0
mprotect(0x7f21d2730000, 4096, PROT_READ) = 0
mprotect(0x7f21d294b000, 8192, PROT_READ) = 0
mprotect(0x7f21d2bb4000, 4096, PROT_READ) = 0
mprotect(0x7f21d2dcc000, 4096, PROT_READ) = 0
mprotect(0x7f21d2fd2000, 4096, PROT_READ) = 0
mprotect(0x7f21d31da000, 4096, PROT_READ) = 0
mprotect(0x7f21d33e2000, 4096, PROT_READ) = 0
mprotect(0x7f21d3733000, 16384, PROT_READ) = 0
mprotect(0x7f21d3a1d000, 4096, PROT_READ) = 0
mprotect(0x7f21d3c22000, 4096, PROT_READ) = 0
mprotect(0x7f21d3e67000, 4096, PROT_READ) = 0
mprotect(0x7f21d410e000, 8192, PROT_READ) = 0
mprotect(0x7f21d4312000, 4096, PROT_READ) = 0
mprotect(0x7f21d4514000, 4096, PROT_READ) = 0
mprotect(0x600000, 4096, PROT_READ)     = 0
mprotect(0x7f21d4733000, 4096, PROT_READ) = 0
munmap(0x7f21d470d000, 143588)          = 0
set_tid_address(0x7f21d47079d0)         = 12813
set_robust_list(0x7f21d47079e0, 0x18)   = 0
futex(0x7fffdc73248c, FUTEX_WAKE_PRIVATE, 1) = 0
futex(0x7fffdc73248c, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NULL, 7f21d4707700) = -1 ENOSYS (Function not implemented)
rt_sigaction(SIGRTMIN, {0x7f21d29a3840, [], SA_RESTORER|SA_SIGINFO, 0x7f21d29acfd0}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {0x7f21d29a38d0, [], SA_RESTORER|SA_RESTART|SA_SIGINFO, 0x7f21d29acfd0}, NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
brk(0)                                  = 0x602000
brk(0x624000)                           = 0x624000
open("/usr/lib64/gio/modules", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3
fcntl(3, F_GETFD)                       = 0x1 (flags FD_CLOEXEC)
getdents(3, /* 11 entries */, 32768)    = 416
stat("/usr/lib64/gio/modules/libgiofam.so", {st_mode=S_IFREG|0755, st_size=14328, ...}) = 0
futex(0x7f21d2fd30ec, FUTEX_WAKE_PRIVATE, 2147483647) = 0
open("/usr/lib64/gio/modules/libgiofam.so", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\20\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=14328, ...}) = 0
mmap(NULL, 2109824, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d20a4000
mprotect(0x7f21d20a7000, 2093056, PROT_NONE) = 0
mmap(0x7f21d22a6000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x2000) = 0x7f21d22a6000
close(4)                                = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143588, ...}) = 0
mmap(NULL, 143588, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7f21d470d000
close(4)                                = 0
open("/usr/lib/libfam.so.0", O_RDONLY)  = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0000\32\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=27088, ...}) = 0
mmap(NULL, 2122424, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d1e9d000
mprotect(0x7f21d1ea3000, 2093056, PROT_NONE) = 0
mmap(0x7f21d20a2000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x5000) = 0x7f21d20a2000
close(4)                                = 0
mprotect(0x7f21d20a2000, 4096, PROT_READ) = 0
mprotect(0x7f21d22a6000, 4096, PROT_READ) = 0
munmap(0x7f21d470d000, 143588)          = 0
stat("/usr/lib64/gio/modules/libgiogconf.so", {st_mode=S_IFREG|0755, st_size=10160, ...}) = 0
open("/usr/lib64/gio/modules/libgiogconf.so", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\f\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=10160, ...}) = 0
mmap(NULL, 2105552, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d1c9a000
mprotect(0x7f21d1c9c000, 2093056, PROT_NONE) = 0
mmap(0x7f21d1e9b000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x1000) = 0x7f21d1e9b000
close(4)                                = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143588, ...}) = 0
mmap(NULL, 143588, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7f21d470d000
close(4)                                = 0
open("/usr/lib/libgconf-2.so.4", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\2602\1\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=262048, ...}) = 0
mmap(NULL, 2357712, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d1a5a000
mprotect(0x7f21d1a95000, 2097152, PROT_NONE) = 0
mmap(0x7f21d1c95000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x3b000) = 0x7f21d1c95000
close(4)                                = 0
open("/usr/lib/libORBit-2.so.0", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\240\242\2\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=460192, ...}) = 0
mmap(NULL, 2557416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d17e9000
mprotect(0x7f21d1847000, 2097152, PROT_NONE) = 0
mmap(0x7f21d1a47000, 73728, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x5e000) = 0x7f21d1a47000
mmap(0x7f21d1a59000, 1512, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d1a59000
close(4)                                = 0
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\220\27\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=18696, ...}) = 0
mmap(NULL, 2114136, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d15e4000
mprotect(0x7f21d15e8000, 2093056, PROT_NONE) = 0
mmap(0x7f21d17e7000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x3000) = 0x7f21d17e7000
close(4)                                = 0
open("/usr/lib/libdbus-glib-1.so.2", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\242\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=143768, ...}) = 0
mmap(NULL, 2239432, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d13c1000
mprotect(0x7f21d13e3000, 2093056, PROT_NONE) = 0
mmap(0x7f21d15e2000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x21000) = 0x7f21d15e2000
close(4)                                = 0
open("/usr/lib/libdbus-1.so.3", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\202\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=261472, ...}) = 0
mmap(NULL, 2357544, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d1181000
mprotect(0x7f21d11c0000, 2093056, PROT_NONE) = 0
mmap(0x7f21d13bf000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x3e000) = 0x7f21d13bf000
close(4)                                = 0
open("/lib/libutil.so.1", O_RDONLY)     = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 \16\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=10464, ...}) = 0
mmap(NULL, 2105608, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d0f7e000
mprotect(0x7f21d0f80000, 2093056, PROT_NONE) = 0
mmap(0x7f21d117f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x1000) = 0x7f21d117f000
close(4)                                = 0
mprotect(0x7f21d117f000, 4096, PROT_READ) = 0
mprotect(0x7f21d13bf000, 4096, PROT_READ) = 0
mprotect(0x7f21d15e2000, 4096, PROT_READ) = 0
mprotect(0x7f21d17e7000, 4096, PROT_READ) = 0
mprotect(0x7f21d1a47000, 61440, PROT_READ) = 0
mprotect(0x7f21d1c95000, 8192, PROT_READ) = 0
mprotect(0x7f21d1e9b000, 4096, PROT_READ) = 0
munmap(0x7f21d470d000, 143588)          = 0
stat("/usr/lib64/gio/modules/libgvfsdbus.so", {st_mode=S_IFREG|0755, st_size=172984, ...}) = 0
open("/usr/lib64/gio/modules/libgvfsdbus.so", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0P\233\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=172984, ...}) = 0
mmap(NULL, 2269312, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d0d53000
mprotect(0x7f21d0d7c000, 2093056, PROT_NONE) = 0
mmap(0x7f21d0f7b000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x28000) = 0x7f21d0f7b000
mmap(0x7f21d0f7d000, 128, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d0f7d000
close(4)                                = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143588, ...}) = 0
mmap(NULL, 143588, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7f21d470d000
close(4)                                = 0
open("/usr/lib/libgvfscommon.so.0", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0P\241\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=98944, ...}) = 0
mmap(NULL, 2194488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d0b3b000
mprotect(0x7f21d0b52000, 2093056, PROT_NONE) = 0
mmap(0x7f21d0d51000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x16000) = 0x7f21d0d51000
close(4)                                = 0
open("/lib/libudev.so.0", O_RDONLY)     = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0.\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=51616, ...}) = 0
mmap(NULL, 2149024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d092e000
mprotect(0x7f21d093a000, 2093056, PROT_NONE) = 0
mmap(0x7f21d0b39000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0xb000) = 0x7f21d0b39000
close(4)                                = 0
mprotect(0x7f21d0b39000, 4096, PROT_READ) = 0
mprotect(0x7f21d0d51000, 4096, PROT_READ) = 0
mprotect(0x7f21d0f7b000, 4096, PROT_READ) = 0
munmap(0x7f21d470d000, 143588)          = 0
stat("/usr/lib64/gio/modules/libgioremote-volume-monitor.so", {st_mode=S_IFREG|0755, st_size=80920, ...}) = 0
open("/usr/lib64/gio/modules/libgioremote-volume-monitor.so", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300B\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=80920, ...}) = 0
mmap(NULL, 2176920, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d071a000
mprotect(0x7f21d072d000, 2093056, PROT_NONE) = 0
mmap(0x7f21d092c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x12000) = 0x7f21d092c000
close(4)                                = 0
mprotect(0x7f21d092c000, 4096, PROT_READ) = 0
open("/usr/share/gvfs/remote-volume-monitors", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 4
getdents(4, /* 3 entries */, 32768)     = 80
brk(0x645000)                           = 0x645000
open("/usr/share/locale/locale.alias", O_RDONLY) = 5
fstat(5, {st_mode=S_IFREG|0644, st_size=2570, ...}) = 0
mmap(NULL, 65536, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d4721000
read(5, "# Locale name alias data base.\n#"..., 65536) = 2570
read(5, "", 65536)                      = 0
close(5)                                = 0
munmap(0x7f21d4721000, 65536)           = 0
open("/usr/share/gvfs/remote-volume-monitors/hal.monitor", O_RDONLY) = 5
fstat(5, {st_mode=S_IFREG|0644, st_size=123, ...}) = 0
read(5, "[RemoteVolumeMonitor]\nName=GProx"..., 4096) = 123
read(5, "", 4096)                       = 0
close(5)                                = 0
getdents(4, /* 0 entries */, 32768)     = 0
close(4)                                = 0
getdents(3, /* 0 entries */, 32768)     = 0
close(3)                                = 0
munmap(0x7f21d1c9a000, 2105552)         = 0
munmap(0x7f21d1a5a000, 2357712)         = 0
munmap(0x7f21d17e9000, 2557416)         = 0
munmap(0x7f21d13c1000, 2239432)         = 0
munmap(0x7f21d20a4000, 2109824)         = 0
munmap(0x7f21d1e9d000, 2122424)         = 0
socket(PF_FILE, SOCK_STREAM, 0)         = 3
connect(3, {sa_family=AF_FILE, path=@"/tmp/dbus-aDdaABTcjB"}, 23) = 0
fcntl(3, F_GETFL)                       = 0x2 (flags O_RDWR)
fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK)    = 0
fcntl(3, F_GETFD)                       = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
geteuid()                               = 1000
rt_sigaction(SIGPIPE, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7f21d34160c0}, {SIG_DFL, [], 0}, 8) = 0
poll([{fd=3, events=POLLOUT}], 1, 0)    = 1 ([{fd=3, revents=POLLOUT}])
write(3, "\0", 1)                       = 1
write(3, "AUTH EXTERNAL 31303030\r\n", 24) = 24
poll([{fd=3, events=POLLIN}], 1, -1)    = 1 ([{fd=3, revents=POLLIN}])
read(3, "OK cff499fd817a3136d7a4f44a00000"..., 2048) = 37
poll([{fd=3, events=POLLOUT}], 1, -1)   = 1 ([{fd=3, revents=POLLOUT}])
write(3, "BEGIN\r\n", 7)                = 7
poll([{fd=3, events=POLLIN|POLLOUT}], 1, -1) = 1 ([{fd=3, revents=POLLOUT}])
writev(3, [{"l\1\0\1\0\0\0\0\1\0\0\0n\0\0\0\1\1o\0\25\0\0\0/org/fre"..., 128}, {"", 0}], 2) = 128
poll([{fd=3, events=POLLIN}], 1, 25000) = 1 ([{fd=3, revents=POLLIN}])
read(3, "l\2\1\1\n\0\0\0\1\0\0\0=\0\0\0\6\1s\0\5\0\0\0:1.90\0\0\0"..., 2048) = 260
read(3, 0x60b060, 2048)                 = -1 EAGAIN (Resource temporarily unavailable)
rt_sigaction(SIGPIPE, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7f21d34160c0}, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7f21d34160c0}, 8) = 0
writev(3, [{"l\1\0\1\0\0\0\0\2\0\0\0\212\0\0\0\1\1o\0\31\0\0\0/org/gtk"..., 160}, {"", 0}], 2) = 160
poll([{fd=3, events=POLLIN}], 1, 60000) = 1 ([{fd=3, revents=POLLIN}])
read(3, "l\2\1\1\24\2\0\0V\0\0\0005\0\0\0\6\1s\0\5\0\0\0:1.90\0\0\0"..., 2048) = 604
read(3, 0x60b060, 2048)                 = -1 EAGAIN (Resource temporarily unavailable)
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 4
connect(4, {sa_family=AF_FILE, path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
close(4)                                = 0
socket(PF_FILE, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 4
connect(4, {sa_family=AF_FILE, path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
close(4)                                = 0
open("/etc/nsswitch.conf", O_RDONLY)    = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=508, ...}) = 0
mmap(NULL, 65536, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f21d4721000
read(4, "# /etc/nsswitch.conf:\n# $Header:"..., 65536) = 508
read(4, "", 65536)                      = 0
close(4)                                = 0
munmap(0x7f21d4721000, 65536)           = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143588, ...}) = 0
mmap(NULL, 143588, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7f21d470d000
close(4)                                = 0
open("/lib/libnss_compat.so.2", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 \23\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=31432, ...}) = 0
mmap(NULL, 2127088, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d20a0000
mprotect(0x7f21d20a7000, 2093056, PROT_NONE) = 0
mmap(0x7f21d22a6000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x6000) = 0x7f21d22a6000
close(4)                                = 0
open("/lib/libnsl.so.1", O_RDONLY)      = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320@\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=88880, ...}) = 0
mmap(NULL, 2194128, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d1e88000
mprotect(0x7f21d1e9d000, 2093056, PROT_NONE) = 0
mmap(0x7f21d209c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x14000) = 0x7f21d209c000
mmap(0x7f21d209e000, 6864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f21d209e000
close(4)                                = 0
mprotect(0x7f21d209c000, 4096, PROT_READ) = 0
mprotect(0x7f21d22a6000, 4096, PROT_READ) = 0
munmap(0x7f21d470d000, 143588)          = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=143588, ...}) = 0
mmap(NULL, 143588, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7f21d470d000
close(4)                                = 0
open("/lib/libnss_nis.so.2", O_RDONLY)  = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200 \0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=43376, ...}) = 0
mmap(NULL, 2139352, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d1c7d000
mprotect(0x7f21d1c87000, 2093056, PROT_NONE) = 0
mmap(0x7f21d1e86000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x9000) = 0x7f21d1e86000
close(4)                                = 0
open("/lib/libnss_files.so.2", O_RDONLY) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0p!\0\0\0\0\0\0"..., 832) = 832
fstat(4, {st_mode=S_IFREG|0755, st_size=47432, ...}) = 0
mmap(NULL, 2143632, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f21d1a71000
mprotect(0x7f21d1a7c000, 2093056, PROT_NONE) = 0
mmap(0x7f21d1c7b000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0xa000) = 0x7f21d1c7b000
close(4)                                = 0
mprotect(0x7f21d1c7b000, 4096, PROT_READ) = 0
mprotect(0x7f21d1e86000, 4096, PROT_READ) = 0
munmap(0x7f21d470d000, 143588)          = 0
open("/etc/passwd", O_RDONLY|O_CLOEXEC) = 4
fcntl(4, F_GETFD)                       = 0x1 (flags FD_CLOEXEC)
lseek(4, 0, SEEK_CUR)                   = 0
fstat(4, {st_mode=S_IFREG|0644, st_size=1286, ...}) = 0
mmap(NULL, 1286, PROT_READ, MAP_SHARED, 4, 0) = 0x7f21d4730000
lseek(4, 1286, SEEK_SET)                = 1286
munmap(0x7f21d4730000, 1286)            = 0
close(4)                                = 0
getuid()                                = 1000
uname({sys="Linux", node="firari", ...}) = 0
open("/usr/lib64/gvfs/modules", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
open("/usr/lib64/charset.alias", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=26050, ...}) = 0
mmap(NULL, 26050, PROT_READ, MAP_SHARED, 4, 0) = 0x7f21d472a000
close(4)                                = 0
futex(0x7f21d3737f60, FUTEX_WAKE_PRIVATE, 2147483647) = 0
lstat("/home/firari/cia.jpg", {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
open("/home/firari/cia.jpg", O_RDONLY)  = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
open("/home/firari/cia2.jpg", O_WRONLY|O_CREAT|O_EXCL, 0666) = 5
read(4, "\377\330\377\340\0\20JFIF\0\1\1\1\0H\0H\0\0\377\341)oExif\0\0II"..., 65536) = 65536
write(5, "\377\330\377\340\0\20JFIF\0\1\1\1\0H\0H\0\0\377\341)oExif\0\0II"..., 65536) = 65536
read(4, "\300R\304\260e\322\314t(\6\373\17\216\4\10:\330j\327\247p\300\223\306\302\337A\202\n\24\200x"..., 65536) = 65536
write(5, "\300R\304\260e\322\314t(\6\373\17\216\4\10:\330j\327\247p\300\223\306\302\337A\202\n\24\200x"..., 65536) = 65536
read(4, "a\362\3011\\\330\321\22\16\5\5\242ab\312V\315u<\334|\360'`\210\327\334\17\314\226\271\3"..., 65536) = 65536
write(5, "a\362\3011\\\330\321\22\16\5\5\242ab\312V\315u<\334|\360'`\210\327\334\17\314\226\271\3"..., 65536) = 65536
read(4, "\230X\21o\217|j\0I\266\255\330\352\265\271\265\361\"E\330]*_$4c\351N\353!\220\306"..., 65536) = 65536
write(5, "\230X\21o\217|j\0I\266\255\330\352\265\271\265\361\"E\330]*_$4c\351N\353!\220\306"..., 65536) = 65536
read(4, "\f\276Xe\365h\270\332\303\30\314K\231\30\352:F\245\217{\237\206\4v\27\263\v\220\16\225\337m"..., 65536) = 65536
write(5, "\f\276Xe\365h\270\332\303\30\314K\231\30\352:F\245\217{\237\206\4v\27\263\v\220\16\225\337m"..., 65536) = 65536
read(4, "7\f\201R\333od6\6\214\326\313\32#\262YA \271\2736\374\17\375\333\32\4\20\247\314[j"..., 65536) = 65536
write(5, "7\f\201R\333od6\6\214\326\313\32#\262YA \271\2736\374\17\375\333\32\4\20\247\314[j"..., 65536) = 65536
read(4, "\236\337b\230\222\274&\350lj\326\207)\220\371f\232D(\352%x\333o0\367\267\337\17t\342\242"..., 65536) = 65536
write(5, "\236\337b\230\222\274&\350lj\326\207)\220\371f\232D(\352%x\333o0\367\267\337\17t\342\242"..., 65536) = 65536
read(4, "klo\266#\24\336\"K\221\232\0\v*jZZr%T\22\357\245U\266\7\222O;[\21\236"..., 65536) = 65536
write(5, "klo\266#\24\336\"K\221\232\0\v*jZZr%T\22\357\245U\266\7\222O;[\21\236"..., 65536) = 65536
read(4, "\377\0\314\217\274TPe\322-\232\315q\262\203\352\36\327'\16\260\345\225\17$z#,9t\2\326"..., 65536) = 65536
write(5, "\377\0\314\217\274TPe\322-\232\315q\262\203\352\36\327'\16\260\345\225\17$z#,9t\2\326"..., 65536) = 65536
read(4, "\373\363\355\201\321Dc\220<\313px\2675g\256u3\177\5O\241\37\245$\314z\242\n\211\222\30"..., 65536) = 65536
write(5, "\373\363\355\201\321Dc\220<\313px\2675g\256u3\177\5O\241\37\245$\314z\242\n\211\222\30"..., 65536) = 65536
read(4, "\236\10\377\0\303&\222\217Lh\220\230\3320\326\275\266\343\357\212g\374DR\266\226IQ\0036\243\21"..., 65536) = 65536
write(5, "\236\10\377\0\303&\222\217Lh\220\230\3320\326\275\266\343\357\212g\374DR\266\226IQ\0036\243\21"..., 65536) = 65536
read(4, "5Z\3115`\310\307o\337\322\245VT%X\343\326\253j\234\332\226\275dB\227\204\3\30b\305\254"..., 65536) = 65536
write(5, "5Z\3115`\310\307o\337\322\245VT%X\343\326\253j\234\332\226\275dB\227\204\3\30b\305\254"..., 65536) = 65536
read(4, "O#5\3319\f\243)=x!-UC_D3*\350\24~\"8b\244]\330\257\3y\316\366"..., 65536) = 65536
write(5, "O#5\3319\f\243)=x!-UC_D3*\350\24~\"8b\244]\330\257\3y\316\366"..., 65536) = 65536
read(4, "\324J\250\350\227\250~\t\277k\3757\305}\323\235%\235d\331\355\34u4,\324O0-Q}@"..., 65536) = 65536
write(5, "\324J\250\350\227\250~\t\277k\3757\305}\323\235%\235d\331\355\34u4,\324O0-Q}@"..., 65536) = 65536
read(4, "\243\261Y70Pq\300\316+\214\370\207[\24\332\337\17L\330\2\335\373[5\276\263\223\257:\236\232"..., 65536) = 65536
write(5, "\243\261Y70Pq\300\316+\214\370\207[\24\332\337\17L\330\2\335\373[5\276\263\223\257:\236\232"..., 65536) = 65536
read(4, "\300\304\10\365<\263U\313,\241\2033YB\22\266\267?\317\r\231\226r\301$\6E\221\24\351R\346"..., 65536) = 65536
write(5, "\300\304\10\365<\263U\313,\241\2033YB\22\266\267?\317\r\231\226r\301$\6E\221\24\351R\346"..., 65536) = 65536
read(4, "\34\256\2678\214\255q\212\236&\374_\231v`\252F\327\346\342\336\335\261Lx\347\377\0O\357\0\377"..., 65536) = 65536
write(5, "\34\256\2678\214\255q\212\236&\374_\231v`\252F\327\346\342\336\335\261Lx\347\377\0O\357\0\377"..., 65536) = 65536
read(4, "*\t\320\10?<7g\177\264\24\347\300>\207=IKKMU\324Y\325U\\\23\321\300 sO"..., 65536) = 65536
write(5, "*\t\320\10?<7g\177\264\24\347\300>\207=IKKMU\324Y\325U\\\23\321\300 sO"..., 65536) = 65536
read(4, "\6)\304~#CL\17\251n\313\265\210\30e\225\351\3441T\211\0329\277\211x\326{\377\0,H"..., 65536) = 65536
write(5, "\6)\304~#CL\17\251n\313\265\210\30e\225\351\3441T\211\0329\277\211x\326{\377\0,H"..., 65536) = 65536
read(4, "\313\244\2lpT\211\346\207\205\200tr\ff\367\267\367\266\24\303'\341\331!\235\316\235K\244\23\253"..., 65536) = 65536
write(5, "\313\244\2lpT\211\346\207\205\200tr\ff\367\267\367\266\24\303'\341\331!\235\316\235K\244\23\253"..., 65536) = 65536
read(4, "\3333o\245(\33\260\4w\257>z\237\241s9\314\224mJ`\253\22\226Zi\341\322\254TX\235"..., 65536) = 65536
write(5, "\3333o\245(\33\260\4w\257>z\237\241s9\314\224mJ`\253\22\226Zi\341\322\254TX\235"..., 65536) = 65536
read(4, "\316\212\247\252\360\333\305\254\376*\232J|\312\247#\223!Z\34\310\251y\5P\222\355\20m\356\276N"..., 65536) = 65536
write(5, "\316\212\247\252\360\333\305\254\376*\232J|\312\247#\223!Z\34\310\251y\5P\222\355\20m\356\276N"..., 65536) = 65536
read(4, "*\227\300\352\\\276\206\217\303.\236\243\312L4\220\316\305)\344Y`\235\365\n\210\344wbM\374\270"..., 65536) = 65536
write(5, "*\227\300\352\\\276\206\217\303.\236\243\312L4\220\316\305)\344Y`\235\365\n\210\344wbM\374\270"..., 65536) = 65536
read(4, "\26\332\244T\252\3566'\212S\n4\2339\334\3k\355\301\377\0|\24\310\301\265\17M\215\201\300\343"..., 65536) = 65536
write(5, "\26\332\244T\252\3566'\212S\n4\2339\334\3k\355\301\377\0|\24\310\301\265\17M\215\201\300\343"..., 65536) = 65536
read(4, "\244h\234H\204\222,\302\352.\247\363\2G|s\350\372\355b\35L\253\261O\341\277\37>\337\2575"..., 65536) = 65536
write(5, "\244h\234H\204\222,\302\352.\247\363\2G|s\350\372\355b\35L\253\261O\341\277\37>\337\2575"..., 65536) = 65536
read(4, "\364\373\343a\355k\200m\360\266\2\227`-\271\0\226\37\\k\353\316\303\343\205\262\20\3664\226Fg"..., 65536) = 57912
write(5, "\364\373\343a\355k\200m\360\266\2\227`-\271\0\226\37\\k\353\316\303\343\205\262\20\3664\226Fg"..., 57912) = 57912
read(4, "", 65536)                      = 0
close(4)                                = 0
fstat(5, {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
close(5)                                = 0
lstat("/home/firari/cia.jpg", {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
listxattr("/home/firari/cia.jpg", (nil), 0) = 0
stat("/home/firari", {st_mode=S_IFDIR|0755, st_size=171, ...}) = 0
lstat("/home/firari", {st_mode=S_IFDIR|0755, st_size=171, ...}) = 0
lstat("/home", {st_mode=S_IFDIR|0777, st_size=3, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0755, st_size=29, ...}) = 0
lstat("/home/firari", {st_mode=S_IFDIR|0755, st_size=171, ...}) = 0
lstat("/home", {st_mode=S_IFDIR|0777, st_size=3, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0755, st_size=29, ...}) = 0
statfs("/home/firari/.local/share/gvfs-metadata", {f_type=0x52345362, f_bsize=4096, f_blocks=5232034, f_bfree=2691845, f_bavail=2691845, f_files=0, f_ffree=0, f_fsid={0, 0}, f_namelen=3976, f_frsize=4096}) = 0
open("/home/firari/.local/share/gvfs-metadata/home", O_RDONLY) = 4
fstat(4, {st_mode=S_IFREG|0600, st_size=24980, ...}) = 0
mmap(NULL, 24980, PROT_READ, MAP_SHARED, 4, 0) = 0x7f21d4723000
open("/home/firari/.local/share/gvfs-metadata/home-b4b227ff.log", O_RDONLY) = 5
fstat(5, {st_mode=S_IFREG|0644, st_size=32768, ...}) = 0
mmap(NULL, 32768, PROT_READ, MAP_SHARED, 5, 0) = 0x7f21d471b000
lstat("/home/firari/cia2.jpg", {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
chmod("/home/firari/cia2.jpg", 0100644) = 0
stat("/home/firari/cia2.jpg", {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
utimes("/home/firari/cia2.jpg", {{1284274746, 91737}, {1268545884, 0}}) = 0
lstat("/home/firari/cia2.jpg", {st_mode=S_IFREG|0644, st_size=1696312, ...}) = 0
lstat("/home/firari", {st_mode=S_IFDIR|0755, st_size=171, ...}) = 0
lstat("/home", {st_mode=S_IFDIR|0777, st_size=3, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0755, st_size=29, ...}) = 0
socket(PF_FILE, SOCK_STREAM, 0)         = 6
connect(6, {sa_family=AF_FILE, path=@"/tmp/dbus-aDdaABTcjB"}, 23) = 0
fcntl(6, F_GETFL)                       = 0x2 (flags O_RDWR)
fcntl(6, F_SETFL, O_RDWR|O_NONBLOCK)    = 0
fcntl(6, F_GETFD)                       = 0
fcntl(6, F_SETFD, FD_CLOEXEC)           = 0
geteuid()                               = 1000
rt_sigaction(SIGPIPE, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7f21d34160c0}, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7f21d34160c0}, 8) = 0
poll([{fd=6, events=POLLOUT}], 1, 0)    = 1 ([{fd=6, revents=POLLOUT}])
write(6, "\0", 1)                       = 1
write(6, "AUTH EXTERNAL 31303030\r\n", 24) = 24
poll([{fd=6, events=POLLIN}], 1, -1)    = 1 ([{fd=6, revents=POLLIN}])
read(6, "OK cff499fd817a3136d7a4f44a00000"..., 2048) = 37
poll([{fd=6, events=POLLOUT}], 1, -1)   = 1 ([{fd=6, revents=POLLOUT}])
write(6, "BEGIN\r\n", 7)                = 7
poll([{fd=6, events=POLLIN|POLLOUT}], 1, -1) = 1 ([{fd=6, revents=POLLOUT}])
writev(6, [{"l\1\0\1\0\0\0\0\1\0\0\0n\0\0\0\1\1o\0\25\0\0\0/org/fre"..., 128}, {"", 0}], 2) = 128
poll([{fd=6, events=POLLIN}], 1, 25000) = 1 ([{fd=6, revents=POLLIN}])
read(6, "l\2\1\1\n\0\0\0\1\0\0\0=\0\0\0\6\1s\0\5\0\0\0:1.91\0\0\0"..., 2048) = 260
read(6, 0x61e310, 2048)                 = -1 EAGAIN (Resource temporarily unavailable)
writev(6, [{"l\1\0\1u\0\0\0\2\0\0\0~\0\0\0\1\1o\0\25\0\0\0/org/gtk"..., 144}, {",\0\0\0/home/firari/.local/share/gv"..., 117}], 2) = 261
poll([{fd=6, events=POLLIN}], 1, 60000) = 1 ([{fd=6, revents=POLLIN}])
read(6, "l\2\1\1\0\0\0\0\311\0\0\0&\0\0\0\6\1s\0\5\0\0\0:1.91\0\0\0"..., 2048) = 56
read(6, 0x61e310, 2048)                 = -1 EAGAIN (Resource temporarily unavailable)
exit_group(1)                           = ?

--------------040808030009090106040502
Content-Type: text/x-c;
 name="copy3.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="copy3.c"

#include <gio/gio.h>
#include <glib.h>
#include <stdio.h>

int main() {
	g_type_init();
	GFile *source=NULL, *dest=NULL;
	GError *err=NULL;
	source=g_file_new_for_path("/home/firari/cia.jpg");
	if(source==NULL)
		return 1;
	dest=g_file_new_for_path("/home/firari/cia2.jpg");
	if(dest==NULL)
		return 2;
	g_file_copy(source,dest,G_FILE_COPY_NONE,NULL,NULL,NULL,NULL);
}

--------------040808030009090106040502--
