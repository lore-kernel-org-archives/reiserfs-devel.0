From: Joachim Zobel <jzobel@heute-morgen.de>
Subject: Re: Yet another reiserfs<dm<md corruption
Date: Mon, 11 Apr 2005 21:14:47 +0200
Message-ID: <1113246888.4614.12.camel@localhost>
Reply-To: jzobel@heute-morgen.de
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Q8HKvxM2Ro378t5aF5JE"
Return-path: <reiserfs-list-return-23849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-Q8HKvxM2Ro378t5aF5JE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Montag, den 11.04.2005, 22:04 +0400 schrieb E.Gryaznova:

> Would you please send the following commands outputs?:
> # dmsetup deps
> # dmsetup status
> # dmsetup info
> # pvdisplay --map
> # lvdisplay --map -vv
> 
> 
> # ls -l /dev/vg (and /dev/mapper)
> 

See the attached file reiserfs.log

The devices 
volg2-logv4: 1 dependencies     : (22, 3)
volg2-logv3: 1 dependencies     : (22, 3)
volg2-logv2: 1 dependencies     : (22, 3)
where created after the incident. 
One of them had a successful (some files lost) reiserfsck --rebuild-tree
after dd-ing the bad /dev/volg-raid1/logv1 on it. 

lvdisplay --map -v did some stderr output, which is attached as
lvdisplay.err

#cat /proc/mdstat
Personalities : [raid1]
md0 : active raid1 hda2[0] hdc2[1]
      3903680 blocks [2/2] [UU]

Sincerely,
Joachim


--=-Q8HKvxM2Ro378t5aF5JE
Content-Disposition: attachment; filename=reiserfs.log
Content-Type: text/x-log; name=reiserfs.log; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

volg1-logv1: 1 dependencies	: (3, 3)
volg2-logv4: 1 dependencies	: (22, 3)
volg2-logv3: 1 dependencies	: (22, 3)
volg2-logv2: 1 dependencies	: (22, 3)
volg--raid1-logv1: 1 dependencies	: (9, 0)
volg2-logv1: 1 dependencies	: (22, 3)
Name:              volg1-logv1
State:             ACTIVE
Tables present:    LIVE
Open count:        2
Event number:      0
Major, minor:      253, 4
Number of targets: 1
UUID: 1tqG5yiemwSFQ1GkmcLPjADrYb49GDL6tmRbgVAKBTTJkcP4guS3233G050fPg4Z

Name:              volg2-logv4
State:             ACTIVE
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 3
Number of targets: 1
UUID: 5XONhMOETPyUyPMWbcQoiykA5V0nF0DvwC3Dq9RzreO6HVnQL6aYGImslX3QjAia

Name:              volg2-logv3
State:             ACTIVE
Tables present:    LIVE
Open count:        2
Event number:      0
Major, minor:      253, 2
Number of targets: 1
UUID: 5XONhMOETPyUyPMWbcQoiykA5V0nF0DvVA3yDXRqBpulFXsNm2XGAqkd7NBZdyqm

Name:              volg2-logv2
State:             ACTIVE
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 1
Number of targets: 1
UUID: 5XONhMOETPyUyPMWbcQoiykA5V0nF0DvPmnxVsFv15nIx0TjLB9xxPvMCMqd0hXw

Name:              volg--raid1-logv1
State:             ACTIVE
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 5
Number of targets: 1
UUID: KPkKyaMKCH6nI4WrSeOBWwx8ED4uLBgpeMyOHrc8J6bv6oyinwTfJJQ44VZvk2Cl

Name:              volg2-logv1
State:             ACTIVE
Tables present:    LIVE
Open count:        2
Event number:      0
Major, minor:      253, 0
Number of targets: 1
UUID: 5XONhMOETPyUyPMWbcQoiykA5V0nF0Dvwk5eMkAO22ulJ6oTGORSE19U01xDGk60

volg1-logv1: 0 4194304 linear 
volg2-logv4: 0 4194304 linear 
volg2-logv3: 0 4194304 linear 
volg2-logv2: 0 4194304 linear 
volg--raid1-logv1: 0 4194304 linear 
volg2-logv1: 0 10485760 linear 
  --- Physical volume ---
  PV Name               /dev/hdc3
  VG Name               volg2
  PV Size               11,38 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              2912
  Free PE               96
  Allocated PE          2816
  PV UUID               DspSyy-tH0u-hRqs-Ivil-JnrZ-TOBk-SlGCHn
   
  --- Physical volume ---
  PV Name               /dev/hda3
  VG Name               volg1
  PV Size               3,76 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              962
  Free PE               450
  Allocated PE          512
  PV UUID               DiN2N2-vadu-imxg-FWmW-QJ84-bLDr-E7S9hj
   
  --- Physical volume ---
  PV Name               /dev/md0
  VG Name               volg-raid1
  PV Size               3,72 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              952
  Free PE               440
  Allocated PE          512
  PV UUID               C6aX8y-qezV-ZDYH-z2OW-X2gC-6laf-CBykKp
   
  --- Logical volume ---
  LV Name                /dev/volg2/logv1
  VG Name                volg2
  LV UUID                wk5eMk-AO22-ulJ6-oTGO-RSE1-9U01-xDGk60
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                5,00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
   
  --- Segments ---
  Logical extent 0 to 1279:
    Type		linear
    Physical volume	/dev/hdc3
    Physical extents	0 to 1279
   
   
  --- Logical volume ---
  LV Name                /dev/volg2/logv2
  VG Name                volg2
  LV UUID                PmnxVs-Fv15-nIx0-TjLB-9xxP-vMCM-qd0hXw
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2,00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1
   
  --- Segments ---
  Logical extent 0 to 511:
    Type		linear
    Physical volume	/dev/hdc3
    Physical extents	1280 to 1791
   
   
  --- Logical volume ---
  LV Name                /dev/volg2/logv3
  VG Name                volg2
  LV UUID                VA3yDX-RqBp-ulFX-sNm2-XGAq-kd7N-BZdyqm
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                2,00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2
   
  --- Segments ---
  Logical extent 0 to 511:
    Type		linear
    Physical volume	/dev/hdc3
    Physical extents	1792 to 2303
   
   
  --- Logical volume ---
  LV Name                /dev/volg2/logv4
  VG Name                volg2
  LV UUID                wC3Dq9-Rzre-O6HV-nQL6-aYGI-mslX-3QjAia
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2,00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3
   
  --- Segments ---
  Logical extent 0 to 511:
    Type		linear
    Physical volume	/dev/hdc3
    Physical extents	2304 to 2815
   
   
  --- Logical volume ---
  LV Name                /dev/volg1/logv1
  VG Name                volg1
  LV UUID                tmRbgV-AKBT-TJkc-P4gu-S323-3G05-0fPg4Z
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                2,00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:4
   
  --- Segments ---
  Logical extent 0 to 511:
    Type		linear
    Physical volume	/dev/hda3
    Physical extents	0 to 511
   
   
  --- Logical volume ---
  LV Name                /dev/volg-raid1/logv1
  VG Name                volg-raid1
  LV UUID                eMyOHr-c8J6-bv6o-yinw-TfJJ-Q44V-Zvk2Cl
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2,00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:5
   
  --- Segments ---
  Logical extent 0 to 511:
    Type		linear
    Physical volume	/dev/md0
    Physical extents	0 to 511
   
   
/dev/volg1:
insgesamt 0
lrwxrwxrwx  1 root root 23 2005-04-11 07:23 logv1 -> /dev/mapper/volg1-logv1

/dev/volg2:
insgesamt 0
lrwxrwxrwx  1 root root 23 2005-04-11 07:23 logv1 -> /dev/mapper/volg2-logv1
lrwxrwxrwx  1 root root 23 2005-04-11 07:23 logv2 -> /dev/mapper/volg2-logv2
lrwxrwxrwx  1 root root 23 2005-04-11 07:23 logv3 -> /dev/mapper/volg2-logv3
lrwxrwxrwx  1 root root 23 2005-04-11 07:23 logv4 -> /dev/mapper/volg2-logv4

/dev/volg-raid1:
insgesamt 0
lrwxrwxrwx  1 root root 29 2005-04-11 07:23 logv1 -> /dev/mapper/volg--raid1-logv1
insgesamt 0
crw-------  1 root root  10, 63 2005-04-11 07:23 control
brw-------  1 root root 253,  4 2005-04-11 07:23 volg1-logv1
brw-------  1 root root 253,  0 2005-04-11 07:23 volg2-logv1
brw-------  1 root root 253,  1 2005-04-11 07:23 volg2-logv2
brw-------  1 root root 253,  2 2005-04-11 07:23 volg2-logv3
brw-------  1 root root 253,  3 2005-04-11 07:23 volg2-logv4
brw-------  1 root root 253,  5 2005-04-11 07:23 volg--raid1-logv1

--=-Q8HKvxM2Ro378t5aF5JE
Content-Disposition: attachment; filename=lvdisplay.err
Content-Type: text/plain; name=lvdisplay.err; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Finding all logical volumes
      /dev/md0: lvm2 label detected
      /dev/hda1: No label detected
      /dev/hdc1: No label detected
      /dev/hda2: lvm2 label detected
      Ignoring duplicate PV C6aX8yqezVZDYHz2OWX2gC6lafCBykKp on /dev/hda2 - using md /dev/md0
      /dev/hdc2: lvm2 label detected
      Ignoring duplicate PV C6aX8yqezVZDYHz2OWX2gC6lafCBykKp on /dev/hdc2 - using md /dev/md0
      /dev/hda3: lvm2 label detected
      /dev/hdc3: lvm2 label detected
      Locking /var/lock/lvm/V_volg2 RB
      /dev/hdc3: lvm2 label detected
      Setting activation/missing_stripe_filler to /dev/ioerror
      Unlocking /var/lock/lvm/V_volg2
      Locking /var/lock/lvm/V_volg1 RB
      /dev/hda3: lvm2 label detected
      Unlocking /var/lock/lvm/V_volg1
      Locking /var/lock/lvm/V_volg-raid1 RB
      /dev/md0: lvm2 label detected
      Unlocking /var/lock/lvm/V_volg-raid1

--=-Q8HKvxM2Ro378t5aF5JE--

