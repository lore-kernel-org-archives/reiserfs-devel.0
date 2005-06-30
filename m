From: Chris Wedgwood <cw@f00f.org>
Subject: Re: XFS corruption during power-blackout
Date: Thu, 30 Jun 2005 11:46:27 -0700
Message-ID: <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org>
References: <254889.27725ab660aa106eb6acc07307d71ef1fbd5b6fd366aebef9e2f611750fbcb467e46e8a4.IBX@taniwha.stupidest.org> <OFC7BE2BBA.42F70A93-ON88257030.00595A48-88257030.005A99A3@us.ibm.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <OFC7BE2BBA.42F70A93-ON88257030.00595A48-88257030.005A99A3@us.ibm.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Henderson <hbryan@us.ibm.com>
Cc: Al Boldi <a1426z@gawab.com>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

On Thu, Jun 30, 2005 at 12:30:20PM -0400, Bryan Henderson wrote:

> For another point of reference - were these ATA (personal class) or
> SCSI (commercial class) drives or both?

IDE were Maxtor some old Maxtor 60GB disks and some not-so-old 200GB
WD drives.  Maxtor has 2MB cache.  WD 8MB.

The SCSI disks where 10K RPM SCA somethings.  I think they were Segate
(they've since been taken or else I would check).  I have no idea what
the cache is on those.

> Is write caching the default on typical SCSI devices?

I'm not sure.  It seemed to be off by default for the SCSI disks and
on by default for IDE when I checked.  I can't rule out the
bios/controller doing something there though.

> But be careful with the 'sync' program/system call.  As defined by
> POSIX, it is not a synchronizing operation.

Yes, but POSIX is broken in places.  The linux implmentation (now and
for sometime but not always) won't return until all dirty data is
flushed.

POSIX is a bit more sane about fsync():

      The fsync() function can be used by an application to indicate
      that all data for the open file description named by fildes is
      to be transferred to the storage device associated with the file
      described by fildes in an implementation-dependent manner. The
      fsync() function does not return until the system has completed
      that action or until an error is detected.

> It's supposed to cause buffered writes to get hardened some time
> soon, not right now.  So in theory, you can't pull the plug after
> typing "sync."

Data lss internal to the disks aside you can uner Linux.  I do it all
the time.  Various other people do and this is something some people
do test.

> In others, it implements "everything that was buffered when sync()
> started is hardened before the next sync() returns,"

That is what happens now.  I'm not sure any other behavior makes sense
does it?

If it happens differently I would call that a bug.

> and some 'sync' programs do multiple sync()s.

Such programs are arguably broken (grub maybe?).  If one doesn't work,
then why should doing it <n>-times?

> And it's also filesystem-type-dependent.

If a filesystem doesn't flush reliably with sync, I would call that a
bug.

> fsync(), on the other hand, is a true synchronizing operation.

Again that requires the fs to behave correctly so if it fails it
should be reported as a bug.

