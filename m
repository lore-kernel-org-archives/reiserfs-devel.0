From: Trond Hagen <trond@vinterbro.com>
Subject: Re: add_save_link:search_by_key
Date: 07 Jul 2003 07:51:01 +0200
Message-ID: <1057557060.1925.4.camel@atlas.vinterbro.com>
References: <1057354336.1968.7.camel@atlas.vinterbro.com>
	 <20030705114653.GA7094@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-DlEcbpk2+zUUyOW/aPh6"
Return-path: <reiserfs-list-return-14839-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030705114653.GA7094@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

--=-DlEcbpk2+zUUyOW/aPh6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thanks, but the Red Hat kernel is a 2.4.20 why isn't the fix merged in ?

trond=20


On Sat, 2003-07-05 at 13:46, Oleg Drokin wrote:
> Hello!
>=20
> On Fri, Jul 04, 2003 at 11:32:16PM +0200, Trond Hagen wrote:
>=20
> > why I'm getting a lot of these ?=20
> > Jul  4 22:24:59 db-http1 kernel: vs-2100: add_save_link:search_by_key
> > ([-1 15610004 0x1001 DIRECT]) returned 1
> > I'm running: 2.4.20-13.7smp  (Red Hat 7.3 kernel)
>=20
> Sounds like you've been bitten by infamous iget4() race. The fix is
> merged into 2.4.20
> The individual fix can be obtained from
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending/07-race-fix.dif=
f
> Don't forget to fsck your reiserfs filesystems after applying
> the fix (use latest reiserfsprogs from our ftp site, not the old
> stuff from RH 7.3!)
>=20
> Bye,
>     Oleg
>

--=-DlEcbpk2+zUUyOW/aPh6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/CQpEjoU0q0/uaNERAgwQAKCHo9V4kpJOrCAY6Zp5mFWJgqV60wCgk5Ei
mjRBhk5rXQI1mAA6LeJD3Fc=
=/YdH
-----END PGP SIGNATURE-----

--=-DlEcbpk2+zUUyOW/aPh6--

