From: Jiri Klouda <jk@zg.cz>
Subject: Re: reiser4 for windows
Date: Mon, 6 Dec 2004 22:07:30 -0800
Message-ID: <20041207060730.GA1344@zg.cz>
Reply-To: Jiri Klouda <jk@zg.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <reiserfs-list-return-22698-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs <reiserfs-list@namesys.com>

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Also, is it a given that reiser4 for windows would work without help
> from MS?  I've just never seen a third-party filesystem driver for
> windows.  You'd think that at least one other filesystem, one of the
> Linux/BSD/etc ones, would have done this, if it was feasable.

You might be onto something here. I am pretty sure my company would
pay quite a lot for a working, fast and elegant implementation of=20
symbolic links on windows. Either as a new filesystem or as an addition=20
onto ntfs. We currently use one such addition and not very usable and
uses a catalog of symlinks that can easily get corrupted.

Having reiser4 on Windows or even ext2, would be a huge thing.

> All this leaves me with the distinct impression that it'd be cheaper to
> buy some gigabit ethernet (or fibre) and a Linux CIFS/Samba fileserver
> using reiser4.  Steam and others refuse to install on network drives,
> Windows probably will not boot off a network drive, but I imagine that
> fixing these would be easier than porting a filesystem.

Unfortunatelly even with very fast ethernet connections and network
appliance with CIFS access, we still don't get the performance of a
local filesystem. Plus, you don't want to really give write access=20
over network, that slows down anything when you get into hundreds of
clients. And we really cannot pay for so many network applicances to
make this scalable proposition.

I wish we could just drop Windows as a platform, but as long as there
are customers, there will be need to support them as well... :(

-Jiri

--=20
Jiri Klouda <jk@zg.cz>
http://www.zg.cz/~jk

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBtUiipxwzMweqZNwRApLmAJ9583MYDF5YEL+t/wF5Ldzb80Ju5QCg3BzB
QdqnaxncEbvSAcmEivz5/fc=
=vEb3
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
