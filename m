From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Segfaulting with reiser4 after doing file extensive operations
 on reiser4 system from a chrooted environment.
Date: Tue, 19 Feb 2008 03:41:12 +0300
Message-ID: <47BA25A8.5060004@gmail.com>
References: <loom.20080218T195750-476@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20080218T195750-476@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gary Hawco <ghawco@cox.net>
Cc: reiserfs-devel@vger.kernel.org

Gary Hawco wrote:

>Hi guys. First time post.
>
>  
>

Hello, welcome

>Here is my issue with reiser4. Been a long time user. Have two Linux systems,
>Slackware12 and Gentoo x86. Gentoo has been formatted with reiser4 from
>Slackware using latest reiser4progs-1.0.6 with mkfs.reiser4 /dev/sda7.
>
>My Gentoo tarballs extract fine to the freshly formatted partition.  Use the
>standard noatime,nodiratime settings for Gentoo /etc/fstab.  Slackware uses a
>vanilla 2.6.24.2 kernel patched with the latest (012508) reiser4 patch and
>Gentoo uses same patch with 2.6.24-r2 gentoo sources kernel. All kernel
>configurations identical with reiser4 support compiled into kernel.
>
>If I boot into Gentoo everything is fine. I have played around with the
>compression plugins and they're fine too.
>
>The problem is if I chroot into Gentoo while running Slackware from a console
>to, for instance, update my Gentoo system (emerge --sync && emerge -uDN world),
>when I actually reboot into Gentoo I ALWAYS get a segfault. A reboot into Gentoo
>corrects the problem.
>
>  
>

i.e. the second boot to Gentoo is okay?

>Steps to ALWAYS reproduce problem:
>
>>From a Slackware console:
>mount /dev/sda7 /sda7 (Gentoo partition)
>mount -t proc none /sda7/proc (to enable internet connection in chrooted
>environment)
>chroot /sda7 /bin/bash
>env-update && source /etc/profile
>emerge --sync && emerge -uDN world
>
>After Gentoo is updated:
>exit
>umount /sda7/proc /sda7
>  
>

You get a kernel oops at this point, or?
Would you please try to catch the kernel messages via serial console, or 
somehow else?

>It was suggested I try to sync the fs before umounting. Tried it, but same
>results, i.e. reboot into Gentoo and it segtaults near the end of the boot
>process complaining about several .sh scripts. Minor changes to Gentoo from the
>chrooted environment do not cause the segfaults when actually subsequently
>booting into Gentoo, nor are there ever any segfaults while in the chrooted
>environment. An fsck check after I umount the Gentoo partition does not show any
>irregularities or fs corruption either.
>
>I believe this issue is a bug, albeit minor.  
>
>Any other information I can provide will be forth coming.
>
>Thank you for an otherwise stellar fs experience.
>
>Gary Hawco
>Tucson, AZ.
>
>-
>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>

