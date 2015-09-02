From: <doiggl@velocitynet.com.au>
Subject: reiser4progs version 1.1.0 and result [on sdb]
Date: Wed, 02 Sep 2015 20:56:58 +1000
Message-ID: <87fce38a0d513ab6ac157ce543bd1392@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

Question: 
Is it ok to use the command:

#  fsck.reiser4  --build-fs --force  /dev/sdb

I did the following steps:

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


#  fsck.reiser4  --fix --force  /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
       
Will fix minor corruptions of the Reiser4 SuperBlock.                     
                                                                          
       
Will fix minor corruptions of the Reiser4 FileSystem.                     
                                                                          
       
***** fsck.reiser4 started at Wed Sep  2 09:21:00 2015
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
        Time interval: Wed Sep  2 09:22:58 2015 - Wed Sep  2 17:07:06 2015

CHECKING EXTENT REGIONS.                                                  
                                                                          
     
        Read twigs 2217790                                                
                                                                          
     
        Time interval: Wed Sep  2 17:07:06 2015 - Wed Sep  2 19:17:21 2015

CHECKING THE SEMANTIC TREE                                                
                                                                          
     
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].                                        
       
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened. 
        Time interval: Wed Sep  2 19:17:21 2015 - Wed Sep  2 19:17:21 2015
                                                                          
     
FSCK: repair.c: 547: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.                                                  
     
***** fsck.reiser4 finished at Wed Sep  2 19:17:22 2015
Closing fs...done

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

#
Thanks Glenn



