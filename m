From: Stewart Smith <stewart@flamingspork.com>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 01 Jul 2005 11:09:01 +1000
Message-ID: <1120180141.6048.102.camel@localhost.localdomain>
References: <254889.27725ab660aa106eb6acc07307d71ef1fbd5b6fd366aebef9e2f611750fbcb467e46e8a4.IBX@taniwha.stupidest.org>
	 <OFC7BE2BBA.42F70A93-ON88257030.00595A48-88257030.005A99A3@us.ibm.com>
	 <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-vYORHOKhdez9j8DqZeqo"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Chris Wedgwood <cw@f00f.org>
Cc: Bryan Henderson <hbryan@us.ibm.com>, Al Boldi <a1426z@gawab.com>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com


--=-vYORHOKhdez9j8DqZeqo
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2005-06-30 at 11:46 -0700, Chris Wedgwood wrote:
> Yes, but POSIX is broken in places.  The linux implmentation (now and
> for sometime but not always) won't return until all dirty data is
> flushed.

POSIX, in regard to fsync() provides "flexibility for the
implementation" - maybe your environment is special and you don't buffer
anything, so fsync() is null. Or perhaps you cannot control some of the
disk caches, so fsync() is null.

In newer systems, you can check for the flag POSIX_SYNCHRONIZED_IO (or
similar) that, if set, gaurentees that fsync() is synchronously flushing
buffers to disk. However, this only came into the spec in 99 or 2000 i
think, so there are still a lot of systems in which you have to know the
behaviour.

> > and some 'sync' programs do multiple sync()s.
>=20
> Such programs are arguably broken (grub maybe?).  If one doesn't work,
> then why should doing it <n>-times?

It's a legacy from the days when it was an async operation. The idea
went: that the time it took to type sync and press enter three times
(note, no using up-arrow, enter - typing) would be long enough for the
buffers that started to get flushed on the first sync to have hit disk.

> > And it's also filesystem-type-dependent.
>=20
> If a filesystem doesn't flush reliably with sync, I would call that a
> bug.
>=20
> > fsync(), on the other hand, is a true synchronizing operation.
>=20
> Again that requires the fs to behave correctly so if it fails it
> should be reported as a bug.

It's all fun and games - reliably getting data to disk is not fun. If
Linux can reliably follow the idea that fsync() is synchronous and
really does flush everything to disk, then it will be a lot better off
then a lot of other platforms.

Also, it'd be useful to have a list of where bugs affecting this have
been found and in what kernels - It is not out of the question
explicitly coding in exceptions (read: big warnings to users) for these
systems.

I guess a list of known-bad drives and controllers could be useful too.
Doubly useful if the kernel could report this, but a userspace list
would also be good.=20

--=20
Stewart Smith (stewart@flamingspork.com)
http://www.flamingspork.com/


--=-vYORHOKhdez9j8DqZeqo
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iQCVAwUAQsSXrYwDm44RooHBAQJ6hQP9H9lfHmJSHCLxz+sfbmiUAeY44udyywOs
tQSnNDhNbiP8ICWHJCcFjxWEo5pVOEeMvd+G4E0bYpGtAMm91bW780Y0ZQGuzrHQ
WaL4aa43fApYNPhg9EiwyJd9zyi7c9Yn5/XKuottolgxZ7oKWGoqwT60RIO21st7
V2jvpIiSjX0=
=16RG
-----END PGP SIGNATURE-----

--=-vYORHOKhdez9j8DqZeqo--

