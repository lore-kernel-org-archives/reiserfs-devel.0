From: Chris Mason <mason@suse.com>
Subject: Re: online fsck
Date: Thu, 22 Apr 2004 14:06:52 -0400
Message-ID: <1082657211.12989.111.camel@watt.suse.com>
References: <20040422150042.5b49c6c3.pegasus@nerv.eu.org>
	 <1082640853.12989.54.camel@watt.suse.com>  <40880610.9050207@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40880610.9050207@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Jure =?iso-8859-2?Q?Pe=E8ar?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

On Thu, 2004-04-22 at 13:51, Hans Reiser wrote:
> Chris Mason wrote:
>=20
> >On Thu, 2004-04-22 at 09:00, Jure Pe=E8ar wrote:
> > =20
> >
> >>Hi all,
> >>
> >>Is it theoretically posible?
> >>
> >>Like, does it need a drastic redesing of reiserfs or just sufficient $$
> >>directed to the team to be implemented?
> >>
> >>
> >>Because i think that reiserfsck --check in 12h + --rebuild-tree in 18h =
is
> >>still waaay too much downtime for a 500gb mail server...
> >>   =20
> >>
> >
> >Online check is easy, just use lvm or evms to make a snapshot and then
> >check the snapshot.=20
> >
> Requires that users use lvm before discovering the need for fsck, but,=20
> yes.  What would be ideal would be some support for finding the=20
> inconsistency on the snapshot, and then fixing it on the real fs using=20
> the information learned from the snapshot fsck.

Which should be possible, espeically for corruptions at the leaf
levels.  Things like incorrect i_size, pointers to files that don't
exist, etc.  Corruptions that require a full blow rebuild-tree will be
much harder.

I was wrong to say that an online rebuild-tree would be impossible, but
it certainly does seem tricky.  Basically you could freeze the old tree,
using it for readonly lookups.  Rebuild to new tree in the background,
and verify things you find in the old tree in the new tree (to catch a
file that has been deleted while the FS was mounted but is present in
the old tree).

-chris


