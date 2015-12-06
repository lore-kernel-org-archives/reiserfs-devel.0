From: <doiggl@velocitynet.com.au>
Subject: Questions about # fsck.reiser4 --build-sb --build-fs /dev/sdb
Date: Sun, 06 Dec 2015 22:03:33 +1100
Message-ID: <fd8846f563ceb4a3bc8108ef3fdbdbe9@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
As identified earlier with a bug in fsck -see link below:
http://www.spinics.net/lists/reiserfs-devel/msg04596.html

Questions [for maintainers of reiser4progs]:

RE:a bug in fsck: it jumps to wrong branch

-- How can code be altered so it jumps to correct branch ?

-- Can it print out the branch name and identifiable details which is used
?

-- Can it print out the changes being made to metadata ?

--Thanks Glenn

I tried these steps as follows:
No success as yet.

# fsck.reiser4 --build-sb /dev/sdb 
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                      
Will build the Reiser4 SuperBlock.                                        
                                                                          
                      
Will check the consistency of the Reiser4 FileSystem.                     
                                                                          
                      
Continue?                                                                 
                                                                          
                      
(Yes/No): yes
***** fsck.reiser4 started at Sun Dec  6 00:59:28 2015
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
        Time interval: Sun Dec  6 01:01:24 2015 - Sun Dec  6 08:50:41 2015

CHECKING EXTENT REGIONS.                                                  
                              
        Read twigs 2217790                                                
                              
        Time interval: Sun Dec  6 08:50:41 2015 - Sun Dec  6 11:00:11 2015

CHECKING THE SEMANTIC TREE                                                
                              
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened. 
        Time interval: Sun Dec  6 11:00:11 2015 - Sun Dec  6 11:00:11 2015
                              
FSCK: repair.c: 547: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.      
***** fsck.reiser4 finished at Sun Dec  6 11:00:12 2015
Closing fs...done

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.
#

next -

--build-sb
fixes all severe corruptions in super blocks, rebuilds super blocks from
scratch if needed.

--build-fs
fixes all severe fs corruptions, except super block ones; rebuilds reiser4
filesystem from the scratch if needed.

# fsck.reiser4 --build-sb --build-fs /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                              
Will build the Reiser4 SuperBlock.                                        
                              
Will build the Reiser4 FileSystem.                                        
                              
Continue?                                                                 
                              
(Yes/No): yes
***** fsck.reiser4 started at Sun Dec  6 11:39:59 2015
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
        Time interval: Sun Dec  6 11:41:55 2015 - Sun Dec  6 19:27:24 2015

CHECKING EXTENT REGIONS.                                                  
                              
        Read twigs 2217790                                                
                              
        Time interval: Sun Dec  6 19:27:24 2015 - Sun Dec  6 21:37:06 2015

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
        Time interval: Sun Dec  6 21:37:21 2015 - Sun Dec  6 21:40:59 2015

***** fsck.reiser4 finished at Sun Dec  6 21:40:59 2015
Closing fs...done

FS is consistent.

###
reiser4progs - Utilities for Managing the Reiser4 File System

/usr/sbin/debugfs.reiser4
/usr/sbin/fsck.reiser4
/usr/sbin/make_reiser4
/usr/sbin/measurefs.reiser4
/usr/sbin/mkfs.reiser4
/usr/share/doc/packages/reiser4progs
/usr/share/doc/packages/reiser4progs/BUGS
/usr/share/doc/packages/reiser4progs/COPYING
/usr/share/doc/packages/reiser4progs/ChangeLog
/usr/share/doc/packages/reiser4progs/NEWS
/usr/share/doc/packages/reiser4progs/README
/usr/share/doc/packages/reiser4progs/TODO
/usr/share/man/man8/debugfs.reiser4.8.gz
/usr/share/man/man8/fsck.reiser4.8.gz
/usr/share/man/man8/measurefs.reiser4.8.gz
/usr/share/man/man8/mkfs.reiser4.8.gz

16 files total


# dmesg
.
.
[  125.912719] usb 1-1: new high-speed USB device number 3 using ehci-pci
[  126.048879] usb 1-1: New USB device found, idVendor=04fc,
idProduct=0c25
[  126.048889] usb 1-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[  126.048893] usb 1-1: Product: USB to Serial-ATA bridge
[  126.048897] usb 1-1: Manufacturer: Sunplus Technology Inc.
[  126.048901] usb 1-1: SerialNumber: ST32000542            5XW1ZMG4
[  126.079709] usb-storage 1-1:1.0: USB Mass Storage device detected
[  126.080036] scsi host4: usb-storage 1-1:1.0
[  126.080184] usbcore: registered new interface driver usb-storage
[  127.083702] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[  127.084400] sd 4:0:0:0: Attached scsi generic sg2 type 0
[  127.086622] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[  127.089807] sd 4:0:0:0: [sdb] Write Protect is off
[  127.089819] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[  127.092431] sd 4:0:0:0: [sdb] No Caching mode page found
[  127.092440] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[  136.630647] sd 4:0:0:0: [sdb] Attached SCSI disk


# cat /proc/partitions
major minor  #blocks  name
   8       16 1953514584 sdb

# ll /media/disk
total 0   

# mount -v /dev/sdb /media/disk
mount: mount(2) failed: No such file or directory

# dmesg
.
[ 1124.675312] reiser4[mount(1761)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[ 1124.675331] reiser4[mount(1761)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)
# 

#http://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs/reiser4progs-1.1.0.tar.gz

/tmp/reiser4progs-1.1.0 # find . |sort
.
./AUTHORS
./BUGS
./COPYING
./CREDITS
./CUSTOM_INSTALL_README
./ChangeLog
./INSTALL
./INSTALL_README
./Makefile.am
./Makefile.in
./NEWS
./README
./THANKS
./TODO
./aclocal.m4
./compile
./config.guess
./config.h.in
./config.sub
./configure
./configure.in
./demos
./demos/Makefile.am
./demos/Makefile.in
./demos/busy.c
./demos/busy.h
./demos/cp.c
./demos/create.c
./demos/detect
./demos/ln.c
./demos/ls.c
./demos/misc.c
./demos/rm.c
./demos/stat.c
./demos/trunc.c
./depcomp
./doc
./doc/Makefile.am
./doc/Makefile.in
./doc/debugfs.reiser4.8
./doc/fsck.reiser4.8
./doc/measurefs.reiser4.8
./doc/mkfs.reiser4.8
./include
./include/Makefile.am
./include/Makefile.in
./include/aux
./include/aux/Makefile.am
./include/aux/Makefile.in
./include/aux/aux.h
./include/aux/crc32c.h
./include/aux/gauge.h
./include/misc
./include/misc/Makefile.am
./include/misc/Makefile.in
./include/misc/exception.h
./include/misc/gauge.h
./include/misc/misc.h
./include/misc/mpressure.h
./include/misc/profile.h
./include/misc/ui.h
./include/misc/version.h
./include/reiser4
./include/reiser4/Makefile.am
./include/reiser4/Makefile.in
./include/reiser4/alloc.h
./include/reiser4/backup.h
./include/reiser4/bitmap.h
./include/reiser4/factory.h
./include/reiser4/fake.h
./include/reiser4/filesystem.h
./include/reiser4/flow.h
./include/reiser4/format.h
./include/reiser4/item.h
./include/reiser4/journal.h
./include/reiser4/key.h
./include/reiser4/libreiser4.h
./include/reiser4/master.h
./include/reiser4/node.h
./include/reiser4/object.h
./include/reiser4/oid.h
./include/reiser4/place.h
./include/reiser4/plugin.h
./include/reiser4/print.h
./include/reiser4/profile.h
./include/reiser4/pset.h
./include/reiser4/semantic.h
./include/reiser4/status.h
./include/reiser4/tree.h
./include/reiser4/types.h
./include/repair
./include/repair/Makefile.am
./include/repair/Makefile.in
./include/repair/add_missing.h
./include/repair/alloc.h
./include/repair/backup.h
./include/repair/cleanup.h
./include/repair/disk_scan.h
./include/repair/filesystem.h
./include/repair/filter.h
./include/repair/format.h
./include/repair/item.h
./include/repair/journal.h
./include/repair/librepair.h
./include/repair/lost_found.h
./include/repair/master.h
./include/repair/node.h
./include/repair/object.h
./include/repair/oid.h
./include/repair/place.h
./include/repair/plugin.h
./include/repair/pset.h
./include/repair/repair.h
./include/repair/semantic.h
./include/repair/status.h
./include/repair/tree.h
./include/repair/twig_scan.h
./install-sh
./libaux
./libaux/Makefile.am
./libaux/Makefile.in
./libaux/aux.c
./libaux/crc32c.c
./libaux/gauge.c
./libmisc
./libmisc/Makefile.am
./libmisc/Makefile.in
./libmisc/exception.c
./libmisc/gauge.c
./libmisc/misc.c
./libmisc/mpressure.c
./libmisc/profile.c
./libmisc/ui.c
./libreiser4
./libreiser4.m4
./libreiser4/Makefile.am
./libreiser4/Makefile.in
./libreiser4/alloc.c
./libreiser4/backup.c
./libreiser4/bitmap.c
./libreiser4/factory.c
./libreiser4/fake.c
./libreiser4/filesystem.c
./libreiser4/flow.c
./libreiser4/format.c
./libreiser4/item.c
./libreiser4/journal.c
./libreiser4/key.c
./libreiser4/libreiser4.c
./libreiser4/master.c
./libreiser4/node.c
./libreiser4/object.c
./libreiser4/oid.c
./libreiser4/place.c
./libreiser4/print.c
./libreiser4/profile.c
./libreiser4/pset.c
./libreiser4/semantic.c
./libreiser4/status.c
./libreiser4/tree.c
./librepair
./librepair/Makefile.am
./librepair/Makefile.in
./librepair/add_missing.c
./librepair/alloc.c
./librepair/backup.c
./librepair/cleanup.c
./librepair/disk_scan.c
./librepair/filesystem.c
./librepair/filter.c
./librepair/format.c
./librepair/item.c
./librepair/journal.c
./librepair/master.c
./librepair/node.c
./librepair/object.c
./librepair/oid.c
./librepair/pset.c
./librepair/repair.c
./librepair/semantic.c
./librepair/status.c
./librepair/tree.c
./librepair/twig_scan.c
./ltmain.sh
./missing
./one_touch_install
./plugin
./plugin/Makefile.am
./plugin/Makefile.in
./plugin/alloc
./plugin/alloc/Makefile.am
./plugin/alloc/Makefile.in
./plugin/alloc/alloc40
./plugin/alloc/alloc40/Makefile.am
./plugin/alloc/alloc40/Makefile.in
./plugin/alloc/alloc40/alloc40.c
./plugin/alloc/alloc40/alloc40.h
./plugin/alloc/alloc40/alloc40_repair.c
./plugin/alloc/alloc40/alloc40_repair.h
./plugin/compress
./plugin/compress/Makefile.am
./plugin/compress/Makefile.in
./plugin/compress/cluster.c
./plugin/compress/compress.c
./plugin/compress/compress_mode.c
./plugin/fibre
./plugin/fibre/Makefile.am
./plugin/fibre/Makefile.in
./plugin/fibre/dot_o_fibre
./plugin/fibre/dot_o_fibre/Makefile.am
./plugin/fibre/dot_o_fibre/Makefile.in
./plugin/fibre/dot_o_fibre/dot_o_fibre.c
./plugin/fibre/ext_1_fibre
./plugin/fibre/ext_1_fibre/Makefile.am
./plugin/fibre/ext_1_fibre/Makefile.in
./plugin/fibre/ext_1_fibre/ext_1_fibre.c
./plugin/fibre/ext_3_fibre
./plugin/fibre/ext_3_fibre/Makefile.am
./plugin/fibre/ext_3_fibre/Makefile.in
./plugin/fibre/ext_3_fibre/ext_3_fibre.c
./plugin/fibre/lexic_fibre
./plugin/fibre/lexic_fibre/Makefile.am
./plugin/fibre/lexic_fibre/Makefile.in
./plugin/fibre/lexic_fibre/lexic_fibre.c
./plugin/format
./plugin/format/Makefile.am
./plugin/format/Makefile.in
./plugin/format/format40
./plugin/format/format40/Makefile.am
./plugin/format/format40/Makefile.in
./plugin/format/format40/format40.c
./plugin/format/format40/format40.h
./plugin/format/format40/format40_repair.c
./plugin/format/format40/format40_repair.h
./plugin/hash
./plugin/hash/Makefile.am
./plugin/hash/Makefile.in
./plugin/hash/deg_hash
./plugin/hash/deg_hash/Makefile.am
./plugin/hash/deg_hash/Makefile.in
./plugin/hash/deg_hash/deg_hash.c
./plugin/hash/fnv1_hash
./plugin/hash/fnv1_hash/Makefile.am
./plugin/hash/fnv1_hash/Makefile.in
./plugin/hash/fnv1_hash/fnv1_hash.c
./plugin/hash/r5_hash
./plugin/hash/r5_hash/Makefile.am
./plugin/hash/r5_hash/Makefile.in
./plugin/hash/r5_hash/r5_hash.c
./plugin/hash/rupasov_hash
./plugin/hash/rupasov_hash/Makefile.am
./plugin/hash/rupasov_hash/Makefile.in
./plugin/hash/rupasov_hash/rupasov_hash.c
./plugin/hash/tea_hash
./plugin/hash/tea_hash/Makefile.am
./plugin/hash/tea_hash/Makefile.in
./plugin/hash/tea_hash/tea_hash.c
./plugin/item
./plugin/item/Makefile.am
./plugin/item/Makefile.in
./plugin/item/bbox40
./plugin/item/bbox40/Makefile.am
./plugin/item/bbox40/Makefile.in
./plugin/item/bbox40/bbox40.c
./plugin/item/bbox40/bbox40_repair.c
./plugin/item/bbox40/bbox40_repair.h
./plugin/item/body40
./plugin/item/body40/Makefile.am
./plugin/item/body40/Makefile.in
./plugin/item/body40/body40.c
./plugin/item/body40/body40.h
./plugin/item/cde40
./plugin/item/cde40/Makefile.am
./plugin/item/cde40/Makefile.in
./plugin/item/cde40/cde40.c
./plugin/item/cde40/cde40.h
./plugin/item/cde40/cde40_repair.c
./plugin/item/cde40/cde40_repair.h
./plugin/item/ctail40
./plugin/item/ctail40/Makefile.am
./plugin/item/ctail40/Makefile.in
./plugin/item/ctail40/ctail40.c
./plugin/item/ctail40/ctail40.h
./plugin/item/ctail40/ctail40_repair.c
./plugin/item/ctail40/ctail40_repair.h
./plugin/item/extent40
./plugin/item/extent40/Makefile.am
./plugin/item/extent40/Makefile.in
./plugin/item/extent40/extent40.c
./plugin/item/extent40/extent40.h
./plugin/item/extent40/extent40_repair.c
./plugin/item/extent40/extent40_repair.h
./plugin/item/nodeptr40
./plugin/item/nodeptr40/Makefile.am
./plugin/item/nodeptr40/Makefile.in
./plugin/item/nodeptr40/nodeptr40.c
./plugin/item/nodeptr40/nodeptr40.h
./plugin/item/nodeptr40/nodeptr40_repair.c
./plugin/item/nodeptr40/nodeptr40_repair.h
./plugin/item/plain40
./plugin/item/plain40/Makefile.am
./plugin/item/plain40/Makefile.in
./plugin/item/plain40/plain40.c
./plugin/item/plain40/plain40.h
./plugin/item/plain40/plain40_repair.c
./plugin/item/plain40/plain40_repair.h
./plugin/item/stat40
./plugin/item/stat40/Makefile.am
./plugin/item/stat40/Makefile.in
./plugin/item/stat40/stat40.c
./plugin/item/stat40/stat40.h
./plugin/item/stat40/stat40_repair.c
./plugin/item/stat40/stat40_repair.h
./plugin/item/tail40
./plugin/item/tail40/Makefile.am
./plugin/item/tail40/Makefile.in
./plugin/item/tail40/tail40.c
./plugin/item/tail40/tail40.h
./plugin/item/tail40/tail40_repair.c
./plugin/item/tail40/tail40_repair.h
./plugin/journal
./plugin/journal/Makefile.am
./plugin/journal/Makefile.in
./plugin/journal/journal40
./plugin/journal/journal40/Makefile.am
./plugin/journal/journal40/Makefile.in
./plugin/journal/journal40/journal40.c
./plugin/journal/journal40/journal40.h
./plugin/journal/journal40/journal40_repair.c
./plugin/journal/journal40/journal40_repair.h
./plugin/key
./plugin/key/Makefile.am
./plugin/key/Makefile.in
./plugin/key/key_common
./plugin/key/key_common/Makefile.am
./plugin/key/key_common/Makefile.in
./plugin/key/key_common/key_common.c
./plugin/key/key_common/key_common.h
./plugin/key/key_large
./plugin/key/key_large/Makefile.am
./plugin/key/key_large/Makefile.in
./plugin/key/key_large/key_large.c
./plugin/key/key_large/key_large.h
./plugin/key/key_large/key_large_repair.c
./plugin/key/key_short
./plugin/key/key_short/Makefile.am
./plugin/key/key_short/Makefile.in
./plugin/key/key_short/key_short.c
./plugin/key/key_short/key_short.h
./plugin/key/key_short/key_short_repair.c
./plugin/node
./plugin/node/Makefile.am
./plugin/node/Makefile.in
./plugin/node/node40
./plugin/node/node40/Makefile.am
./plugin/node/node40/Makefile.in
./plugin/node/node40/node40.c
./plugin/node/node40/node40.h
./plugin/node/node40/node40_repair.c
./plugin/node/node40/node40_repair.h
./plugin/node/node41
./plugin/node/node41/Makefile.am
./plugin/node/node41/Makefile.in
./plugin/node/node41/node41.c
./plugin/node/node41/node41.h
./plugin/node/node41/node41_repair.c
./plugin/node/node41/node41_repair.h
./plugin/object
./plugin/object/Makefile.am
./plugin/object/Makefile.in
./plugin/object/ccreg40
./plugin/object/ccreg40/Makefile.am
./plugin/object/ccreg40/Makefile.in
./plugin/object/ccreg40/ccreg40.c
./plugin/object/ccreg40/ccreg40.h
./plugin/object/ccreg40/ccreg40_repair.c
./plugin/object/dir40
./plugin/object/dir40/Makefile.am
./plugin/object/dir40/Makefile.in
./plugin/object/dir40/dir40.c
./plugin/object/dir40/dir40.h
./plugin/object/dir40/dir40_repair.c
./plugin/object/dir40/dir40_repair.h
./plugin/object/obj40
./plugin/object/obj40/Makefile.am
./plugin/object/obj40/Makefile.in
./plugin/object/obj40/obj40.c
./plugin/object/obj40/obj40.h
./plugin/object/obj40/obj40_repair.c
./plugin/object/obj40/obj40_repair.h
./plugin/object/reg40
./plugin/object/reg40/Makefile.am
./plugin/object/reg40/Makefile.in
./plugin/object/reg40/reg40.c
./plugin/object/reg40/reg40_repair.c
./plugin/object/reg40/reg40_repair.h
./plugin/object/spl40
./plugin/object/spl40/Makefile.am
./plugin/object/spl40/Makefile.in
./plugin/object/spl40/spl40.c
./plugin/object/spl40/spl40.h
./plugin/object/spl40/spl40_repair.c
./plugin/object/spl40/spl40_repair.h
./plugin/object/sym40
./plugin/object/sym40/Makefile.am
./plugin/object/sym40/Makefile.in
./plugin/object/sym40/sym40.c
./plugin/object/sym40/sym40_repair.c
./plugin/object/sym40/sym40_repair.h
./plugin/oid
./plugin/oid/Makefile.am
./plugin/oid/Makefile.in
./plugin/oid/oid40
./plugin/oid/oid40/Makefile.am
./plugin/oid/oid40/Makefile.in
./plugin/oid/oid40/oid40.c
./plugin/oid/oid40/oid40.h
./plugin/oid/oid40/oid40_repair.c
./plugin/oid/oid40/oid40_repair.h
./plugin/policy
./plugin/policy/Makefile.am
./plugin/policy/Makefile.in
./plugin/policy/extents
./plugin/policy/extents/Makefile.am
./plugin/policy/extents/Makefile.in
./plugin/policy/extents/extents.c
./plugin/policy/smart
./plugin/policy/smart/Makefile.am
./plugin/policy/smart/Makefile.in
./plugin/policy/smart/smart.c
./plugin/policy/tails
./plugin/policy/tails/Makefile.am
./plugin/policy/tails/Makefile.in
./plugin/policy/tails/tails.c
./plugin/sdext
./plugin/sdext/Makefile.am
./plugin/sdext/Makefile.in
./plugin/sdext/sdext_crypto
./plugin/sdext/sdext_crypto/Makefile.am
./plugin/sdext/sdext_crypto/Makefile.in
./plugin/sdext/sdext_crypto/sdext_crypto.c
./plugin/sdext/sdext_crypto/sdext_crypto.h
./plugin/sdext/sdext_crypto/sdext_crypto_repair.c
./plugin/sdext/sdext_flags
./plugin/sdext/sdext_flags/Makefile.am
./plugin/sdext/sdext_flags/Makefile.in
./plugin/sdext/sdext_flags/sdext_flags.c
./plugin/sdext/sdext_flags/sdext_flags.h
./plugin/sdext/sdext_flags/sdext_flags_repair.c
./plugin/sdext/sdext_lt
./plugin/sdext/sdext_lt/Makefile.am
./plugin/sdext/sdext_lt/Makefile.in
./plugin/sdext/sdext_lt/sdext_lt.c
./plugin/sdext/sdext_lt/sdext_lt.h
./plugin/sdext/sdext_lt/sdext_lt_repair.c
./plugin/sdext/sdext_lw
./plugin/sdext/sdext_lw/Makefile.am
./plugin/sdext/sdext_lw/Makefile.in
./plugin/sdext/sdext_lw/sdext_lw.c
./plugin/sdext/sdext_lw/sdext_lw.h
./plugin/sdext/sdext_lw/sdext_lw_repair.c
./plugin/sdext/sdext_plug
./plugin/sdext/sdext_plug/Makefile.am
./plugin/sdext/sdext_plug/Makefile.in
./plugin/sdext/sdext_plug/sdext_plug.c
./plugin/sdext/sdext_plug/sdext_plug.h
./plugin/sdext/sdext_plug/sdext_plug_repair.c
./plugin/sdext/sdext_symlink
./plugin/sdext/sdext_symlink/Makefile.am
./plugin/sdext/sdext_symlink/Makefile.in
./plugin/sdext/sdext_symlink/sdext_symlink.c
./plugin/sdext/sdext_symlink/sdext_symlink_repair.c
./plugin/sdext/sdext_unix
./plugin/sdext/sdext_unix/Makefile.am
./plugin/sdext/sdext_unix/Makefile.in
./plugin/sdext/sdext_unix/sdext_unix.c
./plugin/sdext/sdext_unix/sdext_unix.h
./plugin/sdext/sdext_unix/sdext_unix_repair.c
./progs
./progs/Makefile.am
./progs/Makefile.in
./progs/debugfs
./progs/debugfs/Makefile.am
./progs/debugfs/Makefile.in
./progs/debugfs/browse.c
./progs/debugfs/browse.h
./progs/debugfs/debugfs.c
./progs/debugfs/debugfs.h
./progs/debugfs/print.c
./progs/debugfs/print.h
./progs/debugfs/types.h
./progs/fsck
./progs/fsck/Makefile.am
./progs/fsck/Makefile.in
./progs/fsck/backup.c
./progs/fsck/backup.h
./progs/fsck/fsck.c
./progs/fsck/fsck.h
./progs/measurefs
./progs/measurefs/Makefile.am
./progs/measurefs/Makefile.in
./progs/measurefs/measurefs.c
./progs/mkfs
./progs/mkfs/Makefile.am
./progs/mkfs/Makefile.in
./progs/mkfs/mkfs.c
./reiser4progs.spec
./reiser4progs.spec.in
./run-ldconfig

#  rpm -qa  |grep -i reiser4progs |sort
reiser4progs-1.1.0-1.1.x86_64


