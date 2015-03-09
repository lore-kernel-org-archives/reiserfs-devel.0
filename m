From: <doiggl@velocitynet.com.au>
Subject: Does anyone know what is wrong with this command or what is causing this error with mount using /dev/sdb ?
Date: Mon, 09 Mar 2015 17:54:02 +1100
Message-ID: <4ef0d63fb4ce3e0f540cb370442860ce@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

Does anyone know what is wrong with this command or what is causing this
error with mount using /dev/sdb ? [1]

[1]
# mkdir /media/disk
# strace -e open mount -o dont_load_bitmap  /dev/sdb /media/disk
mount: mount(2) failed: No such file or directory

- I see various warnings.
- I have done a number of times the following:
     # fsck.reiser4 --build-fs --force  /dev/sdb
     # fsck.reiser4 --check /dev/sdb

- Error does not seem to fix.

- Everytime fsck.reiser4 --build-fs --force  /dev/sdb shows:

FSCK: node.c: 108: repair_node_items_check: Node (<a number>), items (20)
and (21): Wrong order of keys.                                            


- Everytime fsck.reiser4 --check /dev/sdb shows:

FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

Thanks Glenn.



# dmesg shows:
.
.
[  252.512378] usb 1-2: new high-speed USB device number 3 using ehci-pci
[  252.648694] usb 1-2: New USB device found, idVendor=04fc,
idProduct=0c25
[  252.648707] usb 1-2: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[  252.648715] usb 1-2: Product: USB to Serial-ATA bridge
[  252.648721] usb 1-2: Manufacturer: Sunplus Technology Inc.
[  252.648725] usb 1-2: SerialNumber: ST32000542            5XW1ZMG4
[  252.670509] usb-storage 1-2:1.0: USB Mass Storage device detected
[  252.670854] scsi4 : usb-storage 1-2:1.0
[  252.671002] usbcore: registered new interface driver usb-storage
[  253.674343] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[  253.676089] sd 4:0:0:0: Attached scsi generic sg2 type 0
[  253.676462] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[  253.679276] sd 4:0:0:0: [sdb] Write Protect is off
[  253.679290] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[  253.682727] sd 4:0:0:0: [sdb] No Caching mode page found
[  253.682739] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[  253.690345] sd 4:0:0:0: [sdb] No Caching mode page found
[  253.690354] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[  253.706576]  sdb: unknown partition table
[  253.718766] sd 4:0:0:0: [sdb] No Caching mode page found
[  253.718780] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[  253.718790] sd 4:0:0:0: [sdb] Attached SCSI disk
[  487.447770] Loading Reiser4. See www.namesys.com for a description of
Reiser4.
[  487.453647] reiser4[mount(1695)]: try_init_format40
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.14.0/linux-3.14/fs/reiser4/plugin/disk_format/disk_format40.c:301)[vpf-1364]:
NOTICE: Warning: mounting sdb with fatal errors, forcing read-only mount.
[  487.453669] reiser4: sdb: found disk format 4.0.0.
[  487.473956] reiser4[mount(1695)]: traverse_tree
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.14.0/linux-3.14/fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[  487.473973] reiser4[mount(1695)]: key_warning
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.14.0/linux-3.14/fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
WARNING: Error for inode 42 (-2)


[2] stracing  shows:

# strace -e open mount -o dont_load_bitmap  /dev/sdb /media/disk
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libmount.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libblkid.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libselinux.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libuuid.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libpcre.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
open("/proc/filesystems", O_RDONLY)     = 3
open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/locale/en_US.UTF-8/LC_CTYPE", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
open("/usr/lib/locale/en_US.utf8/LC_CTYPE", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) = 3
open("/run/mount/utab", O_RDWR|O_CREAT|O_CLOEXEC, 0644) = 3
open("/dev/sdb", O_RDONLY|O_CLOEXEC)    = 3
open("/sys/dev/block/8:16", O_RDONLY|O_CLOEXEC) = 4
mount: mount(2) failed: No such file or directory
+++ exited with 32 +++

# strace full log

# strace  mount -o dont_load_bitmap  /dev/sdb /media/disk
execve("/usr/bin/mount", ["mount", "-o", "dont_load_bitmap", "/dev/sdb",
"/media/disk"], [/* 66 vars */]) = 0
brk(0)                                  = 0x7ff11f82e000                  
       
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x7ff11ed94000  
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory)                            
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3                          
                                                                          
       
fstat(3, {st_mode=S_IFREG|0644, st_size=143235, ...}) = 0                 
                                                                          
                                                           
mmap(NULL, 143235, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7ff11ed71000         
                                                                          
                                                                    
close(3)                                = 0
open("/usr/lib64/libmount.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\220\242\0\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=251216, ...}) = 0
mmap(NULL, 2350400, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x7ff11e937000
mprotect(0x7ff11e972000, 2097152, PROT_NONE) = 0
mmap(0x7ff11eb72000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3b000) = 0x7ff11eb72000
mmap(0x7ff11eb74000, 3392, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7ff11eb74000
close(3)                                = 0
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\34\2\0\0\0\0\0"..., 832) =
832
fstat(3, {st_mode=S_IFREG|0755, st_size=1915144, ...}) = 0
mmap(NULL, 3787328, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x7ff11e59a000
mprotect(0x7ff11e72e000, 2093056, PROT_NONE) = 0
mmap(0x7ff11e92d000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x193000) = 0x7ff11e92d000
mmap(0x7ff11e933000, 14912, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7ff11e933000
close(3)                                = 0
open("/usr/lib64/libblkid.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\207\0\0\0\0\0\0"..., 832)
= 832
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x7ff11ed70000
fstat(3, {st_mode=S_IFREG|0755, st_size=238448, ...}) = 0
mmap(NULL, 2337672, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x7ff11e35f000
mprotect(0x7ff11e395000, 2097152, PROT_NONE) = 0
mmap(0x7ff11e595000, 16384, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x36000) = 0x7ff11e595000
mmap(0x7ff11e599000, 2952, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7ff11e599000
close(3)                                = 0
open("/lib64/libselinux.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20l\0\0\0\0\0\0"..., 832) =
832
fstat(3, {st_mode=S_IFREG|0755, st_size=138728, ...}) = 0
mmap(NULL, 2242672, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x7ff11e13b000
mprotect(0x7ff11e15c000, 2093056, PROT_NONE) = 0
mmap(0x7ff11e35b000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x20000) = 0x7ff11e35b000
mmap(0x7ff11e35d000, 6256, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7ff11e35d000
close(3)                                = 0
open("/usr/lib64/libuuid.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\240\26\0\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=18968, ...}) = 0
mmap(NULL, 2113928, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x7ff11df36000
mprotect(0x7ff11df3a000, 2093056, PROT_NONE) = 0
mmap(0x7ff11e139000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7ff11e139000
close(3)                                = 0
open("/lib64/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\16\0\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=18904, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x7ff11ed6f000
mmap(NULL, 2109712, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x7ff11dd32000
mprotect(0x7ff11dd35000, 2093056, PROT_NONE) = 0
mmap(0x7ff11df34000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7ff11df34000
close(3)                                = 0
open("/usr/lib64/libpcre.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\31\0\0\0\0\0\0"..., 832)
= 832
fstat(3, {st_mode=S_IFREG|0755, st_size=416064, ...}) = 0
mmap(NULL, 2511400, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x7ff11dacc000
mprotect(0x7ff11db31000, 2093056, PROT_NONE) = 0
mmap(0x7ff11dd30000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x64000) = 0x7ff11dd30000
close(3)                                = 0
open("/lib64/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0pp\0\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=130296, ...}) = 0
mmap(NULL, 2208912, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x7ff11d8b0000
mprotect(0x7ff11d8c7000, 2093056, PROT_NONE) = 0
mmap(0x7ff11dac6000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) = 0x7ff11dac6000
mmap(0x7ff11dac8000, 13456, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7ff11dac8000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x7ff11ed6e000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x7ff11ed6d000
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x7ff11ed6b000
arch_prctl(ARCH_SET_FS, 0x7ff11ed6b840) = 0
mprotect(0x7ff11e92d000, 16384, PROT_READ) = 0
mprotect(0x7ff11dac6000, 4096, PROT_READ) = 0
mprotect(0x7ff11dd30000, 4096, PROT_READ) = 0
mprotect(0x7ff11df34000, 4096, PROT_READ) = 0
mprotect(0x7ff11e139000, 4096, PROT_READ) = 0
mprotect(0x7ff11e35b000, 4096, PROT_READ) = 0
mprotect(0x7ff11e595000, 12288, PROT_READ) = 0
mprotect(0x7ff11eb72000, 4096, PROT_READ) = 0
mprotect(0x7ff11efa1000, 4096, PROT_READ) = 0
mprotect(0x7ff11ed95000, 4096, PROT_READ) = 0
munmap(0x7ff11ed71000, 143235)          = 0
set_tid_address(0x7ff11ed6bb10)         = 2406
set_robust_list(0x7ff11ed6bb20, 24)     = 0
rt_sigaction(SIGRTMIN, {0x7ff11d8b6b40, [], SA_RESTORER|SA_SIGINFO,
0x7ff11d8c0050}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {0x7ff11d8b6bd0, [],
SA_RESTORER|SA_RESTART|SA_SIGINFO, 0x7ff11d8c0050}, NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM64_INFINITY}) =
0
statfs("/sys/fs/selinux", 0x7fffc15591b0) = -1 ENOENT (No such file or
directory)
statfs("/selinux", {f_type="REISERFS_SUPER_MAGIC", f_bsize=4096,
f_blocks=3136591, f_bfree=307071, f_bavail=307071, f_files=0, f_ffree=0,
f_fsid={54214528, 154712411}, f_namelen=255, f_frsize=4096}) = 0
brk(0)                                  = 0x7ff11f82e000
brk(0x7ff11f84f000)                     = 0x7ff11f84f000
open("/proc/filesystems", O_RDONLY)     = 3
fstat(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x7ff11ed93000
read(3, "nodev\tsysfs\nnodev\trootfs\nnodev\tr"..., 1024) = 281
read(3, "", 1024)                       = 0
close(3)                                = 0
munmap(0x7ff11ed93000, 4096)            = 0
open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=2434, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x7ff11ed93000
read(3, "# Locale name alias data base.\n#"..., 4096) = 2434
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0x7ff11ed93000, 4096)            = 0
open("/usr/lib/locale/en_US.UTF-8/LC_CTYPE", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
open("/usr/lib/locale/en_US.utf8/LC_CTYPE", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=256420, ...}) = 0
mmap(NULL, 256420, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7ff11ed2c000
close(3)                                = 0
open("/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=26244, ...}) = 0
mmap(NULL, 26244, PROT_READ, MAP_SHARED, 3, 0) = 0x7ff11ed8d000
close(3)                                = 0
futex(0x7ff11e932918, FUTEX_WAKE_PRIVATE, 2147483647) = 0
getuid()                                = 0
geteuid()                               = 0
getuid()                                = 0
geteuid()                               = 0
getgid()                                = 100
getegid()                               = 100
prctl(PR_GET_DUMPABLE)                  = 1
lstat("/etc/mtab", {st_mode=S_IFLNK|0777, st_size=17, ...}) = 0
getuid()                                = 0
geteuid()                               = 0
getgid()                                = 100
getegid()                               = 100
prctl(PR_GET_DUMPABLE)                  = 1
stat("/run", {st_mode=S_IFDIR|0755, st_size=740, ...}) = 0
lstat("/run/mount/utab", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
open("/run/mount/utab", O_RDWR|O_CREAT|O_CLOEXEC, 0644) = 3
close(3)                                = 0
readlink("/dev", 0x7fffc1556f50, 4096)  = -1 EINVAL (Invalid argument)
readlink("/dev/sdb", 0x7fffc1556f50, 4096) = -1 EINVAL (Invalid argument)
stat("/dev/sdb", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 16), ...}) = 0
readlink("/media", 0x7fffc1556eb0, 4096) = -1 EINVAL (Invalid argument)
readlink("/media/disk", 0x7fffc1556eb0, 4096) = -1 EINVAL (Invalid
argument)
access("/dev/sdb", F_OK)                = 0
open("/dev/sdb", O_RDONLY|O_CLOEXEC)    = 3
fadvise64(3, 0, 0, POSIX_FADV_RANDOM)   = 0
fstat(3, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 16), ...}) = 0
uname({sys="Linux", node="orac.site", ...}) = 0
ioctl(3, BLKGETSIZE64, 2000398934016)   = 0
open("/sys/dev/block/8:16", O_RDONLY|O_CLOEXEC) = 4
newfstatat(4, "partition", 0x7fffc1557c40, 0) = -1 ENOENT (No such file or
directory)
openat(4, "dm/uuid", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
close(4)                                = 0
ioctl(3, CDROM_GET_CAPABILITY or SNDRV_SEQ_IOCTL_UNSUBSCRIBE_PORT, 0) = -1
EINVAL (Invalid argument)
lseek(3, 2000398843904, SEEK_SET)       = 2000398843904
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 64)
= 64
lseek(3, 2000398925824, SEEK_SET)       = 2000398925824
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 256)
= 256
lseek(3, 0, SEEK_SET)                   = 0
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 256)
= 256
lseek(3, 4096, SEEK_SET)                = 4096
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 256)
= 256
lseek(3, 2000398933504, SEEK_SET)       = 2000398933504
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512)
= 512
lseek(3, 2000398802432, SEEK_SET)       = 2000398802432
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512)
= 512
lseek(3, 2000398932992, SEEK_SET)       = 2000398932992
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 48)
= 48
lseek(3, 2000398901760, SEEK_SET)       = 2000398901760
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398803456, SEEK_SET)       = 2000398803456
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398802944, SEEK_SET)       = 2000398802944
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398729728, SEEK_SET)       = 2000398729728
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398631424, SEEK_SET)       = 2000398631424
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398588416, SEEK_SET)       = 2000398588416
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398557696, SEEK_SET)       = 2000398557696
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398467584, SEEK_SET)       = 2000398467584
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398435328, SEEK_SET)       = 2000398435328
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398426624, SEEK_SET)       = 2000398426624
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398447104, SEEK_SET)       = 2000398447104
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000397353472, SEEK_SET)       = 2000397353472
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
lseek(3, 2000398928384, SEEK_SET)       = 2000398928384
read(3, "\0\0\0\0", 4)                  = 4
lseek(3, 4096, SEEK_SET)                = 4096
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 2000398929920, SEEK_SET)       = 2000398929920
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
4096) = 4096
lseek(3, 0, SEEK_SET)                   = 0
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 1024, SEEK_SET)                = 1024
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 1048576, SEEK_SET)             = 1048576
read(3, "_zyppdb more robust (bnc#441043)"..., 1024) = 1024
lseek(3, 3072, SEEK_SET)                = 3072
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 7168, SEEK_SET)                = 7168
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 15360, SEEK_SET)               = 15360
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 31744, SEEK_SET)               = 31744
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 64512, SEEK_SET)               = 64512
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 8192, SEEK_SET)                = 8192
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 65536, SEEK_SET)               = 65536
read(3,
"ReIsEr4\0\0\0\0\0\0\0\0\0\0\0\0\0200\6\316\321t\220N\250\251\270\330!"...,
1024) = 1024
lseek(3, 32768, SEEK_SET)               = 32768
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 131072, SEEK_SET)              = 131072
read(3,
"\0\0\1\0x\1b\16SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\0\0<c"..., 41) =
41
lseek(3, 135168, SEEK_SET)              = 135168
read(3,
"\0\0\1\0\245\0175\0SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\0\2\350\10"...,
41) = 41
lseek(3, 139264, SEEK_SET)              = 139264
read(3,
"\0\0\1\0o\rk\2SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\0<c"..., 41) =
41
lseek(3, 143360, SEEK_SET)              = 143360
read(3,
"\0\0\1\0\350\v\362\3SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\0<c"...,
41) = 41
lseek(3, 147456, SEEK_SET)              = 147456
read(3,
"\0\0\1\0\213\rO\2SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\0\260\0("...,
41) = 41
lseek(3, 151552, SEEK_SET)              = 151552
read(3,
"\0\0\1\0\316\1\f\16SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\0h\4'"..., 41)
= 41
lseek(3, 155648, SEEK_SET)              = 155648
read(3,
"\0\0\1\0\24\r\306\2SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\0<c"...,
41) = 41
lseek(3, 159744, SEEK_SET)              = 159744
read(3,
"\0\0\3\0\217\f\377\2SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\0\250\0#"...,
41) = 41
lseek(3, 163840, SEEK_SET)              = 163840
read(3,
"\0\0\1\0\243\t7\6SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\334|\""...,
41) = 41
lseek(3, 167936, SEEK_SET)              = 167936
read(3, "\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\n
\21"..., 41) = 41
lseek(3, 172032, SEEK_SET)              = 172032
read(3,
"\0\0\16\0S\3\231\nSF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\t11"..., 41)
= 41
lseek(3, 176128, SEEK_SET)              = 176128
read(3,
"\0\0\6\0\0\0\34\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\27\0\244\201"...,
41) = 41
lseek(3, 180224, SEEK_SET)              = 180224
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20y\214T"...,
41) = 41
lseek(3, 184320, SEEK_SET)              = 184320
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20d&\314"...,
41) = 41
lseek(3, 188416, SEEK_SET)              = 188416
read(3, "\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20
\251$"..., 41) = 41
lseek(3, 192512, SEEK_SET)              = 192512
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\0209,t"...,
41) = 41
lseek(3, 196608, SEEK_SET)              = 196608
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\320\222$"...,
41) = 41
lseek(3, 200704, SEEK_SET)              = 200704
read(3,
"\0\0\2\0\0\0\264\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\236&o"...,
41) = 41
lseek(3, 204800, SEEK_SET)              = 204800
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20l\244\n"...,
41) = 41
lseek(3, 208896, SEEK_SET)              = 208896
read(3,
"\0\0\4\0\0\0h\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\302\0021"...,
41) = 41
lseek(3, 212992, SEEK_SET)              = 212992
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20?(8"..., 41)
= 41
lseek(3, 217088, SEEK_SET)              = 217088
read(3,
"\0\0\2\0\0\0\264\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20id."..., 41)
= 41
lseek(3, 221184, SEEK_SET)              = 221184
read(3,
"\0\0\5\0\0\0B\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\4@\27"..., 41)
= 41
lseek(3, 225280, SEEK_SET)              = 225280
read(3, "\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20c)
"..., 41) = 41
lseek(3, 229376, SEEK_SET)              = 229376
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\344cl"...,
41) = 41
lseek(3, 233472, SEEK_SET)              = 233472
read(3, "\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\"
\332"..., 41) = 41
lseek(3, 237568, SEEK_SET)              = 237568
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\357\220\6"...,
41) = 41
lseek(3, 241664, SEEK_SET)              = 241664
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\rth"...,
41) = 41
lseek(3, 245760, SEEK_SET)              = 245760
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20,\"\210"...,
41) = 41
lseek(3, 249856, SEEK_SET)              = 249856
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\33+a"...,
41) = 41
lseek(3, 253952, SEEK_SET)              = 253952
read(3,
"\0\0\2\0\0\0\264\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20x\10l"...,
41) = 41
lseek(3, 258048, SEEK_SET)              = 258048
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\1no"...,
41) = 41
lseek(3, 393216, SEEK_SET)              = 393216
read(3,
"\264\325\241\21\"Ttw\247\306\24\177\200\377}?\304B1\2\365\342\354\225\231\311\371\363\364\177\t\204"...,
41) = 41
lseek(3, 397312, SEEK_SET)              = 397312
read(3,
"\257\261\207\332a+\tC\2235D\263U\330\301E*\nb\240\20\2134\233\347V\262
&\36432"..., 41) = 41
lseek(3, 401408, SEEK_SET)              = 401408
read(3, "\316\313\354\365i\\\366\21\217OIm
\0\225y\21\25q\216}\323\247bx&s\217\227\276\374\342"..., 41) = 41
lseek(3, 405504, SEEK_SET)              = 405504
read(3,
"\360d\313\21\315Hd\246\342(\24\36\255:\256?\377\326\302\270EM\300\2167\373\22\24\324\371U\307"...,
41) = 41
lseek(3, 409600, SEEK_SET)              = 409600
read(3, "\5\0330T\2150B\270\315\257\350\243\257\221
1c\16\276\6-dP\304\22L\376\31\n\257fd"..., 41) = 41
lseek(3, 413696, SEEK_SET)              = 413696
read(3,
"\235\255\10\205-JR\262\34A\235\362\301\37I\350,\220)mi\3747\177!\242\200\321\335\244\204\324"...,
41) = 41
lseek(3, 417792, SEEK_SET)              = 417792
read(3,
"\0\0\1\0.\4\254\vSF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\0\34\355"...,
41) = 41
lseek(3, 421888, SEEK_SET)              = 421888
read(3, "\355\253\356\333\3\0\0\0\0\1libsatsolver-demo-0.14"..., 41) = 41
lseek(3, 425984, SEEK_SET)              = 425984
read(3, "de\0dmacvicar@suse.de\0dmacvicar@s"..., 41) = 41
lseek(3, 430080, SEEK_SET)              = 430080
read(3, " to fix multiversion patches [bn"..., 41) = 41
lseek(3, 434176, SEEK_SET)              = 434176
read(3, "rproviders()\n- make patches do n"..., 41) = 41
lseek(3, 438272, SEEK_SET)              = 438272
read(3, "d support for susetags filelist\n"..., 41) = 41
lseek(3, 442368, SEEK_SET)              = 442368
read(3, "\263\3232\371D\377\16j\241/\201\336f\335\n\232\301~1
Q\315g\231\22\210\362\352\367:V|"..., 41) = 41
lseek(3, 446464, SEEK_SET)              = 446464
read(3,
"o\361i4<\203I\237\30l\367\216\367\366\336\207|\27\266F\6A\303\24\374\275J\215I\376\365\344"...,
41) = 41
lseek(3, 450560, SEEK_SET)              = 450560
read(3,
"s\357\371\253l)\337\267N\317\344+\3(\374\321\21m\210Ld\242\206K@o\315\201\272}r\343"...,
41) = 41
lseek(3, 454656, SEEK_SET)              = 454656
read(3,
"j\265\241\4\213\0.\273q0\307\265\230\304\211\341\276\264\317\221I\306}i+\252\231\3163\366U\376"...,
41) = 41
lseek(3, 458752, SEEK_SET)              = 458752
read(3,
"x\213\277\tY\30\345\370\245@\t\347\24\345|\22\10\247\212\310\300\257\f\0207\2016s\16C\225\244"...,
41) = 41
lseek(3, 462848, SEEK_SET)              = 462848
read(3,
"\22\270\0\32\210Q\v\33v\352\245\0245\366e\36\vsO$f\354\262\305\373\341\37\362\31_\262E"...,
41) = 41
lseek(3, 466944, SEEK_SET)              = 466944
read(3,
"\32)\f\221#\342m\345+\266\32\353\250\214v\370\303{>\5P\2\225\"6\237wa\377-\24\300"...,
41) = 41
lseek(3, 471040, SEEK_SET)              = 471040
read(3,
"\351\311\214\321DG\326\351\20\260\205\312\207\371\f\371\327%\352\206G\252\241f\251\6\320\254\346\236\370Q"...,
41) = 41
lseek(3, 475136, SEEK_SET)              = 475136
read(3,
"i\243h/m\362\314\270ql\311{V\30\305w\236U\360\223\303\340\222\352\366k\333\352\332\307&\375"...,
41) = 41
lseek(3, 479232, SEEK_SET)              = 479232
read(3,
"\243/0\16\233\237B\16p\215\n4\310\177E\233\324z\v\347\372\24\321\344\262\321\321\350\0N\7e"...,
41) = 41
lseek(3, 483328, SEEK_SET)              = 483328
read(3,
"\272\r;\32\6\367\21\365\247h1A+\325\23\316\16\345!\356l,\33\275F\312\346\333v\340\235\270"...,
41) = 41
lseek(3, 487424, SEEK_SET)              = 487424
read(3,
"\350h\215VA\343\"\221\204`D\250Ua\212\366\1U\7\254\223\330\213\"~\343rp|\206\"H"...,
41) = 41
lseek(3, 491520, SEEK_SET)              = 491520
read(3,
"IV\326\310\371\3703\345\332Y\324\241{rw\177\314\6\23\257\224d\03453\366\373>\"\375\351<"...,
41) = 41
lseek(3, 495616, SEEK_SET)              = 495616
read(3,
"\311U3\327!\376I\30r\302k\211\375\322J3\274:3\333\3\320\235\177\342\20d\22\234\335\3735"...,
41) = 41
lseek(3, 499712, SEEK_SET)              = 499712
read(3,
"\301)\335R\31\24\326\326^\343ht\357\3748e\367\312\356W\271g\31\275\337\211Z\274\\\24\243J"...,
41) = 41
lseek(3, 503808, SEEK_SET)              = 503808
read(3,
"$\231'\210HR\262l\177U\214\301\0\204V\320I[\322]\352\201~\375Yv\254\342\354\0.H"...,
41) = 41
lseek(3, 507904, SEEK_SET)              = 507904
read(3,
"\202\264\24\223\222\252k4\201q\206Q\322\354\366\255\25\253\351\272\363\2u{\325\321\\\327\33\377\v\251"...,
41) = 41
lseek(3, 512000, SEEK_SET)              = 512000
read(3,
"\206\315|\27oV\302\376\266\25\26)\271\272\225K\322o\201=>\262\357\3427\35:V\215KU\367"...,
41) = 41
lseek(3, 516096, SEEK_SET)              = 516096
read(3,
"\263\223F\24R\212\337a\t\324Eq\243J\335\220KV&\311\332R\317(\325S!\324[\361\261\260"...,
41) = 41
lseek(3, 520192, SEEK_SET)              = 520192
read(3,
"\232\207Dwr6?\rE\2469S\0\266Gju\323\221e\2063,\215O\246\313\322kR)\336"...,
41) = 41
lseek(3, 0, SEEK_SET)                   = 0
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1377) = 1377
lseek(3, 8192, SEEK_SET)                = 8192
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1377) = 1377
lseek(3, 65536, SEEK_SET)               = 65536
read(3,
"ReIsEr4\0\0\0\0\0\0\0\0\0\0\0\0\0200\6\316\321t\220N\250\251\270\330!"...,
1377) = 1377
lseek(3, 262144, SEEK_SET)              = 262144
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20t\2\334"...,
1377) = 1377
lseek(3, 9728, SEEK_SET)                = 9728
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512)
= 512
lseek(3, 18944, SEEK_SET)               = 18944
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512)
= 512
lseek(3, 2048, SEEK_SET)                = 2048
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
lseek(3, 67108864, SEEK_SET)            = 67108864
read(3,
"t\324\224O$&\215\272\370M\202\0022&vY\213z;\265\253\374^\21F\316\5\370\362\355\254u"...,
1024) = 1024
lseek(3, 274877906944, SEEK_SET)        = 274877906944
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20ZMW"...,
1024) = 1024
lseek(3, 2097152, SEEK_SET)             = 2097152
read(3,
"\0\0\1\0\0\0\332\17SF4RT\367\332\35\0\0\0\0\0\0\0\0\0\0\1\0\20\3321\202"...,
1024) = 1024
ioctl(3, BLKSSZGET, 512)                = 0
lseek(3, 28672, SEEK_SET)               = 28672
read(3,
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
close(3)                                = 0
stat("/sbin/mount.reiser4", 0x7fffc1557f40) = -1 ENOENT (No such file or
directory)
stat("/sbin/fs.d/mount.reiser4", 0x7fffc1557f40) = -1 ENOENT (No such file
or directory)
stat("/sbin/fs/mount.reiser4", 0x7fffc1557f40) = -1 ENOENT (No such file
or directory)
mount("/dev/sdb", "/media/disk", "reiser4", MS_MGC_VAL,
"dont_load_bitmap") = -1 ENOENT (No such file or directory)
lstat("/media/disk", {st_mode=S_IFDIR|0755, st_size=48, ...}) = 0
stat("/media/disk", {st_mode=S_IFDIR|0755, st_size=48, ...}) = 0
stat("/dev/sdb", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 16), ...}) = 0
write(2, "mount: ", 7mount: )                  = 7
write(2, "mount(2) failed", 15mount(2) failed)         = 15
write(2, ": ", 2: )                       = 2
write(2, "No such file or directory\n", 26No such file or directory
) = 26
close(1)                                = 0
close(2)                                = 0
exit_group(32)                          = ?
+++ exited with 32 +++
