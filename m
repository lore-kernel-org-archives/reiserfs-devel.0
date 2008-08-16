From: doiggl@velocitynet.com.au
Subject: Re: How do i make reiser4 filesystem available via /etc/fstab ?
Date: Sat, 16 Aug 2008 20:44:38 +1000 (EST)
Message-ID: <14774.202.168.22.19.1218883478.squirrel@webmail.velocity.net.au>
References: <14477.202.168.22.19.1218874745.squirrel@webmail.velocity.net.au>
    <200808161023.08004.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200808161023.08004.volker.armin.hemmann@tu-clausthal.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
I tried the following in /etc/fstab, and restarted, no luck,
/dev/sda  /reiser4 reiser4 0 0

By the way, this whole disk(separate to the o/s) was intended to be reiser4.
Glenn

> Volker Armin Hemmann wrote :
> you don't mkfs whole disks, only partitions.
>
> And then have a look.
> First path to device (like /dev/sdaX) then path to mount point, then fs
> type,
> additional options, 0 0

>> Hello,
>>
>> Question.
>> How do I make reiser4 a permanent fixture via /etc/fstab (after
>> reboots)?.
>> I am using opensuse 11.
>>
>> Manual commands I have used in the past to access the filesystem:
>> # mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/sda -fy
>> # fsck.reiser4 --fix /dev/sda -y
>> # mkdir /reiser4
>> # mount -t reiser4 /dev/sda /reiser4


