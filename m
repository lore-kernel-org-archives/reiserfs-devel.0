From: Steven Poulakos <poulakos@uiuc.edu>
Subject: Fatal File System Corruption -Software RAID + NFS
Date: Sun, 16 Nov 2003 11:04:00 -0600
Message-ID: <3FB7AE00.4070409@uiuc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16100-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Hi,

I'm encountering my second wave of reiserfs filesystem corruption with a 
Web/NFS/NIS server.  This time, I had fatal corruption after updating 
the Kernel.  Below are the system specs and the error message that I'm 
receiving.

The system:

Debian (latest unstable)
2.4.22 Kernel  (not patched in any way)
running NFS (from the kernel), which serves home directories to 3 
workstations
Software RAID 1
-2, mirrored 80gig (7200RPM) IBM hard drives
-Each drive is connected to its own channel on a Promise Ultra ATA/100 
Controller (Ultra100 Tx2) card (PCI)  (using ATA 100 cables)
-the two drives are called hda and hdc (contain 3 mirrored RAID partitions)

The problem:

Two of three RAID'ed partitions have been working without errors (/home 
and /usr).  My root partition generated the errors below for many days 
until  detected.  After a reboot, the system would not load.  reiserfsck 
--rebuild-tree could not recover the corruption.  I have assumed that I 
must rebuild the system now, and being able to prevent the errors below 
from happening again will affect how I proceed with the rebuild.  Any 
info for prevent the below errors would be great!

-Steve

Here are snippets of the errors that just repeat over and over...

Nov  9 06:47:34 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekComplete DataRequest }
Nov  9 06:47:34 ctdev kernel:
Nov  9 06:47:34 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:47:34 ctdev kernel:
Nov  9 06:47:34 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:47:34 ctdev kernel:
Nov  9 06:47:39 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:47:39 ctdev kernel:
Nov  9 06:47:39 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:47:39 ctdev kernel:
Nov  9 06:47:44 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:47:44 ctdev kernel:
Nov  9 06:47:44 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
.....(snip).......

.....(snip).......
Nov  9 06:47:59 ctdev kernel:
Nov  9 06:48:05 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:48:05 ctdev kernel:
Nov  9 06:48:05 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:48:05 ctdev kernel:
Nov  9 06:48:05 ctdev kernel: hdc: status timeout: status=0xd0 { Busy }
Nov  9 06:48:05 ctdev kernel:
Nov  9 06:48:05 ctdev kernel: PDC202XX: Secondary channel reset.
Nov  9 06:48:05 ctdev kernel: ide1: reset: success
Nov  9 06:48:10 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:48:10 ctdev kernel:
Nov  9 06:48:10 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:48:10 ctdev kernel:
Nov  9 06:48:10 ctdev kernel: hdc: write_intr error1: nr_sectors=5, 
stat=0xd0
Nov  9 06:48:10 ctdev kernel: hdc: write_intr: status=0xd0 { Busy }
Nov  9 06:48:10 ctdev kernel:
Nov  9 06:48:10 ctdev kernel: PDC202XX: Secondary channel reset.
Nov  9 06:48:10 ctdev kernel: ide1: reset: success
Nov  9 06:48:15 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
.....(snip).......


.....(snip).......
Nov  9 06:56:45 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:56:45 ctdev kernel:
Nov  9 06:56:50 ctdev kernel: hdc: write_intr error1: nr_sectors=51, 
stat=0xd0
Nov  9 06:56:50 ctdev kernel: hdc: write_intr: status=0xd0 { Busy }
Nov  9 06:56:50 ctdev kernel:
Nov  9 06:56:50 ctdev kernel: PDC202XX: Secondary channel reset.
Nov  9 06:56:50 ctdev kernel: ide1: reset: success
Nov  9 06:56:56 ctdev kernel: hdc: write_intr error1: nr_sectors=51, 
stat=0xd0
Nov  9 06:56:56 ctdev kernel: hdc: write_intr: status=0xd0 { Busy }
Nov  9 06:56:56 ctdev kernel:
Nov  9 06:56:56 ctdev kernel: PDC202XX: Secondary channel reset.
Nov  9 06:56:56 ctdev kernel: ide1: reset: success
Nov  9 06:56:56 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:56:56 ctdev kernel:
Nov  9 06:57:01 ctdev kernel: hdc: status error: status=0x58 { 
DriveReady SeekCo
mplete DataRequest }
Nov  9 06:57:01 ctdev kernel:
..... (snip) .....


