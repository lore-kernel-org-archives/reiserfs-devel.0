From: dimas <dimas000@ya.ru>
Subject: Re: reiser4 kernel compilation problem.
Date: Sat, 23 Nov 2013 16:13:09 +0400
Message-ID: <20131123161309.1b321a45@Ulf.tvoe.tv>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1385208790;
	bh=eY6o292gExeRKdNmhAYM2FLX1fmhF+28fQ39kw/DEE0=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=YRDXBNeRttiht0qnqw6rlBcvwvmz0V7ANZ452JjBK6fQ+FxUh3Za/c+XWvzhI64dv
	 mfefaHzv92YRYlbZxTYg1pWZhPBhwYAk8+f4UmiNLE4uxfAqr5EfQxiZ+vLJBvpTxE
	 e6183AlgOKysvT5oQB5L/RYJniKhyZvaVv+QjdfA=
In-Reply-To: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

firstly, why are you using unpartitioned disk, creating fs on a disk, not
partition? if there is r4, and drive is 2 TB, i think, it's not camera memory
or smth like that)) just create mbr/gpt partition table to avoid some potential
problems.
secondly, check that reiser4 module is loaded, if occasionly not - try insmod.
also, you can check if r4 is listed in /proc/filesystems


2013-326 00:01 doiggl@velocitynet.com.au <doiggl@velocitynet.com.au> wrote:
> Hello,
> I get this message when trying to use a reiser4 partition.
> 
> # mount /dev/sdb  /media/disk
> mount: unknown filesystem type 'reiser4'
> 
> What an I missing [in the kernel build] so I can use this partition ?
> -Thanks Glenn
> 
> Steps I have done:
> These paramerers are set for the kernel and it built ok, and I booted from
> it.
> 
> CONFIG_REISER4_DEBUG=n
> CONFIG_REISER4_FS=m
> 
> I booted the new kernel
> # uname -a
> Linux test.site 3.11.9-2.ga012288-vanilla #1 SMP Thu Nov 21 10:36:29 UTC
> 2013 (1602f81) x86_64 x86_64 x86_64 GNU/Linux
> 
> - Full kernel build log see [1]
> - Built rpm are at [2]
> - dmesg when powering up disk with reiser4 partition.
> 
> [1] reiser4/kernel build log [its a long log...]
> https://build.opensuse.org/build/home:doiggl/openSUSE_Factory/x86_64/kernel-reiser4/_log
> 
> reiser4 build parameters set: 
> https://build.opensuse.org/package/view_file/home:doiggl/kernel-reiser4/zreiser4parameters.txt?expand=1
> 
> [2] Built reiser4/kernels
> https://build.opensuse.org/package/binaries/home:doiggl/kernel-reiser4?repository=openSUSE_Factory
> 
> [3]dmesg when powering up disk 
> [ 9401.263823] usb 1-2: new high-speed USB device number 3 using ehci-pci
> [ 9401.400157] usb 1-2: New USB device found, idVendor=04fc,
> idProduct=0c25
> [ 9401.400170] usb 1-2: New USB device strings: Mfr=2, Product=3,
> SerialNumber=1
> [ 9401.400177] usb 1-2: Product: USB to Serial-ATA bridge
> [ 9401.400183] usb 1-2: Manufacturer: Sunplus Technology Inc.
> [ 9401.400188] usb 1-2: SerialNumber: ST32000542            5XW1ZMG4
> [ 9401.424287] usb-storage 1-2:1.0: USB Mass Storage device detected
> [ 9401.424697] scsi4 : usb-storage 1-2:1.0
> [ 9401.424905] usbcore: registered new interface driver usb-storage
> [ 9402.429827] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
>   PQ: 0 ANSI: 2
> [ 9402.430333] sd 4:0:0:0: Attached scsi generic sg2 type 0
> [ 9402.431961] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
> TB/1.81 TiB)
> [ 9402.434681] sd 4:0:0:0: [sdb] Write Protect is off
> [ 9402.434695] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
> [ 9402.437448] sd 4:0:0:0: [sdb] No Caching mode page found
> [ 9402.437461] sd 4:0:0:0: [sdb] Assuming drive cache: write through
> [ 9402.444950] sd 4:0:0:0: [sdb] No Caching mode page found
> [ 9402.444962] sd 4:0:0:0: [sdb] Assuming drive cache: write through
> [ 9402.464733]  sdb: unknown partition table
> [ 9402.476864] sd 4:0:0:0: [sdb] No Caching mode page found
> [ 9402.476876] sd 4:0:0:0: [sdb] Assuming drive cache: write through
> [ 9402.476885] sd 4:0:0:0: [sdb] Attached SCSI disk
> 
> #fdisk -l
> Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
