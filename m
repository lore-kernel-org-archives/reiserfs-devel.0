From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: Reiserfs Data Recovery
Date: Tue, 9 Mar 2004 12:08:00 -0600
Message-ID: <20040309180800.GB32693@dbz.icequake.net>
References: <404C81B9.4050504@nsanity.com> <20040308184124.GE5817@dbz.icequake.net> <404CC8AA.9020405@nsanity.com> <20040308215919.GB11093@dbz.icequake.net> <404DAC43.6070501@namesys.com> <404DD7CD.6030004@nsanity.com> <404DE68E.3080706@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Return-path: <reiserfs-list-return-17147-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <404DE68E.3080706@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2004 at 06:45:18PM +0300, Hans Reiser wrote:
> >
> My bad experience was with getting their drivers to work with 2.6, and I=
=20
> tried to use raid 1..., and I figured out that it wasn't really hardware=
=20
> raid because it needed a software driver that wasn't in 2.6 and it was=20
> work to figure out that it was missing and they don't provide telephone=
=20
> support and, oh, I just hated them by the end of the experience....  I=20
> ended up just using each drive as a separate device and their hardware=20
> as a dumb ide controller.

Yeah, effectively all those cheap "RAID" cards (those w/o a CPU or
local cache) do is provide you with a pretty BIOS menu to setup your
arrays.  All the work is done by the md driver anyway.  The BIOS stores
the array configuration at the end of the disks (I think) and the
"driver" just picks up that configuration and starts running a md set
over the assocated disks.  The hardware itself is a basic ATA controller
as far as I can tell.

--=20
Ryan Underwood, <nemesis@icequake.net>

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFATggAIonHnh+67jkRAns+AJoCCUQcCEkyTk4P5JruD84p6Jo8pACdFuBG
t/TLy3oBs03FtBsi1/J5Y04=
=E/Ss
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
