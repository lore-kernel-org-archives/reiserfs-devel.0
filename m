From: "Gerald Leier" <gleier@mcmarketing.at>
Subject: Lost 30GB reiserfs partition :(
Date: Mon, 19 Aug 2002 15:05:09 +0200
Message-ID: <000b01c24781$0bc68cb0$e201a8c0@mcmarketing.at>
Reply-To: <gleier@mcmarketing.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11237-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi Folks,

on saturday i turned my computer on (running linux 2.4.18)
and couldnt access my data partition (all my documents,
midi and mp3 files i collected in the last 4 years).

i tried to mount the reiserfs partition by hand but mount
made my terminal freeze.

So i tried reiserfsck. There was some problem with superblock
so i did a reiserfsck --rebuild-sb /dev/hdd1. That stopped
after a few seconds with a segmentation fault.
I was told, before --rebuild-sb segfaulted, that i have to do a
--rebuild-tree to after rebuild-sb finishes.

The situation now is:

I cant access the device. reiserfsck allway gives me floating
point exceptions when trying to do anything on the damaged
filesystem. i got the newest reiserfstools (3.6.3) and also
built myself a 2.4.19er kernel for testing if i can mount
the filesystem with this driver. no chance.

Can someone tell me if i lost or if there is a chance to get
my data back again ?

here is the strace output of reiserfsck --check


thanx
 gerald


---START

FLUXSTREAM:~# strace reiserfsck --check /dev/hdd1
execve("/usr/local/sbin/reiserfsck", ["reiserfsck", "--check",
"/dev/hdd1"], [/* 13 vars */]) = 0
uname({sys="Linux", node="FLUXSTREAM", ...}) = 0
brk(0)                                  = 0x8088680
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=11969, ...}) = 0
old_mmap(NULL, 11969, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40014000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\30\222"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=1153784, ...}) = 0
old_mmap(NULL, 1166560, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =
0x40017000
mprotect(0x4012a000, 40160, PROT_NONE)  = 0
old_mmap(0x4012a000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x113000) = 0x4012a000
old_mmap(0x40130000, 15584, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40130000
close(3)                                = 0
munmap(0x40014000, 11969)               = 0
brk(0)                                  = 0x8088680
brk(0x8088700)                          = 0x8088700
brk(0x8089000)                          = 0x8089000
getrlimit(0x1, 0xbffffd44)              = 0
setrlimit(RLIMIT_FSIZE, {rlim_cur=RLIM_INFINITY,
rlim_max=RLIM_INFINITY}) = 0
write(2, "\n<-------------reiserfsck, 2002-"..., 67
<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3

) = 67
write(2, "Will read-only check consistency"..., 64Will read-only check
consistency of the filesystem on /dev/hdd1
) = 64
write(2, "Will put log info to \'stdout\'\n", 30Will put log info to
'stdout'
) = 30
write(2, "\nDo you want to run this program"..., 65
Do you want to run this program?[N/Yes] (note need to type Yes):) = 65
fstat64(0, {st_mode=S_IFCHR|0600, st_rdev=makedev(136, 0), ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x40014000
read(0, Yes
"Yes\n", 1024)                  = 4
open("/dev/hdd1", O_RDONLY|O_LARGEFILE) = 3
brk(0x808b000)                          = 0x808b000
brk(0x808d000)                          = 0x808d000
brk(0x808f000)                          = 0x808f000
brk(0x8091000)                          = 0x8091000
brk(0x8093000)                          = 0x8093000
_llseek(3, 8192, [8192], SEEK_SET)      = 0
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
4096) = 4096
_llseek(3, 65536, [65536], SEEK_SET)    = 0
read(3, "\210\305o\0\210\305o\0\377\357\377\357\22\0\0\0\0\0\0\0"...,
4096) = 4096
--- SIGFPE (Floating point exception) ---
+++ killed by SIGFPE +++

----END







MC Marketing GmbH.
IT Services

e-mail: gleier@mcmarketing.at     *    http://www.mcmarketing.at
tel:++43 1 524 01 40-57           *     http://www.clubticket.at
fax:++43 1 524 01 40-50           *       http://www.megacard.at
A-1070 Wien / Kirchengasse 32/1   *       http://www.skatelab.at

