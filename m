From: Sam@Vilain.net
Subject: reiserfsck --blame-it-on-the-hardware-yeah-yeah
Date: Sat, 8 Feb 2003 13:50:57 +1300
Sender: Sam Vilain <sv@horo.vilain.net>
Message-ID: <20030208005057.GA1059@horo.vilain.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12673-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi there,

I have done as requested and used your latest pre-release of
reiserfsck to check my filesystem.  However, it reports an erroneous
error.

(none):~# reiserfsck --no-journal-available /dev/hda1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre1

  *************************************************************
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

Will read-only check consistency of the filesystem on /dev/hda1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Filesystem with standard journal found, --no-journal-available is ignored
###########
reiserfsck --check started at Sun Feb  9 14:43:07 2003
###########

The problem has occurred looks like a hardware problem.
Check your hard drive for badblocks.

bread: Cannot read the block (524111).

Aborted
(none):~# dd if=/dev/hda of=/tmp/foo skip=524100 count=100
100+0 records in
100+0 records out
(none):~# od -x /tmp/foo
0000000 6974 6e6f 7720 6c69 206c 6562 6920 636e
0000020 756c 6564 2064 6e69 7420 6568 6e20 7865
[... lots of very valid looking data snipped ...]
(none):~# time badblocks -c 2048 -n -s -v /dev/hda1
Initializing random test data
Checking for bad blocks in non-destructive read-write mode
From block 0 to 2000061
Checking for bad blocks (non-destructive read-write test):   2000061/  2000061
Pass completed, 0 bad blocks found.

real    15m44.304s
user    0m6.420s
sys     0m33.250s
(none):~#

I used `-c 2048' as the disk's buffer is only 128KiB; to avoid having
badblocks merely testing the integrity of the disk cache :-).  Here's
what's happening through the eyes of `strace':

[...]
read(0, "Yes\n", 4096)                  = 4
open("/dev/hda1", O_RDONLY|O_LARGEFILE) = 3
brk(0x808d000)                          = 0x808d000
brk(0x808f000)                          = 0x808f000
brk(0x8091000)                          = 0x8091000
brk(0x8093000)                          = 0x8093000
brk(0x8095000)                          = 0x8095000
brk(0x8097000)                          = 0x8097000
_llseek(3, 8192, [8192], SEEK_SET)      = 0
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 409
6
_llseek(3, 65536, [65536], SEEK_SET)    = 0
read(3, "P\377\7\0005\356\0\0\35\223\0\0\22\0\0\0\0\0\0\0\0 \0\0"..., 4096) = 40
96
open("/dev/hda1", O_RDONLY|O_LARGEFILE) = 4
_llseek(4, 33628160, [33628160], SEEK_SET) = 0
read(4, "\357M\3\0\324\27\0\0e\0\0\0\22\0\0\0\0\0\0\0\0 \0\0\0\4"..., 4096) = 40
96
fstat64(3, {st_mode=S_IFBLK|0660, st_rdev=makedev(3, 1), ...}) = 0
open("/dev/null", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOTDIR (Not a directory
)
open("/dev/", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 5
fstat64(5, {st_mode=S_IFDIR|0755, st_size=24576, ...}) = 0
fcntl64(5, F_SETFD, FD_CLOEXEC)         = 0
getdents64(0x5, 0x8095128, 0x1000, 0)   = 4088
stat64("/dev/kmem", {st_mode=S_IFCHR|0640, st_rdev=makedev(1, 2), ...}) = 0
stat64("/dev/mem", {st_mode=S_IFCHR|0640, st_rdev=makedev(1, 1), ...}) = 0
stat64("/dev/core", 0xbffffcec)         = -1 ENOENT (No such file or directory)
close(5)                                = 0
time([1044755218])                      = 1044755218
open("/etc/localtime", O_RDONLY)        = 5
fstat64(5, {st_mode=S_IFREG|0644, st_size=870, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0
x40015000
read(5, "TZif\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\5\0\0\0\5\0"..., 4096) = 870
close(5)                                = 0
munmap(0x40015000, 4096)                = 0
write(2, "###########\nreiserfsck --check s"..., 79) = 79
brk(0x80a8000)                          = 0x80a8000
_llseek(3, 2146758656, 0xbffffc84, SEEK_SET) = -1 EINVAL (Invalid argument)
write(2, "\nThe problem has occurred looks "..., 94) = 94
write(2, "\nbread: Cannot read the block (5"..., 41) = 41
rt_sigprocmask(SIG_UNBLOCK, [ABRT], NULL, 8) = 0
getpid()                                = 71
kill(71, SIGABRT)                       = 0
--- SIGABRT (Aborted) ---
+++ killed by SIGABRT +++

The parameters to that _llseek() command look quite off.  The
filesystem is less than 2GiB!

It would be quite a loss in terms of time for me to have to rebuild
this filesystem from scratch.  It's my primary workstation's root
filesystem (and I had only just purchased a backup device; I was in
the process of backing up my data when this happened, Murphy's Law
proving itself).

I'd really appreciate it if you could help me zap that data journal in
the form of brief instructions (& references to kernel struct
typedefs), or perhaps give me a patch to reiserfsprogs that will allow
the --no-journal-available switch to actually do what it says.

Cheers,
--
Sam Vilain, sam@vilain.net

Real Programmers don't write in BASIC.  Actually, no programmers write
in BASIC after reaching puberty.
