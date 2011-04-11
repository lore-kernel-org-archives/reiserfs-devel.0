From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: ls: reading directory .: Input/output error on reiser4 partition
Date: Mon, 11 Apr 2011 15:57:23 +0200
Message-ID: <4DA308C3.30304@gmail.com>
References: <bbbd01a6540b1e8806d343871853ef25@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bbbd01a6540b1e8806d343871853ef25@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 04/11/2011 03:50 PM, doiggl@velocitynet.com.au wrote:
> Hello
> I get this error on a Reiser4 disk:
>
> What are the commands to
> - check disk structure


make sure /dev/sdd is unmounted, or mounted read-only;
fsck.reiser4 /dev/sdd


> - list any errors
> - repair errors
>
> I am using Reiser4 vers 2.6.38
> Build log
> ->https://build.opensuse.org/package/binaries?package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_11.4
>
> Thanks Glenn
>
> # ls
> ls: reading directory .: Input/output error
>
> 2. The disk was mounted with this command ok
> # mount /dev/sdd /media/disk
>
> 3. dmsg shows disk plugged in ok vis usb connection.
>
> #dmesg
>
> [  149.408064] usb 2-3: new high speed USB device using ehci_hcd and
> address 4
> [  149.543649] usb 2-3: New USB device found, idVendor=04fc,
> idProduct=0c25
> [  149.543662] usb 2-3: New USB device strings: Mfr=2, Product=3,
> SerialNumber=1
> [  149.543670] usb 2-3: Product: USB to Serial-ATA bridge
> [  149.543677] usb 2-3: Manufacturer: Sunplus Technology Inc.
> [  149.543683] usb 2-3: SerialNumber: ST32000542            5XW1ZMG4
> [  149.548258] scsi8 : usb-storage 2-3:1.0
> [  150.553859] scsi 8:0:0:0: Direct-Access     ST320005 42AS
>    PQ: 0 ANSI: 2
> [  150.554568] sd 8:0:0:0: Attached scsi generic sg4 type 0
> [  150.558628] sd 8:0:0:0: [sdd] 3907029168 512-byte logical blocks: (2.00
> TB/1.81 TiB)
> [  150.563677] sd 8:0:0:0: [sdd] Write Protect is off
> [  150.563694] sd 8:0:0:0: [sdd] Mode Sense: 38 00 00 00
> [  150.565315] sd 8:0:0:0: [sdd] Incomplete mode parameter data
> [  150.565330] sd 8:0:0:0: [sdd] Assuming drive cache: write through
> [  150.571680] sd 8:0:0:0: [sdd] Incomplete mode parameter data
> [  150.571695] sd 8:0:0:0: [sdd] Assuming drive cache: write through
> [  150.586796]  sdd: unknown partition table
> [  150.593817] sd 8:0:0:0: [sdd] Incomplete mode parameter data
> [  150.593828] sd 8:0:0:0: [sdd] Assuming drive cache: write through
> [  150.593838] sd 8:0:0:0: [sdd] Attached SCSI disk
> [  222.780803] Loading Reiser4. See www.namesys.com for a description of
> Reiser4.
> [  222.786169] reiser4: sdd: found disk format 4.0.0.
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

