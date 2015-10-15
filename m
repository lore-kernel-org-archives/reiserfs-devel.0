From: <doiggl@velocitynet.com.au>
Subject: segfault at 0 ip 00007efe91c79e09 sp 00007ffd4a43f430 error 4 in libreiser4-1.1.so from  '# fsck.reiser4 --fix /dev/sdb'
Date: Thu, 15 Oct 2015 19:43:06 +1100
Message-ID: <9ebf7916da11fc84af7b109184e19598@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

How is segfault fixed ?
using opensuse 64 bit x86_64
Thanks
--Glenn

# dmesg
[36217.056514] fsck.reiser4[1994]: segfault at 0 ip 00007efe91c79e09 sp
00007ffd4a43f430 error 4 in libreiser4-1.1.so.0.0.0[7efe91c5c000+4c000]

# rpm -qf /usr/lib64/libreiser4-1.1.so.0.0.0
libreiser4-1_1-0-1.1.0-14.1.x86_64

# rpm -qf /usr/lib64/libreiser4-1.1.so.0
libreiser4-1_1-0-1.1.0-14.1.x86_64

# fsck.reiser4 --fix /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                   
Will fix minor corruptions of the Reiser4 SuperBlock.                     
                                                   
Will fix minor corruptions of the Reiser4 FileSystem.                     
                                                   
Continue?                                                                 
                                                   
(Yes/No): yes
***** fsck.reiser4 started at Thu Oct 15 08:39:00 2015
FSCK: backup.c: 505: repair_backup_open: Found backup does not match to
the on-disk filesystem metadata.                       
Backup update is needed. Done.                                            
                                                   
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
version:        1 
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
        Time interval: Thu Oct 15 08:40:55 2015 - Thu Oct 15 16:24:00 2015

CHECKING EXTENT REGIONS.                                                  
                                                              
        Read twigs 2217790                                                
                                                              
        Time interval: Thu Oct 15 16:24:00 2015 - Thu Oct 15 18:33:46 2015

CHECKING THE SEMANTIC TREE                                                
                                                              
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].                              
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened. 
        Time interval: Thu Oct 15 18:33:47 2015 - Thu Oct 15 18:33:47 2015
                                                              
FSCK: repair.c: 547: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.                                      
Segmentation fault

# dmesg
[36217.056514] fsck.reiser4[1994]: segfault at 0 ip 00007efe91c79e09 sp
00007ffd4a43f430 error 4 in libreiser4-1.1.so.0.0.0[7efe91c5c000+4c000]

# dmesg
[38198.804395] usb 1-2: USB disconnect, device number 3
[38236.083430] usb 1-2: new high-speed USB device number 4 using ehci-pci
[38236.219675] usb 1-2: New USB device found, idVendor=04fc,
idProduct=0c25
[38236.219687] usb 1-2: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[38236.219694] usb 1-2: Product: USB to Serial-ATA bridge
[38236.219700] usb 1-2: Manufacturer: Sunplus Technology Inc.
[38236.219705] usb 1-2: SerialNumber: ST32000542            5XW1ZMG4
[38236.222656] usb-storage 1-2:1.0: USB Mass Storage device detected
[38236.223163] scsi host5: usb-storage 1-2:1.0
[38237.229192] scsi 5:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[38237.229780] sd 5:0:0:0: Attached scsi generic sg2 type 0
[38237.231338] sd 5:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[38237.234898] sd 5:0:0:0: [sdb] Write Protect is off
[38237.234909] sd 5:0:0:0: [sdb] Mode Sense: 38 00 00 00
[38237.237568] sd 5:0:0:0: [sdb] No Caching mode page found
[38237.237578] sd 5:0:0:0: [sdb] Assuming drive cache: write through
[38237.278121] sd 5:0:0:0: [sdb] Attached SCSI disk
[38281.822957] Loading Reiser4 (format release: 4.0.1) See www.namesys.com
for a description of Reiser4.
[38281.828160] reiser4[mount(17356)]: try_init_format40
(../fs/reiser4/plugin/disk_format/disk_format40.c:300)[vpf-1363]:
NOTICE: Warning: mounting sdb with errors.
[38281.828173] reiser4: sdb: found disk format 4.0.1.
[38281.828284] reiser4: sdb: use 'fsck.reiser4 --fix' to complete disk
format upgrade.
[38391.735448] reiser4[mount(17356)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[38391.735466] reiser4[mount(17356)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)

# cat /proc/partitions
major minor  #blocks  name
   8       16   1,953,514,584 sdb
