From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: Desktop Filesystem Benchmarks in 2.6.3
Date: Thu, 4 Mar 2004 20:32:02 -0700
Message-ID: <3DF9165145FACB4C96977FF650C1E904096337AE@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17087-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Clemens Schwaighofer <cs@tequila.co.jp>, Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>

I smell a troll, but oh well.  If you are happy with mediocre
performance on substandard hardware, perhaps you don't need reiser after
all.  In fact, I doubt you need ext3.

Some people are happy with poor performing hardware at home.  "Pearls
before swine", I always say.  I suppose they would also be happy eating
Wonderbread that fell on a dirty kitchen floor.

Five second rule!

(jeez talk about cross-posting.  Lemme cut some of those out before I
cross post to the world)

jim burnes
security engineer
great-west, denver
=20

> -----Original Message-----
> From: Clemens Schwaighofer [mailto:cs@tequila.co.jp]
> Sent: Thursday, March 04, 2004 7:00 PM
> To: Felipe Alfaro Solana
> Cc: Robin Rosenberg; David Weinehall; Andrew Ho; Dax Kelson; Peter
Nelson;
> Hans Reiser; linux-kernel; ext2-devel@lists.sourceforge.net; ext3-
> users@redhat.com; jfs-discussion@www-124.southbury.usf.ibm.com;
reiserfs-
> list@namesys.com; linux-xfs@oss.sgi.com
> Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Felipe Alfaro Solana wrote:
> | The problem is that I couldn't save anything: the XFS volume refused
to
> | mount and the XFS recovery tools refused to fix anything. It was
just a
> | single disk bad block. For example in ext2/3 critical parts are
> | replicated several times over the volume, so there's minimal chance
of
> | being unable to mount the volume and recover important files.
>=20
> just my two cents here:
>=20
> if you have an XFS volume, then you mostly do more than just storing
> your baby photos, so you should have a raid below (software or
hardware)
> and then you don't worry about bad blocks, because a) you have a raid
> (probably with a hot spare drive) and b) a daly (or more often)
backup.
>=20
> as for me I stopped using raiser, jfs or xfs at home. why? too many
> negative experience. bad blocks (xfs total b0rked), raiserfs (similar
> things) and I even didn't try jfs. with ext3 it works very well. yes I
> do have a crappy board with a sucky via chipset and some super super
old
> hds, but with ext3 I had NO single problem since 6 months (heavily
> knocking on wood here).
>=20
> all those high end journaling file systems are no good for home
systems
> in my opinion
>=20
> but again, those are just my little two cents here
>=20
> - --
> Clemens Schwaighofer - IT Engineer & System Administration
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> Tequila Japan, 6-17-2 Ginza Chuo-ku, Tokyo 104-8167, JAPAN
> Tel: +81-(0)3-3545-7703            Fax: +81-(0)3-3545-7343
> http://www.tequila.jp
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>=20
> iD8DBQFAR98FjBz/yQjBxz8RAjbtAJ9gyiy3QNak2NgsFyWGm355wshhMgCgz/5E
> r9ARfA4kajBAUZCLOFBi0gw=3D
> =3DInvR
> -----END PGP SIGNATURE-----
