From: Michael James <Michael.James@csiro.au>
Subject: Re: Cannot open root device
Date: Tue, 4 May 2004 13:46:43 +1000
Message-ID: <200405041346.43920.Michael.James@csiro.au>
References: <Pine.LNX.4.33.0405022125330.1672-100000@bi165.wilkes.com>
Reply-To: Michael.James@csiro.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18416-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.33.0405022125330.1672-100000@bi165.wilkes.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: John Wilkes <john@wilkes.com>

On Monday 03 May 2004 22:42, John Wilkes wrote:
> I have a weird problem, and I need some help.
> 
> SuSE 8.2 distribution
> 2.4.20-4GB-athlon kernel from SuSE installation disk
> /boot partition is ext2, others are reiserfs 3.6 format.
> 
> After a power failure last week my system now panics while booting.  It
> complains that it cannot open root device "hda3" on 03:03.
> 
> This is a SuSE 8.2 system that was installed about a year ago.  It had
> rebooted only two days previously.  I am confident that this kernel
> has reiserfs support, but just to be sure, I re-installed the stock
> kernel off of the SuSE 8.2 distribution disks and got the same result.
> 
> Here's where it gets weird: I booted the Rescue system on the
> installation CD, and from there I ran reiserfsck, which reported no
> inconsistecies.  I can mount /dev/hda3 and look around; everything
> seems to be there.  But when I try to boot a system that wants hda3 as
> its root, I get a kernel panic.
> 
> What would cause mount to choke on a reiserfs root partition which
> gets a clean fsck and is mountable from the Rescue system?  What could
> be wrong that fsck doesn't see and fix?
> 
> Any insights or suggestions would be most welcome.

There have been a lot of kernel patches out lately,
 have you somehow got a mismatch between the kernel
 and its reiser or disk driver modules?

Suse boots by starting the kernel and mounting an initrd,
 a compressed vestigial root filesystem.

With that in place it runs a short script called "linuxrc"
 that loads the modules needed to read the root partition.
This is where it gets reiserfs capability, and any scsi drivers needed.
In Suse they aren't compiled into the kernel.

Installing an new kernel using Yast should run "mkinitrd"
 to update the modules in your initrd to match.

So if you have copied back the stock CD kernel,
 you will need the stock initrd, try copying that in as well.
Note, the CD kernel (and initrd) are the "deflt" version.
You'll then need to switch to an athlon kernel and patch it up to date.
But the CD should get you booting again.

Watch the boot messages, there should be some sign if a module is failing to load.
Reiser should ALWAYS load.

Brainwave:
  don't boot to the CD's "rescue system" use the CD to "boot installed system"
That will use the CD's kernel AND modules but give you the real root filesystem.
If that works, you can rpm in the right kernel, then use Yast Online Update to patch it.

Hope this helps,
michaelj

-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

