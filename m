From: "Burnes, James" <james.burnes@gwl.com>
Subject: Resier Fragmentation Effects (was compression vs performance)
Date: Thu, 8 Apr 2004 11:00:17 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C469DBF@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stewart Smith <stewart@flamingspork.com>, Tom Vier <tmv@comcast.net>
Cc: Scott Young <youngs1@sunyit.edu>, reiserfs-list@namesys.com

I thought nearly all filesystems designed since Berkeley FFS were nearly
immune to fragmentation problems.

After reading the following analysis at Harvard, it seems that
fragmentation is still a problem.

http://www.eecs.harvard.edu/~keith/research/tr94.html

At least with FFS it seems that fragmentation is significantly worse
with smaller files.  That makes a certain intuitive sense.

Of course the Harvard guys are claiming worst case FFS fragmentation
incurs a 30% performance hit.  It would be nice if they could fix that,
but everything is relative.  I remember badly fragmented FAT filesystems
with probably closer to 90% performance hit.=20

Apparently worst case is with file systems loaded down with a lot of
small files like news and mail servers.  Since Reiser tends to be used
in situations that call for a lot of small file creation and deletion I
thought this would be pertinent.  Also Reiser is radically different
internally than FFS.

I know Hans is super busy right now so I don't expect him to comment,
but maybe one of the core people could comment about the effects in
Reiser3 and 4 if they have a spare moment.

jim burnes
security engineer
great-west, denver
=20

> -----Original Message-----
> From: Stewart Smith [mailto:stewart@flamingspork.com]
> Sent: Thursday, April 08, 2004 5:48 AM
> To: Tom Vier
> Cc: Scott Young; reiserfs-list@namesys.com
> Subject: Re: Can compression at filesystem level improveoverall
> performance?
>=20
> On Tue, 2004-03-30 at 14:53, Tom Vier wrote:
> > an online defragger is an interesting idea. i think i remember the
topic
> > coming up for ext2 along time ago. iirc, reiserfs can lose
performance
> over
> > time (usage, actually), too.
>=20
> XFS has this, xfs_fsr (part of xfsdump package on debian, might be
> called that on other distros too...)
>=20
> Although... it's pretty hard to get XFS to fragment in the first
place,
> which is the best way to do things - but it's a hard way :)
>=20
> --
> Stewart Smith (stewart@flamingspork.com)
> http://www.flamingspork.com/

