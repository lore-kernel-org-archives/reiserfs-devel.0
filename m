From: <doiggl@velocitynet.com.au>
Subject: Reiser4 files and tarring up accessible files, and 'key_warning (../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]' and ls
Date: Sun, 26 Jun 2016 23:00:17 +1000
Message-ID: <8275f18b33372f39357121cd8ae1110f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Some Questions:
==============
Can I run run 'tar -cvf /homedir/sdb-archive.tar /media/disk' and tar up
remaining  accessible files ?

- What does the following mean ? Is it fixable , if so how ? 

key_warning (../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717

Thank you
--Glenn


I have  run 'mount /dev/sdb /media/disk' mount to a Reiser4 volume and the
mount command worked, file sustem shows: [1]

no --check , --fix, --build-sb , --build-fs  have run in this session, but
have run them in the past.

# ll /media/disk shows lots of '?' on R4 filesystem [in 1st column] see
[1]

I'm using

# rpm -qa | grep -i kernel
kernel-reiser4-4.6.0-1.1.x86_64

patched with
reiser4-for-4.6.0.patch


#dmesg shows
<Error for inode number 'nnnnn'> 1816 times    different inode number each
line.

A sample:

[ 2116.352571] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 249472 (-2)
[ 2116.352602] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 250795 (-2)
[ 2116.352633] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 244586 (-2)
[ 2116.352664] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 249604 (-2)
[ 2116.352694] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 250527 (-2)
[ 2116.352725] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 251426 (-2)
[ 2116.352756] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 244330 (-2)
[ 2116.352787] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 245238 (-2)
.
.
[ 2116.487488] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254604 (-2)
[ 2116.487512] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254621 (-2)
[ 2116.487528] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254605 (-2)
[ 2116.487547] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254622 (-2)
[ 2116.487616] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254615 (-2)
[ 2116.487637] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254617 (-2)
[ 2116.487655] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254620 (-2)
[ 2116.487669] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254616 (-2)
[ 2116.487693] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254618 (-2)
[ 2116.487712] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254614 (-2)
[ 2116.487735] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254619 (-2)
[ 2116.487811] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254611 (-2)
[ 2116.487838] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254609 (-2)
[ 2116.487853] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254612 (-2)
[ 2116.487871] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254607 (-2)
[ 2116.487892] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254610 (-2)
[ 2116.487916] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254608 (-2)
[ 2116.488027] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254808 (-2)
[ 2116.488055] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254809 (-2)
[ 2116.488074] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254798 (-2)
[ 2116.488225] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 255169 (-2)
[ 2116.488248] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 255177 (-2)
[ 2116.488358] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 325715 (-2)
[ 2116.488384] reiser4[ls(2177)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 289503 (-2)
[ 6172.150296] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 185226 (-2)
[ 6172.150434] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 215271 (-2)
[ 6172.150520] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 252106 (-2)
[ 6172.150592] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 252431 (-2)
[ 6172.150646] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 252432 (-2)
[ 6172.150696] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 754079 (-2)
[ 6172.150746] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254332 (-2)
[ 6172.150799] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 254333 (-2)
[ 6172.150908] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 910889 (-2)
[ 6172.150968] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 973512 (-2)
[ 6172.151026] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 973529 (-2)
[ 6172.151080] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 973519 (-2)
[ 6172.151199] reiser4[ls(3412)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
.
.
.




###
# fdisk -l shows:

Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

 # df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb        1.8T  950G  821G  54% /media/disk


Im now using:
# rpm -qa | grep -i reiser4progs
reiser4progs-1.1.0-35.1.x86_64

- mount command used
mount /dev/sdb /media/disk
#

# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb        1.8T  950G  821G  54% /media/disk

# dmesg shows

[   96.154725] usb 1-1: new high-speed USB device number 3 using ehci-pci
[   96.291128] usb 1-1: New USB device found, idVendor=04fc,
idProduct=0c25
[   96.291141] usb 1-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[   96.291148] usb 1-1: Product: USB to Serial-ATA bridge
[   96.291153] usb 1-1: Manufacturer: Sunplus Technology Inc.
[   96.291158] usb 1-1: SerialNumber: ST32000542            5XW1ZMG4
[   96.309688] usb-storage 1-1:1.0: USB Mass Storage device detected
[   96.309921] scsi host4: usb-storage 1-1:1.0
[   96.310088] usbcore: registered new interface driver usb-storage
[   97.312108] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[   97.312702] sd 4:0:0:0: Attached scsi generic sg2 type 0
[   97.317613] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.82 TiB)
[   97.320312] sd 4:0:0:0: [sdb] Write Protect is off
[   97.320323] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[   97.322941] sd 4:0:0:0: [sdb] No Caching mode page found
[   97.322950] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[   97.402103] sd 4:0:0:0: [sdb] Attached SCSI disk



Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

[1] # ll /media/disk 
ls: cannot access /media/disk/nvidia-installer.log: No such file or
directory
ls: cannot access /media/disk/opensuseurl.txt: No such file or directory
ls: cannot access /media/disk/packman.txt: No such file or directory
ls: cannot access /media/disk/q1.txt: No such file or directory
ls: cannot access /media/disk/q1.txt~: No such file or directory
ls: cannot access /media/disk/read-only,txt: No such file or directory
ls: cannot access /media/disk/remove.txt: No such file or directory
ls: cannot access /media/disk/repos.txt: No such file or directory
ls: cannot access /media/disk/rpmlist.log: No such file or directory
ls: cannot access /media/disk/to-remove: No such file or directory
ls: cannot access /media/disk/x: No such file or directory
ls: cannot access /media/disk/zgl: No such file or directory
ls: cannot access /media/disk/pub_linux_utils_fs_reiser4_libaal.html: No
such file or directory
total 403445
drwx------ 102 root root       131 Sep  6  2011 .Trash-0
lrwxrwxrwx   1 root root        55 Jul  5  2009
NVIDIA-Linux-x86_64-185.18.14-pkg2.run ->
nvidia/laptop-7x/NVIDIA-Linux-x86_64-185.18.14-pkg2.run
drwxr-xr-x   2 root root         2 Apr  7  2010 downloads
drwxr-xr-x   3 root root         3 Sep 23  2009 dta
drwxr-xr-x   3 root root         3 Sep 28  2009 engin
drwxr-xr-x   3 root root         3 Jun  2  2009 ext4
drwxr-xr-x   2 root root        17 May 11  2011 extrarpms
drwxr-xr-x   2 root root         3 Nov  7  2010 family-history
drwxr-xr-x   2 root root         2 Oct 17  2009 fb
drwxr-xr-x   3 root root         3 Sep 22  2010 fedora
drwxr-xr-x   4 root root         4 Aug 23  2009 ff
drwxr-xr-x   5 root root         5 Aug  1  2010 flash
drwxr-xr-x   2 root root         4 Oct 31  2010 floss
drwxr-xr-x   4 root root         4 Aug 20  2009 free-partitioning-tools
drwxr-xr-x   4 root root         4 Dec 21  2010 fs
drwxr-xr-x   2 root root         2 Jul  6  2009 gen
drwxr-xr-x   2 root root         2 Feb  6  2011 gifs
drwxr-xr-x   7 root root         7 Jan  9  2010 gnome
drwxr-xr-x   5 root root         6 Oct 22  2010 gnumeric
drwxr-xr-x   6 root root         6 Oct 19  2010 goats
drwxr-xr-x   4 root root         4 Mar 24  2010 google
drwxr-xr-x   3 root root         5 Dec 15  2010 googleearth
drwxr-xr-x   3 root root         3 Dec 12  2009 gps
drwxr-xr-x   3 root root        11 Mar 16  2010 gramps3.1.2
drwxr-xr-x   2 root root         4 Feb 12  2011 grub
drwxr-xr-x   3 root root         4 Apr 28  2010 gtk2
drwxr-xr-x   2 root root         2 Dec  7  2010 hhs
drwxr-xr-x   2 root root         4 Oct 28  2009 hpc
drwxr-xr-x   2 root root         2 Apr 11  2010 icon
drwxr-xr-x   3 root root        28 May 21  2009 ils
drwx------   7 root root        92 Sep  3  2011 iso
drwxr-xr-x   4 root root         4 Apr 25  2010 iso-11.2of
drwxr-xr-x   6 root root         6 Sep  7  2010 iso-factory
drwxr-xr-x   5 root root         7 Jul 20  2009 java
drwxr-xr-x   4 root root         4 Aug  7  2009 jb-hifi
drwxr-xr-x   6 root root         6 Jan  6  2010 jibjab
drwxr-xr-x   5 root root         6 Jan 15  2011 k3b
drwxr-xr-x   3 root root       323 Jun  8  2010 k4
drwxr-xr-x   2 root root         2 Jan  9  2010 kde432
drwxr-xr-x   4 root root         4 Dec 30  2009 kde4info
drwxr-xr-x   6 root root         6 Oct 11  2010 kdenlive
drwxr-xr-x  34 root root        34 Jun  1  2011 kernel
-rw-r--r--   1 root root         0 Aug  7  2010
kernel-2.6.3512desktop.tar.gz
drwxr-xr-x   2 root root         2 Dec 27  2010 kogan
drwxr-xr-x   2 root root         2 May 27  2010 ksnapshot
drwxr-xr-x  10 root root        10 Aug 18  2011 lds
drwxr-xr-x   2 root root         3 Feb 22  2011 lightning
drwxr-xr-x  19 root root       121 Jan 26  2011 linux
-rw-r--r--   1 root root 412928000 Sep 20  2010 linux-2.6.35.4.tar
drwxr-xr-x   1 root root         2 May  6  2011 lost+found
drwxr-xr-x   2 root root       120 Aug 13  2011
lost_name_2a:6b646534000000:1c3f1
drwxr-xr-x   2 root root         4 Apr 12  2011
lost_name_2a:736d6172740000:3e638
drwxr-xr-x   2 root root         9 Sep 10  2010
lost_name_2a:736d6172742e6f:3e6d9
drwxr-xr-x   1 root root        10 Aug  1  2009
lost_name_2a:73746200000000:3f1ed
drwxr-xr-x   2 root root         2 Jul 26  2009 m4
drwxr-xr-x   2 root root         3 Nov  2  2010 mc
drwxr-xr-x   2 root root         4 Nov 24  2010 mirrorq
drwxr-xr-x   2 root root         2 Jul  3  2009 mmsrip
drwxr-xr-x   3 root root         3 Oct 23  2009 mplayer
drwxr-xr-x   3 root root        25 Nov 30  2010 muppets
drwxr-xr-x   2 root root         3 Dec  1  2009 myth-busters
drwxr-xr-x   4 root root         4 Mar  3  2010 navman
drwxr-xr-x   3 root root         4 Jun 30  2009 news
drwxr-xr-x   3 root root         5 Aug 16  2009 ntp
??????????   ? ?    ?            ?            ? nvidia-installer.log
drwxr-xr-x   3 root root         4 Mar  6  2011 olympics-1968-Finish the
Race
drwx------  97 root root       119 Jun  4  2011 opensuse
??????????   ? ?    ?            ?            ? opensuseurl.txt
drwxr-xr-x  48 root root        61 Aug 18  2011 oracle
drwxr-xr-x   3 root root         4 Jan 25  2010 other
drwxr-xr-x   2 root root       142 Oct  2  2010 other-rpms
drwxr-xr-x   2 root root       863 Feb 22  2010 packages
drwxr-xr-x   5 root root        14 May 14  2011 packman
??????????   ? ?    ?            ?            ? packman.txt
drwxr-xr-x   3 root root         4 Aug 11  2009 partitioning
drwxr-xr-x   7 root root        17 Nov  3  2009 phoronix
drwxr-xr-x   2 root root         3 Mar 15  2011 pictures
drwxr-xr-x   3 root root         4 Sep 23  2009 plugins
??????????   ? ?    ?            ?            ?
pub_linux_utils_fs_reiser4_libaal.html
??????????   ? ?    ?            ?            ? q1.txt
??????????   ? ?    ?            ?            ? q1.txt~
??????????   ? ?    ?            ?            ? read-only,txt
??????????   ? ?    ?            ?            ? remove.txt
??????????   ? ?    ?            ?            ? repos.txt
drwxr-xr-x   3 root root         4 Jan 25  2010 rpm-description
drwxr-xr-x   4 root root         8 Sep 23  2009 rpm-help
??????????   ? ?    ?            ?            ? rpmlist.log
drwxr-xr-x   2 root root        22 Jul 22  2010 rpms-old
??????????   ? ?    ?            ?            ? to-remove
??????????   ? ?    ?            ?            ? x
??????????   ? ?    ?            ?            ? zgl
drwxr-xr-x   2 root root         6 Jul 20  2011 zz-iso

