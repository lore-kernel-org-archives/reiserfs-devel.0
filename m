From: Michael James <Michael.James@csiro.au>
Subject: Re: Cannot open root device
Date: Wed, 5 May 2004 10:16:41 +1000
Message-ID: <200405051016.41233.Michael.James@csiro.au>
References: <Pine.LNX.4.33.0405032124200.1663-100000@bi165.wilkes.com>
Reply-To: Michael.James@csiro.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.33.0405032124200.1663-100000@bi165.wilkes.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: John Wilkes <john@wilkes.com>

On Tuesday 04 May 2004 15:22, John Wilkes wrote:
> On Tue, 4 May 2004, Michael James wrote:
> 
> > There have been a lot of kernel patches out lately,
> >  have you somehow got a mismatch between the kernel
> >  and its reiser or disk driver modules?
> 
> I don't think so.  The system had booted successfully only two or
> three days before.  I'm a mere user; I don't do any sort of software
> development, so it's extremely unlikely that I would have managed to
> create a mismatch between kernel and other stuff.
> 
> > Suse boots by starting the kernel and mounting an initrd,
> >  a compressed vestigial root filesystem.
> 
> Can I do that too?  In other words, can I mount /boot/initrd and have
> a look at what's there?  How do I mount it?

Yes, as another poster said it's easy. It will be compressed.

cp /boot/initrd /tmp/initrd.gz
gunzip /tmp/initrd.gz
mount -oloop /tmp/initrd /mnt		# could put "-t ext2" but it should recognise it automatically
cd /mnt
cat linuxrc

That's interesting, the practical import is that if you append a line "/bin/sh"
 you will be in an interactive shell DURING the boot.
You could try to load the modules and mount root.
Could give you a diagnostic test, could be frustrating,
 the stock initrd is pretty bare, you need to build a custom one
 with /bin/mount AND any necessary libraries.
I have used this stuff to build a thing I call cloneboot.
It clones a known-good system DURING boot.
Installed 6 cluster nodes in 8.5 minutes.


> > Installing an new kernel using Yast should run "mkinitrd"
> >  to update the modules in your initrd to match.
> 
> It does.  Yast2 prints a little status line at the bottom of the
> window, and at one point it says "creating initrd" or something
> similar.  Also, when booting my /dev/hdb system, I can mount /dev/hda1
> and see that the datestamps on both vmlinuz and initrd have been
> updated.
> 
> > Note, the CD kernel (and initrd) are the "deflt" version.
> 
> Yast2 on the intallation CD warns me not to use deflt unless I really
> know what I am doing.  Nevertheless, I installed it and get the same
> result.  It's been a while, but I'm pretty sure I selected the athlon
> kernel when I originally installed SuSE 8.2 about a year ago and it
> just worked with reiserfs partitions.

Installing and booting-using are 2 different things.
Yes yast usually chooses the right kernel and you should trust it.
If you boot off the CD you are in a deflt kernel,
 that's the one it uses to work on the most hardware.

> >   don't boot to the CD's "rescue system" use the CD to "boot
> > installed system" That will use the CD's kernel AND modules but give
> > you the real root filesystem.
> 
> I tried that too, but it just hangs with no message on the screen.
> Two LEDs on the keyboard are blinking on and off, which also happens
> when the kernel panics booting off of hda.  I assume it silently has
> the same problem.

Damn.
I'm afraid your problem is a mystery.
Kernel Panic, can't mount root.  Hmmm
Usually happens because some hardware change has shifted the drive letters.
You didn't mean hda anymore it's now hdg.
Playing in the BIOS and turning off an unused IDE port can do this,
 it's recoverable, in fact within grub you can re-type the boot line
 on the fly and experiment.

Or it could be the kernel-module/driver issue I've been suspecting.

Doesn't sound to me like a corrupt file-system,
 you have run reiserfsck and can mount it on rescue systems.

I'd be studying the boot messages for a clue.
And failing that, putting /bin/sh into linuxrc and experimenting.

> 
> > Hope this helps,
> > michaelj
> 
> Thanks; it does help, even though the problem isn't solved.
> 
> Some questions I have:
> 
> I'm guessing that the boot process does "rdev /dev/hda3" at some
> point.  How is "rdev" different from "mount"?  (Apart from the
> obvious, that one sets the root file system while the other simply
> makes the filesystem available.)  Does "rdev" read or write any
> special block that fsck doesn't look at?

Don't know about rdev.

> I'm wondering if reformating the partition would cure the problem.
> 
> Here's how I would go about it:
> 
> 1. boot alternate system on hdb
> 2. mount /dev/hda3 /mnt
> 3. cd /mnt
> 4. tar czvf ~/rootfs.tar .
> 5. umount /mnt
> 6. mkfs -t reiserfs /dev/hda3
> 7. mount /dev/hda3 /mnt
> 8. cd /mnt
> 9. tar xzvf ~/rootfs.tar
> 
> Does that look like it will work?

Yes, in the sense of re-building the partition.
No, I doubt it's a corrupt partition.

>  Any reiserfs specific options
> needed for mkfs?

No, it will ask for some confirmation, but it's obvious enough.


When I was first trying to get Suse up on some new Dell servers
 Kernel Panic made repeated appearances, my assistant and I would salute him.
We didn't like Kernel Panic, but felt it best to be respectful.
That was a bad batch of drivers on new complicated hardware but.



-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

