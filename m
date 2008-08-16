From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: How do i make reiser4 filesystem available via /etc/fstab ?
Date: Sat, 16 Aug 2008 10:23:07 +0200
Message-ID: <200808161023.08004.volker.armin.hemmann@tu-clausthal.de>
References: <14477.202.168.22.19.1218874745.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14477.202.168.22.19.1218874745.squirrel@webmail.velocity.net.au>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Samstag, 16. August 2008, doiggl@velocitynet.com.au wrote:
> hello,
>
> Question.
> How do I make reiser4 a permanent fixture via /etc/fstab (after reboots)?.
> I am using opensuse 11.
>
> Manual commands I have used in the past to access the filesystem:
> # mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/sda -fy
> # fsck.reiser4 --fix /dev/sda -y
> # mkdir /reiser4
> # mount -t reiser4 /dev/sda /reiser4
>
> Access looks like: /dev/sda on /reiser4 type reiser4 (rw)
>
> My fstab looks like this at the moment:
>
> # cat /etc/fstab
> /dev/disk/by-id/scsi-SATA_WDC_WD800BB-00J_WD-WCAM9L615149-part1 swap
>           swap       defaults              0 0
> /dev/disk/by-id/scsi-SATA_WDC_WD800BB-00J_WD-WCAM9L615149-part2 /
>           reiserfs   acl,user_xattr        1 1
> /dev/disk/by-id/scsi-SATA_WDC_WD800BB-00J_WD-WCAM9L615149-part3 /home
>           reiserfs   defaults              1 2
> proc                 /proc                proc       defaults
> 0 0
> sysfs                /sys                 sysfs      noauto
> 0 0
> debugfs              /sys/kernel/debug    debugfs    noauto
> 0 0
> usbfs                /proc/bus/usb        usbfs      noauto
> 0 0
> devpts               /dev/pts             devpts     mode=0620,gid=5
> 0 0
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

you don't mkfs whole disks, only partitions.

And then have a look.
First path to device (like /dev/sdaX) then path to mount point, then fs type, 
additional options, 0 0 

