From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Some ReiserFS failure situations and questions
Date: Wed, 3 Mar 2004 16:48:48 -0600
Message-ID: <20040303224848.GF31472@dbz.icequake.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Return-path: <reiserfs-list-return-17056-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--DO5DiztRLs659m5i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


This is on a Debian unstable system running 2.4.25.

I copied a filesystem to another partition and deleted the partition the
original filesystem was on, all while it was mounted R/W (stupid stupid
stupid).  Then I ended up with a corrupt copy, as well as a corrupt
original filesystem even when the partition was restored.  The copy was
completely unusable.  On the corrupted original, reiserfsck
--rebuild-tree gave up on one of the root trees and tried to reconstruct
things from the rest.

Now, I had previously copied this partition from another disk (and
deleted that partition, forgetting its geometry).  So, I thought perhaps
I could determine where that old partition began so I could retrieve the
filesystem from it.  First I used parted's partition search feature.
That yielded nothing for some reason.  Then I made some guesses and ran
reiserfsck to check.  I told reiserfsck to scan the entire partition,
which it did, but for some reason it wasn't able to locate the reiserfs
superblock which was still there. (I was certain that I placed the new
start-of-partition before the old reiserfs location, and that the space
had not been re-used.)  So each time it simply suggested to create a new
superblock, which was not helpful because it would throw away the old
filesystem information when doing so.  Would it be a good idea to add an
option to debugreiserfs to scan for reiserfs superblocks along an entire
disk device and report their LBA location, so that e.g. parted could be
used to recreate the partition at that location?

In the end, I ended up going with --rebuild-tree on the filesystem I had
destroyed.  It was only able to recover an estimated 1/10 of the files
and directory structure.  Everything else went in lost+found if it was
recovered at all.  Worse, most of the files it "recovered" ended up to
be corrupt; executable files with pieces of some other text file in
them, or full of zeros, etc.  There were also some unexplained phantom
files that turned up with names full of garbage (control characters and
such).  These were difficult to delete, but ones in e.g. /usr/lib would
make ldconfig complain and/or crash.

I'm curious why this chain of events resulted in such a disaster. (mount
filesystem R/W, then delete its partition via parted -> kernel re-reads
partition table)  I mean, this should normally never happen, but why
is a R/W mount with no files currently open (single user mode) corrupted
so badly by its partition being deleted while the reiserfs driver is
running?  Wouldn't hitting the reset button be an even worse thing to
do in any case?

I still have a dd dump of the corrupted partition and a log of
--rebuild-tree can be found at http://dbz.icequake.net/share/fsck.log.gz
=2E  If anyone has any ideas what I can do to better recover this
partition, I would appreciate it.

Previously I had a ReiserFS partition of which the very beginning of the
partition was overwritten with garbage.  This resulted in a similar
disaster.  I wonder if there is a better idea to recover a filesystem
which has had its beginning overwritten.  Or maybe the filesystem trees
can be mirrored elsewhere on the disk for better recovery options?

Anyway, I am a complete newbie at recovering a trashed ReiserFS, so any
general strategy or specific ideas for these two cases would help me
greatly.

----

I have another problem with reiserfs that happens occasionally.  On
reiserfs and only reiserfs partitions, when a crash and journal recovery
happens, occasionally two files that were open will have their contents
"exchanged".  For example, a piece of the text file I was editing ends
up in a licq contact file, or an emule download gets a piece of a web
page from opera in it.  Is this a common problem, and what is the best
way to keep it from happening?  It is irritating because even though the
filesystem is made into a consistent state by the journal recovery, I
usually have to do some manual hacking to figure out what happened to
program's data that is causing it to misbehave, and something like these
things usually turns up.  This sort of thing never occurred with ext3,
or at least I never noticed it.  The stranger thing is that it also
happens on files open for read only, not just those open for writing or
for R/W.

Thanks!

--=20
Ryan Underwood, <nemesis@icequake.net>

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFARmDQIonHnh+67jkRArY9AKDCOR43EQADxvK5WI0uA/EGURhajACfYDYs
3Iw5qV8KlPs3vnQVCwUaUGI=
=u8fN
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--
