From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: mkreiserfs and big RAID-Systems
Date: Mon, 15 Jul 2002 20:08:51 +0400
Message-ID: <200207152008.51657.vitaly@namesys.com>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de> <200207151824.47086.vitaly@namesys.com> <1026751348.32136.14.camel@pallas.IZS.FhG.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026751348.32136.14.camel@pallas.IZS.FhG.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Abele <aba@IZS.FhG.de>
Cc: reiserfs-list@namesys.com

> Here is the result
> [root@saturn6 mkreiserfs]# ./mkreiserfs /dev/sdf1
> Count of blocks on the device: 210096054

As you can see block number is correct - 840384216 blocks.

> bread: Cannot read a block # 210096053.
>
> Abgebrochen (core dumped)
>
> This is the syslog-entry from fdisk
> ===================================
> Jul 16 01:23:14 saturn6 kernel: SCSI device sdf: 1680779520 512-byte hdwr
> sectors (-238952 MB) Jul 16 01:23:14 saturn6 kernel: 
> /dev/scsi/host4/bus0/target4/lun0: p1 Jul 16 01:23:16 saturn6 kernel: SCSI
> device sdf: 1680779520 512-byte hdwr sectors (-238952 MB) Jul 16 01:23:16
> saturn6 kernel:  /dev/scsi/host4/bus0/target4/lun0: p1
>
>
> This is the syslogentry from mkreiserfs
> =======================================
> Jul 16 01:26:39 saturn6 kernel:  I/O error: dev 08:51, sector 1680768424

This is likely to be a bad block. Run 
    /sbin/badblock -b 4096 /dev/sdf1 210096053 210096053 
or with some range.

-- 

Thanks,
Vitaly Fertman
