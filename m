From: Mike Benoit <mikeb@netnation.com>
Subject: Re: tuning a fs for large number of small files
Date: 06 Nov 2002 09:16:10 -0800
Message-ID: <1036602970.13296.254.camel@mikeb.staff.netnation.com>
References: <Pine.LNX.4.44.0211061711290.2873-100000@gamay.kronodoc.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11933-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0211061711290.2873-100000@gamay.kronodoc.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marko Asplund <aspa@kronodoc.fi>
Cc: reiserfs-list@namesys.com

On Wed, 2002-11-06 at 07:25, Marko Asplund wrote:
> On Wed, 6 Nov 2002, Ragnar Kj=F8rstad wrote:
>=20
> > ...
> > If you have the chance you can tar together all the files, and extract
> > them again. This will help in two ways:
> > - reduce fragmentation
> > - write files to the filesystem in reiserfs-optimal order.
> >   If you create the files in the increasing hash-order access will
> >   typlicly be much faster. If you create a tar of the files from a
> >   reiserfs-filesystem (with the same hash) you will accomplish just
> >   that.
>=20
> i was thinking about using something like the following method for=20
> migrating the files to the new filesystem:
> tar clf - /mnt/oldext3fs | tar xf -
>=20
> this should reduce fragmentation but will it write the files in
> filesreiserfs-optimal order?
>=20
> > What hash-function to use doesn't really matter unless you have a lot o=
f
> > files in a single directory. Do you have that? Is there any typlical
> > "pattern" for the filenames, and the order they are created in?
>=20
> there shouldn't be particularly many files in a single directory. the
> filesystem is actually a hierarchy "database" for our backup system
> (Arkeia) and it replicates the filesystem trees of the machines being
> backed up. i can't come up with a typical file naming or creation order
> patterns. most of the directory hierarchies are quite static except for
> the home directories perhaps.
>=20

Speak of the devil. (Arkeia) We have a similar setup to what you
described, our Arkeia server handles about 1TB of data per full backup,
consisting of over 25 million files. We keep the Arkeia database on
reiserfs 3.x using these mount options:=20

defaults,noatime,notail,nodiratime

Though reiserfs handles all the small files without a problem, we found
that hacking the kernel to disable fdatasync was the only way to get
decent speeds from Arkeia. Beware though, Arkeia does like to crash
often, so this usually means more database restores (like I'm doing
right now), but our backup just wouldn't fit in the window otherwise.=20

Regardless, Arkeia just can't handle our load well at all, it's database
is just way to inefficient and there support is terrible at best.
Honestly I wouldn't recommend Arkeia to my worst enemy if they need to
backup more then a few gigs.

--=20
Best Regards,
=20
Mike Benoit
NetNation Communication Inc.
Systems Engineer
Tel: 604-684-6892 or 888-983-6600
 ---------------------------------------
=20
 Disclaimer: Opinions expressed here are my own and not=20
 necessarily those of my employer

