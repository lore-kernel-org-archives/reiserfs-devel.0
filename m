From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Agressive selective pre-allocation
Date: Tue, 10 Dec 2002 08:58:45 +0100
Message-ID: <20021210085845.K26400@vestdata.no>
References: <20021210074600.J26400@vestdata.no> <200212100826.36651.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200212100826.36651.russell@coker.com.au>; from russell@coker.com.au on Tue, Dec 10, 2002 at 08:26:36AM +0100
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com

On Tue, Dec 10, 2002 at 08:26:36AM +0100, Russell Coker wrote:
> Yes.  Or even files that grow rapidly.  Consider the case of an applicati=
on=20
> which creates 10 files and starts appending data to each of them in turn =
in=20
> chunks of a few K (slapd does this).  Your file system will be 100%=20
> fragmented if you don't do something smart about allocation.

allocate on flush should handle this pretty well, don't you think?
Unless the writes are syncrounous.

But yes, the same principle applies. Files that grow over time (large
number of independent writes) is probably more accurate than slow-growing=20
files.

> > An alternative would be the possibility to tell the fs about the
> > properties of the files. Maybe an ioctl to notify the fs that for this
> > particular file the fs should allocate X blocks at the time? That would
> > ensure that the files only get limited fragmentation and performance
> > stays optimal.
>=20
> Another possibility is that you have a file system created for a specific=
 data=20
> type.  When I create a file system for an LDAP directory I know ahead of =
time=20
> that I will have a small number of large files that are all growing slowl=
y. =20
> An option to the mkfs and tunefs programs to set this would do for me (an=
d=20
> it's easy to implement and get included in the kernel).  If I could set m=
y=20
> LDAP partitions to have disk space allocation in chunks of 4M then I'd be=
=20
> happy.

That would work very well on things like logs - and it's probably a lot eas=
ier
to do than pr-file allocation policy.

> > Does the metadata-format support blocks beeing allocated but not used
> > yet? Is it sufficient to add them to the extent-map, mark them free,
> > without changing the size of the file?
>=20
> You shouldn't need anything in the meta-data if you just do it in allocat=
ion=20
> algorithms, every time you are about to grow a file and you can't grow it=
=20
> contiguously then you search for a large free region.

Hmm, so still only allocate 1 block, but do it at a location that has a lar=
ger
region available?

> > Personally I think fragmentation is one of the most serious
> > performance-problems for filesystems, and this could potentially help a
> > lot at least for the slow-growing files like logfiles and mboxes.
>=20
> mbox's aren't an issue, if you have them then you probably don't care too=
 much=20
> about performance anyway.

I know some that do, because some old mail-clients don't support maildir.


--=20
Ragnar Kj=F8rstad
