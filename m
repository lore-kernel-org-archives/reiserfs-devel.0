From: John Wilkes <john@wilkes.com>
Subject: Cannot open root device
Date: Mon, 3 May 2004 05:42:18 -0700 (PDT)
Message-ID: <Pine.LNX.4.33.0405022125330.1672-100000@bi165.wilkes.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18384-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I have a weird problem, and I need some help.

SuSE 8.2 distribution
2.4.20-4GB-athlon kernel from SuSE installation disk
/boot partition is ext2, others are reiserfs 3.6 format.

After a power failure last week my system now panics while booting.  It
complains that it cannot open root device "hda3" on 03:03.

This is a SuSE 8.2 system that was installed about a year ago.  It had
rebooted only two days previously.  I am confident that this kernel
has reiserfs support, but just to be sure, I re-installed the stock
kernel off of the SuSE 8.2 distribution disks and got the same result.

Here's where it gets weird: I booted the Rescue system on the
installation CD, and from there I ran reiserfsck, which reported no
inconsistecies.  I can mount /dev/hda3 and look around; everything
seems to be there.  But when I try to boot a system that wants hda3 as
its root, I get a kernel panic.

What would cause mount to choke on a reiserfs root partition which
gets a clean fsck and is mountable from the Rescue system?  What could
be wrong that fsck doesn't see and fix?

Any insights or suggestions would be most welcome.

--
John Wilkes
john at wilkes dot com




