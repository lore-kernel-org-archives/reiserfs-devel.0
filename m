From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: where are reiser4 sources
Date: Wed, 23 Feb 2005 15:00:32 -0700
Message-ID: <1109196032.15057.35.camel@localhost>
References: <421A096F.5040603@gmx.de> <421A941B.5030708@slaphack.com>
	 <421B4DC0.2000006@gmx.de> <421B7CD5.8080001@namesys.com>
	 <421B7FFF.8050201@gmx.de>  <421CBB13.4030306@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-nB2S8J7LwdVFY3BZoR8n"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <421CBB13.4030306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-nB2S8J7LwdVFY3BZoR8n
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-02-23 at 09:19 -0800, Hans Reiser wrote:
> Mark Junker wrote:
>=20
> > Hans Reiser schrieb:
> >
> >> That violates the license.
> >
> >
> > GPL? This shouldn't be a problem because the sources aren't statically=20
> > linked to Windows. The sources to create the driver can be published=20
> > under GPL too so this shouldn't be a problem.
> >
> > Where do you see the license violation?
> >
> > Regards,
> > Mark
> >
> >
> >
> The GPL says nothing about static linking.  You are making a derivative=20
> work.  No.=20

I don't think that's right, Hans.  If his linking code is also GPL, the
GPL of the filesystem code is satisfied.  The only problem would be from
the Windows licensing rejecting GPL'd driver code, which I think it
does.

The dynamic linking problems can be got around by writing an
implementation that links dynamically against something else that is
okay under GPL.  If that code also happens to link dynamically against
non-GPL code, that is the end-user's problem.  So if there was, say, a
Linux or BSD implementation of a Windows driver interface like
NDISwrapper for filesystems, he could legally write against _that_.

Once there's a documented interface and more than one implementation,
implementing that interface no longer becomes a derived work.

In any case, he could always write a FUSE-like driver that thunked
filesystem calls in and out of a service.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-nB2S8J7LwdVFY3BZoR8n
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCHP0AG8fHaOLTWwgRApbdAJ0Qym+KdckTCFa2bzonr1b1zmjvAwCfdRvY
dD/T2ipcUaclTPya2iwkoGs=
=W189
-----END PGP SIGNATURE-----

--=-nB2S8J7LwdVFY3BZoR8n--

