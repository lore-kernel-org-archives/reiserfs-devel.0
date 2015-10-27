From: <doiggl@velocitynet.com.au>
Subject: Some reiser4 meta-data questions: [/dev/sdb]
Date: Tue, 27 Oct 2015 16:05:24 +1100
Message-ID: <02b714410cdba6d50bc46d86b0d8e80a@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Some reiser4 meta-data questions: [/dev/sdb]

- I packed r4 meta-data with command

# debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4meta-sdb.gz

- I Unpacked r4 metadata with command as follows, metadata unpacked ok.
# gunzip r4meta-sdb.gz

 3,084,286,240 r4meta-sdb.gz
24,742,135,567 r4meta-sdb


What commands would you run against unpacked meta-data to help diagnosis
of problems and fixing meta-data ?
So mount command completes.
Thanks for assistance
--Glenn


Some history:

-tried
# mount -o dont_load_bitmap /dev/sdb /media/disk
mount: mount(2) failed: No such file or directory

- mount point exists
# ll /media/disk
total 0

# fdisk -l
Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

#dmesg shows: [disk plugged in and mount attempt]

[   28.904861] usb usb1-port3: disabled by hub (EMI?), re-enabling...
[   28.904880] usb 1-3: USB disconnect, device number 2
[   29.187872] usb 1-3: new low-speed USB device number 3 using ohci-pci
[   29.356171] usb 1-3: New USB device found, idVendor=1c4f,
idProduct=0034
[   29.356183] usb 1-3: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[   29.356190] usb 1-3: Product: Usb Mouse
[   29.356196] usb 1-3: Manufacturer: SIGMACHIP
[   29.364090] input: SIGMACHIP Usb Mouse as
/devices/pci0000:00/0000:00:12.0/usb1/1-3/1-3:1.0/0003:1C4F:0034.0002/input/input21
[   29.364627] hid-generic 0003:1C4F:0034.0002: input,hidraw0: USB HID
v1.10 Mouse [SIGMACHIP Usb Mouse] on usb-0000:00:12.0-3/input0
[   29.568181] usb 4-1: new high-speed USB device number 3 using ehci-pci
[   29.704239] usb 4-1: New USB device found, idVendor=04fc,
idProduct=0c25
[   29.704251] usb 4-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[   29.704257] usb 4-1: Product: USB to Serial-ATA bridge
[   29.704263] usb 4-1: Manufacturer: Sunplus Technology Inc.
[   29.704268] usb 4-1: SerialNumber: ST32000542            5XW1ZMG4
[   29.723217] usb-storage 4-1:1.0: USB Mass Storage device detected
[   29.723584] scsi host4: usb-storage 4-1:1.0
[   29.723801] usbcore: registered new interface driver usb-storage
[   30.726464] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[   30.727079] sd 4:0:0:0: Attached scsi generic sg2 type 0
[   30.729576] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[   30.733952] sd 4:0:0:0: [sdb] Write Protect is off
[   30.733960] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[   30.736912] sd 4:0:0:0: [sdb] No Caching mode page found
[   30.736920] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[   40.300617] sd 4:0:0:0: [sdb] Attached SCSI disk
.
.
[  415.988119] Loading Reiser4 (format release: 4.0.1) See www.namesys.com
for a description of Reiser4.
[  415.993678] reiser4[mount(1499)]: try_init_format40
(../fs/reiser4/plugin/disk_format/disk_format40.c:303)[vpf-1364]:
NOTICE: Warning: mounting sdb with fatal errors, forcing read-only mount.
[  415.993703] reiser4: sdb: found disk format 4.0.1.
[  416.062105] reiser4[mount(1499)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[  416.062118] reiser4[mount(1499)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)

previously:
http://www.spinics.net/lists/reiserfs-devel/msg04596.html
http://www.spinics.net/lists/reiserfs-devel/msg04206.html
http://www.spinics.net/lists/reiserfs-devel/msg03094.html
