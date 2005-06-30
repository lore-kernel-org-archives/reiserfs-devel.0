From: Eric Van Hensbergen <ericvh@gmail.com>
Subject: Re: reiser4 plugins
Date: Thu, 30 Jun 2005 14:57:19 -0500
Message-ID: <a4e6962a0506301257827759c@mail.gmail.com>
References: <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
	 <m2k6kd2rx8.fsf@Douglas-McNaughts-Powerbook.local>
	 <20050629135820.GJ11013@nysv.org>
	 <20050629205636.GN16867@khan.acc.umu.se>
	 <20050630100119.GO11013@nysv.org>
Reply-To: Eric Van Hensbergen <ericvh@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24856-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050630100119.GO11013@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Douglas McNaught <doug@mcnaught.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Hubert Chan <hubert@uhoreg.ca>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On 6/30/05, Markus   T=F6rnqvist <mjt@nysv.org> wrote:
>=20
> >instead of trying to get a monstrosity (albeit a very cool one,
> >conceptually) into the kernel.  Sure, it could be made to work,
> >but not without dropping our Unixness.  And if we do, we should
> >start by looking at Plan 9 =3D)
>=20
> What's wrong with "dropping our Unixness" if it means taking
> an extra step toward Plan 9?
>=20
> Why is this a bad idea?
>=20

It's not.  For those who don't already know about it: check out the
v9fs project (http://v9fs.sf.net) - we're taking steps of moving the
Linux kernel towards Plan 9 while trying to preserve Unix semantics
where they make sense.

     -eric
