From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Working Reiser4 patch for kernel 2.6.6(-mm2)?
Date: Wed, 2 Jun 2004 20:34:45 +0400
Message-ID: <20040602163444.GG8091@backtop.namesys.com>
References: <200406021554.11690.rmeijer@internet.gr> <20040602125602.GC8091@backtop.namesys.com> <200406021603.46918.rmeijer@internet.gr> <20040602160234.GF8091@backtop.namesys.com> <20040602162348.GH4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040602162348.GH4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com

On Wed, Jun 02, 2004 at 07:23:48PM +0300, Markus T=F6rnqvist wrote:
> On Wed, Jun 02, 2004 at 08:02:34PM +0400, Alex Zarochentsev wrote:
> >> But there was a kernel Oops and something like:
> >> "page_extent: trying to read past end of device. Want=3D23252123 Limit=
=3D83380"
> >It would be fine to see a (decoded) stack trace.

<linux source dir>/Documentation/oops-tracing.txt=20

> Not that I would have had this problem, but are there some general
> guidelines/FAQ-like answer on how to acquire this?
>=20
> >> I can try again and write down the messages if you want...
> >Does the snapshot from 2004.04.21 or from 2004.03.26 work still ?
>=20
> It's against 2.6.5, not 2.6.6, and I think that was the general idea...

Do you use RAID or LVM ?

> --=20
> mjt
>=20

--=20
Alex.
