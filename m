From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 22:50:29 +0200
Message-ID: <1093553429.13881.48.camel@leto.cs.pocnet.net>
References: <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de>
	 <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
	 <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk>
	 <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org>
	 <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk>
	 <20040826001152.GB23423@mail.shareable.org>
	 <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk>
	 <20040826010049.GA24731@mail.shareable.org>
	 <20040826100530.GA20805@taniwha.stupidest.org>
	 <20040826110258.GC30449@mail.shareable.org>  <412E06B2.7060106@pobox.com>
	 <1093552705.5678.96.camel@krustophenia.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-njmBt7sJI+Y+Bwmp5TfP"
Return-path: <reiserfs-list-return-20800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093552705.5678.96.camel@krustophenia.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Lee Revell <rlrevell@joe-job.com>
Cc: Will Dyson <will_dyson@pobox.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

--=-njmBt7sJI+Y+Bwmp5TfP
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 16:38 -0400 schrieb Lee Revell:

> > It has always bugged me that Gnome and KDE implement their own VFS laye=
rs.=20
>=20
> Same here.  This always seemed like something the kernel should be able
> to handle.  It seems to me that if reiser4 had been available at the
> time the Gnome and KDE developers would not have needed to do this.

Well, the kernel doesn't have a filesystem that speaks http, scp and
those things. GnomeVFS is URL-based. It has some pseudo-protocols that
extract a pseudo directory-tree for all installed applications + the
changes the used made, created on the fly from a set of XML files that
are read-only and system-wide and the user-overridden changes. I don't
know if all of these things would really make sense inside the kernel.


--=-njmBt7sJI+Y+Bwmp5TfP
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLk0VZCYBcts5dM0RAgg0AKCLz0jkrP0PfSpQg147pJCZJb8iVACfbeyv
HzBIA9kmJoG/31QvfBIzeYE=
=/7ga
-----END PGP SIGNATURE-----

--=-njmBt7sJI+Y+Bwmp5TfP--

