From: Andreas Abele <aba@IZS.FhG.de>
Subject: Re: mkreiserfs and big RAID-Systems
Date: 15 Jul 2002 18:42:28 +0200
Message-ID: <1026751348.32136.14.camel@pallas.IZS.FhG.de>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de>
	<200207151738.02786.vitaly@namesys.com>
	<1026748894.30600.39.camel@pallas.IZS.FhG.de> 
	<200207151824.47086.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207151824.47086.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Vitaly,

> Could you run just 
>     mkreiserfs /dev/sdf1
> 


this has no effect, except the number of affected blocks.

Here is the result
[root@saturn6 mkreiserfs]# ./mkreiserfs /dev/sdf1

<-------------mkreiserfs, 2002------------->
reiserfsprogs 3.6.2

mkreiserfs: Guessing about desired format.. 
mkreiserfs: Kernel 2.4.18 is running.
Format 3.6 with standard journal
Count of blocks on the device: 210096054
Number of blocks consumed by mkreiserfs formatting process: 14623
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: e4df4ab3-dd1b-4426-80f1-dbf6d60f8b96
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/sdf1'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%

bread: Cannot read a block # 210096053.

Abgebrochen (core dumped)

This is the syslog-entry from fdisk
===================================
Jul 16 01:23:14 saturn6 kernel: SCSI device sdf: 1680779520 512-byte hdwr sectors (-238952 MB)
Jul 16 01:23:14 saturn6 kernel:  /dev/scsi/host4/bus0/target4/lun0: p1
Jul 16 01:23:16 saturn6 kernel: SCSI device sdf: 1680779520 512-byte hdwr sectors (-238952 MB)
Jul 16 01:23:16 saturn6 kernel:  /dev/scsi/host4/bus0/target4/lun0: p1


This is the syslogentry from mkreiserfs
=======================================
Jul 16 01:26:39 saturn6 kernel:  I/O error: dev 08:51, sector 1680768424

I don't think this is a hardware problem, because i have 5 raids of that kind and they all behave 
the same way.

thanks 
Andreas Abele

