From: <doiggl@velocitynet.com.au>
Subject: reiser4progs fsck.reiser4 1.1.0 and Wrong order of keys query [on sdb]
Date: Thu, 03 Sep 2015 09:51:33 +1000
Message-ID: <a183fec1149b76d5775189db36688175@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Question:
#########
Is there a patch available to fix this problem ?
Thanks
--Glenn

reiser4progs version 1.1.0 and result [on sdb]

# fsck.reiser4  -V
fsck.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

# rpm -qa |grep -i reiser |sort
libreiser4-1_1-0-1.1.0-13.1.x86_64
libreiser4-minimal-1_1-0-1.1.0-13.1.x86_64
libreiserfs-0_3-0-0.3.0.5-163.3.x86_64
reiser4progs-1.1.0-13.1.x86_64
reiser4progs-debuginfo-1.0.9-69.1.x86_64
reiser4progs-debugsource-1.0.9-69.1.x86_64
reiser4progs-devel-1.1.0-13.1.x86_64
reiserfs-3.6.23-1.3.x86_64


# dmesg

[ 2611.535910] usb 1-2: new high-speed USB device number 3 using ehci-pci
[ 2611.654916] usb 1-2: New USB device found, idVendor=04fc,
idProduct=0c25
[ 2611.654930] usb 1-2: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[ 2611.654937] usb 1-2: Product: USB to Serial-ATA bridge
[ 2611.654943] usb 1-2: Manufacturer: Sunplus Technology Inc.
[ 2611.654948] usb 1-2: SerialNumber: ST32000542            5XW1ZMG4
[ 2611.681303] usb-storage 1-2:1.0: USB Mass Storage device detected
[ 2611.681651] scsi4 : usb-storage 1-2:1.0
[ 2611.681958] usbcore: registered new interface driver usb-storage
[ 2612.689193] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[ 2612.690210] sd 4:0:0:0: Attached scsi generic sg2 type 0
[ 2612.691311] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[ 2612.695719] sd 4:0:0:0: [sdb] Write Protect is off
[ 2612.695735] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[ 2612.699070] sd 4:0:0:0: [sdb] No Caching mode page present
[ 2612.699083] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 2612.706449] sd 4:0:0:0: [sdb] No Caching mode page present
[ 2612.706461] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 2612.769517]  sdb: unknown partition table
[ 2612.781717] sd 4:0:0:0: [sdb] No Caching mode page present
[ 2612.781730] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 2612.781738] sd 4:0:0:0: [sdb] Attached SCSI disk


  fsck.reiser4  --build-fs --force  /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
     
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
     
Will build the Reiser4 FileSystem.                                        
                                                                          
     
***** fsck.reiser4 started at Wed Sep  2 21:13:02 2015
Reiser4 fs was detected on /dev/sdb.                                      
                                                                          
     
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format plugin. 
version:        0 
magic:          ReIsEr40FoRmAt 
mkfs id:        0x1ddaf754 
flushes:        0 
blocks:         488378640 
free blocks:    217146980 
root block:     37017218 
tail policy:    0x2 (smart) 
next oid:       0xedade 
file count:     188313 
tree height:    6 
key policy:     LARGE 
 
 
CHECKING THE STORAGE TREE                                                 
                                                                          
     
        Read nodes 197008413                                              
                                                                          
     
        Nodes left in the tree 197008413 
                Leaves of them 194764277, Twigs of them 2217790 
        Time interval: Wed Sep  2 21:14:59 2015 - Thu Sep  3 05:00:48 2015

CHECKING EXTENT REGIONS.                                                  
                                                                          
     
        Read twigs 2217790                                                
                                                                          
     
        Time interval: Thu Sep  3 05:00:48 2015 - Thu Sep  3 07:11:06 2015

LOOKING FOR UNCONNECTED NODES                                             
                                                                          
     
FSCK: node.c: 108: repair_node_items_check: Node (43828275), items (0) and
(1): Wrong order of keys.                                                  
     
FSCK: node.c: 108: repair_node_items_check: Node (52697435), items (79)
and (80): Wrong order of keys.                                             
        
FSCK: node.c: 108: repair_node_items_check: Node (63227569), items (24)
and (25): Wrong order of keys.                                             
        
FSCK: node.c: 108: repair_node_items_check: Node (63227571), items (73)
and (74): Wrong order of keys.                                             
        
FSCK: node.c: 108: repair_node_items_check: Node (116595727), items (20)
and (21): Wrong order of keys.                                             
       
FSCK: node.c: 108: repair_node_items_check: Node (227923161), items (22)
and (23): Wrong order of keys.                                             
       
FSCK: node.c: 108: repair_node_items_check: Node (284305753), items (61)
and (62): Wrong order of keys.                                             
       
        Read nodes 1481038                                                
                                                                          
     
        Good nodes 471512 
                Leaves of them 466164, Twigs of them 5348 
        Time interval: Thu Sep  3 07:11:22 2015 - Thu Sep  3 07:14:56 2015

***** fsck.reiser4 finished at Thu Sep  3 07:14:56 2015
Closing fs...done

FS is consistent.

#



Background history
==================
 http://www.spinics.net/lists/reiserfs-devel/msg04206.html
 http://www.spinics.net/lists/reiserfs-devel/msg04682.html

[from url]

This is a bug in fsck: it jumps to wrong branch for some reasons.
Not yet fixed.

Edward.
 
