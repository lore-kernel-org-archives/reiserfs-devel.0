From: <doiggl@velocitynet.com.au>
Subject: Re: reiser4 kernel compilation problem.
Date: Wed, 27 Nov 2013 01:58:06 +1100
Message-ID: <0d261550194f47e24b19754de30e8949@mail.velocitynet.com.au>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au> <20131123161309.1b321a45@Ulf.tvoe.tv> <3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au> <20131125135635.36d29c28@Ulf.tvoe.tv> <529334E8.40704@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <529334E8.40704@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru

On Mon, 25 Nov 2013 12:30:48 +0100, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 11/25/2013 10:56 AM, dimas wrote:
>>> Hello,
>>> Here are the details:
>>>
>>> # insmod
>>> Usage: insmod filename [args]
>> no-no-no, insmod is used to load module. you must give it a module name
>> to load.
>> also there is lsmod, which shows currently loaded modules. read man
>> insmod, man
>> lsmod for details.
>> so, aftre your mount attempt (not before it, because modules usually
>> load only
>> when requested) check if reiser4 module did loaded:
>> lsmod | grep "reiser4"
>> if it occasionaly shows nothing, try loading it manually, using "insmod
>> reiser4" or better
>> modprobe -v reiser4
>> if this will fail too, there should be a problem with the module
itself.
>> i'm using no modules, building only what i need, and building it static
>> (=Y).
>> static built reiser4 works perfectly wirh 3.11 for me, so i don't know,
>> what's
>> that. check dmesg after attempt to load, maybe there is something.
>>
>>> # ll /proc/filesystems
>>> -r--r--r-- 1 root root 0 Nov 25 12:18 /proc/filesystems
>> try "cat /proc/filesystems")) it shows list of fs types, which kernel
>> currently
>> support
>>
>>> Back to the Question:
>>> What reiser4 kernel build paramerers I need in the kernel build so I
can
>>> use this partition ?
>>> I have set:
>>> CONFIG_REISER4_DEBUG=n
>>> CONFIG_REISER4_FS=m
>> if you are not using cryptocompress plugin (your fsck lock says, you
are
>> not).
>> i believe, this is enough.
> 
> 
> Fsck doesn't report if compression has been enabled.
> debugfs.reiser4 should be patched to show value of "create" (reg40 or 
> ccreg40),
> "compress" (lzo1, or gzip1), etc.
> 
> Edward.
> --
> To unsubscribe from this list: send the line "unsubscribe
reiserfs-devel"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hello,
I  tried the following 7 steps.
dmesg log shows  key_warning [see below]
What do I do mext ?
Thanks Glenn

1.
# cat /proc/filesystems |sort                                             
                                    
        btrfs                                                             
                                           
        ext2                                                              
                                           
        ext3                                                              
                                           
        ext4                                                              
                                           
        fuseblk                                                           
                                           
        iso9660                                                           
                                           
        reiserfs                                                          
                                           
nodev   anon_inodefs                                                      
                                           
nodev   autofs                                                            
                                           
nodev   bdev                                                              
                                           
nodev   cgroup                                                            
                                           
nodev   cpuset                                                            
                                           
nodev   debugfs                                                           
                                           
nodev   devpts                                                            
                                           
nodev   devtmpfs                                                          
                                           
nodev   fuse                                                              
                                           
nodev   fusectl                                                           
                                           
nodev   hugetlbfs                                                         
                                           
nodev   mqueue                                                            
                                           
nodev   pipefs                                                            
                                           
nodev   proc                                                              
                                           
nodev   pstore                                                            
                                           
nodev   ramfs                                                             
                                           
nodev   rootfs                                                            
                                           
nodev   securityfs                                                        
                                           
nodev   sockfs                                                            
                                           
nodev   sysfs                                                             
                                           
nodev   tmpfs 

2.
# mount /dev/sdb  /media/disk                                             
                                    
mount: unknown filesystem type 'reiser4

3.
# insmod reiser4                                                          
                                    
insmod: can't read 'reiser4': No such file or directory

4.
# modprobe -v reiser4                                                     
                                   
insmod /lib/modules/3.11.9-2.ga012288-vanilla/kernel/fs/reiser4/reiser4.ko

5. I see reiser4 in /proc/filesystems [below]
# cat /proc/filesystems |sort                                             
                                    
        btrfs                                                             
                                           
        ext2                                                              
                                           
        ext3                                                              
                                           
        ext4                                                              
                                           
        fuseblk
        iso9660
        reiser4
        reiserfs
nodev   anon_inodefs
nodev   autofs
nodev   bdev
nodev   cgroup
nodev   cpuset
nodev   debugfs
nodev   devpts
nodev   devtmpfs
nodev   fuse
nodev   fusectl
nodev   hugetlbfs
nodev   mqueue
nodev   pipefs
nodev   proc
nodev   pstore
nodev   ramfs
nodev   rootfs
nodev   securityfs
nodev   sockfs
nodev   sysfs
nodev   tmpfs

6. Retried step
# mount /dev/sdb  /media/disk
mount: mount(2) failed: No such file or directory

7. dmesg log shows:
[ 1057.245719] usb 1-1: new high-speed USB device number 3 using ehci-pci
[ 1057.382157] usb 1-1: New USB device found, idVendor=04fc,
idProduct=0c25
[ 1057.382171] usb 1-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[ 1057.382178] usb 1-1: Product: USB to Serial-ATA bridge
[ 1057.382184] usb 1-1: Manufacturer: Sunplus Technology Inc.
[ 1057.382189] usb 1-1: SerialNumber: ST32000542            5XW1ZMG4
[ 1057.402783] usb-storage 1-1:1.0: USB Mass Storage device detected
[ 1057.403048] scsi4 : usb-storage 1-1:1.0
[ 1057.403281] usbcore: registered new interface driver usb-storage
[ 1058.406928] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[ 1058.407468] sd 4:0:0:0: Attached scsi generic sg2 type 0
[ 1058.413888] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[ 1058.416565] sd 4:0:0:0: [sdb] Write Protect is off
[ 1058.416578] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[ 1058.419294] sd 4:0:0:0: [sdb] No Caching mode page found
[ 1058.419306] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 1058.426820] sd 4:0:0:0: [sdb] No Caching mode page found
[ 1058.426834] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 1058.448674]  sdb: unknown partition table
[ 1058.460729] sd 4:0:0:0: [sdb] No Caching mode page found
[ 1058.460743] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 1058.460751] sd 4:0:0:0: [sdb] Attached SCSI disk
[ 1059.926891] SFW2-INext-DROP-DEFLT IN=enp3s0f5 OUT= MAC=
SRC=fe80:0000:0000:0000:22cf:30ff:fe28:fda2
DST=ff02:0000:0000:0000:0000:0000:0000:00fb LEN=84 TC=0 HOPLIMIT=255
FLOWLBL=0 PROTO=UDP SPT=5353 DPT=5353 LEN=44 
[ 1355.630505] Loading Reiser4. See www.namesys.com for a description of
Reiser4.
[ 1556.544870] CE: hpet increased min_delta_ns to 20115 nsec
[ 1605.505484] reiser4: sdb: found disk format 4.0.0.
[ 1716.171644] reiser4[mount(1879)]: traverse_tree
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.11.9/linux-3.11/fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[ 1716.171662] reiser4[mount(1879)]: key_warning
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.11.9/linux-3.11/fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
WARNING: Error for inode 42 (-2)

