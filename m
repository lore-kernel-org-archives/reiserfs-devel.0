From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 19:16:20 +0200
Message-ID: <20060731171620.GL31121@lug-owl.de>
References: <1153760245.5735.47.camel@ipso.snappymail.ca> <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl> <20060731125846.aafa9c7c.reiser4@blinkenlights.ch> <20060731144736.GA1389@merlin.emma.line.org> <20060731175958.1626513b.reiser4@blinkenlights.ch> <20060731162224.GJ31121@lug-owl.de> <1154364421.7964.22.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zROEGoKAXsG5UqGB"
Return-path: <reiserfs-list-return-29304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1154364421.7964.22.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Dan Oglesby <doglesby@teleformix.com>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, Matthias Andree <matthias.andree@gmx.de>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--zROEGoKAXsG5UqGB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-07-31 11:47:00 -0500, Dan Oglesby <doglesby@teleformix.com> wr=
ote:
> On Mon, 2006-07-31 at 18:22 +0200, Jan-Benedict Glaw wrote:
> > On Mon, 2006-07-31 17:59:58 +0200, Adrian Ulrich <reiser4@blinkenlights=
=2Ech> wrote:
> > > A colleague of mine happened to create a ~300gb filesystem and started
> > > to migrate Mailboxes (Maildir-style format =3D many small files (1-3k=
b))
> > > to the new LUN. At about 70% the filesystem ran out of inodes; Not a
> > So preparation work wasn't done.
>=20
> As someone who is currently planning to migrate ~100GB of stored mail to
> the Maildirs format, it was pretty clear early on that EXT3 would not
> cut it (from past and current experiences), and not just for the sake of
> calculating inodes.

Uh?  Where did you face a problem there?

With maildir, you shouldn't face any problems IMO. Even users with
zillions of mails should work properly with the dir_index stuff:

	tune2fs -O dir_index /dev/hdXX

or alternatively (to start that for already existing directories):

	e2fsck -fD /dev/hdXX


Of course, you'll always face a problem with lots of files in one
directory at getdents() time (eg. opendir()/readdir()/closedir()), but
this is a common limit for all filesystems.

MfG, JBG

--=20
       Jan-Benedict Glaw       jbglaw@lug-owl.de                +49-172-760=
8481
Signature of:           Alles wird gut! ...und heute wirds schon ein bi=C3=
=9Fchen besser.
the second  :

--zROEGoKAXsG5UqGB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFEzjrkHb1edYOZ4bsRAjZUAJ4jmxJQFGQSzz6CfPEbZeVAbPIUNQCeMIlB
1lhHhNKeQxAgf7hj7UsnYws=
=aNZk
-----END PGP SIGNATURE-----

--zROEGoKAXsG5UqGB--
