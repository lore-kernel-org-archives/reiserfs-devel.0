From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 19:38:36 +0400
Message-ID: <20040916153835.GK5137@backtop.namesys.com>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com> <20040916130809.GI26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040916130809.GI26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Will Smith <will@willsmith.org>, reiserfs-list@namesys.com

On Thu, Sep 16, 2004 at 04:08:09PM +0300, Markus T=F6rnqvist wrote:
> On Thu, Sep 16, 2004 at 12:52:49PM +0400, Alex Zarochentsev wrote:
>=20
> >> 3) the repacker can bring performance of reiser4 back
> >>    to full speed, but only if run several times.
> >yes, we had similar results.  it is so cool that reiser4 repacker effect
> >is visible outside namesys :)
>=20
> S'cuse me, but why does it have to be run several times?

because the current repacker is too dumb :)  It needs a room to place blocks
there in right order.  So, backward run frees space at the beginning of the
disk, next forward run has enough space for its work.=20

I don't want to advocate that algorithm too much, but it was simple enough =
to
be placed into kernel space. =20

We are not going to add more intelligence to the in-kernel repacker module =
but
design an interface between repacker and user-space programs and implement
reisizing alg. in user-space.=20

> A bug to be fixed?
>=20
> >> 4) the repacker is not yet stable - I had to run fsck
> >>    a few times after repacking, and once got a kernel
> >>    stack trace during repacking resulting in an
> >>    un-unmountable filesystem.
> >unmergable units shouldn't be problem for the reiser4 kernel code.
>=20
> What are their significance; what do they mean?

two extent units (start1, len1), (start2, len2) can be merged into one (sta=
rt1,
len1 + len2) because start1 + len1 =3D=3D start2.  I think no reiser4 kerne=
l code
depends on that mergable extents do not exist.

> Basically warnings are scary, even if they were harmless :)
>=20
> Thanks!
>=20
> --=20
> mjt
>=20

--=20
Alex.
