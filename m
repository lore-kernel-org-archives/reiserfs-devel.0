From: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Subject: Re: Reiserfs concurrent write problems
Date: Fri, 30 Apr 2004 15:44:10 -0600
Message-ID: <20040430214410.GA790@em.ca>
References: <20040426172648.GA22918@em.ca> <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca> <1083088841.30344.131.camel@watt.suse.com> <20040430195405.GB23648@em.ca> <1083356649.30344.479.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <reiserfs-list-return-18338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1083356649.30344.479.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2004 at 04:24:10PM -0400, Chris Mason wrote:
> Thanks.  One thing I didn't notice before:
>=20
> Filesystem partition: 72GB on a software RAID-1 array of Fujitsu SCSI
> 15kRPM disks.=20
> Journal partition: 400MB on a software RAID-1 array of Quantum Atlas 10K
> SCSI disks.=20
>=20
> So the external log is on slower disks?  That might explain why it is
> sometimes slower to have reiserfs on the external log.

Yes, the journal is on a slower array.  That's what was available when
building the system.  They're still not *SLOW* disks, though, at 10kRPM
and 32MB/sec transfer rate.
--=20
Bruce Guenter <bruceg@em.ca> http://em.ca/~bruceg/ http://untroubled.org/
OpenPGP key: 699980E8 / D0B7 C8DD 365D A395 29DA  2E2A E96F B2DC 6999 80E8

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAksiq6W+y3GmZgOgRAs1QAJ43poQ16v9XI5Oa9nsBZ6zQh7wf9QCdElv1
whtLw+x7O+bJJkv+CNklovk=
=PAZM
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
