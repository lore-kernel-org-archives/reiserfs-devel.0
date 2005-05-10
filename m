From: Linas Vepstas <linas@austin.ibm.com>
Subject: Re: kernel BUG() hit during PCI testing
Date: Tue, 10 May 2005 12:34:48 -0500
Message-ID: <20050510173448.GQ11745@austin.ibm.com>
References: <20050509222314.GA17876@austin.ibm.com> <4280E05D.6000000@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4280E05D.6000000@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com


HI,

On Tue, May 10, 2005 at 12:25:01PM -0400, Jeff Mahoney was heard to remark:
> Linas Vepstas wrote:
> > 
> > Hi,
> > 
> > I just hit a kernel BUG() during pci testing of 2.6.11.8.  The goal of 
> > the testing was to temporarily disable a PCI slot containing a SCSI controller. 
> > I think I permanently killed the PCI slot; i/o died, and shortly after 
> > I hit the BUG().  See below.
> > 
> > The goal is, of course, to have the kernel keep on trooping even if 
> > the SCSI controller dies out from under it; returning -EIO to user apps
> > accessing the failed file system is acceptable.
> > 
> > --linas
> > 
> > io-falcons:~ # dmesg
> > 
> > 
> > -bash: /bin/dmesg: Input/output error
> > 
> > (Above is the "normal" message when a file system returns -EIO to user space;
> > I expect to see these kinds of messages if the block device under the
> > file system fails. Then, a second later I got the crash:
> > 
> > io-falcons:~ #
> > io-falcons:~ #
> > io-falcons:~ # cpu 0x0: Vector: 700 (Program Check) at [c0000001ffe73740]
> >     pc: c000000000138b48: .write_ordered_chunk+0xa4/0x100
> >     lr: c0000000001392f4: .write_ordered_buffers+0x348/0x364
> >     sp: c0000001ffe739c0
> >    msr: 9000000000029032
> >   current = 0xc0000003fe6d5030
> >   paca    = 0xc000000000547000
> >     pid   = 942, comm = reiserfs/0
> > kernel BUG in submit_ordered_buffer at fs/reiserfs/journal.c:616!
> 
> Hi Linas -
> 
> This one is on my radar among several others of the same type. What's
> happening is that somehow buffers are getting dirtied despite not being
> uptodate. They're getting allowed to be put back into the write cycle
> which is totally invalid, so they're getting caught rather than being
> written to disk. ext3 has similar problems, but tends to handle them as
> buffer errors rather than BUGs. I'm investigating whether or not these
> errors could occur outside individual filesystems.

OK, if I don't get busy with other things, I'll look more closely at
this as well. Maybe :-/    Meanwhile here's the dmesg output between
the pci outage and the crash.  Don't know if this will be useful.
If you want any kind of tracing turned on, let me know.

--linas

<4>sym0: suspicious SCSI data while resetting the BUS.
<4>sym0: dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,atn,msg,c/d,i/o =
0x7ffffff, expecting 0x100
<5>sym0: SCSI BUS has been reset.
<4>sym0:8:0: HOST RESET operation timed-out.

(Yes, that's because the PCI bus is down at this point ... this
message is "normal".)

<6>scsi: Device offlined - not ready after error recovery: host 0
channel 0 id 8 lun 0
<6>scsi: Device offlined - not ready after error recovery: host 0
channel 0 id 8 lun 0
<6>scsi: Device offlined - not ready after error recovery: host 0
channel 0 id 8 lun 0
<3>scsi0 (8:0): rejecting I/O to offline device
<3>scsi0 (8:0): rejecting I/O to offline device
<3>scsi0 (8:0): rejecting I/O to offline device
<3>scsi0 (8:0): rejecting I/O to offline device
<3>Buffer I/O error on device sda4, logical block 743
<4>lost page write due to I/O error on sda4
<3>scsi0 (8:0): rejecting I/O to offline device
<3>Buffer I/O error on device sda4, logical block 744
<4>lost page write due to I/O error on sda4
<3>scsi0 (8:0): rejecting I/O to offline device
<3>Buffer I/O error on device sda4, logical block 745
<4>lost page write due to I/O error on sda4
<3>Buffer I/O error on device sda4, logical block 746
<4>lost page write due to I/O error on sda4
<3>Buffer I/O error on device sda4, logical block 747
<4>lost page write due to I/O error on sda4
<3>Buffer I/O error on device sda4, logical block 748
<4>lost page write due to I/O error on sda4
<3>Buffer I/O error on device sda4, logical block 749
<4>lost page write due to I/O error on sda4
<3>Buffer I/O error on device sda4, logical block 750
<4>lost page write due to I/O error on sda4
<3>Buffer I/O error on device sda4, logical block 751
<4>lost page write due to I/O error on sda4
<3>Buffer I/O error on device sda4, logical block 752
<4>lost page write due to I/O error on sda4
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 360606 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<2>REISERFS: abort (device sda4): Journal write error in
flush_commit_list
<2>REISERFS: Aborting journal for filesystem on sda4
<2>kernel BUG in submit_ordered_buffer at fs/reiserfs/journal.c:616!
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 88143 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 243569 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 287908 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 294525 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 347520 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 358764 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 353053 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 297565 0x0 SD]
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 271252 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 294526 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 275030 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 269330 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20595 269318 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 364350 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 271245 0x0 SD]
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 271354 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [2 157094 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 275029 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 263497 0x0 SD]
<3>scsi0 (8:0): rejecting I/O to offline device
<4>ReiserFS: sda4: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [20588 100739 0x0 SD]
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 155380 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
<4>ReiserFS: sda4: warning: clm-6006: writing inode 364428 on readonly
FS
0:mon>


