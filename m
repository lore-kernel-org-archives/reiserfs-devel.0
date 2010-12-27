From: <doiggl@velocitynet.com.au>
Subject: Reiser4  setup using an entire disk volume using 2.6.36.2
Date: Mon, 27 Dec 2010 16:30:34 +1100
Message-ID: <da704e1c9641948a581f3250f98c6013@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
This is an example setup using an entire disk volume.
 
# modprobe -v  reiser4
insmod
/lib/modules/2.6.36.2-56-vanilla/kernel/lib/zlib_deflate/zlib_deflate.ko 
insmod /lib/modules/2.6.36.2-56-vanilla/kernel/lib/lzo/lzo_compress.ko 
insmod /lib/modules/2.6.36.2-56-vanilla/kernel/fs/reiser4/reiser4.ko

After adding in  disk via usb

[   51.488771] usb 1-1.2: new high speed USB device using ehci_hcd and
address 5
[   51.584116] usb 1-1.2: New USB device found, idVendor=04fc,
idProduct=0c25
[   51.584123] usb 1-1.2: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[   51.584129] usb 1-1.2: Product: USB to Serial-ATA bridge
[   51.584135] usb 1-1.2: Manufacturer: Sunplus Technology Inc.
[   51.584139] usb 1-1.2: SerialNumber: ST31000333            5TE04R8W
[   51.618433] Initializing USB Mass Storage driver...
[   51.619594] scsi8 : usb-storage 1-1.2:1.0
[   51.619859] usbcore: registered new interface driver usb-storage
[   51.619862] USB Mass Storage support registered.
[   52.628635] scsi 8:0:0:0: Direct-Access     ST310003 33AS              
  PQ: 0 ANSI: 2
[   52.629100] sd 8:0:0:0: Attached scsi generic sg2 type 0
[   52.631208] sd 8:0:0:0: [sdb] 1953525168 512-byte logical blocks: (1.00
TB/931 GiB)
[   52.640218] sd 8:0:0:0: [sdb] Write Protect is off
[   52.640225] sd 8:0:0:0: [sdb] Mode Sense: 38 00 00 00
[   52.640228] sd 8:0:0:0: [sdb] Assuming drive cache: write through
[   52.644589] sd 8:0:0:0: [sdb] Assuming drive cache: write through
[   52.669352]  sdb: sdb1
[   52.673154] sd 8:0:0:0: [sdb] Assuming drive cache: write through
[   52.673162] sd 8:0:0:0: [sdb] Attached SCSI disk
[  145.972234] Loading Reiser4. See www.namesys.com for a description of
Reiser4.

# mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/sdb -fy
# fsck.reiser4 --fix /dev/sdb -y
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
   
Will fix minor corruptions of the Reiser4 SuperBlock.                     
                                                                          
   
Will fix minor corruptions of the Reiser4 FileSystem.                     
                                                                          
   
***** fsck.reiser4 started at Mon Dec 27 16:04:57 2010
Reiser4 fs was detected on /dev/sdb.                                      
                                                                          
   
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           5602fc26-41a7-4361-b3a7-39a673679f80 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format plugin. 
version:        0 
magic:          ReIsEr40FoRmAt 
mkfs id:        0x62e55157 
flushes:        0 
blocks:         244190640 
free blocks:    244183135 
root block:     23 
tail policy:    0x2 (smart) 
next oid:       0x10000 
file count:     1 
tree height:    2 
key policy:     LARGE 
 
 
CHECKING THE STORAGE TREE                                                 
                                                                          
   
        Read nodes 2                                                      
                                                                          
   
        Nodes left in the tree 2 
                Leaves of them 1, Twigs of them 1 
        Time interval: Mon Dec 27 16:05:52 2010 - Mon Dec 27 16:05:52 2010

CHECKING EXTENT REGIONS.                                                  
                                                                          
   
        Read twigs 1                                                      
                                                                          
   
        Time interval: Mon Dec 27 16:05:52 2010 - Mon Dec 27 16:05:53 2010

CHECKING THE SEMANTIC TREE                                                
                                                                          
   
        Found 1 objects (some could be encountered more then once).       
                                                                          
   
        Time interval: Mon Dec 27 16:05:53 2010 - Mon Dec 27 16:05:53 2010

***** fsck.reiser4 finished at Mon Dec 27 16:05:53 2010
Closing fs...done

FS is consistent.

# mkdir /reiser4
# mount -t reiser4 /dev/sdb /reiser4


- commands used in process
# mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/sdb -fy
# fsck.reiser4 --fix /dev/sdb -y
# mkdir /reiser4
# mount -t reiser4 /dev/sdb /reiser4

# manually added reiser4 filesystem to /etc/fstab
/dev/sdb /reiser4 reiser4 defaults 0 0

Files used see http://www.spinics.net/lists/reiserfs-devel/msg02654.html
Cheers Glenn
