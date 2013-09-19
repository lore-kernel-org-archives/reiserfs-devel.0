From: <doiggl@velocitynet.com.au>
Subject: Re: Is this disk ok to use?  completed  fsck.reiser4 --build-fs  /dev/sdb
Date: Thu, 19 Sep 2013 21:24:44 +1000
Message-ID: <33a3fa0afed6cdb67904345bc36ce407@mail.velocitynet.com.au>
References: <8c94fce2adeb7d8a09bce676c15748e1@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <8c94fce2adeb7d8a09bce676c15748e1@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Thu, 19 Sep 2013 21:13:56 +1000, <doiggl@velocitynet.com.au> wrote:
> Hello,
> Is this disk ok to use?
> see fsck.reiser4 report.
> # fdisk -l
> 
> Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> 
disk details when powered on

[10151.467937] usb 1-1: new high-speed USB device number 3 using ehci-pci
[10151.586596] usb 1-1: New USB device found, idVendor=04fc,
idProduct=0c25
[10151.586608] usb 1-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[10151.586615] usb 1-1: Product: USB to Serial-ATA bridge
[10151.586621] usb 1-1: Manufacturer: Sunplus Technology Inc.
[10151.586626] usb 1-1: SerialNumber: ST32000542            5XW1ZMG4
[10151.609412] usb-storage 1-1:1.0: USB Mass Storage device detected
[10151.610485] scsi4 : usb-storage 1-1:1.0
[10151.610711] usbcore: registered new interface driver usb-storage
[10152.617336] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[10152.618340] sd 4:0:0:0: Attached scsi generic sg2 type 0
[10152.620187] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[10152.622888] sd 4:0:0:0: [sdb] Write Protect is off
[10152.622901] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[10152.625534] sd 4:0:0:0: [sdb] No Caching mode page present
[10152.625546] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[10152.633072] sd 4:0:0:0: [sdb] No Caching mode page present
[10152.633084] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[10152.656594]  sdb: unknown partition table
[10152.671233] sd 4:0:0:0: [sdb] No Caching mode page present
[10152.671246] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[10152.671255] sd 4:0:0:0: [sdb] Attached SCSI disk

> Thanks Glenn
> 
> 
> # fsck.reiser4 --build-fs  /dev/sdb
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the /dev/sdb block device.                                      

>                                                                         

>                                                                         

> Will check the consistency of the Reiser4 SuperBlock.                   

>                                                                         

>                                                                         

> Will build the Reiser4 FileSystem.                                      

>                                                                         

>                                                                         

> Continue?                                                               

>                                                                         

>                                                                         

> (Yes/No): yes
> ***** fsck.reiser4 started at Fri Sep 20 15:50:44 2013
> Reiser4 fs was detected on /dev/sdb.                                    

>                                                                         

>                                                                         

> Master super block (16): 
> magic:          ReIsEr4 
> blksize:        4096 
> format:         0x0 (format40) 
> uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede 
> label:          <none> 
>  
> Format super block (17): 
> plugin:         format40 
> description:    Disk-format plugin. 
> version:        0 
> magic:          ReIsEr40FoRmAt 
> mkfs id:        0x1ddaf754 
> flushes:        0 
> blocks:         488378640 
> free blocks:    217146980 
> root block:     37017218 
> tail policy:    0x2 (smart) 
> next oid:       0xedade 
> file count:     188313 
> tree height:    6 
> key policy:     LARGE 
>  
>  
> CHECKING THE STORAGE TREE                                               

>                                                                         

>                                                                         

>         Read nodes 197008413                                            

>                                                                         

>                                                                         

>         Nodes left in the tree 197008413 
>                 Leaves of them 194764277, Twigs of them 2217790 
>         Time interval: Fri Sep 20 15:52:42 2013 - Fri Sep 20 23:24:50
2013
> 
> CHECKING EXTENT REGIONS.                                                

>                                                                         

>                                                                         

>         Read twigs 2217790                                              

>                                                                         

>                                                                         

>         Time interval: Fri Sep 20 23:24:50 2013 - Sat Sep 21 01:34:27
2013
> 
> LOOKING FOR UNCONNECTED NODES                                           

>                                                                         

>                                                                         

> FSCK: node.c: 108: repair_node_items_check: Node (43828275), items (0)
and
> (1): Wrong order of keys.                                               
 
>                                                                         

> FSCK: node.c: 108: repair_node_items_check: Node (52697435), items (79)
> and (80): Wrong order of keys.                                          
 
>                                                                         

>  
> FSCK: node.c: 108: repair_node_items_check: Node (63227569), items (24)
> and (25): Wrong order of keys.                                          
 
>                                                                         

>  
> FSCK: node.c: 108: repair_node_items_check: Node (63227571), items (73)
> and (74): Wrong order of keys.                                          
 
>                                                                         

>  
> FSCK: node.c: 108: repair_node_items_check: Node (116595727), items (20)
> and (21): Wrong order of keys.                                          
 
>                                                                         

> 
> FSCK: node.c: 108: repair_node_items_check: Node (227923161), items (22)
> and (23): Wrong order of keys.                                          
 
>                                                                         

> 
> FSCK: node.c: 108: repair_node_items_check: Node (284305753), items (61)
> and (62): Wrong order of keys.                                          
 
>                                                                         

> 
>         Read nodes 1481038                                              

>                                                                         

>                                                                         

>         Good nodes 471512 
>                 Leaves of them 466164, Twigs of them 5348 
>         Time interval: Sat Sep 21 01:34:44 2013 - Sat Sep 21 01:38:17
2013
> 
> ***** fsck.reiser4 finished at Sat Sep 21 01:38:17 2013
> Closing fs...done
> 
> FS is consistent.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
reiserfs-devel"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
