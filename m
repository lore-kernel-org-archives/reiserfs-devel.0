From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Object Oriented FS
Date: Mon, 27 Oct 2003 11:56:22 -0700
Message-ID: <20031027115622.A17778@schatzie.adilger.int>
References: <200310271604.h9RG4D3h008698@eastgate.starhub.net.sg> <3F9D629A.6050508@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15904-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F9D629A.6050508@namesys.com>; from reiser@namesys.com on Mon, Oct 27, 2003 at 09:23:22PM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: darren <teodarren@myrealbox.com>, reiserfs-list@namesys.com

On Oct 27, 2003  21:23 +0300, Hans Reiser wrote:
> darren wrote:
> > allows very high throughput by scaling
>
> Do you know what that  means?  (Seriously, I don't....)

Panasas (from what little I have seen of it) looks to be very similar to
Lustre.  Clients do not access disks directly, but rather have a mapping
layer between offsets and actual data on disk (similar to LVM and VM
abstractions of block devices/memory).  Once client has this mapping (very
small in lustre, on the order of a few hundred bytes at most), it
can do IO directly to one or more storage devices hence scaling of
throughput proportional to number of storage targets.

In Lustre at least, the client knows nothing about the physical layout of
blocks in the file on disk, but rather just accesses one or more objects
via object identifyer, offset, length so the actual layout of the on disk
data can change.

Lustre is GPL, don't know about Panasas.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

