From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: reiser4 vs. apache2 bad interaction?
Date: Wed, 23 Jun 2004 17:36:31 +0200
Message-ID: <20040623153631.GA10290@chepelov.org>
References: <20040607115743.GA27255@chepelov.org> <20040608165733.GW8091@backtop.namesys.com> <20040608184629.GA6507@chepelov.org> <20040623153253.GC5080@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040623153253.GC5080@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Le Wed, Jun 23, 2004, =C3=A0 07:32:53PM +0400, Alex Zarochentsev a =E9crit:

> > Yes. The machine is http://www.chepelov.org/cyrille/traminer, so you can
> > see it's not exactly a 2U quad-opteron (and you can also get a sense for
> > the kind (and lack) of content on the box).
>=20
> can you try
> http://namesys.com/auto-snapshots/reiser4-2004.06.23-14.56-linux-2.6.7-rc=
3-mm1.diff.gz ?
>=20
> there was a bug in readpages_unix_file() which affected reiser4_sendfile(=
).

Thanks Alex; I will do this ASAP.

	-- Cyrille

--=20
