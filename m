From: <doiggl@velocitynet.com.au>
Subject: Why is mount command not working  on /dev/sdb
Date: Thu, 03 Sep 2015 16:53:44 +1000
Message-ID: <d830895823b381bf2890cbabbedda2e5@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Hello,

Why is mount command not working  on /dev/sdb ?
Can it be repaired ?
If so how ?
--Glenn

# md /media/disk

# fdisk -l


Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

#dmesg
[ 3390.448870] usb 1-2: new high-speed USB device number 3 using ehci-pci
[ 3390.585319] usb 1-2: New USB device found, idVendor=04fc,
idProduct=0c25
[ 3390.585331] usb 1-2: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[ 3390.585338] usb 1-2: Product: USB to Serial-ATA bridge
[ 3390.585344] usb 1-2: Manufacturer: Sunplus Technology Inc.
[ 3390.585350] usb 1-2: SerialNumber: ST32000542            5XW1ZMG4
[ 3390.626290] usb-storage 1-2:1.0: USB Mass Storage device detected
[ 3390.626588] scsi host4: usb-storage 1-2:1.0
[ 3390.626797] usbcore: registered new interface driver usb-storage
[ 3391.631132] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[ 3391.631836] sd 4:0:0:0: Attached scsi generic sg2 type 0
[ 3391.634198] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[ 3391.636823] sd 4:0:0:0: [sdb] Write Protect is off
[ 3391.636834] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[ 3391.639517] sd 4:0:0:0: [sdb] No Caching mode page found
[ 3391.639531] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 3401.600724] sd 4:0:0:0: [sdb] Attached SCSI disk



# mount /dev/sdb /media/disk
mount: mount(2) failed: No such file or directory

# dmesg
[ 7269.030082] Loading Reiser4 (format release: 4.0.1) See www.namesys.com
for a description of Reiser4.
[ 7269.036161] reiser4: sdb: found disk format 4.0.0.
[ 7379.481446] reiser4[mount(4352)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[ 7379.481464] reiser4[mount(4352)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)


# cat /proc/modules |grep -i reiser4                                      
                                                                          
     
reiser4 442368 0 - Live 0xffffffffa0a37000

/lib/modules/4.1.6-14-vanilla/kernel/fs/reiser4 # ll
total 729
-rw-r--r-- 1 root root 744837 Sep  3 01:24 reiser4.ko

related earlier repair attempt
#
http://www.spinics.net/lists/reiserfs-devel/msg04809.html

