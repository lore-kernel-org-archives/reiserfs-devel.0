From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiserfs problem
Date: Thu, 21 May 2015 09:45:16 +0800
Message-ID: <555D38AC.8000601@gmail.com>
References: <1208801633.20150514020848@vvo.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=TDlujbWfY/gXy095XtcKaUH//LPKbTdnDXnuUFzYb78=;
        b=QIikmmHKC19+HX3/bbEATTkN+fMErOyiR5A3wZGhs+ThY4mY9VgOARgth9E6/vQhW9
         5bKnh7okxRFkLA4gQZBl4u2IoAkrVdVrPbZzmPaYh8m160uji1FLvnQvjbcpT2ffpObA
         A60USVplLyxDwrShSbe2U67LodC+qHT8PINg7uVZNY0Ky6qfi5pauxTkMgq6w+cB3oBT
         qtpua3AN8Ymaegu/6q3ryzC1uLPLQB8I1nATEMOG+hxr+S3hA0ZO7ig15WcXFgBI0wuM
         mFxqrKf8i4hvE3CtRoF3yoZbepq+UsSePU8Ix7YpC83hAcanuG3ssvxlNtnkunyiI2Gm
         wqmg==
In-Reply-To: <1208801633.20150514020848@vvo.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1251"; format="flowed"
To: jeffm@suse.com
Cc: mikh@vvo.ru, ReiserfS development mailing list <reiserfs-devel@vger.kernel.org>

Jeff,

it seems we need a sanity check somewhere at
the beginning of the resizer to make sure that the
resulted volume is not larger than 16T.
Could you please take a look?

Thanks,
Edward.


On 05/14/2015 12:08 AM, Sergey Mikhalych wrote:
> =C7=E4=F0=E0=E2=F1=F2=E2=F3=E9=F2=E5, =DD=E4=F3=E0=F0=E4.
>
> =CF=F0=EE=F8=F3 =EF=F0=EE=F9=E5=ED=E8=FF, =F7=F2=EE =EE=F2=E2=EB=E5=EA=
=E0=FE, =E4=E0 =F1=EF=F0=EE=F1=E8=F2=FC =E1=EE=EB=FC=F8=E5 =ED=E5 =F3 =EA=
=EE=E3=EE.
> =D1=F3=F2=FC  =EF=F0=EE=E1=EB=E5=EC=FB: =E2 =EF=F0=EE=E4=E0=EA=F8=E5=ED=
 =F1=E5=F0=E2=E5=F0 =E4=EE=E1=E0=E2=EB=E5=ED=FB =E4=EE=EF=EE=EB=ED=E8=F2=
=E5=EB=FC=ED=FB=E5 6 =E4=E8=F1=EA=EE=E2. =F1=EE=E1=F0=E0=ED =F0=E5=E9=E4=
6 =ED=E0
> =EA=EE=ED=F2=F0=EE=EB=EB=E5=F0=E5,   =F4=E8=E7=E8=F7=E5=F1=EA=E8=E9  =
 =EF=E0=F0=F2=E8=F8=E5=ED  =E4=EE=E1=E0=E2=EB=E5=ED  =E2  lvm-=E3=F0=F3=
=EF=EF=F3,  =ED=EE  =ED=E0
> =F4=E8=ED=E0=EB=FC=ED=EE=E9 =F1=F2=E0=E4=E8=E8 - =EE=F8=E8=E1=EA=E0 =EF=
=F0=E8 =F0=E0=F1=F8=E8=F0=E5=ED=E8=E8 =F4=E0=E9=EB=EE=E2=EE=E9 =F1=E8=F1=
=F2=E5=EC=FB.
> =CE=E1=ED=EE=E2=E8=EB   =FF=E4=F0=EE   =E4=EE   =EF=EE=F1=EB=E5=E4=ED=
=E5=E3=EE,   =F1=EE=E1=F0=E0=EB   =E8=E7  =E8=F1=F5=EE=E4=ED=E8=EA=EE=E2=
  =EF=EE=F1=EB=E5=E4=ED=E8=E9
> resize_reiserfs - =F1=E8=F2=F3=E0=F6=E8=FF =ED=E5 =EC=E5=ED=FF=E5=F2=F1=
=FF.
>
> resize_reiserfs: bitmap.c:176: reiserfs_bitmap_set_bit: Assertion `bi=
t_number < bm->bm_bit_size' failed.
> Aborted
>
> =C7=E0=EF=F3=F1=F2=E8=F2=FC  =ED=E0  =E2=FB=F5=EE=E4=ED=FB=F5  fsck.r=
eiserfs  ?
>
> ------------
>
> [root@nika mich]# vgdisplay
>    --- Volume group ---
>    VG Name               fedora
>    System ID
>    Format                lvm2
>    Metadata Areas        2
>    Metadata Sequence No  5
>    VG Access             read/write
>    VG Status             resizable
>    MAX LV                0
>    Cur LV                2
>    Open LV               1
>    Max PV                0
>    Cur PV                2
>    Act PV                2
>    VG Size               25.47 TiB
>    PE Size               4.00 MiB
>    Total PE              6675716
>    Alloc PE / Size       6675716 / 25.47 TiB
>    Free  PE / Size       0 / 0
>    VG UUID               7zMHCn-2rM3-DwAf-v4pC-2rTG-POHk-ux8cTq
>    =20
> [root@nika mich]# lvdisplay
>    --- Logical volume ---
>    LV Path                /dev/fedora/root
>    LV Name                root
>    VG Name                fedora
>    LV UUID                Xi8boU-eegJ-w2t4-SiBT-EOxY-9Gt0-ufQaNU
>    LV Write Access        read/write
>    LV Creation host, time localhost, 2014-08-23 05:40:09 +0400
>    LV Status              available
>    # open                 1
>    LV Size                19.53 GiB
>    Current LE             5000
>    Segments               1
>    Allocation             inherit
>    Read ahead sectors     auto
>    - currently set to     256
>    Block device           253:0
>    =20
>    --- Logical volume ---
>    LV Path                /dev/fedora/home
>    LV Name                home
>    VG Name                fedora
>    LV UUID                8u78Jm-tfLO-s0k7-99az-RQVx-cPez-lCX16b
>    LV Write Access        read/write
>    LV Creation host, time localhost, 2014-08-23 05:40:10 +0400
>    LV Status              available
>    # open                 0
>    LV Size                25.45 TiB
>    Current LE             6670716
>    Segments               2
>    Allocation             inherit
>    Read ahead sectors     auto
>    - currently set to     256
>    Block device           253:1
>    =20
> [root@nika mich]# pvdisplay
>    --- Physical volume ---
>    PV Name               /dev/sdc4
>    VG Name               fedora
>    PV Size               10.91 TiB / not usable 0
>    Allocatable           yes (but full)
>    PE Size               4.00 MiB
>    Total PE              2860805
>    Free PE               0
>    Allocated PE          2860805
>    PV UUID               ojkwZA-vSnJ-5L85-HRJA-iGLw-WmdG-1LOK8o
>    =20
>    --- Physical volume ---
>    PV Name               /dev/sdd1
>    VG Name               fedora
>    PV Size               14.55 TiB / not usable 2.98 MiB
>    Allocatable           yes (but full)
>    PE Size               4.00 MiB
>    Total PE              3814911
>    Free PE               0
>    Allocated PE          3814911
>    PV UUID               zqqnp3-73Cv-u4HW-8r7g-zg03-GsGl-jRG4vM
>    =20
> [root@nika mich]# resize_reiserfs /dev/fedora/home
> resize_reiserfs 3.6.21 (2009 www.namesys.com)
>
> resize_reiserfs: bitmap.c:176: reiserfs_bitmap_set_bit: Assertion `bi=
t_number < bm->bm_bit_size' failed.
> Aborted
>
> [root@nika mich]# mount /home
> [root@nika mich]# df -k
> Filesystem                1K-blocks        Used  Available Use% Mount=
ed on
> devtmpfs                    8192864           0    8192864   0% /dev
> tmpfs                       8199908           0    8199908   0% /dev/=
shm
> tmpfs                       8199908         636    8199272   1% /run
> tmpfs                       8199908           0    8199908   0% /sys/=
fs/cgroup
> /dev/mapper/fedora-root    20027260    13954688    5032188  74% /
> tmpfs                       8199908           0    8199908   0% /tmp
> /dev/md0                  249804944    84018732  165786212  34% /var/=
lib/mysql
> /dev/mapper/fedora-home 11697377276 10464383528 1232993748  90% /home
>
>
> [root@nika mich]# uname -a
> Linux nika 3.19.5-100.fc20.x86_64 #1 SMP Mon Apr 20 19:51:16 UTC 2015=
 x86_64 x86_64 x86_64 GNU/Linux
>
> [root@nika mich]# mount
> /dev/mapper/fedora-home on /home type reiserfs (rw,noatime)
>
>> =CF=E5=F0=EF=E5=E7=E0=E3=F0=F3=E7=E8=EB=F1=FF  =F1 nomount =EE=EF=F6=
=E8=E5=E9, =E8 =F1=F0=E0=E7=F3 =EF=EE=EF=F0=EE=E1=EE=E2=E0=EB =F3=E4=E0=
=EB=E8=F2=FC =EF=E0=F0=F2=E8=F8=E5=ED
>> =E8=E7 =E3=F0=F3=EF=EF=FB:
> [root@nika mich]# pvremove /dev/sdd1 --force --force
> Really WIPE LABELS from physical volume "/dev/sdd1" of volume group "=
fedora" [y/n]? y
>    WARNING: Wiping physical volume label from /dev/sdd1 of volume gro=
up "fedora"
>    Can't open /dev/sdd1 exclusively - not removing. Mounted filesyste=
m?
>
> [root@nika mich]# fdisk -l
>
> Disk /dev/sda: 238.5 GiB, 256060514304 bytes, 500118192 sectors
> Units: sectors of 1 * 512 =3D 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: dos
> Disk identifier: 0x9509a759
>
> Device    Boot Start       End    Blocks  Id System
> /dev/sda1       2048 500118191 250058072  fd Linux raid autodetect
>
>
> Disk /dev/sdb: 238.5 GiB, 256060514304 bytes, 500118192 sectors
> Units: sectors of 1 * 512 =3D 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: dos
> Disk identifier: 0xf34dca6b
>
> Device    Boot Start       End    Blocks  Id System
> /dev/sdb1       2048 500118191 250058072  fd Linux raid autodetect
>
>
> Disk /dev/sdc: 10.9 TiB, 12000138625024 bytes, 23437770752 sectors
> Units: sectors of 1 * 512 =3D 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: gpt
> Disk identifier: 9EA5B48C-FD78-47D5-A677-649084CAEA92
>
> Device           Start          End   Size Type
> /dev/sdc1         2048         4095     1M BIOS boot partition
> /dev/sdc2         4096      1028095   500M Microsoft basic data
> /dev/sdc3      1028096      2052095   500M Linux swap
> /dev/sdc4      2052096  23437768703  10.9T Linux LVM
>
>
> Disk /dev/sdd: 14.6 TiB, 16000900661248 bytes, 31251759104 sectors
> Units: sectors of 1 * 512 =3D 512 bytes
> Sector size (logical/physical): 512 bytes / 4096 bytes
> I/O size (minimum/optimal): 4096 bytes / 4096 bytes
> Disklabel type: gpt
> Disk identifier: 0DCCB049-2A14-4666-B91C-16DC8EBB0E30
>
> Device    Start          End   Size Type
> /dev/sdd1  2048  31251759070  14.6T Linux LVM
>
>
> Disk /dev/mapper/fedora-root: 19.5 GiB, 20971520000 bytes, 40960000 s=
ectors
> Units: sectors of 1 * 512 =3D 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
>
> Disk /dev/md0: 238.4 GiB, 255925223424 bytes, 499853952 sectors
> Units: sectors of 1 * 512 =3D 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
>
> Disk /dev/mapper/fedora-home: 25.5 TiB, 27979010801664 bytes, 5464650=
5472 sectors
> Units: sectors of 1 * 512 =3D 512 bytes
> Sector size (logical/physical): 512 bytes / 4096 bytes
> I/O size (minimum/optimal): 4096 bytes / 4096 bytes
>
> [root@nika mich]# cat /proc/mdstat
> Personalities : [raid1]
> md0 : active raid1 sdb1[1] sda1[0]
>        249926976 blocks super 1.2 [2/2] [UU]
>        bitmap: 0/2 pages [0KB], 65536KB chunk
>
> unused devices: <none>
>
>
> [root@nika MegaCli]# dmsetup info
> Name:              fedora-root
> State:             ACTIVE
> Read Ahead:        256
> Tables present:    LIVE
> Open count:        1
> Event number:      0
> Major, minor:      253, 0
> Number of targets: 1
> UUID: LVM-7zMHCn2rM3DwAfv4pC2rTGPOHkux8cTqXi8boUeegJw2t4SiBTEOxY9Gt0u=
fQaNU
>
> Name:              fedora-home
> State:             ACTIVE
> Read Ahead:        256
> Tables present:    LIVE
> Open count:        2
> Event number:      0
> Major, minor:      253, 1
> Number of targets: 2
> UUID: LVM-7zMHCn2rM3DwAfv4pC2rTGPOHkux8cTq8u78JmtfLOs0k799azRQVxcPezl=
CX16b
>
> [root@nika MegaCli]# lvscan
>    ACTIVE            '/dev/fedora/root' [19.53 GiB] inherit
>    ACTIVE            '/dev/fedora/home' [25.45 TiB] inherit
>
> [root@nika resize_reiserfs]# ./resize_reiserfs /dev/dm-1
> resize_reiserfs 3.6.24
>
> resize_reiserfs: bitmap.c:176: reiserfs_bitmap_set_bit: Assertion `bi=
t_number < bm->bm_bit_size' failed.
> Aborted
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
