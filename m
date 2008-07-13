From: doiggl@velocitynet.com.au
Subject: Re: Nightly Builds
Date: Mon, 14 Jul 2008 00:21:50 +1000 (EST)
Message-ID: <23441.202.168.22.19.1215958910.squirrel@webmail.velocity.net.au>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>
    <485E788A.8020802@suse.com>
    <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>
    <485FAF96.40608@suse.com>
    <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>
    <48610B80.3020908@suse.com>
    <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au>
    <48626E1B.6070604@suse.com>
    <23129.202.168.22.19.1214638448.squirrel@webmail.velocity.net.au>
    <4866575D.1000305@suse.com>
    <14971.202.168.22.19.1214748124.squirrel@webmail.velocity.net.au>
    <4867DC31.2030702@suse.com>
    <23784.202.168.22.19.1214826598.squirrel@webmail.velocity.net.au>
    <4868F3C8.2090006@suse.com>
    <20253.202.168.22.19.1215615647.squirrel@webmail.velocity.net.au>
    <4874D51A.7020909@suse.com>
    <24383.202.168.22.19.1215703298.squirrel@webmail.velocity.net.au>
    <4876301A.6020208@suse.com>
    <27342.202.168.22.19.1215840119.squirrel@webmail .velocity.net.au>
    <84BA00E0-5BA8-41A3-9C7C-54723058D7F6@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <84BA00E0-5BA8-41A3-9C7C-54723058D7F6@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>

Hello,
- I rebooted and now 'modprobe -v  reiser4' now shows activity:
# modprobe -v  reiser4
insmod
/lib/modules/2.6.25.9-0.2-default/kernel/lib/zlib_deflate/zlib_deflate.ko
insmod /lib/modules/2.6.25.9-0.2-default/kernel/lib/lzo/lzo_compress.ko
insmod /lib/modules/2.6.25.9-0.2-default/kernel/lib/lzo/lzo_decompress.ko
insmod /lib/modules/2.6.25.9-0.2-default/weak-updates/reiser4.ko

-- Next my blank disk shows up as /dev/sda  .This is unformatted.
So I tried formatting it,and got the following error:

# mkfs.reiser4 -o create=ccreg40 /dev/sda
mkfs.reiser4 1.0.6
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Overriding the plugin profile by "create=ccreg40".
Block size 4096 will be used.
Linux 2.6.25.9-0.2-default is detected.
Error: Device /dev/sda is an entire harddrive, not just one partition.

-- So next I created an extended partition (entire disk) it with YAST,that
worked, named /dev/sda1
-- Next I tried to create a reiser4 filesystem on /dev/sda1 , and failed.


# mkfs.reiser4 -o create=ccreg40 /dev/sda1
mkfs.reiser4 1.0.6
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Overriding the plugin profile by "create=ccreg40".
Block size 4096 will be used.
Linux 2.6.25.9-0.2-default is detected.
Uuid ceb5d729-091b-4524-84b0-2d014f297842 will be used.
Reiser4 is going to be created on /dev/sda1.
(Yes/No): y
Error: Requested filesystem size (0) is too small. Reiser4 required
minimal size 25 blocks long.
Error: Can't create filesystem on /dev/sda1.

# mkfs.reiser4 -V
mkfs.reiser4 1.0.6

The commands I used both failed.
Question: How do I format (say 10GB) size part of the disk with
mkfs.reiser4 with compression as well and what am I missing from the
command ?

Thankyou
Glenn

> Jeff Wrote
> Ok... But does the mount fail?
>
> --
> Jeff Mahoney (mobile)
> SuSE Labs


