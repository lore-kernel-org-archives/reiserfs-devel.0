From: <doiggl@velocitynet.com.au>
Subject: Re: How can I list files with accessible inodes [/dev/sdb]
Date: Sat, 27 Aug 2016 00:21:44 +1000
Message-ID: <4646e380301d5ae653196657e9ba4ba0@mail.velocitynet.com.au>
References: <0529de4b5b9d00bff54fbf8403d9a6f5@mail.velocitynet.com.au> <alpine.DEB.2.20.14.1608251507170.8131@trent.utfs.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
        boundary="=_3752c992c931cb004d0c99d293e0323f"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.14.1608251507170.8131@trent.utfs.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

--=_3752c992c931cb004d0c99d293e0323f
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

On Thu, 25 Aug 2016 15:12:55 -0700 (PDT), Christian Kujau
<lists@nerdbynature.de> wrote:
> On Fri, 19 Aug 2016, doiggl@velocitynet.com.au wrote:
>> Reiser4 on /dev/sdb
>> Can these  errors be fixed. 
>> No luck in the past.
>> I cannot access files which have ?????????? in ls listing or "No such
>> file
> 
> As always: 
> 
> * Which kernel and what patches are you using? Does it happen on the 
>   latest 4.7 vanilla kernel with Reiser4 patches on top? Was the
>   file system accessible with older kernels?
> * How is your Reiser4 file system mounted? (mount | grep reiser4)
> * What lead to the errors in the first place? Was there a power outage,
>   or some other crash?
> * Does syslog show any underlying device errors? Please use a pastebin
>   for longer syslog outputs.
> 
> C.

Hello,
This is what I have recorded so far.
repair attemps fails.
attaching 
--Glenn


Now using,
# rpm -qa |grep -i reiser4 |sort
kernel-reiser4-4.7.0-9.2.x86_64
libreiser4-1_1-0-1.1.0-13.1.x86_64                                        
                                         
libreiser4-minimal-1_1-0-1.1.0-13.1.x86_64                                
                                             
reiser4progs-1.1.0-13.1.x86_64                                            
                                                   
reiser4progs-devel-1.1.0-13.1.x86_64                                      
                                                        

kernel now  in use:
linux-4.7.tar.xz 

latest reiser4 patch used:
reiser4-for-4.7.0.patch

latest reiser4 build + project
https://build.opensuse.org/package/show/home:doiggl/kernel-reiser4

previous built rpms:
# ll *kernel-reiser4*                                                     
                                                   
-rw-r--r-- 1 root users 39915183 Jun  7 18:30
kernel-reiser4-3.11.6-11.1.x86_64.rpm
-rw-r--r-- 1 root root  43323220 May  9  2014
kernel-reiser4-3.14.0-4.1.x86_64.rpm
-rw-r--r-- 1 root users 43807877 Aug 26  2014
kernel-reiser4-3.15.0-1.1.x86_64.rpm
-rw-r--r-- 1 root users 45308033 Oct 17  2014
kernel-reiser4-3.16.3-35.1.gd2bbe7f.x86_64.rpm
-rw-r--r-- 1 root users 45612619 Nov  1  2014
kernel-reiser4-3.17.1-1.1.gd2bbe7f.x86_64.rpm
-rw-r--r-- 1 root users 45590145 Nov  3  2014
kernel-reiser4-3.17.2-1.1.gd2bbe7f.x86_64.rpm
-rw-r--r-- 1 root users 44276040 Feb  5  2015
kernel-reiser4-3.17.3-1.1.gd2bbe7f.x86_64.rpm
-rw-r--r-- 1 root users 44414469 Feb 11  2015
kernel-reiser4-3.18.6-2.1.gd2bbe7f.x86_64.rpm
-rw-r--r-- 1 root users 44422758 Feb 16  2015
kernel-reiser4-3.18.7-1.1.gd2bbe7f.x86_64.rpm
-rw-r--r-- 1 root users 45373259 Sep 17  2015
kernel-reiser4-4.1.6-7.1.gd2bbe7f.x86_64.rpm
-rw-r--r-- 1 root users 45248952 Sep 29  2015
kernel-reiser4-4.2.1-3.1.gd2bbe7f.x86_64.rpm
-rw-r--r-- 1 root users 45301630 Oct 26  2015
kernel-reiser4-4.2.1-36.1.gd2bbe7f.x86_64.rpm
-rw-r--r-- 1 root users 48108295 Jan 16  2016
kernel-reiser4-4.4.0-2.1.x86_64.rpm
-rw-r--r-- 1 root users 49596638 Apr  7 20:59
kernel-reiser4-4.5.0-7.1.x86_64.rpm
-rw-r--r-- 1 root users 50986904 May 26 01:20
kernel-reiser4-4.6.0-1.1.x86_64.rpm
-rw-r--r-- 1 root users 51448624 Aug 12 11:41
kernel-reiser4-4.7.0-9.2.x86_64.rpm

build log example:
.
[   38s] + cd linux-4.7
[   38s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[   38s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/lustre-lloop-dont-change-logical-size
[   38s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/i915-fix-build-error-with-werror
[   38s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-4.7.0.patch
[   38s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/firmware-path
[   38s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/cloneconfig.diff
.
.
[  664s] build: extracting built packages...
[  684s] RPMS/x86_64/kernel-reiser4-4.7.0-9.2.x86_64.rpm
[  684s] RPMS/x86_64/kernel-reiser4-devel-4.7.0-9.2.x86_64.rpm
[  684s] SRPMS/pesign-repackage-1.0-9.2.src.rpm
[  684s] SRPMS/kernel-reiser4-4.7.0-9.2.nosrc.rpm
[  684s] OTHER/_statistics
[  684s] OTHER/kernel-reiser4-debugsource-4.7.0-9.2.x86_64.rpm
[  684s] OTHER/kernel-reiser4-devel-debuginfo-4.7.0-9.2.x86_64.rpm
[  684s] OTHER/kernel-reiser4-debuginfo-4.7.0-9.2.x86_64.rpm

eariest attempt to use/repair: aprox

http://www.spinics.net/lists/reiserfs-devel/msg03016.html
2.6.39.4 with reiser4 enabled.
Date: Fri, 18 Nov 2011

earliest repair try failed.

Date: Sun, 08 May 2011
http://www.spinics.net/lists/reiserfs-devel/msg02855.html

Date: Thu, 19 Sep 2013
http://www.spinics.net/lists/reiserfs-devel/msg03576.html

later repair tries failed.

# plug in reiser4 volume

# fdisk -l shows:
Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


dmesg shows:
[207700.361762] usb 1-1: new high-speed USB device number 4 using ehci-pci
[207700.497991] usb 1-1: New USB device found, idVendor=04fc,
idProduct=0c25
[207700.498003] usb 1-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[207700.498011] usb 1-1: Product: USB to Serial-ATA bridge
[207700.498017] usb 1-1: Manufacturer: Sunplus Technology Inc.
[207700.498021] usb 1-1: SerialNumber: ST32000542            5XW1ZMG4
[207700.500965] usb-storage 1-1:1.0: USB Mass Storage device detected
[207700.501516] scsi host5: usb-storage 1-1:1.0
[207701.507449] scsi 5:0:0:0: Direct-Access     ST320005 42AS             
   PQ: 0 ANSI: 2
[207701.509303] sd 5:0:0:0: Attached scsi generic sg2 type 0
[207701.511040] sd 5:0:0:0: [sdb] 3907029168 512-byte logical blocks:
(2.00 TB/1.82 TiB)
[207701.515127] sd 5:0:0:0: [sdb] Write Protect is off
[207701.515140] sd 5:0:0:0: [sdb] Mode Sense: 38 00 00 00
[207701.517889] sd 5:0:0:0: [sdb] No Caching mode page found
[207701.517897] sd 5:0:0:0: [sdb] Assuming drive cache: write through
[207701.719569] sd 5:0:0:0: [sdb] Attached SCSI disk# dmesg


This is the sequence of --checks and --build-fs times of Reiser4 volume on
disk /dev/sdb

Date: Thu, 19 Sep 2013
Re: Is this disk ok to use? completed fsck.reiser4 --build-fs /dev/sdb
http://www.spinics.net/lists/reiserfs-devel/msg03576.html

Date: Tue, 24 Feb 2015
http://www.spinics.net/lists/reiserfs-devel/msg04667.html

--check    Mon Feb 23 01:34:22 2015
--build-fs Mon Feb 23 13:09:25 2015
--check    Tue Feb 24 17:03:22 2015
--build-fs Tue Aug 26 17:22:24 2014
--build-fs Fri Sep 20 15:50:44 2013

commands used
-------------
# fsck.reiser4 --check /dev/sdb
# fsck.reiser4 --build-fs --force  /dev/sdb

References from:
Fri Sep 20 15:50:44 2013
to
Mon Feb 23 01:34:22 2015

----------
http://www.spinics.net/lists/reiserfs-devel/msg04665.html
http://www.spinics.net/lists/reiserfs-devel/msg04206.html
http://www.spinics.net/lists/reiserfs-devel/msg04663.html
http://www.spinics.net/lists/reiserfs-devel/msg04661.html
http://www.spinics.net/lists/reiserfs-devel/msg04596.html
http://www.spinics.net/lists/reiserfs-devel/msg04203.html
http://www.spinics.net/lists/reiserfs-devel/msg04202.html
http://www.spinics.net/lists/reiserfs-devel/msg04205.html
http://www.spinics.net/lists/reiserfs-devel/msg03575.html


mount shows
# time mount /dev/sdb  /media/disk

real    1m50.414s
user    0m0.012s
sys     0m1.844s

# df -h shows:
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        3.8G  8.0K  3.8G   1% /dev
tmpfs           3.8G  556K  3.8G   1% /dev/shm
tmpfs           3.8G   21M  3.8G   1% /run
/dev/sda2        12G  7.0G  5.1G  58% /
tmpfs           3.8G     0  3.8G   0% /sys/fs/cgroup
tmpfs           3.8G   21M  3.8G   1% /var/lock
tmpfs           3.8G   21M  3.8G   1% /var/run
/dev/sdb        1.8T  747G  1.0T  43% /media/disk



Reiser4 volume is:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb        1.8T  747G  1.0T  43% /media/disk
# dmesg

inode number changes:

[208536.965487] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 128783 (-2)
[208536.965498] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 128783 (-2)
[208536.965510] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 125602 (-2)
[208536.965518] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 125602 (-2)
[208536.965530] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 126434 (-2)
[208536.965538] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 126434 (-2)
[208536.965551] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 126845 (-2)
[208536.965559] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 126845 (-2)
.
.
[208537.884568] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108002 (-2)
[208537.884589] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 107983 (-2)
[208537.884602] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 107983 (-2)
[208537.884623] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108010 (-2)
[208537.884637] reiser4[nepomukfilewatc(1321)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108010 (-2)

--count shows:
# dmesg |grep -i "key_warning" |wc -l
1637

inode number changes + 'Error for inode'  + "key_warning" shows in count.
--=_3752c992c931cb004d0c99d293e0323f
Content-Transfer-Encoding: base64
Content-Type: application/x-bzip2; charset=binary; charset=UTF-8;
 name=dmesg-output.txt.bz2;
Content-Disposition: attachment;
 filename=dmesg-output.txt.bz2;

QlpoOTFBWSZTWVhO+gsA3BpfgGAQQGP/8CKhEIqvr96gYDE/AAAAAADyvXqu6UaZzDhVUdCbMc4E
zritIdycWKrZqRgrA1u7lXBrVs5QNsUbq44Bp1drboDrTsuOdNDrp0OnWTaccdsOdpcJdOCG5yg4
NQ3XHs6qgUqKqhbgAASSFH6moDTEAAAAAam0YipVGjTQADIaGmhoGp4QKVVMhggwmjJgJkwSnpCE
lSkwmgxGQyZA0ZDAGmho0YjIBoANDAqgQJVAminkgHqP0oGmZPU/NH6JR+sv5QEQR6AiCPy/Vj9V
JbS/V+qWm3lsOGNttv4tsbW2ppx/I24268662228ww8lp4l1taVuuMaY0W6lxbTzSnnVNPJbaecU
txt1ja1HW2NqJU0w48bbW2xp5xbbxijy3ElMNtNnTiNtpadNNOuKdeStinXmPJYtxw48680kpxxT
EUacS2044bdfi462+dcddcW+dfLS2ecaacU8potTzim2lLY80t4lpxxSVKSbdbdaUpTzCWOtMbdU
tjG0qS640po02xiWNnG3GkUlto62lTjrFtLcSeU2caRKlFuvNqW2xjHnXHGktsbWxLzzbTTy2mON
tNrYtjps8lLEpbeaKS8688tx1xLzjFtsdaadS6x1jDzEutHijjiWPNnnEqU226pxpjjby1NvNtpe
S828x1inWPOKebS0sljzTTTFPOpeceYt5tjTTbzSWnErU2lLjjrjS1OKY0pxSWNuNuPNturdWppT
TrbjbFONuvNtnluPPPNpU2xaXCWnnXmNlvPPOOuuLeaeW864lba2KebcU6x1KVtpYxjG3W3DanFO
tuOKdU246lxtpjbHkusdWxpKnS22PJUxtbrT8lMS6+aOOvnzGm0tJbdYl86eOpY02ltji3mlJSlx
brrGNJdUt5a3m0rbdUtLTqm3HHHXHnnTTrFGvLddWptxtx5xLrbG223nnWzza0scW046624pS1LY
262x1SzjrHlpU6446tppx5pjGnnlKYts44z+0BEEftARBH6QEQR/ogIgiYCII/rARBH8kBEEftAR
BHoCII7ARBH8ICII/nARBH7QEQRMBEEf8YCII/SIIREfwRECH+aAiCLgIgj+MBEEf6wEQR35/N/N
LqzH4tNP+Dq1qLfzaSlx+LSW2JW280dU6ilrStbzHUttMaabY6p1/ktjzHlpeS8+Y+aQIgjiUvlq
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
fxQEQR+EBEEfhARBHyAiCP9xdyRThQkFhO+gsA==
--=_3752c992c931cb004d0c99d293e0323f--

