From: John Wilkes <john@wilkes.com>
Subject: Re: Cannot open root device
Date: Mon, 3 May 2004 22:22:37 -0700 (PDT)
Message-ID: <Pine.LNX.4.33.0405032124200.1663-100000@bi165.wilkes.com>
References: <200405041346.43920.Michael.James@csiro.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405041346.43920.Michael.James@csiro.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, 4 May 2004, Michael James wrote:

> There have been a lot of kernel patches out lately,
>  have you somehow got a mismatch between the kernel
>  and its reiser or disk driver modules?

I don't think so.  The system had booted successfully only two or
three days before.  I'm a mere user; I don't do any sort of software
development, so it's extremely unlikely that I would have managed to
create a mismatch between kernel and other stuff.

> Suse boots by starting the kernel and mounting an initrd,
>  a compressed vestigial root filesystem.

Can I do that too?  In other words, can I mount /boot/initrd and have
a look at what's there?  How do I mount it?

> Installing an new kernel using Yast should run "mkinitrd"
>  to update the modules in your initrd to match.

It does.  Yast2 prints a little status line at the bottom of the
window, and at one point it says "creating initrd" or something
similar.  Also, when booting my /dev/hdb system, I can mount /dev/hda1
and see that the datestamps on both vmlinuz and initrd have been
updated.

> Note, the CD kernel (and initrd) are the "deflt" version.

Yast2 on the intallation CD warns me not to use deflt unless I really
know what I am doing.  Nevertheless, I installed it and get the same
result.  It's been a while, but I'm pretty sure I selected the athlon
kernel when I originally installed SuSE 8.2 about a year ago and it
just worked with reiserfs partitions.

>   don't boot to the CD's "rescue system" use the CD to "boot
> installed system" That will use the CD's kernel AND modules but give
> you the real root filesystem.

I tried that too, but it just hangs with no message on the screen.
Two LEDs on the keyboard are blinking on and off, which also happens
when the kernel panics booting off of hda.  I assume it silently has
the same problem.

> Hope this helps,
> michaelj

Thanks; it does help, even though the problem isn't solved.

Some questions I have:

I'm guessing that the boot process does "rdev /dev/hda3" at some
point.  How is "rdev" different from "mount"?  (Apart from the
obvious, that one sets the root file system while the other simply
makes the filesystem available.)  Does "rdev" read or write any
special block that fsck doesn't look at?

I'm wondering if reformating the partition would cure the problem.

Here's how I would go about it:

1. boot alternate system on hdb
2. mount /dev/hda3 /mnt
3. cd /mnt
4. tar czvf ~/rootfs.tar .
5. umount /mnt
6. mkfs -t reiserfs /dev/hda3
7. mount /dev/hda3 /mnt
8. cd /mnt
9. tar xzvf ~/rootfs.tar

Does that look like it will work?  Any reiserfs specific options
needed for mkfs?

/jw
-- 
John Wilkes
john at wilkes dot com


