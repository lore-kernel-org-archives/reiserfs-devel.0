From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Thu, 07 Jul 2005 09:00:32 -0500
Message-ID: <42CD3580.4020008@slaphack.com>
References: <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl> <m2k6kd2rx8.fsf@Douglas-McNaughts-Powerbook.local> <20050629135820.GJ11013@nysv.org> <20050629205636.GN16867@khan.acc.umu.se> <42C4FA1A.1050100@slaphack.com> <20050701155446.GZ16867@khan.acc.umu.se> <20050707082749.GZ11013@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25033-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050707082749.GZ11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Douglas McNaught <doug@mcnaught.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Hubert Chan <hubert@uhoreg.ca>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Markus T=F6rnqvist wrote:
> On Fri, Jul 01, 2005 at 05:54:46PM +0200, David Weinehall wrote:
>=20
>>Which would neither need VFS changes nor be dependent on Reiser4 in
>>any way, so I don't see why this thread lives on.  Just get down to
>>business and implement this metafs =3D)
>=20
>=20
> I've been gone for a while and suddenly drowning in mail...
>=20
> Anyway, I don't really like the metafs thing.
>=20
> To access the data, you still need to refactor userspace,
> so that's not a real advantage. Doing lookups from /meta
> all the time, instead of in the file-as-dir-whatever...

I don't really see the disadvantage.

Also, metafs means much less of a fight to get people to adopt the whole=20
meta concept, because it can be done in a POSIX-compliant way which=20
doesn't break tar.

File-as-dir is nice if you're using meta files, but it causes lots of=20
unexpected weirdness.  I don't think metafs costs us much in=20
performance, and with one or two shell scripts, it wouldn't cost us that=20
much efficiency on the commandline.

But, I also like file-as-dir.  I think it might be time for a vote.

I vote metafs.

Or, maybe Hans needs to tell us which way we're going...

> And the best thing to do would be to bring these "Reiser4-specific"
> enhancements to every FS.

Which has nothing to do with whether it's done in "metafs" or not.
