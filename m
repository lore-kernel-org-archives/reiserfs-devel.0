From: Jure =?UTF-8?Q?Pe=C3=A8ar?= <pegasus@nerv.eu.org>
Subject: Re: reiser4 on alpha
Date: Sat, 26 Jun 2004 09:57:32 +0200
Message-ID: <20040626095732.24379346.pegasus@nerv.eu.org>
References: <20040626015101.3c47427d.pegasus@nerv.eu.org>
	<20040626064131.GN5080@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19409-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040626064131.GN5080@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Sat, 26 Jun 2004 10:41:31 +0400
Alex Zarochentsev <zam@namesys.com> wrote:

> > {standard input}: Assembler messages:
> > {standard input}:5: Warning: setting incorrect section attributes for
> > .got
>=20
> Does only reiser4 produce the above warning?

No. I get these from various parts of the kernel, but are a lot less
frequent now on 2.6.7 than on previous kernels.

> > Looking at fs/reiser4/debug.h suggest that this is something done on
> > purpose to guard against other problems.
>=20
> yes, "duplicated case value" is a result of our compile-time assertion if
> it fails.
>=20
> But the assertion is wrong because the assumtion that struct coord has no
> implicit padding is wrong on alpha.

Do i undestrand that right, the fix is just to comment out the c1->pad line
there?

--=20

Jure Pe=E8ar
