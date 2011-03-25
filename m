From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 2.6.36 kernel panic
Date: Fri, 25 Mar 2011 02:48:22 +0100
Message-ID: <4D8BF466.7080600@gmail.com>
References: <AANLkTimrF930Dh82UKoq=M0mDy7aVrvbXC=ZDoTZT_YC@mail.gmail.com>	<4D713169.3060906@gmail.com>	<AANLkTimqtUR-Wfja8tpC4LATZYVpN5N01aPGLFqzOV8K@mail.gmail.com>	<AANLkTimYL=czRRmTSUabohUKNgKzmciKAavfLKqj5aRP@mail.gmail.com>	<4D8BC711.1020101@gmail.com>	<AANLkTikMKQdsrSB__KLGs5wS9+nO3rxOhrWc-x2je5o-@mail.gmail.com> <AANLkTikK8pS_bsxnwYrRd3NVXsR=uf5OWe_2h3+njOVU@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=gW1p1BjZyR78/sfdXqofFLzYJRQKyco90BpT9+nZIcc=;
        b=EMyO+/tibe/kW/s74niFudEEJZr+Gnm5xYqO+4QPXhdeN7DiYCe0VgrYDnv9TjOa5k
         0++0DwMPE+FDLq09xUpB9nt8hkqAZj42WejAuGxxmIDnDjS9V/G7mpFypEWFjZ9pd+H4
         zaZUncarX3r0Vdczn4DvZfTXyt+GIWd14JvQI=
In-Reply-To: <AANLkTikK8pS_bsxnwYrRd3NVXsR=uf5OWe_2h3+njOVU@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 03/25/2011 12:15 AM, Dushan Tcholich wrote:
> Btw. I found something suspicious in my /var/log/messages
>
> Mar 24 17:03:48 krshina3 kernel: [18656.820109] ata1: lost interrupt
> (Status 0x50)
> Mar 24 17:03:48 krshina3 kernel: [18656.820128] ata1.00: exception
> Emask 0x10 SAct 0x0 SErr 0x4050002 action 0xe frozen
> Mar 24 17:03:48 krshina3 kernel: [18656.820133] ata1.00: SError: {
> RecovComm PHYRdyChg CommWake DevExch }
> Mar 24 17:03:48 krshina3 kernel: [18656.820137] ata1.00: failed
> command: WRITE DMA
> Mar 24 17:03:48 krshina3 kernel: [18656.820145] ata1.00: cmd
> ca/00:10:18:0e:03/00:00:00:00:00/e1 tag 0 dma 8192 out
> Mar 24 17:03:48 krshina3 kernel: [18656.820146]          res
> 40/00:00:00:4f:c2/00:00:00:00:00/00 Emask 0x14 (ATA bus error)
> Mar 24 17:03:48 krshina3 kernel: [18656.820150] ata1.00: status: { DRDY }
> Mar 24 17:03:48 krshina3 kernel: [18656.820161] ata1.00: hard resetting link
> Mar 24 17:03:48 krshina3 kernel: [18657.544072] ata1.01: hard resetting link
> Mar 24 17:03:48 krshina3 kernel: [18658.020149] ata1.00: SATA link up
> 3.0 Gbps (SStatus 123 SControl 300)
> Mar 24 17:03:50 krshina3 kernel: [18658.020161] ata1.01: SATA link
> down (SStatus 4 SControl 300)
> Mar 24 17:03:50 krshina3 kernel: [18658.036242] ata1.00: configured for UDMA/133
> Mar 24 17:03:50 krshina3 kernel: [18658.036248] ata1.00: device
> reported invalid CHS sector 0
> Mar 24 17:03:50 krshina3 kernel: [18658.036257] ata1: EH complete
>
> But it doesn't make kernel panic,


It shouldn't panic with such mount options.
At the "moment of truth" your system will become read-only..


  system continues to work 24/7.
>
> Thanks
>
> Dushan
>
> On Fri, Mar 25, 2011 at 12:12 AM, Dushan Tcholich<dusanc@gmail.com>  wrote:
>>   cat /etc/fstab | grep "#" -v
>>
>>
>> /dev/sda1               /boot           ext2            noauto,noatime  1 2
>> /dev/md1                none            swap            sw              0 0
>> /dev/sda2               /               reiser4
>> noatime,onerror=remount-ro              0 0
>> /dev/md126              /mnt/media      reiser4
>> noatime,users,onerror=remount-ro        0 0
>> /dev/md127              /usr/portage    reiser4
>> noatime,onerror=remount-ro              0 0
>>
>> shm                     /dev/shm        tmpfs
>> nodev,nosuid,noexec    0 0
>>
>> This is fstab for last 2 weeks:D
>>
