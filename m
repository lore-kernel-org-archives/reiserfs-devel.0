From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: hard hang with reiser4-for-2.6.11-5 and VMware Workstation 5.0
Date: Tue, 21 Jun 2005 20:56:15 +0300
Message-ID: <20050621175614.GV11013@nysv.org>
References: <20050617170514.23193.qmail@web53908.mail.yahoo.com> <42B308C0.4050807@namesys.com> <20050618102940.GP11013@nysv.org> <200506181756.49623.vitaly@namesys.com> <20050618143630.GR11013@nysv.org> <1119267412.4394.84.camel@tribesman.namesys.com> <20050620122432.GS11013@nysv.org> <1119284314.4394.200.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JHjDRUnf1JOMxzko"
Return-path: <reiserfs-list-return-24431-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1119284314.4394.200.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vladimir Saveliev <vs@namesys.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>, scott <scottfk@yahoo.com>

--JHjDRUnf1JOMxzko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2005 at 08:18:35PM +0400, Vladimir Saveliev wrote:

>So, in short, I think you should apply reiser4*patch of 2.6.12-mm1 to
>2.6.12 and that is all.=20

I did that, and the progs, and all's ok!

Quickly ran bonnie++ in the 32-bit chroot and it was ok, also
with 32-bit and 64-bit at the same time, in the same dir.

I dunno what else I can test for soon enough but at least I
didn't get oopses or anything :)

Thanks!

--=20
mjt


--JHjDRUnf1JOMxzko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCuFS+IqNMpVm8OhwRAs/qAKCoBUGbF3tjB/qdkh11LGakBa+qogCeNQvK
YnllHkIohn2t3KOCXoRHtlI=
=qEAo
-----END PGP SIGNATURE-----

--JHjDRUnf1JOMxzko--
