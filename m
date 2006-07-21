From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: reiser4 status (correction)
Date: Fri, 21 Jul 2006 14:37:33 -0700
Message-ID: <1153517853.6659.56.camel@ipso.snappymail.ca>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>
	 <44C093D2.1040703@namesys.com>
	 <1153514509.6659.41.camel@ipso.snappymail.ca>
	 <44C141C4.1030802@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-rwD954q7P5CG9220I0iS"
Return-path: <reiserfs-list-return-29113-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C141C4.1030802@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

--=-rwD954q7P5CG9220I0iS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-07-21 at 16:06 -0500, David Masover wrote:
> Mike Benoit wrote:
>=20
> > Tuning fsync will fix the last wart on Reiser4 as far as benchmarks are
> > concerned won't it? Right now Reiser4 looks excellent on the benchmarks
> > that don't use fsync often (mongo?), but last I recall the fsync
> > performance was so poor it overshadows the rest of the performance. It
> > would also probably be more useful to a much wider audience, especially
> > if Namesys decides to charge for the repacker.
>=20
> If Namesys does decide to charge for the repacker, I'll have to consider=20
> whether it's worth it to pay for it or to use XFS instead.  Reiser4=20
> tends to become much more fragmented than most other Linux FSes --=20
> purely subjective, but probably true.
>=20

I would like to see some actual data on this. I haven't used Reiser4 for
over a year, and when I did it was only to benchmark it. But Reiser4
allocates on flush, so in theory this should decrease fragmentation, not
increase it. Due to this I question what you are _really_ seeing, or if
perhaps it is a bug in the allocator? Why would XFS or any other
multi-purpose file system resist fragmentation noticeably more then
Reiser4 does.

I don't think the repacker is designed to be a "must have" for every
Reiser4 installation. If it was, I would consider Reiser4 to be
seriously flawed. Instead I think it is simply designed to improve
certain workloads that may cause high fragmentation in hopes of keeping
I/O speeds at their peek.=20

Am I correct in this assumption Hans?
=20
No Linux file system that I'm aware of has a defragmentor, but they DO
become fragmented, just not near as bad as FAT32 used to when MS created
their defragmentor. The highest "non-contiguous" percent I've seen with
EXT3 is about 12%, FAT32 I have seen over 50%, and NTFS over 30%. In
fact I'm running in to a fragmentation issue with ReiserV3 right now
that Jeff is working on, but it is more of a worst case scenario issue,
not a regular occurrence issue.

For "normal" workloads I doubt you would notice much difference at all
by using a repacker, 10% maybe? Which is one of the reasons you probably
haven't seen a repacker for EXT2/3, even though I'm sure it would
improve performance for some people.

--=20
Mike Benoit <ipso@snappymail.ca>

--=-rwD954q7P5CG9220I0iS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEwUkdMhKjsejwBhgRAmrBAJ42Pzsea000Ux6Pf/MqzkjlXFpQJwCdGK/Y
9gVDoD4qbrr3zurH/3xuaFk=
=DQNW
-----END PGP SIGNATURE-----

--=-rwD954q7P5CG9220I0iS--

