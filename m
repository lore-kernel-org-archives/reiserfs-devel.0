From: Fionn Behrens <fionn@spamfilter.de>
Subject: Re: Full of surprises - A reiser4 story from userland
Date: Wed, 28 Sep 2005 17:28:07 +0200
Message-ID: <1127921286.12894.106.camel@laptop>
References: <1127914812.12894.96.camel@laptop>
	 <200509281825.49873.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-LeQQZhu4kP2zjbEblDIJ"
Return-path: <reiserfs-list-return-26302-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509281825.49873.vitaly@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-LeQQZhu4kP2zjbEblDIJ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mi, 2005-09-28 at 18:25 +0400, Vitaly Fertman wrote:

> > 2.6.11 refused to boot the
> > root partition, claiming that there were an inconsistency in the FS.
>=20
> the disk format got new parameters and old kernels cannot understand it r=
ight.

Ah, I see. So maybe it would be a good idea if the new fs version would
put up a big fat warning to syslog when it detects a partition written
by a previous version, telling the user that he is about to break
compatibility to his older version (and that the must upgrade userland
tools, too!)

> > Sep 28 08:44:20 rtfm kernel: WARNING: wrong pset member (11) for 42
> > Sep 28 08:44:20 rtfm kernel: WARNING: unused space in inode 42

> which fsck version?

1.0.4

> > the man page said that this would be read-only.=20
>=20
> it says:
> " --check
> the default action checks the consistency and reports, but does not=20
> repair any corruption that it finds. This option may be used on a=20
> read-only file system mount.
> "
> it does not mean 100% read-only check.=20

Okay, you sound a bit like a lawyer, but: you right me wrong.

> > There was my fourth surprise: This fsck thing had LIED to me; it was no=
t
> > read-only.=20
>=20
> why do you think --build-fs is read-only?=20

Had not gone --build-fs yet. This was still about --check.

> > It may have checked the fs read-only but it must have=20
> > treacherously flipped some "error" bit somewhere on disk

> > Warning, mounting filesystem with fatal errors, forcing read-only mount
> > (followed by the error from above)
>=20
> do you see anything relevant in the syslog?

That line was in the syslog.

> > So much for --check being just a check. I grabbed a book and lost about
> > two more precious working hours running the --build-fs thing.

> you need to clarify what reiser4progs version you are running.
> 1.0.5 fixes the fs to the letest format, which is needed for 2.6.13.
> 1.0.3 to the 2.6.10's one.=20

1.0.4 . As I am now back on 2.6.11, I guess I should not upgrade to
1.0.5 or would that not do harm anyway?

thanks for answering!

kind regards,
		Fionn
--=20
I believe we have been called by history to lead the world.
                                                 G.W. Bush, 2002-03-01


--=-LeQQZhu4kP2zjbEblDIJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDOraGjkvYSI4bFywRAhVJAJ4zkCTGXmV75CdpbhWrk8XdLLEbjACfepZF
UcOQVlai6hQtDbD7JPtGaoo=
=MYNF
-----END PGP SIGNATURE-----

--=-LeQQZhu4kP2zjbEblDIJ--


