From: Jose R R <Jose.r.r@metztli-it.com>
Subject: ata1.00: exception Emask 0x0 SAct 0x7f00000c SErr 0x0 action 0x6 frozen
Date: Fri, 18 Mar 2016 19:57:55 -0700
Message-ID: <CAM12Q5TaFZJ_AW1tOucgoOK+VPiORgmha=HNrmer=V9rRWgV1Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:date:message-id:subject:from:to;
        bh=Q66lXrRBe2evf0kCzxC8UbD/iYzXPdKpr0JXIZ9FNl4=;
        b=zCeCRINv4O45akRyUMldsnx7XIxcOXECV8+xF0lPfeidj7gzd5MpUwYsL9mvcvNl8X
         D5g5ebZe1HbOYXBdth5xUBcwrHctcu5mMBbif6e/4yGDjBHHmEOZU9sZPTNpVlcvD/Dk
         T4XxS0OjQ1rywTYGldYv4fmwGb7Mh5HAweD4seNIvhC9ynoD/BFtYZK8mS8pdyE6tz9V
         d/soETAPl0aahjD69hB3ANPsALkkWpUriq3LncxqhknvJ3+v/Lu/mkD6gtqKQNXGpuun
         p28irVGLYpYxTPEnDhd8uFkjBvimAxwM+8pdvyGO10rq3WUhE8acHlcwVplivYIsXZm7
         qyuQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org

Niltze, all-

Any insight appreciated. Thank you.

Using SFRN 4.0.1 Reiser4*-patched kernel source 4.4.6-2 UDEB in unstable d-i
*(reiser4-for-4.4.0.patch.gz)

It has already happened 3 times during my test install in VirtualBox
5.0.14 and 5.0.16

[...]
Mar 19 01:03:38 anna-install: Installing partman-auto-lvm
Mar 19 01:03:38 anna[3589]: DEBUG: retrieving e2fsprogs-udeb
1.43~WIP.2016.03.15-2
Mar 19 01:03:40 anna[3589]: DEBUG: retrieving lvm2-udeb 2.02.146-1
Mar 19 01:03:42 anna[3589]: DEBUG: retrieving partman-auto-lvm 59
Mar 19 01:03:43 anna[3589]: DEBUG: retrieving partman-lvm 112
Mar 19 01:03:46 anna-install: Installing partman-auto-crypto
Mar 19 01:03:46 anna[3736]: DEBUG: retrieving partman-auto-crypto 24
Mar 19 01:03:48 anna[3736]: DEBUG: retrieving partman-crypto 87
Mar 19 01:03:50 kernel: [  463.246921] ntfs: driver 2.1.32 [Flags: R/W MODULE].
Mar 19 01:03:51 kernel: [  463.323580] raid6: sse2x1   gen()  3377 MB/s
Mar 19 01:03:51 kernel: [  463.402165] raid6: sse2x1   xor()  2977 MB/s
Mar 19 01:03:51 kernel: [  463.472176] raid6: sse2x2   gen()  5881 MB/s
Mar 19 01:03:51 kernel: [  463.543505] raid6: sse2x2   xor()  5213 MB/s
Mar 19 01:03:51 kernel: [  463.622093] raid6: sse2x4   gen() 11703 MB/s
Mar 19 01:03:51 kernel: [  463.692105] raid6: sse2x4   xor()  8443 MB/s
Mar 19 01:03:51 kernel: [  463.692108] raid6: using algorithm sse2x4
gen() 11703 MB/s
Mar 19 01:03:51 kernel: [  463.692109] raid6: .... xor() 8443 MB/s, rmw enabled
Mar 19 01:03:51 kernel: [  463.692111] raid6: using ssse3x2 recovery algorithm
Mar 19 01:03:51 kernel: [  463.693511] xor: automatically using best
checksumming function:
Mar 19 01:03:51 kernel: [  463.762093]    avx       : 39088.000 MB/sec
Mar 19 01:03:51 kernel: [  463.773480] Btrfs loaded
Mar 19 01:03:51 kernel: [  463.785316] JFS: nTxBlock = 7975, nTxLock = 63801
Mar 19 01:03:51 kernel: [  463.797510] Loading Reiser4 (format
release: 4.0.1) See www.namesys.com for a description of Reiser4.
Mar 19 01:03:51 kernel: [  463.811589] SGI XFS with ACLs, security
attributes, realtime, no debug enabled
Mar 19 01:03:51 md-devices: mdadm: No arrays found in config file or
automatically
Mar 19 01:03:51 kernel: [  464.061106] device-mapper: uevent: version 1.0.3
Mar 19 01:03:51 kernel: [  464.061349] device-mapper: ioctl:
4.34.0-ioctl (2015-10-28) initialised: dm-devel@redhat.com
Mar 19 01:03:51 partman:   No matching physical volumes found
Mar 19 01:03:51 partman:   Reading all physical volumes.  This may
take a while...
Mar 19 01:06:47 partman: mke2fs 1.43-WIP (15-Mar-2016)
Mar 19 01:06:49 partman: mke2fs 1.43-WIP (15-Mar-2016)
Mar 19 01:06:57 kernel: [  649.939221] reiser4: sda6: found disk format 4.0.1.
Mar 19 01:06:57 kernel: [  649.950236] reiser4: sda6: using Hybrid
Transaction Model.
Mar 19 01:06:57 kernel: [  650.164258] EXT4-fs (sda1): mounting ext2
file system using the ext4 subsystem
Mar 19 01:06:57 kernel: [  650.205386] EXT4-fs (sda1): mounted
filesystem without journal. Opts: (null)
Mar 19 01:06:57 kernel: [  650.283688] EXT4-fs (sda5): mounted
filesystem with ordered data mode. Opts: (null)
Mar 19 01:06:58 apt-install: Queueing package e2fsprogs for later installation
Mar 19 01:06:58 apt-install: Queueing package reiser4progs for later
installation
Mar 19 01:06:58 apt-install: Queueing package initramfs-tools for
later installation
Mar 19 01:06:58 apt-install: Queueing package linux-base for later installation
Mar 19 01:06:58 apt-install: Queueing package ca-certificates for
later installation
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/free_space/50new/do_option:
Mar 19 01:06:58 main-menu[3206]: (process:3575): line 226:
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/active_partition/copy/choices: not found
Mar 19 01:06:58 main-menu[3206]: (process:3575):
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/free_space/50new/do_option:
Mar 19 01:06:58 main-menu[3206]: (process:3575): line 226:
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/active_partition/copy/choices: not found
Mar 19 01:06:58 main-menu[3206]: (process:3575):
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/free_space/50new/do_option:
Mar 19 01:06:58 main-menu[3206]: (process:3575): line 226:
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/active_partition/copy/choices: not found
Mar 19 01:06:58 main-menu[3206]: (process:3575):
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/free_space/50new/do_option:
Mar 19 01:06:58 main-menu[3206]: (process:3575): line 226:
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/active_partition/copy/choices: not found
Mar 19 01:06:58 main-menu[3206]: (process:3575):
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/free_space/50new/do_option:
Mar 19 01:06:58 main-menu[3206]: (process:3575): line 226:
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/active_partition/copy/choices: not found
Mar 19 01:06:58 main-menu[3206]: (process:3575):
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/free_space/50new/do_option:
Mar 19 01:06:58 main-menu[3206]: (process:3575): line 226:
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/active_partition/copy/choices: not found
Mar 19 01:06:58 main-menu[3206]: (process:3575):
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/free_space/50new/do_option:
Mar 19 01:06:58 main-menu[3206]: (process:3575): line 226:
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/active_partition/copy/choices: not found
Mar 19 01:06:58 main-menu[3206]: (process:3575):
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/free_space/50new/do_option:
Mar 19 01:06:58 main-menu[3206]: (process:3575): line 226:
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/active_partition/copy/choices: not found
Mar 19 01:06:58 main-menu[3206]: (process:3575):
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/free_space/50new/do_option:
Mar 19 01:06:58 main-menu[3206]: (process:3575): line 226:
Mar 19 01:06:58 main-menu[3206]: (process:3575):
/lib/partman/active_partition/copy/choices: not found
Mar 19 01:06:58 main-menu[3206]: (process:3575):
Mar 19 01:06:59 main-menu[3206]: INFO: Falling back to the package
description for brltty-udeb
Mar 19 01:07:01 main-menu[3206]: INFO: Falling back to the package
description for brltty-udeb
Mar 19 01:07:01 main-menu[3206]: INFO: Menu item 'bootstrap-base' selected
Mar 19 01:07:05 debootstrap: gpgv: Signature made Fri Mar 18 21:10:38
2016 UTC using RSA key ID 46925553
Mar 19 01:07:05 debootstrap:
Mar 19 01:07:05 debootstrap: gpgv: Good signature from "Debian Archive
Automatic Signing Key (7.0/wheezy) <ftpmaster@debian.org>"
Mar 19 01:07:05 debootstrap:
Mar 19 01:07:05 debootstrap: gpgv: Signature made Fri Mar 18 21:10:38
2016 UTC using RSA key ID 2B90D010
Mar 19 01:07:05 debootstrap:
Mar 19 01:07:05 debootstrap: gpgv: Good signature from "Debian Archive
Automatic Signing Key (8/jessie) <ftpmaster@debian.org>"
Mar 19 01:07:05 debootstrap:
Mar 19 01:07:36 kernel: [  688.978500] atkbd serio0: Spurious NAK on
isa0060/serio0. Some program might be trying to access hardware
directly.
Mar 19 01:11:03 init: starting pid 177, tty '/dev/tty2': '-/bin/sh'
Mar 19 01:12:02 kernel: [  954.966856] ata1.00: exception Emask 0x0
SAct 0x7f00000c SErr 0x0 action 0x6 frozen

Mar 19 01:12:02 kernel: [  954.966856] ata1.00: exception Emask 0x0
SAct 0x7f00000c SErr 0x0 action 0x6 frozen
Mar 19 01:12:02 kernel: [  954.966869] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:02 kernel: [  954.966882] ata1.00: cmd
61/00:10:c8:f0:14/08:00:00:00:00/40 tag 2 ncq 1048576 out
Mar 19 01:12:02 kernel: [  954.966882]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:02 kernel: [  954.966888] ata1.00: status: { DRDY }
Mar 19 01:12:02 kernel: [  954.966892] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:02 kernel: [  954.966902] ata1.00: cmd
61/00:18:c8:f8:14/08:00:00:00:00/40 tag 3 ncq 1048576 out
Mar 19 01:12:02 kernel: [  954.966902]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:02 kernel: [  954.966907] ata1.00: status: { DRDY }
Mar 19 01:12:02 kernel: [  954.966912] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:02 kernel: [  954.966922] ata1.00: cmd
61/00:c0:c8:b8:14/08:00:00:00:00/40 tag 24 ncq 1048576 out
Mar 19 01:12:02 kernel: [  954.966922]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:02 kernel: [  954.966927] ata1.00: status: { DRDY }
Mar 19 01:12:02 kernel: [  954.966931] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:02 kernel: [  954.966941] ata1.00: cmd
61/00:c8:c8:c0:14/08:00:00:00:00/40 tag 25 ncq 1048576 out
Mar 19 01:12:02 kernel: [  954.966941]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:02 kernel: [  954.966945] ata1.00: status: { DRDY }
Mar 19 01:12:02 kernel: [  954.966949] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:02 kernel: [  954.966959] ata1.00: cmd
61/00:d0:c8:c8:14/08:00:00:00:00/40 tag 26 ncq 1048576 out
Mar 19 01:12:02 kernel: [  954.966959]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:02 kernel: [  954.966964] ata1.00: status: { DRDY }
Mar 19 01:12:02 kernel: [  954.966967] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:02 kernel: [  954.966977] ata1.00: cmd
61/00:d8:c8:d0:14/08:00:00:00:00/40 tag 27 ncq 1048576 out
Mar 19 01:12:02 kernel: [  954.966977]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:02 kernel: [  954.966982] ata1.00: status: { DRDY }
Mar 19 01:12:02 kernel: [  954.966986] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:02 kernel: [  954.966995] ata1.00: cmd
61/00:e0:c8:d8:14/08:00:00:00:00/40 tag 28 ncq 1048576 out
Mar 19 01:12:02 kernel: [  954.966995]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:02 kernel: [  954.967000] ata1.00: status: { DRDY }
Mar 19 01:12:02 kernel: [  954.967004] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:02 kernel: [  954.967013] ata1.00: cmd
61/00:e8:c8:e0:14/08:00:00:00:00/40 tag 29 ncq 1048576 out
Mar 19 01:12:02 kernel: [  954.967013]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:02 kernel: [  954.967018] ata1.00: status: { DRDY }
Mar 19 01:12:02 kernel: [  954.967022] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:02 kernel: [  954.967031] ata1.00: cmd
61/00:f0:c8:e8:14/08:00:00:00:00/40 tag 30 ncq 1048576 out
Mar 19 01:12:02 kernel: [  954.967031]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:02 kernel: [  954.967036] ata1.00: status: { DRDY }
Mar 19 01:12:02 kernel: [  954.967057] ata1: hard resetting link
Mar 19 01:12:02 kernel: [  955.287020] ata1: SATA link up 3.0 Gbps
(SStatus 123 SControl 300)
Mar 19 01:12:02 kernel: [  955.287566] ata1.00: configured for UDMA/133
Mar 19 01:12:02 kernel: [  955.287573] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:02 kernel: [  955.287576] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:02 kernel: [  955.287579] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:02 kernel: [  955.287581] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:02 kernel: [  955.287583] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:02 kernel: [  955.287585] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:02 kernel: [  955.287586] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:02 kernel: [  955.287588] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:02 kernel: [  955.287631] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:02 kernel: [  955.287653] sd 0:0:0:0: [sda] tag#0 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.287658] sd 0:0:0:0: [sda] tag#0 CDB:
Write(10) 2a 00 00 14 70 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.287662] blk_update_request: I/O error,
dev sda, sector 1339592
Mar 19 01:12:02 kernel: [  955.287768] sd 0:0:0:0: [sda] tag#19 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.287772] sd 0:0:0:0: [sda] tag#19 CDB:
Write(10) 2a 00 00 14 68 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.287774] blk_update_request: I/O error,
dev sda, sector 1337544
Mar 19 01:12:02 kernel: [  955.287849] sd 0:0:0:0: [sda] tag#18 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.287852] sd 0:0:0:0: [sda] tag#18 CDB:
Write(10) 2a 00 00 14 60 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.287854] blk_update_request: I/O error,
dev sda, sector 1335496
Mar 19 01:12:02 kernel: [  955.287929] sd 0:0:0:0: [sda] tag#17 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.287932] sd 0:0:0:0: [sda] tag#17 CDB:
Write(10) 2a 00 00 14 58 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.287934] blk_update_request: I/O error,
dev sda, sector 1333448
Mar 19 01:12:02 kernel: [  955.288008] sd 0:0:0:0: [sda] tag#16 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.288011] sd 0:0:0:0: [sda] tag#16 CDB:
Write(10) 2a 00 00 14 50 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.288012] blk_update_request: I/O error,
dev sda, sector 1331400
Mar 19 01:12:02 kernel: [  955.288088] sd 0:0:0:0: [sda] tag#15 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.288091] sd 0:0:0:0: [sda] tag#15 CDB:
Write(10) 2a 00 00 14 48 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.288093] blk_update_request: I/O error,
dev sda, sector 1329352
Mar 19 01:12:02 kernel: [  955.288165] sd 0:0:0:0: [sda] tag#14 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.288168] sd 0:0:0:0: [sda] tag#14 CDB:
Write(10) 2a 00 00 14 40 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.288170] blk_update_request: I/O error,
dev sda, sector 1327304
Mar 19 01:12:02 kernel: [  955.288245] sd 0:0:0:0: [sda] tag#13 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.288248] sd 0:0:0:0: [sda] tag#13 CDB:
Write(10) 2a 00 00 14 38 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.288250] blk_update_request: I/O error,
dev sda, sector 1325256
Mar 19 01:12:02 kernel: [  955.288323] sd 0:0:0:0: [sda] tag#12 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.288326] sd 0:0:0:0: [sda] tag#12 CDB:
Write(10) 2a 00 00 14 30 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.288327] blk_update_request: I/O error,
dev sda, sector 1323208
Mar 19 01:12:02 kernel: [  955.288404] sd 0:0:0:0: [sda] tag#11 FAILED
Result: hostbyte=DID_OK driverbyte=DRIVER_TIMEOUT
Mar 19 01:12:02 kernel: [  955.288407] sd 0:0:0:0: [sda] tag#11 CDB:
Write(10) 2a 00 00 14 28 c8 00 08 00 00
Mar 19 01:12:02 kernel: [  955.288409] blk_update_request: I/O error,
dev sda, sector 1321160
Mar 19 01:12:02 kernel: [  955.289324] ata1: EH complete
Mar 19 01:12:28 kernel: [  981.143128] atkbd serio0: Spurious NAK on
isa0060/serio0. Some program might be trying to access hardware
directly.
Mar 19 01:12:33 kernel: [  985.978884] ata1.00: exception Emask 0x0
SAct 0x487e0000 SErr 0x0 action 0x6 frozen
Mar 19 01:12:33 kernel: [  985.978894] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:33 kernel: [  985.978904] ata1.00: cmd
61/00:88:a0:83:15/08:00:00:00:00/40 tag 17 ncq 1048576 out
Mar 19 01:12:33 kernel: [  985.978904]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:33 kernel: [  985.978908] ata1.00: status: { DRDY }
Mar 19 01:12:33 kernel: [  985.978912] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:33 kernel: [  985.978919] ata1.00: cmd
61/00:90:a0:8b:15/08:00:00:00:00/40 tag 18 ncq 1048576 out
Mar 19 01:12:33 kernel: [  985.978919]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:33 kernel: [  985.978923] ata1.00: status: { DRDY }
Mar 19 01:12:33 kernel: [  985.978926] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:33 kernel: [  985.978932] ata1.00: cmd
61/00:98:a0:93:15/08:00:00:00:00/40 tag 19 ncq 1048576 out
Mar 19 01:12:33 kernel: [  985.978932]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:33 kernel: [  985.978936] ata1.00: status: { DRDY }
Mar 19 01:12:33 kernel: [  985.978939] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:33 kernel: [  985.978946] ata1.00: cmd
61/e0:a0:a0:9b:15/05:00:00:00:00/40 tag 20 ncq 770048 out
Mar 19 01:12:33 kernel: [  985.978946]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:33 kernel: [  985.978949] ata1.00: status: { DRDY }
Mar 19 01:12:33 kernel: [  985.978952] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:33 kernel: [  985.978959] ata1.00: cmd
61/20:a8:80:a1:15/02:00:00:00:00/40 tag 21 ncq 278528 out
Mar 19 01:12:33 kernel: [  985.978959]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:33 kernel: [  985.978962] ata1.00: status: { DRDY }
Mar 19 01:12:33 kernel: [  985.978965] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:33 kernel: [  985.978972] ata1.00: cmd
61/a8:b0:a0:a3:15/06:00:00:00:00/40 tag 22 ncq 872448 out
Mar 19 01:12:33 kernel: [  985.978972]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:33 kernel: [  985.978976] ata1.00: status: { DRDY }
Mar 19 01:12:33 kernel: [  985.978979] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:33 kernel: [  985.978986] ata1.00: cmd
61/fc:d8:1e:92:0c/01:00:00:00:00/40 tag 27 ncq 260096 out
Mar 19 01:12:33 kernel: [  985.978986]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:33 kernel: [  985.978989] ata1.00: status: { DRDY }
Mar 19 01:12:33 kernel: [  985.978992] ata1.00: failed command: WRITE
FPDMA QUEUED
Mar 19 01:12:33 kernel: [  985.978999] ata1.00: cmd
61/30:f0:48:aa:15/03:00:00:00:00/40 tag 30 ncq 417792 out
Mar 19 01:12:33 kernel: [  985.978999]          res
40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
Mar 19 01:12:33 kernel: [  985.979002] ata1.00: status: { DRDY }
Mar 19 01:12:33 kernel: [  985.979018] ata1: hard resetting link
Mar 19 01:12:33 kernel: [  986.299234] ata1: SATA link up 3.0 Gbps
(SStatus 123 SControl 300)
Mar 19 01:12:33 kernel: [  986.300228] ata1.00: configured for UDMA/133
Mar 19 01:12:33 kernel: [  986.300241] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:33 kernel: [  986.300246] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:33 kernel: [  986.300250] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:33 kernel: [  986.300254] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:33 kernel: [  986.300258] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:33 kernel: [  986.300262] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:33 kernel: [  986.300266] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:33 kernel: [  986.300271] ata1.00: device reported
invalid CHS sector 0
Mar 19 01:12:33 kernel: [  986.300295] ata1: EH complete
Mar 19 01:16:07 kernel: [ 1200.190994] INFO: task wget:11559 blocked
for more than 120 seconds.
Mar 19 01:16:07 kernel: [ 1200.191006]       Not tainted 4.4.0-1-amd64 #1
Mar 19 01:16:07 kernel: [ 1200.191009] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Mar 19 01:16:07 kernel: [ 1200.191013] wget            D
ffff88003e215900     0 11559   9142 0x00000000
Mar 19 01:16:07 kernel: [ 1200.191024]  ffff88002d4a5100
ffffffff81a11500 ffff88002d048000 ffff88003fad2150
Mar 19 01:16:07 kernel: [ 1200.191032]  00000000ffffd8ed
ffff88003fad2178 0000000000000000 ffff88003c312380
Mar 19 01:16:07 kernel: [ 1200.191038]  ffffffff8158b0e1
ffff88003fad2108 ffffffffa041cd7b 0000000000000000
Mar 19 01:16:07 kernel: [ 1200.191044] Call Trace:
Mar 19 01:16:07 kernel: [ 1200.191065]  [<ffffffff8158b0e1>] ?
schedule+0x31/0x80
Mar 19 01:16:07 kernel: [ 1200.191108]  [<ffffffffa041cd7b>] ?
reiser4_go_to_sleep+0x4b/0x90 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191119]  [<ffffffff810b65f0>] ?
wake_atomic_t_function+0x60/0x60
Mar 19 01:16:07 kernel: [ 1200.191153]  [<ffffffffa0423955>] ?
capture_fuse_wait.part.28+0x155/0x160 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191183]  [<ffffffffa0421df0>] ?
atom_can_be_committed.part.14+0x10/0x10 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191211]  [<ffffffffa04246ca>] ?
reiser4_try_capture+0x56a/0xb30 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191219]  [<ffffffff81481d00>] ?
__alloc_skb+0x60/0x1e0
Mar 19 01:16:07 kernel: [ 1200.191228]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:16:07 kernel: [ 1200.191255]  [<ffffffffa041cf23>] ?
longterm_lock_znode+0x163/0x4d0 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191287]  [<ffffffffa042b82a>] ?
cbk_cache_search+0x17a/0x280 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191313]  [<ffffffffa042c702>] ?
reiser4_object_lookup+0xf2/0x160 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191350]  [<ffffffffa044857a>] ?
reiser4_find_entry+0xca/0x360 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191360]  [<ffffffff814d5549>] ?
ip_finish_output2+0x159/0x340
Mar 19 01:16:07 kernel: [ 1200.191391]  [<ffffffffa0448fed>] ?
reiser4_lookup_name+0x8d/0x140 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191426]  [<ffffffffa0438983>] ?
reiser4_lookup_common+0x63/0x150 [reiser4]
Mar 19 01:16:07 kernel: [ 1200.191460]  [<ffffffff811ef915>] ? d_alloc+0x55/0x60
Mar 19 01:16:07 kernel: [ 1200.191470]  [<ffffffff811e0a59>] ?
lookup_real+0x19/0x60
Mar 19 01:16:07 kernel: [ 1200.191479]  [<ffffffff811e58cd>] ?
path_openat+0xbbd/0x12f0
Mar 19 01:16:07 kernel: [ 1200.191485]  [<ffffffff811e71b1>] ?
do_filp_open+0x91/0x100
Mar 19 01:16:07 kernel: [ 1200.191494]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:16:07 kernel: [ 1200.191504]  [<ffffffff811d6769>] ?
do_sys_open+0x139/0x220
Mar 19 01:16:07 kernel: [ 1200.191512]  [<ffffffff8158edf2>] ?
system_call_fast_compare_end+0xc/0x67
Mar 19 01:18:07 kernel: [ 1320.190898] INFO: task wget:11559 blocked
for more than 120 seconds.
Mar 19 01:18:07 kernel: [ 1320.190910]       Not tainted 4.4.0-1-amd64 #1
Mar 19 01:18:07 kernel: [ 1320.190913] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Mar 19 01:18:07 kernel: [ 1320.190917] wget            D
ffff88003e215900     0 11559   9142 0x00000000
Mar 19 01:18:07 kernel: [ 1320.190929]  ffff88002d4a5100
ffffffff81a11500 ffff88002d048000 ffff88003fad2150
Mar 19 01:18:07 kernel: [ 1320.190936]  00000000ffffd8ed
ffff88003fad2178 0000000000000000 ffff88003c312380
Mar 19 01:18:07 kernel: [ 1320.190942]  ffffffff8158b0e1
ffff88003fad2108 ffffffffa041cd7b 0000000000000000
Mar 19 01:18:07 kernel: [ 1320.190948] Call Trace:
Mar 19 01:18:07 kernel: [ 1320.190969]  [<ffffffff8158b0e1>] ?
schedule+0x31/0x80
Mar 19 01:18:07 kernel: [ 1320.191011]  [<ffffffffa041cd7b>] ?
reiser4_go_to_sleep+0x4b/0x90 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191022]  [<ffffffff810b65f0>] ?
wake_atomic_t_function+0x60/0x60
Mar 19 01:18:07 kernel: [ 1320.191055]  [<ffffffffa0423955>] ?
capture_fuse_wait.part.28+0x155/0x160 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191085]  [<ffffffffa0421df0>] ?
atom_can_be_committed.part.14+0x10/0x10 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191113]  [<ffffffffa04246ca>] ?
reiser4_try_capture+0x56a/0xb30 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191122]  [<ffffffff81481d00>] ?
__alloc_skb+0x60/0x1e0
Mar 19 01:18:07 kernel: [ 1320.191130]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:18:07 kernel: [ 1320.191158]  [<ffffffffa041cf23>] ?
longterm_lock_znode+0x163/0x4d0 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191198]  [<ffffffffa042b82a>] ?
cbk_cache_search+0x17a/0x280 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191227]  [<ffffffffa042c702>] ?
reiser4_object_lookup+0xf2/0x160 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191263]  [<ffffffffa044857a>] ?
reiser4_find_entry+0xca/0x360 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191274]  [<ffffffff814d5549>] ?
ip_finish_output2+0x159/0x340
Mar 19 01:18:07 kernel: [ 1320.191306]  [<ffffffffa0448fed>] ?
reiser4_lookup_name+0x8d/0x140 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191341]  [<ffffffffa0438983>] ?
reiser4_lookup_common+0x63/0x150 [reiser4]
Mar 19 01:18:07 kernel: [ 1320.191350]  [<ffffffff811ef915>] ? d_alloc+0x55/0x60
Mar 19 01:18:07 kernel: [ 1320.191358]  [<ffffffff811e0a59>] ?
lookup_real+0x19/0x60
Mar 19 01:18:07 kernel: [ 1320.191367]  [<ffffffff811e58cd>] ?
path_openat+0xbbd/0x12f0
Mar 19 01:18:07 kernel: [ 1320.191373]  [<ffffffff811e71b1>] ?
do_filp_open+0x91/0x100
Mar 19 01:18:07 kernel: [ 1320.191382]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:18:07 kernel: [ 1320.191391]  [<ffffffff811d6769>] ?
do_sys_open+0x139/0x220
Mar 19 01:18:07 kernel: [ 1320.191399]  [<ffffffff8158edf2>] ?
system_call_fast_compare_end+0xc/0x67
Mar 19 01:20:07 kernel: [ 1440.190924] INFO: task wget:11559 blocked
for more than 120 seconds.
Mar 19 01:20:07 kernel: [ 1440.190935]       Not tainted 4.4.0-1-amd64 #1
Mar 19 01:20:07 kernel: [ 1440.190938] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Mar 19 01:20:07 kernel: [ 1440.190943] wget            D
ffff88003e215900     0 11559   9142 0x00000000
Mar 19 01:20:07 kernel: [ 1440.190955]  ffff88002d4a5100
ffffffff81a11500 ffff88002d048000 ffff88003fad2150
Mar 19 01:20:07 kernel: [ 1440.190962]  00000000ffffd8ed
ffff88003fad2178 0000000000000000 ffff88003c312380
Mar 19 01:20:07 kernel: [ 1440.190968]  ffffffff8158b0e1
ffff88003fad2108 ffffffffa041cd7b 0000000000000000
Mar 19 01:20:07 kernel: [ 1440.190975] Call Trace:
Mar 19 01:20:07 kernel: [ 1440.190996]  [<ffffffff8158b0e1>] ?
schedule+0x31/0x80
Mar 19 01:20:07 kernel: [ 1440.191038]  [<ffffffffa041cd7b>] ?
reiser4_go_to_sleep+0x4b/0x90 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191049]  [<ffffffff810b65f0>] ?
wake_atomic_t_function+0x60/0x60
Mar 19 01:20:07 kernel: [ 1440.191083]  [<ffffffffa0423955>] ?
capture_fuse_wait.part.28+0x155/0x160 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191113]  [<ffffffffa0421df0>] ?
atom_can_be_committed.part.14+0x10/0x10 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191142]  [<ffffffffa04246ca>] ?
reiser4_try_capture+0x56a/0xb30 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191150]  [<ffffffff81481d00>] ?
__alloc_skb+0x60/0x1e0
Mar 19 01:20:07 kernel: [ 1440.191158]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:20:07 kernel: [ 1440.191186]  [<ffffffffa041cf23>] ?
longterm_lock_znode+0x163/0x4d0 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191217]  [<ffffffffa042b82a>] ?
cbk_cache_search+0x17a/0x280 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191245]  [<ffffffffa042c702>] ?
reiser4_object_lookup+0xf2/0x160 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191282]  [<ffffffffa044857a>] ?
reiser4_find_entry+0xca/0x360 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191291]  [<ffffffff814d5549>] ?
ip_finish_output2+0x159/0x340
Mar 19 01:20:07 kernel: [ 1440.191323]  [<ffffffffa0448fed>] ?
reiser4_lookup_name+0x8d/0x140 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191357]  [<ffffffffa0438983>] ?
reiser4_lookup_common+0x63/0x150 [reiser4]
Mar 19 01:20:07 kernel: [ 1440.191366]  [<ffffffff811ef915>] ? d_alloc+0x55/0x60
Mar 19 01:20:07 kernel: [ 1440.191374]  [<ffffffff811e0a59>] ?
lookup_real+0x19/0x60
Mar 19 01:20:07 kernel: [ 1440.191382]  [<ffffffff811e58cd>] ?
path_openat+0xbbd/0x12f0
Mar 19 01:20:07 kernel: [ 1440.191388]  [<ffffffff811e71b1>] ?
do_filp_open+0x91/0x100
Mar 19 01:20:07 kernel: [ 1440.191397]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:20:07 kernel: [ 1440.191406]  [<ffffffff811d6769>] ?
do_sys_open+0x139/0x220
Mar 19 01:20:07 kernel: [ 1440.191414]  [<ffffffff8158edf2>] ?
system_call_fast_compare_end+0xc/0x67
Mar 19 01:22:07 kernel: [ 1560.190923] INFO: task wget:11559 blocked
for more than 120 seconds.
Mar 19 01:22:07 kernel: [ 1560.190935]       Not tainted 4.4.0-1-amd64 #1
Mar 19 01:22:07 kernel: [ 1560.190938] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Mar 19 01:22:07 kernel: [ 1560.190942] wget            D
ffff88003e215900     0 11559   9142 0x00000000
Mar 19 01:22:07 kernel: [ 1560.190954]  ffff88002d4a5100
ffffffff81a11500 ffff88002d048000 ffff88003fad2150
Mar 19 01:22:07 kernel: [ 1560.190962]  00000000ffffd8ed
ffff88003fad2178 0000000000000000 ffff88003c312380
Mar 19 01:22:07 kernel: [ 1560.190968]  ffffffff8158b0e1
ffff88003fad2108 ffffffffa041cd7b 0000000000000000
Mar 19 01:22:07 kernel: [ 1560.190975] Call Trace:
Mar 19 01:22:07 kernel: [ 1560.190996]  [<ffffffff8158b0e1>] ?
schedule+0x31/0x80
Mar 19 01:22:07 kernel: [ 1560.191038]  [<ffffffffa041cd7b>] ?
reiser4_go_to_sleep+0x4b/0x90 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191050]  [<ffffffff810b65f0>] ?
wake_atomic_t_function+0x60/0x60
Mar 19 01:22:07 kernel: [ 1560.191083]  [<ffffffffa0423955>] ?
capture_fuse_wait.part.28+0x155/0x160 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191113]  [<ffffffffa0421df0>] ?
atom_can_be_committed.part.14+0x10/0x10 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191143]  [<ffffffffa04246ca>] ?
reiser4_try_capture+0x56a/0xb30 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191151]  [<ffffffff81481d00>] ?
__alloc_skb+0x60/0x1e0
Mar 19 01:22:07 kernel: [ 1560.191159]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:22:07 kernel: [ 1560.191187]  [<ffffffffa041cf23>] ?
longterm_lock_znode+0x163/0x4d0 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191219]  [<ffffffffa042b82a>] ?
cbk_cache_search+0x17a/0x280 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191249]  [<ffffffffa042c702>] ?
reiser4_object_lookup+0xf2/0x160 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191287]  [<ffffffffa044857a>] ?
reiser4_find_entry+0xca/0x360 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191296]  [<ffffffff814d5549>] ?
ip_finish_output2+0x159/0x340
Mar 19 01:22:07 kernel: [ 1560.191329]  [<ffffffffa0448fed>] ?
reiser4_lookup_name+0x8d/0x140 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191364]  [<ffffffffa0438983>] ?
reiser4_lookup_common+0x63/0x150 [reiser4]
Mar 19 01:22:07 kernel: [ 1560.191372]  [<ffffffff811ef915>] ? d_alloc+0x55/0x60
Mar 19 01:22:07 kernel: [ 1560.191380]  [<ffffffff811e0a59>] ?
lookup_real+0x19/0x60
Mar 19 01:22:07 kernel: [ 1560.191388]  [<ffffffff811e58cd>] ?
path_openat+0xbbd/0x12f0
Mar 19 01:22:07 kernel: [ 1560.191395]  [<ffffffff811e71b1>] ?
do_filp_open+0x91/0x100
Mar 19 01:22:07 kernel: [ 1560.191404]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:22:07 kernel: [ 1560.191413]  [<ffffffff811d6769>] ?
do_sys_open+0x139/0x220
Mar 19 01:22:07 kernel: [ 1560.191421]  [<ffffffff8158edf2>] ?
system_call_fast_compare_end+0xc/0x67
Mar 19 01:24:07 kernel: [ 1680.190844] INFO: task wget:11559 blocked
for more than 120 seconds.
Mar 19 01:24:07 kernel: [ 1680.190855]       Not tainted 4.4.0-1-amd64 #1
Mar 19 01:24:07 kernel: [ 1680.190859] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Mar 19 01:24:07 kernel: [ 1680.190863] wget            D
ffff88003e215900     0 11559   9142 0x00000000
Mar 19 01:24:07 kernel: [ 1680.190875]  ffff88002d4a5100
ffffffff81a11500 ffff88002d048000 ffff88003fad2150
Mar 19 01:24:07 kernel: [ 1680.190883]  00000000ffffd8ed
ffff88003fad2178 0000000000000000 ffff88003c312380
Mar 19 01:24:07 kernel: [ 1680.190889]  ffffffff8158b0e1
ffff88003fad2108 ffffffffa041cd7b 0000000000000000
Mar 19 01:24:07 kernel: [ 1680.190895] Call Trace:
Mar 19 01:24:07 kernel: [ 1680.190916]  [<ffffffff8158b0e1>] ?
schedule+0x31/0x80
Mar 19 01:24:07 kernel: [ 1680.190958]  [<ffffffffa041cd7b>] ?
reiser4_go_to_sleep+0x4b/0x90 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.190970]  [<ffffffff810b65f0>] ?
wake_atomic_t_function+0x60/0x60
Mar 19 01:24:07 kernel: [ 1680.191004]  [<ffffffffa0423955>] ?
capture_fuse_wait.part.28+0x155/0x160 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.191034]  [<ffffffffa0421df0>] ?
atom_can_be_committed.part.14+0x10/0x10 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.191063]  [<ffffffffa04246ca>] ?
reiser4_try_capture+0x56a/0xb30 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.191073]  [<ffffffff81481d00>] ?
__alloc_skb+0x60/0x1e0
Mar 19 01:24:07 kernel: [ 1680.191081]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:24:07 kernel: [ 1680.191108]  [<ffffffffa041cf23>] ?
longterm_lock_znode+0x163/0x4d0 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.191141]  [<ffffffffa042b82a>] ?
cbk_cache_search+0x17a/0x280 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.191170]  [<ffffffffa042c702>] ?
reiser4_object_lookup+0xf2/0x160 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.191207]  [<ffffffffa044857a>] ?
reiser4_find_entry+0xca/0x360 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.191217]  [<ffffffff814d5549>] ?
ip_finish_output2+0x159/0x340
Mar 19 01:24:07 kernel: [ 1680.191250]  [<ffffffffa0448fed>] ?
reiser4_lookup_name+0x8d/0x140 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.191284]  [<ffffffffa0438983>] ?
reiser4_lookup_common+0x63/0x150 [reiser4]
Mar 19 01:24:07 kernel: [ 1680.191293]  [<ffffffff811ef915>] ? d_alloc+0x55/0x60
Mar 19 01:24:07 kernel: [ 1680.191301]  [<ffffffff811e0a59>] ?
lookup_real+0x19/0x60
Mar 19 01:24:07 kernel: [ 1680.191309]  [<ffffffff811e58cd>] ?
path_openat+0xbbd/0x12f0
Mar 19 01:24:07 kernel: [ 1680.191316]  [<ffffffff811e71b1>] ?
do_filp_open+0x91/0x100
Mar 19 01:24:07 kernel: [ 1680.191325]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:24:07 kernel: [ 1680.191334]  [<ffffffff811d6769>] ?
do_sys_open+0x139/0x220
Mar 19 01:24:07 kernel: [ 1680.191341]  [<ffffffff8158edf2>] ?
system_call_fast_compare_end+0xc/0x67
Mar 19 01:26:07 kernel: [ 1800.190871] INFO: task wget:11559 blocked
for more than 120 seconds.
Mar 19 01:26:07 kernel: [ 1800.190883]       Not tainted 4.4.0-1-amd64 #1
Mar 19 01:26:07 kernel: [ 1800.190886] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Mar 19 01:26:07 kernel: [ 1800.190890] wget            D
ffff88003e215900     0 11559   9142 0x00000000
Mar 19 01:26:07 kernel: [ 1800.190901]  ffff88002d4a5100
ffffffff81a11500 ffff88002d048000 ffff88003fad2150
Mar 19 01:26:07 kernel: [ 1800.190909]  00000000ffffd8ed
ffff88003fad2178 0000000000000000 ffff88003c312380
Mar 19 01:26:07 kernel: [ 1800.190915]  ffffffff8158b0e1
ffff88003fad2108 ffffffffa041cd7b 0000000000000000
Mar 19 01:26:07 kernel: [ 1800.190921] Call Trace:
Mar 19 01:26:07 kernel: [ 1800.190942]  [<ffffffff8158b0e1>] ?
schedule+0x31/0x80
Mar 19 01:26:07 kernel: [ 1800.190984]  [<ffffffffa041cd7b>] ?
reiser4_go_to_sleep+0x4b/0x90 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.190996]  [<ffffffff810b65f0>] ?
wake_atomic_t_function+0x60/0x60
Mar 19 01:26:07 kernel: [ 1800.191030]  [<ffffffffa0423955>] ?
capture_fuse_wait.part.28+0x155/0x160 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.191060]  [<ffffffffa0421df0>] ?
atom_can_be_committed.part.14+0x10/0x10 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.191087]  [<ffffffffa04246ca>] ?
reiser4_try_capture+0x56a/0xb30 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.191096]  [<ffffffff81481d00>] ?
__alloc_skb+0x60/0x1e0
Mar 19 01:26:07 kernel: [ 1800.191105]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:26:07 kernel: [ 1800.191132]  [<ffffffffa041cf23>] ?
longterm_lock_znode+0x163/0x4d0 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.191163]  [<ffffffffa042b82a>] ?
cbk_cache_search+0x17a/0x280 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.191191]  [<ffffffffa042c702>] ?
reiser4_object_lookup+0xf2/0x160 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.191227]  [<ffffffffa044857a>] ?
reiser4_find_entry+0xca/0x360 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.191237]  [<ffffffff814d5549>] ?
ip_finish_output2+0x159/0x340
Mar 19 01:26:07 kernel: [ 1800.191269]  [<ffffffffa0448fed>] ?
reiser4_lookup_name+0x8d/0x140 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.191303]  [<ffffffffa0438983>] ?
reiser4_lookup_common+0x63/0x150 [reiser4]
Mar 19 01:26:07 kernel: [ 1800.191311]  [<ffffffff811ef915>] ? d_alloc+0x55/0x60
Mar 19 01:26:07 kernel: [ 1800.191319]  [<ffffffff811e0a59>] ?
lookup_real+0x19/0x60
Mar 19 01:26:07 kernel: [ 1800.191327]  [<ffffffff811e58cd>] ?
path_openat+0xbbd/0x12f0
Mar 19 01:26:07 kernel: [ 1800.191334]  [<ffffffff811e71b1>] ?
do_filp_open+0x91/0x100
Mar 19 01:26:07 kernel: [ 1800.191343]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:26:07 kernel: [ 1800.191351]  [<ffffffff811d6769>] ?
do_sys_open+0x139/0x220
Mar 19 01:26:07 kernel: [ 1800.191359]  [<ffffffff8158edf2>] ?
system_call_fast_compare_end+0xc/0x67
Mar 19 01:28:07 kernel: [ 1920.190947] INFO: task wget:11559 blocked
for more than 120 seconds.
Mar 19 01:28:07 kernel: [ 1920.190959]       Not tainted 4.4.0-1-amd64 #1
Mar 19 01:28:07 kernel: [ 1920.190962] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Mar 19 01:28:07 kernel: [ 1920.190966] wget            D
ffff88003e215900     0 11559   9142 0x00000000
Mar 19 01:28:07 kernel: [ 1920.190978]  ffff88002d4a5100
ffffffff81a11500 ffff88002d048000 ffff88003fad2150
Mar 19 01:28:07 kernel: [ 1920.190986]  00000000ffffd8ed
ffff88003fad2178 0000000000000000 ffff88003c312380
Mar 19 01:28:07 kernel: [ 1920.190992]  ffffffff8158b0e1
ffff88003fad2108 ffffffffa041cd7b 0000000000000000
Mar 19 01:28:07 kernel: [ 1920.190998] Call Trace:
Mar 19 01:28:07 kernel: [ 1920.191020]  [<ffffffff8158b0e1>] ?
schedule+0x31/0x80
Mar 19 01:28:07 kernel: [ 1920.191063]  [<ffffffffa041cd7b>] ?
reiser4_go_to_sleep+0x4b/0x90 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191074]  [<ffffffff810b65f0>] ?
wake_atomic_t_function+0x60/0x60
Mar 19 01:28:07 kernel: [ 1920.191108]  [<ffffffffa0423955>] ?
capture_fuse_wait.part.28+0x155/0x160 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191139]  [<ffffffffa0421df0>] ?
atom_can_be_committed.part.14+0x10/0x10 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191169]  [<ffffffffa04246ca>] ?
reiser4_try_capture+0x56a/0xb30 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191178]  [<ffffffff81481d00>] ?
__alloc_skb+0x60/0x1e0
Mar 19 01:28:07 kernel: [ 1920.191187]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:28:07 kernel: [ 1920.191215]  [<ffffffffa041cf23>] ?
longterm_lock_znode+0x163/0x4d0 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191247]  [<ffffffffa042b82a>] ?
cbk_cache_search+0x17a/0x280 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191276]  [<ffffffffa042c702>] ?
reiser4_object_lookup+0xf2/0x160 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191313]  [<ffffffffa044857a>] ?
reiser4_find_entry+0xca/0x360 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191324]  [<ffffffff814d5549>] ?
ip_finish_output2+0x159/0x340
Mar 19 01:28:07 kernel: [ 1920.191356]  [<ffffffffa0448fed>] ?
reiser4_lookup_name+0x8d/0x140 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191391]  [<ffffffffa0438983>] ?
reiser4_lookup_common+0x63/0x150 [reiser4]
Mar 19 01:28:07 kernel: [ 1920.191399]  [<ffffffff811ef915>] ? d_alloc+0x55/0x60
Mar 19 01:28:07 kernel: [ 1920.191408]  [<ffffffff811e0a59>] ?
lookup_real+0x19/0x60
Mar 19 01:28:07 kernel: [ 1920.191416]  [<ffffffff811e58cd>] ?
path_openat+0xbbd/0x12f0
Mar 19 01:28:07 kernel: [ 1920.191422]  [<ffffffff811e71b1>] ?
do_filp_open+0x91/0x100
Mar 19 01:28:07 kernel: [ 1920.191431]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:28:07 kernel: [ 1920.191440]  [<ffffffff811d6769>] ?
do_sys_open+0x139/0x220
Mar 19 01:28:07 kernel: [ 1920.191448]  [<ffffffff8158edf2>] ?
system_call_fast_compare_end+0xc/0x67
Mar 19 01:30:07 kernel: [ 2040.191111] INFO: task wget:11559 blocked
for more than 120 seconds.
Mar 19 01:30:07 kernel: [ 2040.191122]       Not tainted 4.4.0-1-amd64 #1
Mar 19 01:30:07 kernel: [ 2040.191125] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Mar 19 01:30:07 kernel: [ 2040.191130] wget            D
ffff88003e215900     0 11559   9142 0x00000000
Mar 19 01:30:07 kernel: [ 2040.191142]  ffff88002d4a5100
ffffffff81a11500 ffff88002d048000 ffff88003fad2150
Mar 19 01:30:07 kernel: [ 2040.191149]  00000000ffffd8ed
ffff88003fad2178 0000000000000000 ffff88003c312380
Mar 19 01:30:07 kernel: [ 2040.191155]  ffffffff8158b0e1
ffff88003fad2108 ffffffffa041cd7b 0000000000000000
Mar 19 01:30:07 kernel: [ 2040.191161] Call Trace:
Mar 19 01:30:07 kernel: [ 2040.191183]  [<ffffffff8158b0e1>] ?
schedule+0x31/0x80
Mar 19 01:30:07 kernel: [ 2040.191225]  [<ffffffffa041cd7b>] ?
reiser4_go_to_sleep+0x4b/0x90 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191235]  [<ffffffff810b65f0>] ?
wake_atomic_t_function+0x60/0x60
Mar 19 01:30:07 kernel: [ 2040.191269]  [<ffffffffa0423955>] ?
capture_fuse_wait.part.28+0x155/0x160 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191299]  [<ffffffffa0421df0>] ?
atom_can_be_committed.part.14+0x10/0x10 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191327]  [<ffffffffa04246ca>] ?
reiser4_try_capture+0x56a/0xb30 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191335]  [<ffffffff81481d00>] ?
__alloc_skb+0x60/0x1e0
Mar 19 01:30:07 kernel: [ 2040.191343]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:30:07 kernel: [ 2040.191370]  [<ffffffffa041cf23>] ?
longterm_lock_znode+0x163/0x4d0 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191401]  [<ffffffffa042b82a>] ?
cbk_cache_search+0x17a/0x280 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191428]  [<ffffffffa042c702>] ?
reiser4_object_lookup+0xf2/0x160 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191465]  [<ffffffffa044857a>] ?
reiser4_find_entry+0xca/0x360 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191475]  [<ffffffff814d5549>] ?
ip_finish_output2+0x159/0x340
Mar 19 01:30:07 kernel: [ 2040.191507]  [<ffffffffa0448fed>] ?
reiser4_lookup_name+0x8d/0x140 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191541]  [<ffffffffa0438983>] ?
reiser4_lookup_common+0x63/0x150 [reiser4]
Mar 19 01:30:07 kernel: [ 2040.191549]  [<ffffffff811ef915>] ? d_alloc+0x55/0x60
Mar 19 01:30:07 kernel: [ 2040.191558]  [<ffffffff811e0a59>] ?
lookup_real+0x19/0x60
Mar 19 01:30:07 kernel: [ 2040.191566]  [<ffffffff811e58cd>] ?
path_openat+0xbbd/0x12f0
Mar 19 01:30:07 kernel: [ 2040.191572]  [<ffffffff811e71b1>] ?
do_filp_open+0x91/0x100
Mar 19 01:30:07 kernel: [ 2040.191581]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:30:07 kernel: [ 2040.191590]  [<ffffffff811d6769>] ?
do_sys_open+0x139/0x220
Mar 19 01:30:07 kernel: [ 2040.191598]  [<ffffffff8158edf2>] ?
system_call_fast_compare_end+0xc/0x67
Mar 19 01:32:07 kernel: [ 2160.190981] INFO: task wget:11559 blocked
for more than 120 seconds.
Mar 19 01:32:07 kernel: [ 2160.190992]       Not tainted 4.4.0-1-amd64 #1
Mar 19 01:32:07 kernel: [ 2160.190995] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Mar 19 01:32:07 kernel: [ 2160.191000] wget            D
ffff88003e215900     0 11559   9142 0x00000000
Mar 19 01:32:07 kernel: [ 2160.191011]  ffff88002d4a5100
ffffffff81a11500 ffff88002d048000 ffff88003fad2150
Mar 19 01:32:07 kernel: [ 2160.191018]  00000000ffffd8ed
ffff88003fad2178 0000000000000000 ffff88003c312380
Mar 19 01:32:07 kernel: [ 2160.191024]  ffffffff8158b0e1
ffff88003fad2108 ffffffffa041cd7b 0000000000000000
Mar 19 01:32:07 kernel: [ 2160.191031] Call Trace:
Mar 19 01:32:07 kernel: [ 2160.191052]  [<ffffffff8158b0e1>] ?
schedule+0x31/0x80
Mar 19 01:32:07 kernel: [ 2160.191094]  [<ffffffffa041cd7b>] ?
reiser4_go_to_sleep+0x4b/0x90 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191105]  [<ffffffff810b65f0>] ?
wake_atomic_t_function+0x60/0x60
Mar 19 01:32:07 kernel: [ 2160.191139]  [<ffffffffa0423955>] ?
capture_fuse_wait.part.28+0x155/0x160 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191169]  [<ffffffffa0421df0>] ?
atom_can_be_committed.part.14+0x10/0x10 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191196]  [<ffffffffa04246ca>] ?
reiser4_try_capture+0x56a/0xb30 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191205]  [<ffffffff81481d00>] ?
__alloc_skb+0x60/0x1e0
Mar 19 01:32:07 kernel: [ 2160.191214]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:32:07 kernel: [ 2160.191241]  [<ffffffffa041cf23>] ?
longterm_lock_znode+0x163/0x4d0 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191272]  [<ffffffffa042b82a>] ?
cbk_cache_search+0x17a/0x280 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191300]  [<ffffffffa042c702>] ?
reiser4_object_lookup+0xf2/0x160 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191337]  [<ffffffffa044857a>] ?
reiser4_find_entry+0xca/0x360 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191347]  [<ffffffff814d5549>] ?
ip_finish_output2+0x159/0x340
Mar 19 01:32:07 kernel: [ 2160.191387]  [<ffffffffa0448fed>] ?
reiser4_lookup_name+0x8d/0x140 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191435]  [<ffffffffa0438983>] ?
reiser4_lookup_common+0x63/0x150 [reiser4]
Mar 19 01:32:07 kernel: [ 2160.191445]  [<ffffffff811ef915>] ? d_alloc+0x55/0x60
Mar 19 01:32:07 kernel: [ 2160.191454]  [<ffffffff811e0a59>] ?
lookup_real+0x19/0x60
Mar 19 01:32:07 kernel: [ 2160.191461]  [<ffffffff811e58cd>] ?
path_openat+0xbbd/0x12f0
Mar 19 01:32:07 kernel: [ 2160.191468]  [<ffffffff811e71b1>] ?
do_filp_open+0x91/0x100
Mar 19 01:32:07 kernel: [ 2160.191476]  [<ffffffff810bb3e1>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Mar 19 01:32:07 kernel: [ 2160.191485]  [<ffffffff811d6769>] ?
do_sys_open+0x139/0x220
Mar 19 01:32:07 kernel: [ 2160.191493]  [<ffffffff8158edf2>] ?
system_call_fast_compare_end+0xc/0x67


Best Professional Regards

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
