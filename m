From: Neil Robinson <neilr@superbase.co.uk>
Subject: Re: 3.6.25 - Journal replayed back to 3 weeks ago
Date: Thu, 15 Jan 2004 16:33:39 +0000
Message-ID: <1074184418.2397.84.camel@neilvaiogt.superbase.co.uk>
References: <1073933244.2405.44.camel@neilvaiogt.superbase.co.uk>
	 <1073934293.32706.861.camel@tiny.suse.com>
	 <1074144196.2397.38.camel@neilvaiogt.superbase.co.uk>
	 <1074178426.29550.19.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1074178426.29550.19.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

On Thu, 2004-01-15 at 14:53, Chris Mason wrote:
> On Thu, 2004-01-15 at 00:23, Neil Robinson wrote:
> > Chris,
> > 
> > I haven't heard anything since my response, so just in case it wasn't
> > complete enough:
> > 
> > uname -a results:
> > 
> > 2.4.20-gentoo-r9 #1 Sat Dec 6 03:17:43 GMT 2003 i686 Intel(R) Pentium(R)
> > 4 CPU 2.66GHz GenuineIntel GNU/Linux
> > 
> > This is running in a vmware workstation 4.0 Windows XP host. It is set
> > up with 3 MAX 4GB emulated SCSI drives and 1 emulated MAX 2GB FAT32 IDE
> > hard drive.
> > 
> > sda1 is ext2 on /boot
> > sda2 is swap on swap
> > sda3 is reiserfs on /
> > sdb1 is reiserfs on /home
> > sdc1 is reiserfs on /var/tmp/portage
> > hda1 is vfat on /work
> 
> Ok, please tell me more about the vmware setup.  Is are the vmware
> drives configured to do copy on write?

According to the documentation, changes made to the virtual drives are
committed to the physical drive immediately. Here is the salient info
from the dmesg:

scsi: ***** BusLogic SCSI Driver Version 2.1.15 of 17 August 1998 *****
scsi: Copyright 1995-1998 by Leonard N. Zubkoff <lnz@dandelion.com>
scsi0: Configuring BusLogic Model BT-958 PCI Wide Ultra SCSI Host
Adapter
scsi0:   Firmware Version: 5.07B, I/O Address: 0x10C0, IRQ Channel:
11/Level
scsi0:   PCI Bus: 0, Device: 16, Address: 0xF8000000, Host Adapter SCSI
ID: 7
scsi0:   Parity Checking: Enabled, Extended Translation: Enabled
scsi0:   Synchronous Negotiation: Ultra, Wide Negotiation: Enabled
scsi0:   Disconnect/Reconnect: Enabled, Tagged Queuing: Enabled
scsi0:   Scatter/Gather Limit: 128 of 8192 segments, Mailboxes: 211
scsi0:   Driver Queue Depth: 211, Host Adapter Queue Depth: 192
scsi0:   Tagged Queue Depth: Automatic, Untagged Queue Depth: 3
scsi0:   Error Recovery Strategy: Default, SCSI Bus Reset: Enabled
scsi0: *** BusLogic BT-958 Initialized Successfully ***
scsi0 : BusLogic BT-958
  Vendor: VMware,   Model: VMware Virtual S  Rev: 1.0 
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: VMware,   Model: VMware Virtual S  Rev: 1.0 
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: VMware,   Model: VMware Virtual S  Rev: 1.0 
  Type:   Direct-Access                      ANSI SCSI revision: 02
scsi0: Target 0: Queue Depth 28, Asynchronous
scsi0: Target 1: Queue Depth 28, Asynchronous
scsi0: Target 2: Queue Depth 28, Asynchronous
scsi0: Target 3: Queue Depth 3, Asynchronous
scsi0: Target 4: Queue Depth 3, Asynchronous
scsi0: Target 5: Queue Depth 3, Asynchronous
scsi0: Target 6: Queue Depth 3, Asynchronous
scsi0: Target 8: Queue Depth 3, Asynchronous
scsi0: Target 9: Queue Depth 3, Asynchronous
scsi0: Target 10: Queue Depth 3, Asynchronous
scsi0: Target 11: Queue Depth 3, Asynchronous
scsi0: Target 12: Queue Depth 3, Asynchronous
scsi0: Target 13: Queue Depth 3, Asynchronous
scsi0: Target 14: Queue Depth 3, Asynchronous
scsi0: Target 15: Queue Depth 3, Asynchronous
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
Attached scsi disk sdc at scsi0, channel 0, id 2, lun 0
SCSI device sda: 8388608 512-byte hdwr sectors (4295 MB)
 /dev/scsi/host0/bus0/target0/lun0: p1 p2 p3
SCSI device sdb: 8388608 512-byte hdwr sectors (4295 MB)
 /dev/scsi/host0/bus0/target1/lun0: p1
SCSI device sdc: 8388608 512-byte hdwr sectors (4295 MB)
 /dev/scsi/host0/bus0/target2/lun0: p1

Ciao, Neil

