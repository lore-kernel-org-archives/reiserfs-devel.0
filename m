From: Steven Cole <elenstev@mesatop.com>
Subject: Re: Object Oriented FS
Date: Mon, 27 Oct 2003 18:40:53 -0700
Message-ID: <200310271840.53732.elenstev@mesatop.com>
References: <200310271604.h9RG4D3h008698@eastgate.starhub.net.sg> <3F9D629A.6050508@namesys.com> <20031027115622.A17778@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15911-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031027115622.A17778@schatzie.adilger.int>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>, Hans Reiser <reiser@namesys.com>
Cc: darren <teodarren@myrealbox.com>, reiserfs-list@namesys.com

On Monday 27 October 2003 11:56 am, Andreas Dilger wrote:
> On Oct 27, 2003  21:23 +0300, Hans Reiser wrote:
> > darren wrote:
> > > allows very high throughput by scaling
> >
> > Do you know what that  means?  (Seriously, I don't....)
>
> Panasas (from what little I have seen of it) looks to be very similar to
> Lustre.  Clients do not access disks directly, but rather have a mapping
> layer between offsets and actual data on disk (similar to LVM and VM
> abstractions of block devices/memory).  Once client has this mapping (very
> small in lustre, on the order of a few hundred bytes at most), it
> can do IO directly to one or more storage devices hence scaling of
> throughput proportional to number of storage targets.
>
> In Lustre at least, the client knows nothing about the physical layout of
> blocks in the file on disk, but rather just accesses one or more objects
> via object identifyer, offset, length so the actual layout of the on disk
> data can change.
>
> Lustre is GPL, don't know about Panasas.
>
> Cheers, Andreas

Reading the following, it appears that something _should_ be GPL...

=46rom http://www.panasas.com/object_storage_arch.html

"Panasas is committed to drive the development of standards for the=20
object-based storage. Through the ANSI T10 committee, Panasas is working wi=
th=20
industry leaders including EMC, IBM, Intel, and Seagate to ensure that=20
open-source, reference implementations of object-based storage designs are=
=20
available and driven through an open standards process."

=46rom http://www.panasas.com/directflow.html

"For the operating system on client server nodes to directly read and write=
=20
data objects, an installable file system must be deployed. The DirectFLOW=20
client installs as a local file system under Linux and is transparent to th=
e=20
operating system and applications above it. This installable file system=20
manages the striping of data objects across StorageBlades on a per-object=20
basis, and unlike standard RAID arrays, has the ability to optimize data=20
layout and RAID level by each object. DirectFLOW thereby enables=20
high-performance simultaneous data access for large numbers of clients to=20
many files."

The fairly large .pdf files available for download seem to be short (2-page=
),=20
prettied-up versions of the information available at the above URLs.

Steven



