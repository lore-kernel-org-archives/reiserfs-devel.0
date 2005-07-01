From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Fri, 01 Jul 2005 03:08:58 -0500
Message-ID: <42C4FA1A.1050100@slaphack.com>
References: <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl> <m2k6kd2rx8.fsf@Douglas-McNaughts-Powerbook.local> <20050629135820.GJ11013@nysv.org> <20050629205636.GN16867@khan.acc.umu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050629205636.GN16867@khan.acc.umu.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Weinehall <tao@acc.umu.se>
Cc: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, Douglas McNaught <doug@mcnaught.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Hubert Chan <hubert@uhoreg.ca>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

David Weinehall wrote:
> On Wed, Jun 29, 2005 at 04:58:20PM +0300, Markus   T=F6rnqvist wrote:
>=20
>>On Wed, Jun 29, 2005 at 09:50:27AM -0400, Douglas McNaught wrote:
>>
>>>I'll just note that the "applications bundled as directories" stuff on
>>>MacOS/NextStep is done completely in userspace--as far as the kernel
>>>is concerned, "Mail.app" is a regular directory.  The file manager
>>>handles recognition and invocation of application bundles (and there
>>>is an 'open' shell command that does the same thing).
>>
>>Note that MacOS has the monopoly on what they ship, Linux has a
>>motherload of file managers and window systems and all.
>>
>>What pisses me off is the fact that Gnome and friends implement
>>their own incompatible-with-others VFS's and automounters and
>>stuff.
>>
>>Surely supporting this in the kernel and extending the LSB
>>to require this is the best step to take without infringing
>>anyone's freedom as such.
>>
>>*still pissed off about having to hassle an automatic mount*
>=20
>=20
> GNOME and KDE run on operating systems that run other kernels than
> Linux, hence they have to implement their own userland VFS anyway.
> Adding this to the Linux kernel won't help them one bit, unless
> we can magically convince Sun to add it to Solaris, all different
> BSD:s to add it to their kernels, etc.  Not going to happen.
> An effort to get GNOME and KDE to unify their VFS:s would be
> far more benificial,

Than what?  Creating a unified VFS which I can access from Bash, and=20
which obsoletes both GNOME and KDE's VFSes except in their presentation?

> FreeDesktop is doing a lot of work to make GNOME, KDE, and other
> DE:s interoperate as much as possible.  Support their initiative
> instead of trying to get a monstrosity (albeit a very cool one,
> conceptually) into the kernel.  Sure, it could be made to work,
> but not without dropping our Unixness.

(I'm talking about the metafs (/meta) idea, which isn't nearly as much a=20
monstrocity, and doesn't kill our unixness, it enhances it.)
