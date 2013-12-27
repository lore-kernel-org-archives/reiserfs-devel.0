From: <doiggl@velocitynet.com.au>
Subject: is [reiser4] volume repairable ?
Date: Fri, 27 Dec 2013 21:36:20 +1100
Message-ID: <d3794137e75f100cec88bf899e6b70c9@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Is any of this repairable ?
If possible, is it repairable enough to allow a copy of some files to
another disk ?
What tools/live-cd [reiser4] could be used for this ?
What repair steps could be used ?
Thanks Glenn

# md /media/disk/
# mount /dev/sdb /media/disk/
mount: mount(2) failed: No such file or directory

# uname -a
Linux test.site 3.12.5-3.ga012288-vanilla #1 SMP Thu Dec 19 14:49:57 UTC
2013 (3848a14) x86_64 x86_64 x86_64 GNU/Linux

dmesg shows:
.
.
[28915.817039] usb 1-1: new high-speed USB device number 3 using ehci-pci
[28915.953409] usb 1-1: New USB device found, idVendor=04fc,
idProduct=0c25
[28915.953422] usb 1-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[28915.953429] usb 1-1: Product: USB to Serial-ATA bridge
[28915.953435] usb 1-1: Manufacturer: Sunplus Technology Inc.
[28915.953439] usb 1-1: SerialNumber: ST32000542            5XW1ZMG4
[28915.973442] usb-storage 1-1:1.0: USB Mass Storage device detected
[28915.973832] scsi4 : usb-storage 1-1:1.0
[28915.974012] usbcore: registered new interface driver usb-storage
[28916.978453] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[28916.978949] sd 4:0:0:0: Attached scsi generic sg2 type 0
[28916.980430] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[28916.983915] sd 4:0:0:0: [sdb] Write Protect is off
[28916.983930] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[28916.986551] sd 4:0:0:0: [sdb] No Caching mode page found
[28916.986565] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[28916.993862] sd 4:0:0:0: [sdb] No Caching mode page found
[28916.993871] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[28917.047109]  sdb: unknown partition table
[28917.059240] sd 4:0:0:0: [sdb] No Caching mode page found
[28917.059255] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[28917.059265] sd 4:0:0:0: [sdb] Attached SCSI disk
[29034.779002] Loading Reiser4. See www.namesys.com for a description of
Reiser4.
[29034.783157] reiser4: sdb: found disk format 4.0.0.
[29145.449717] reiser4[mount(13366)]: traverse_tree
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.12.5/linux-3.12/fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[29145.449736] reiser4[mount(13366)]: key_warning
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.12.5/linux-3.12/fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
WARNING: Error for inode 42 (-2)
[29197.448118] reiser4: sdb: found disk format 4.0.0.
[29307.883113] reiser4[mount(13434)]: traverse_tree
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.12.5/linux-3.12/fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[29307.883132] reiser4[mount(13434)]: key_warning
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.12.5/linux-3.12/fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
WARNING: Error for inode 42 (-2)

