From: Russell Coker <russell@coker.com.au>
Subject: Re: Agressive selective pre-allocation
Date: Tue, 10 Dec 2002 08:26:36 +0100
Message-ID: <200212100826.36651.russell@coker.com.au>
References: <20021210074600.J26400@vestdata.no>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12134-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021210074600.J26400@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ragnar =?iso-8859-1?q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

On Tue, 10 Dec 2002 07:46, Ragnar Kj=F8rstad wrote:
> A lot of filesystems have files that grow slowly over time, and this is
> causing serious fragmentation, and thus performance-problems in some
> situations.

Yes.  Or even files that grow rapidly.  Consider the case of an application=
=20
which creates 10 files and starts appending data to each of them in turn in=
=20
chunks of a few K (slapd does this).  Your file system will be 100%=20
fragmented if you don't do something smart about allocation.

> Some files, for instance MBOX-type mailboxes and logfiles, are known to
> the user/administrator to grow over time. It is possible to preallocate
> diskspace by creating large files with just zeroes in them, but this is
> not very flexible and requires the application to be awere.

Most applications will either have an error condition if the file is longer=
=20
than they expect, treat it as all data (and leave a hole in the file), or=20
truncate it to the length that they want.

> An alternative would be the possibility to tell the fs about the
> properties of the files. Maybe an ioctl to notify the fs that for this
> particular file the fs should allocate X blocks at the time? That would
> ensure that the files only get limited fragmentation and performance
> stays optimal.

Another possibility is that you have a file system created for a specific d=
ata=20
type.  When I create a file system for an LDAP directory I know ahead of ti=
me=20
that I will have a small number of large files that are all growing slowly.=
 =20
An option to the mkfs and tunefs programs to set this would do for me (and =

it's easy to implement and get included in the kernel).  If I could set my =

LDAP partitions to have disk space allocation in chunks of 4M then I'd be=20
happy.

> Does the metadata-format support blocks beeing allocated but not used
> yet? Is it sufficient to add them to the extent-map, mark them free,
> without changing the size of the file?

You shouldn't need anything in the meta-data if you just do it in allocatio=
n=20
algorithms, every time you are about to grow a file and you can't grow it=20
contiguously then you search for a large free region.

> Personally I think fragmentation is one of the most serious
> performance-problems for filesystems, and this could potentially help a
> lot at least for the slow-growing files like logfiles and mboxes.

mbox's aren't an issue, if you have them then you probably don't care too m=
uch=20
about performance anyway.

--=20
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

