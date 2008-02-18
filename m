From: Gary Hawco <ghawco@cox.net>
Subject: Segfaulting with reiser4 after doing file extensive operations on reiser4 system from a chrooted environment.
Date: Mon, 18 Feb 2008 20:13:42 +0000 (UTC)
Message-ID: <loom.20080218T195750-476@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi guys. First time post.

Here is my issue with reiser4. Been a long time user. Have two Linux systems,
Slackware12 and Gentoo x86. Gentoo has been formatted with reiser4 from
Slackware using latest reiser4progs-1.0.6 with mkfs.reiser4 /dev/sda7.

My Gentoo tarballs extract fine to the freshly formatted partition.  Use the
standard noatime,nodiratime settings for Gentoo /etc/fstab.  Slackware uses a
vanilla 2.6.24.2 kernel patched with the latest (012508) reiser4 patch and
Gentoo uses same patch with 2.6.24-r2 gentoo sources kernel. All kernel
configurations identical with reiser4 support compiled into kernel.

If I boot into Gentoo everything is fine. I have played around with the
compression plugins and they're fine too.

The problem is if I chroot into Gentoo while running Slackware from a console
to, for instance, update my Gentoo system (emerge --sync && emerge -uDN world),
when I actually reboot into Gentoo I ALWAYS get a segfault. A reboot into Gentoo
corrects the problem.

Steps to ALWAYS reproduce problem:

From a Slackware console:
mount /dev/sda7 /sda7 (Gentoo partition)
mount -t proc none /sda7/proc (to enable internet connection in chrooted
environment)
chroot /sda7 /bin/bash
env-update && source /etc/profile
emerge --sync && emerge -uDN world

After Gentoo is updated:
exit
umount /sda7/proc /sda7

It was suggested I try to sync the fs before umounting. Tried it, but same
results, i.e. reboot into Gentoo and it segtaults near the end of the boot
process complaining about several .sh scripts. Minor changes to Gentoo from the
chrooted environment do not cause the segfaults when actually subsequently
booting into Gentoo, nor are there ever any segfaults while in the chrooted
environment. An fsck check after I umount the Gentoo partition does not show any
irregularities or fs corruption either.

I believe this issue is a bug, albeit minor.  

Any other information I can provide will be forth coming.

Thank you for an otherwise stellar fs experience.

Gary Hawco
Tucson, AZ.

