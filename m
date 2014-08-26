From: <doiggl@velocitynet.com.au>
Subject: What can I do next to use R4 partition  sdb
Date: Tue, 26 Aug 2014 16:52:13 +1000
Message-ID: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello.
What can I do next to use R4 partition  sdb 
Thanks Glenn

- What I have done so far:

# md /media/disk

# ls -la  /media/disk
total 0
drwxr-xr-x 2 root users 48 Aug 18 16:05 .
drwxr-xr-x 4 root root  96 Aug 19 18:21 ..

mount command used.
# strace mount /dev/sdb  /media/disk

# strace shows {last few lines}
stat("/sbin/mount.reiser4", 0x7fff82b08700) = -1 ENOENT (No such file or
directory)
stat("/sbin/fs.d/mount.reiser4", 0x7fff82b08700) = -1 ENOENT (No such file
or directory)
stat("/sbin/fs/mount.reiser4", 0x7fff82b08700) = -1 ENOENT (No such file
or directory)
mount("/dev/sdb", "/media/disk", "reiser4", MS_MGC_VAL, NULL) = -1 ENOENT
(No such file or directory)
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



# cat /proc/filesystems
nodev   sysfs
nodev   rootfs
nodev   ramfs
nodev   bdev
nodev   proc
nodev   cgroup
nodev   cpuset
nodev   tmpfs
nodev   devtmpfs
nodev   debugfs
nodev   securityfs
nodev   sockfs
nodev   pipefs
nodev   devpts
        ext3
        ext2
        ext4
nodev   hugetlbfs
nodev   autofs
nodev   pstore
nodev   mqueue
        btrfs
        reiserfs
        reiser4

#dmesg shows atrer I plug in disk and run command #mount /dev/sdb 
/media/disk

13927.148926] usb 1-1: new high-speed USB device number 3 using ehci-pci
[13927.285272] usb 1-1: New USB device found, idVendor=04fc,
idProduct=0c25
[13927.285284] usb 1-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[13927.285291] usb 1-1: Product: USB to Serial-ATA bridge
[13927.285297] usb 1-1: Manufacturer: Sunplus Technology Inc.
[13927.285302] usb 1-1: SerialNumber: ST32000542            5XW1ZMG4
[13927.306242] usb-storage 1-1:1.0: USB Mass Storage device detected
[13927.306757] scsi4 : usb-storage 1-1:1.0
[13927.307043] usbcore: registered new interface driver usb-storage
[13928.310186] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[13928.310793] sd 4:0:0:0: Attached scsi generic sg2 type 0
[13928.313184] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[13928.317396] sd 4:0:0:0: [sdb] Write Protect is off
[13928.317410] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[13928.320044] sd 4:0:0:0: [sdb] No Caching mode page found
[13928.320056] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[13928.386115]  sdb: unknown partition table
[13928.405823] sd 4:0:0:0: [sdb] Attached SCSI disk
[14041.917702] Loading Reiser4. See www.namesys.com for a description of
Reiser4.
[14041.921930] reiser4: sdb: found disk format 4.0.0.
[14152.798878] reiser4[mount(7623)]: traverse_tree
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.15.0/linux-3.15/fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[14152.798896] reiser4[mount(7623)]: key_warning
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.15.0/linux-3.15/fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
WARNING: Error for inode 42 (-2)


# uname -a
Linux test.site 3.15.8-1-vanilla #1 SMP Tue Aug 5 04:15:41 UTC 2014
(258e3b0) x86_64 x86_64 x86_64 GNU/Linux

