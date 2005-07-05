From: Sonny Rao <sonny@burdell.org>
Subject: Re: XFS corruption during power-blackout
Date: Tue, 5 Jul 2005 11:53:22 -0400
Message-ID: <20050705155322.GB13262@kevlar.burdell.org>
References: <254889.27725ab660aa106eb6acc07307d71ef1fbd5b6fd366aebef9e2f611750fbcb467e46e8a4.IBX@taniwha.stupidest.org> <OFC7BE2BBA.42F70A93-ON88257030.00595A48-88257030.005A99A3@us.ibm.com> <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wedgwood <cw@f00f.org>
Cc: Bryan Henderson <hbryan@us.ibm.com>, Al Boldi <a1426z@gawab.com>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

On Thu, Jun 30, 2005 at 11:46:27AM -0700, Chris Wedgwood wrote:
> On Thu, Jun 30, 2005 at 12:30:20PM -0400, Bryan Henderson wrote:
> 
> > For another point of reference - were these ATA (personal class) or
> > SCSI (commercial class) drives or both?
> 
> IDE were Maxtor some old Maxtor 60GB disks and some not-so-old 200GB
> WD drives.  Maxtor has 2MB cache.  WD 8MB.
> 
> The SCSI disks where 10K RPM SCA somethings.  I think they were Segate
> (they've since been taken or else I would check).  I have no idea what
> the cache is on those.
> 
> > Is write caching the default on typical SCSI devices?
> 
> I'm not sure.  It seemed to be off by default for the SCSI disks and
> on by default for IDE when I checked.  I can't rule out the
> bios/controller doing something there though.

On all the SCSI drives shipped w/ servers write-caching is turned off
for this very reason.  This is true of all the IBM equipment I've
seen, not sure about the smaller mom & pop outfits or drives sold
through retail channels though.

Sonny
