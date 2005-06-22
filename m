From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 18:55:05 +0300
Message-ID: <20050622155505.GZ11013@nysv.org>
References: <20050620235458.5b437274.akpm@osdl.org> <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com> <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com> <20050621181802.11a792cc.akpm@osdl.org> <1119452212.15527.33.camel@server.cs.pocnet.net> <42B97F82.6040404@yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wwU9tsYnHnYeRAKj"
Return-path: <reiserfs-list-return-24465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42B97F82.6040404@yandex.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Cc: Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--wwU9tsYnHnYeRAKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2005 at 07:10:58PM +0400, Artem B. Bityuckiy wrote:
>
>More filesystems in future may want to use these semantics. There are=20
>cases when one can't use Reiser4 to implement them, but instead, need to=
=20
>implement another file system with the same semantics.

So merge it as it is and move the stuff to the VFS as needed or
deemed necessary. And enable the pseudo interface, or at least
set it in menuconfig and enable by default, it needs testing too.

Then someone says "we can't implement this in the fs" and someone
else says "we can't implement this in the vfs" and someone else
says "this is a good thing which we want but you won't let us"
and we stagnate again...

Isn't this bickering getting a bit old?
After all, it seems the code is merged in -mm, the big issues are fixed
and all should be ready for more real-life testing and such?

--=20
mjt


--wwU9tsYnHnYeRAKj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCuYnZIqNMpVm8OhwRAlNhAKCzjcojE8bVWZjWJt+vbWg1XMX2CgCgzRMq
fYY23GL0oeKp4ICxqZxTJpk=
=4wWu
-----END PGP SIGNATURE-----

--wwU9tsYnHnYeRAKj--
