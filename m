From: John Wilkes <john@wilkes.com>
Subject: Re: Cannot open root device
Date: Mon, 3 May 2004 07:05:50 -0700 (PDT)
Message-ID: <Pine.LNX.4.33.0405030645280.1672-100000@bi165.wilkes.com>
References: <200405031609.14379.rmeijer@internet.gr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18386-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405031609.14379.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: "Raymond A. Meijer" <rmeijer@internet.gr>

On Mon, 3 May 2004, Raymond A. Meijer wrote:

> Maybe it's not a ReiserFS problem but a LILO problem?
>
> Could you try booting with the "root=/dev/hda3" boot option?

Already tried that, thanks.  Same problem.

> What does your lilo.conf look like?

I'm using grub, not lilo; grub understands the file system and does
not require the absolute disk address of the kernel.  It appears to
find the /boot partition on /dev/hda1 and tries to boot that kernel
using that initrd.

This system booted two days previously with no problem, and nothing
changed since then.  I have since re-installed the default kernel from
the SuSE 8.2 installation CD (which I am certain includes reiserfs
support) and it still panics when booting because it cannot open
/dev/hda3 as the root device.

The grub menu.lst file (which follows) has the root=/dev/hda3 option.

Based on what I've read, everything looks normal.  When it panics, the
kernel's output to the console is:

  VFS: Cannot open root device "hda3" on 03:03

The "03:03" indicates major device 3 and minor device 3, which is what
one expects for /dev/hda3.

I've tried the "failsafe" boot option in grub (see below) but it has
the same problem.

How can the /dev/hda3 partition be mountable on another system but not
as root when booting?  What is the difference between mounting a
partition as "/" during boot (which fails) and mounting it as "/mnt"
(which is successful)?  What could be wrong that fsck does not see and
fix?


My /boot/grub/menu.lst file:

color white/blue black/light-gray
default 0
gfxmenu (hd0,0)/message
timeout 8

title linux
    kernel (hd0,0)/vmlinuz root=/dev/hda3 vga=0x31a  hdc=ide-scsi hdclun=0 splash=silent showopts
    initrd (hd0,0)/initrd

title SuSE_7.3
    kernel (hd1,0)/vmlinuz root=/dev/hdb3

title failsafe
    kernel (hd0,0)/vmlinuz.shipped root=/dev/hda3 showopts ide=nodma apm=off acpi=off vga=normal nosmp noapic maxcpus=0 3
    initrd (hd0,0)/initrd.shipped

title floppy
    root (fd0)
    chainloader +1


-- 
John Wilkes
john at wilkes dot com

