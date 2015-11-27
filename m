From: <doiggl@velocitynet.com.au>
Subject: meta data query - commands to run on [r4meta-sdb.gz] packed from /dev/sdb
Date: Fri, 27 Nov 2015 15:45:46 +1100
Message-ID: <d4786b8c90e07a12a5cc4e8502040065@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello,

I use these versions:

# fsck.reiser4  -V
fsck.reiser4 1.1.0
Format release: 4.0.1

# rpm -qa |grep -i reiser4 |sort
kernel-reiser4-4.1.6-7.1.gd2bbe7f.x86_64
libreiser4-1_1-0-1.1.0-14.1.x86_64
reiser4progs-1.1.0-14.1.x86_64

- packed reiser4 metadata via command
# debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4meta-sdb.gz

- I unpacked reiser4 metadata via command
# gunzip r4meta-sdb.gz

# ll r4meta-sdb
-rw-r--r-- 1 root users 24742135567 Nov 27 14:33 r4meta-sdb
24,742,135,567

= 2941.40457 Megabytes
= 2.87247    Gigabytes



I note the freespace you had was not enough to unpack metadata [1]

I unpacked metadata
# gunzip r4meta-sdb.gz

A question for Edward Shishkin

- What commands do you run against unpacked metadata ?

I know files and data are on disk but just trying to access it.
Thank you for any help the commands to run.
Thankyou Glenn


[1]
http://permalink.gmane.org/gmane.comp.file-systems.reiserfs.general/23836
http://www.spinics.net/lists/reiserfs-devel/msg04596.html

#dmesg
[14764.492268] usb usb4-port3: disabled by hub (EMI?), re-enabling...
[14764.492286] usb 4-3: USB disconnect, device number 2
[14764.779615] usb 4-3: new low-speed USB device number 3 using ohci-pci
[14764.948678] usb 4-3: New USB device found, idVendor=1c4f,
idProduct=0034
[14764.948691] usb 4-3: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[14764.948698] usb 4-3: Product: Usb Mouse
[14764.948704] usb 4-3: Manufacturer: SIGMACHIP
[14764.956597] input: SIGMACHIP Usb Mouse as
/devices/pci0000:00/0000:00:12.0/usb4/4-3/4-3:1.0/0003:1C4F:0034.0002/input/input21
[14764.957251] hid-generic 0003:1C4F:0034.0002: input,hidraw0: USB HID
v1.10 Mouse [SIGMACHIP Usb Mouse] on usb-0000:00:12.0-3/input0
[14767.982313] usb 1-2: new high-speed USB device number 4 using ehci-pci
[14768.118261] usb 1-2: New USB device found, idVendor=04fc,
idProduct=0c25
[14768.118275] usb 1-2: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[14768.118282] usb 1-2: Product: USB to Serial-ATA bridge
[14768.118288] usb 1-2: Manufacturer: Sunplus Technology Inc.
[14768.118294] usb 1-2: SerialNumber: ST32000542            5XW1ZMG4
[14768.121238] usb-storage 1-2:1.0: USB Mass Storage device detected
[14768.121739] scsi host5: usb-storage 1-2:1.0
[14769.123943] scsi 5:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[14769.125016] sd 5:0:0:0: Attached scsi generic sg3 type 0
[14769.126017] sd 5:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[14769.128629] sd 5:0:0:0: [sdb] Write Protect is off
[14769.128637] sd 5:0:0:0: [sdb] Mode Sense: 38 00 00 00
[14769.131282] sd 5:0:0:0: [sdb] No Caching mode page found
[14769.131289] sd 5:0:0:0: [sdb] Assuming drive cache: write through
[14769.168733] sd 5:0:0:0: [sdb] Attached SCSI disk

[14894.742982] Loading Reiser4 (format release: 4.0.1) See www.namesys.com
for a description of Reiser4.
[14894.748479] reiser4[mount(5819)]: try_init_format40
(../fs/reiser4/plugin/disk_format/disk_format40.c:303)[vpf-1364]:
NOTICE: Warning: mounting sdb with fatal errors, forcing read-only mount.
[14894.748497] reiser4: sdb: found disk format 4.0.1.
[14945.020661] SFW2-INext-DROP-DEFLT IN=enp3s0f5 OUT= MAC=
SRC=fe80:0000:0000:0000:22cf:30ff:fe28:fda2
DST=ff02:0000:0000:0000:0000:0000:0000:00fb LEN=84 TC=0 HOPLIMIT=255
FLOWLBL=0 PROTO=UDP SPT=5353 DPT=5353 LEN=44 
[15004.431490] reiser4[mount(5819)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[15004.431510] reiser4[mount(5819)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)

-I tried
# mount /dev/sdb /media/disk2
mount: mount(2) failed: No such file or directory
