From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 19:54:28 +0300
Message-ID: <20050622165428.GA11013@nysv.org>
References: <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com> <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com> <20050621181802.11a792cc.akpm@osdl.org> <1119452212.15527.33.camel@server.cs.pocnet.net> <42B97F82.6040404@yandex.ru> <20050622155505.GZ11013@nysv.org> <42B98FD5.6050201@yandex.ru> <f0cc385605062209464d5619a2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bNvn4bxlrUVLu6cT"
Return-path: <reiserfs-list-return-24469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <f0cc385605062209464d5619a2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "M." <vo.sinh@gmail.com>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--bNvn4bxlrUVLu6cT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2005 at 06:46:50PM +0200, M. wrote:
>
>Is it not simpler to ask the reiserfs guys for a detailed explanation
>of why and where this plugins' layer differs from using VFS for
>plugins and let others comment on that ?

I hope this is not FUD or something like that, but it seems to me
the VFS guys are not too willing to implement Reiser4-HiFi stuff anywhere
else, like the VFS, and don't want Reiser4 in, because it duplicates.

Think of the chicken and the egg.

I may be wrong, though.

>If something cant be done using VFS this layer is needed by reiser4
>and has to be merged.

But it's still possible to let Reiser4 in and take them, say, a feature
at a time to the VFS.

Unless it's going to be a political wankfest/pissing contest about
if things like this should even be implemented, anywhere, ever :P

--=20
mjt



--bNvn4bxlrUVLu6cT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCuZfEIqNMpVm8OhwRAtOUAKC+ubZYVypKK/+MvMZ/2q3S8ZJz8wCdGElM
FDNafKVlMSay7Xlo5PTaE6U=
=DY1c
-----END PGP SIGNATURE-----

--bNvn4bxlrUVLu6cT--
