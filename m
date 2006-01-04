From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: why hang-up on sync?
Date: Wed, 04 Jan 2006 02:54:32 +0100
Message-ID: <43BB2AD8.6050304@ursynow.2a.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050804090500040807090202"
Return-path: <reiserfs-list-return-27590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------050804090500040807090202
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Whats up with sync ? this is what happens when i run hdparm -t /dev/hda 
( i tested /dev/hda with testdisk tool, and everything seems fine)

# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda1             3.0G  2.5G  326M  89% /
/dev/hda2             139G   72G   68G  52% /home
tmpfs                 443M     0  443M   0% /dev/shm
# mount
/dev/hda1 on / type ext3 (rw,errors=remount-ro)
/dev/hda2 on /home type reiser4 (rw,noatime,nodiratime)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw)

Linux 2.6.14.3 with latest reiser4 patch.

I'm attaching strace from hdparm -t /dev/hda


--------------050804090500040807090202
Content-Type: text/plain;
 name="strace1.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="strace1.log"

execve("/sbin/hdparm", ["hdparm", "-t", "/dev/hda"], [/* 20 vars */]) = 0
uname({sys="Linux", node="werewolf.cba.pl", ...}) = 0
brk(0)                                  = 0x8056000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fb0000
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=34708, ...}) = 0
old_mmap(NULL, 34708, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7fa7000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/tls/libc.so.6", O_RDONLY)    = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320O\1"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1266800, ...}) = 0
old_mmap(NULL, 1272764, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xb7e70000
old_mmap(0xb7f9d000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x12d000) = 0xb7f9d000
old_mmap(0xb7fa5000, 7100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7fa5000
close(3)                                = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7e6f000
mprotect(0xb7f9d000, 20480, PROT_READ)  = 0
set_thread_area({entry_number:-1 -> 6, base_addr:0xb7e6f6c0, limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_present:0, useable:1}) = 0
munmap(0xb7fa7000, 34708)               = 0
open("/dev/hda", O_RDONLY|O_NONBLOCK)   = 3
fstat64(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 0), ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7faf000
write(1, "\n", 1)                       = 1
write(1, "/dev/hda:\n", 10)             = 10
ioctl(3, BLKGETSIZE64, 0xbfbc3600)      = 0
shmget(IPC_PRIVATE, 2097152, 0600)      = 0
shmctl(0, IPC_64|SHM_LOCK, 0)           = 0
shmat(0, 0, 0)                          = 0xb7c6f000
shmctl(0, IPC_64|IPC_RMID, 0)           = 0
sync(
--------------050804090500040807090202--

