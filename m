From: Michael.James@csiro.au
Subject: Un-long listable files (strace+Oops)
Date: Tue, 9 Sep 2003 15:12:11 +1000
Message-ID: <200309091512.11914.Michael.James@csiro.au>
References: <200308061431.13695.Michael.James@csiro.au> <200308070823.40130.Michael.James@csiro.au> <3F3188C5.7050606@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15603-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F3188C5.7050606@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Dear Reiser experts,

I'm getting un-long listable files cropping up occasionally.
(on a Suse8.2 system, Reiserfs 3.6)

Most recently an attempted download of Knoppix
 bombed Mozilla Firebird (0.6.1) out,
 leaving an unlistable file called KNOPPIX_V3.2-2003-07-26-EN.iso

No funny characters in the name,
 can be listed as long as it's not an ls -l
 can be mv-ed,
 can't be cp-ed

These files persist in their unlistability across reboots,
 but unmounting /home and running fsck.reiserfs fixes them.
fsck.reiserfs reports a clean run, but after it runs the file is listable again.

Please get in touch directly if you are interested,
 particularily if there is some other test I could perform.
Generally I find having these files around an irritating form of bitrot,
 so I get rid of them, which can hinder investigations
 as I can't create them repeatably.

Here's an strace of what happens when I "ls -l it.

suse:/home/pi/jam176/tmp # cat strace.ls-l
execve("/bin/ls", ["ls", "-l", "KNOPPIX_V3.2-2003-07-26-EN.iso"], [/* 89 vars */]) = 0
uname({sys="Linux", node="suse", ...})  = 0
brk(0)                                  = 0x805a9ac
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=72067, ...}) = 0
old_mmap(NULL, 72067, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40015000
close(3)                                = 0
open("/lib/librt.so.1", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\32"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=34378, ...}) = 0
old_mmap(NULL, 72952, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40027000
mprotect(0x4002d000, 48376, PROT_NONE)  = 0
old_mmap(0x4002d000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x5000) = 0x4002d000
old_mmap(0x4002e000, 44280, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4002e000
close(3)                                = 0
open("/opt/globus/lib/libacl.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/opt/gridengine/lib/glinux/libacl.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libacl.so.1", O_RDONLY)      = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0000\24\0"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0644, st_size=30694, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40039000
old_mmap(NULL, 24028, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4003a000
mprotect(0x4003f000, 3548, PROT_NONE)   = 0
old_mmap(0x4003f000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x4000) = 0x4003f000
close(3)                                = 0
open("/opt/globus/lib/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/opt/gridengine/lib/glinux/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0pY\1\000"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=1491599, ...}) = 0
old_mmap(NULL, 1268004, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40040000
mprotect(0x4016f000, 26916, PROT_NONE)  = 0
old_mmap(0x4016f000, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x12f000) = 0x4016f000
old_mmap(0x40173000, 10532, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40173000
close(3)                                = 0
open("/opt/globus/lib/libpthread.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/opt/gridengine/lib/glinux/libpthread.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libpthread.so.0", O_RDONLY)  = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320@\0"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=82840, ...}) = 0
old_mmap(NULL, 327300, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40176000
mprotect(0x40183000, 274052, PROT_NONE) = 0
old_mmap(0x40183000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xd000) = 0x40183000
old_mmap(0x40184000, 269956, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40184000
close(3)                                = 0
open("/opt/globus/lib/libattr.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/opt/gridengine/lib/glinux/libattr.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libattr.so.1", O_RDONLY)     = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0000\r\0"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0644, st_size=14255, ...}) = 0
old_mmap(NULL, 13360, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x401c6000
mprotect(0x401c9000, 1072, PROT_NONE)   = 0
old_mmap(0x401c9000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x401c9000
close(3)                                = 0
munmap(0x40015000, 72067)               = 0
getrlimit(0x3, 0xbfffeb6c)              = 0
setrlimit(RLIMIT_STACK, {rlim_cur=2044*1024, rlim_max=RLIM_INFINITY}) = 0
getpid()                                = 12780
rt_sigaction(SIGRTMIN, {0x4017de10, [], SA_RESTORER, 0x400695c8}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {0x4017de50, [], SA_RESTORER, 0x400695c8}, NULL, 8) = 0
rt_sigaction(SIGRT_2, {0x4017df20, [], SA_RESTORER, 0x400695c8}, NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [RTMIN], NULL, 8) = 0
_sysctl({{CTL_KERN, KERN_VERSION}, 2, 0xbfffebbc, 30, (nil), 0}) = 0
brk(0)                                  = 0x805a9ac
brk(0x805b9ac)                          = 0x805b9ac
brk(0)                                  = 0x805b9ac
brk(0x805c000)                          = 0x805c000
open("/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=32058672, ...}) = 0
mmap2(NULL, 2097152, PROT_READ, MAP_PRIVATE, 3, 0) = 0x401ca000
close(3)                                = 0
ioctl(1, SNDCTL_TMR_TIMEBASE, {B38400 opost isig icanon echo ...}) = 0
ioctl(1, TIOCGWINSZ, {ws_row=24, ws_col=80, ws_xpixel=0, ws_ypixel=0}) = 0
brk(0)                                  = 0x805c000
brk(0x805f000)                          = 0x805f000
lstat64("KNOPPIX_V3.2-2003-07-26-EN.iso", {st_mode=S_IFREG|0644, st_size=290107392, ...}) = 0
getxattr("KNOPPIX_V3.2-2003-07-26-EN.iso", "system.posix_acl_access"s



And there it hangs, waiting for heat-death-of-universe.




Here's the Oops from Firebird bombing out:



Sep  3 12:17:35 suse -- MARK --
Sep  3 12:37:35 suse -- MARK --
Sep  3 12:39:13 suse kernel: Unable to handle kernel paging request at virtual address 00001d08
Sep  3 12:39:13 suse kernel:  printing eip:
Sep  3 12:39:13 suse kernel: c0133ec7
Sep  3 12:39:13 suse kernel: *pde = 00000000
Sep  3 12:39:13 suse kernel: Oops: 0000 2.4.20-4GB #1 Wed Aug 6 18:26:21 UTC 2003
Sep  3 12:39:13 suse kernel: CPU:    0
Sep  3 12:39:13 suse kernel: EIP:    0010:[__find_lock_page_helper+23/96]    Tainted: PF
Sep  3 12:39:13 suse kernel: EIP:    0010:[<c0133ec7>]    Tainted: PF
Sep  3 12:39:13 suse kernel: EFLAGS: 00010206
Sep  3 12:39:13 suse kernel: eax: caae4168   ebx: 00001d00   ecx: 00001d00   edx: 00062030
Sep  3 12:39:13 suse kernel: esi: caae4168   edi: 00062030   ebp: 00001d00   esp: c2f25f04
Sep  3 12:39:13 suse kernel: ds: 0018   es: 0018   ss: 0018
Sep  3 12:39:13 suse kernel: Process zcat (pid: 3340, stackpage=c2f25000)
Sep  3 12:39:15 suse kernel: Stack: caae4168 00062030 f7e6f4d8 caae40c0 c01366d1 caae4168 00062030 f7e6f4d8
Sep  3 12:39:15 suse kernel:        00001000 00000000 00001000 fffffff4 00000000 62030000 00000000 caae40c0
Sep  3 12:39:15 suse kernel:        caae4168 00000000 47000286 caae412c caae40c0 caae40c0 00004000 c0136c18
Sep  3 12:39:15 suse kernel: Call Trace:    [generic_file_write_nolock+705/2000] [generic_file_write+56/80] [reiserfs:__insmod_reiserfs_S.text_L165788+51778/139792] [sys_write+120/256] [system_call+51/64]
Sep  3 12:39:15 suse kernel: Call Trace:    [<c01366d1>] [<c0136c18>] [<f7f8caa2>] [<c0144b08>] [<c0108c33>]
Sep  3 12:39:15 suse kernel: Modules: [(reiserfs:<f7f80060>:<f7fb0f54>)]
Sep  3 12:39:15 suse kernel: Code: 39 73 08 75 f4 39 7b 0c 75 ef ff 43 14 0f ba 6b 18 00 19 c0
Sep  3 12:44:51 suse kernel:  <1>Unable to handle kernel paging request at virtual address 00001d08
Sep  3 12:44:51 suse kernel:  printing eip:
Sep  3 12:44:51 suse kernel: c0133b49
Sep  3 12:44:51 suse kernel: *pde = 00000000
Sep  3 12:44:51 suse kernel: Oops: 0000 2.4.20-4GB #1 Wed Aug 6 18:26:21 UTC 2003
Sep  3 12:44:51 suse kernel: CPU:    0
Sep  3 12:44:51 suse kernel: EIP:    0010:[page_cache_read+89/224]    Tainted: PF
Sep  3 12:44:51 suse kernel: EIP:    0010:[<c0133b49>]    Tainted: PF
Sep  3 12:44:51 suse kernel: EFLAGS: 00010206
Sep  3 12:44:51 suse kernel: eax: 00000000   ebx: d7a39c48   ecx: 00000012   edx: 00001d00
Sep  3 12:44:51 suse kernel: esi: 0000c841   edi: 0000c8aa   ebp: f7e6f4d8   esp: c94cdee4
Sep  3 12:44:51 suse kernel: ds: 0018   es: 0018   ss: 0018
Sep  3 12:44:51 suse kernel: Process rsync (pid: 3379, stackpage=c94cd000)
Sep  3 12:44:51 suse kernel: Stack: f74fe2c0 00000069 0000c841 f74fe2c0 00039b80 c013414f 0000007f 00000080
Sep  3 12:44:51 suse kernel:        c17a6de0 d7a39c48 f7e6f138 0000c7c2 c01345fe 00000001 f74fe2c0 d7a39ba0
Sep  3 12:44:51 suse kernel:        c17a6de0 00001000 00000001 00000000 00000000 d7a39ba0 00000000 c0134970
Sep  3 12:44:51 suse kernel: Call Trace:    [generic_file_readahead+159/384] [__do_generic_file_read+926/1264] [file_read_actor+0/240] [generic_file_read+261/304] [file_read_actor+0/240]
Sep  3 12:44:51 suse kernel: Call Trace:    [<c013414f>] [<c01345fe>] [<c0134970>] [<c0134b65>] [<c0134970>]
Sep  3 12:44:51 suse kernel:   [sys_read+120/256] [system_call+51/64]
Sep  3 12:44:51 suse kernel:   [<c0144a08>] [<c0108c33>]
Sep  3 12:44:51 suse kernel: Code: 39 5a 08 75 f4 31 c0 39 7a 0c 75 ed 5a 5b 5e 5f 5d c3 8b 43
Sep  3 12:57:35 suse -- MARK --
Sep  3 12:59:00 suse /USR/SBIN/CRON[3499]: (root) CMD ( rm -f /var/spool/cron/lastrun/cron.hourly)
Sep  3 13:06:36 suse kernel:  <1>Unable to handle kernel paging request at virtual address 00001d08
Sep  3 13:06:36 suse kernel:  printing eip:
Sep  3 13:06:36 suse kernel: c0133ec7
Sep  3 13:06:36 suse kernel: *pde = 00000000
Sep  3 13:06:36 suse kernel: Oops: 0000 2.4.20-4GB #1 Wed Aug 6 18:26:21 UTC 2003
Sep  3 13:06:36 suse kernel: CPU:    0
Sep  3 13:06:36 suse kernel: EIP:    0010:[__find_lock_page_helper+23/96]    Tainted: PF
Sep  3 13:06:36 suse kernel: EIP:    0010:[<c0133ec7>]    Tainted: PF
Sep  3 13:06:36 suse kernel: EFLAGS: 00210206
Sep  3 13:06:36 suse kernel: eax: d7a39c48   ebx: 00001d00   ecx: 00001d00   edx: 0004c8a9
Sep  3 13:06:36 suse kernel: esi: d7a39c48   edi: 0004c8a9   ebp: 00001d00   esp: d50fdf04
Sep  3 13:06:36 suse kernel: ds: 0018   es: 0018   ss: 0018
Sep  3 13:06:36 suse kernel: Process MozillaFirebird (pid: 2934, stackpage=d50fd000)
Sep  3 13:06:36 suse kernel: Stack: d7a39c48 0004c8a9 f7e6f4d8 c1750890 c01366d1 d7a39c48 0004c8a9 f7e6f4d8
Sep  3 13:06:36 suse kernel:        00001000 00000000 00000308 fffffff4 00000250 4c8a9000 00000000 d7a39ba0
Sep  3 13:06:36 suse kernel:        d7a39c48 00000000 492d7b98 d7a39c0c d7a39ba0 d7a39ba0 00000558 c0136c18
Sep  3 13:06:36 suse kernel: Call Trace:    [generic_file_write_nolock+705/2000] [generic_file_write+56/80] [reiserfs:__insmod_reiserfs_S.text_L165788+51778/139792] [sys_write+120/256] [system_call+51/64]
Sep  3 13:06:36 suse kernel: Call Trace:    [<c01366d1>] [<c0136c18>] [<f7f8caa2>] [<c0144b08>] [<c0108c33>]
Sep  3 13:06:36 suse kernel: Modules: [(reiserfs:<f7f80060>:<f7fb0f54>)]
Sep  3 13:06:36 suse kernel: Code: 39 73 08 75 f4 39 7b 0c 75 ef ff 43 14 0f ba 6b 18 00 19 c0
Sep  3 13:07:44 suse gconfd (jam176-2944): GConf server is not in use, shutting down.
Sep  3 13:07:44 suse gconfd (jam176-2944): Exiting
Sep  3 13:12:52 suse su: (to root) jam176 on /dev/pts/1
Sep  3 13:12:52 suse su: pam_unix2: session started for user root, service su




-- 
Michael James				michael.james@csiro.au
System Administrator			voice:	02 6246 5040
CSIRO Bioinformatics Facility	fax:		02 6246 5166





