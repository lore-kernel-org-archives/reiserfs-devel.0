From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: reiser4 plugins
Date: Thu, 30 Jun 2005 15:52:25 -0400
Message-ID: <200506301952.j5UJqPrn013513@laptop11.inf.utfsm.cl>
References: <20050630153738.GU11013@nysv.org>
Return-path: <reiserfs-list-return-24855-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from mjt@nysv.org (Markus =?ISO-8859-1?Q?=20T=F6rnqvist?=) 
   of "Thu, 30 Jun 2005 18:37:38 +0300." <20050630153738.GU11013@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus =?ISO-8859-1?Q?=20T=F6rnqvist?= <mjt@nysv.org>
Cc: Nikita Danilov <nikita@clusterfs.com>, Douglas McNaught <doug@mcnaught.org>, Hubert Chan <hubert@uhoreg.ca>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Markus   T=C3=B6rnqvist <mjt@nysv.org> wrote:
> On Thu, Jun 30, 2005 at 07:18:47PM +0400, Nikita Danilov wrote:
> >Sorry, I don't see your point. Again: if you think that user level
> >developers are unlikely to agree to the common framework, what
> >difference it makes whether this framework is defined at the kernel or
> >library boundary? Applications would have to be changed to conform to
> >the common API either way.

> I see it as a heavier incentive to do it by a framework that's in
> the kernel.

API is API, if in-kernel, in-X-lib, or in-userland-VFS-lib is completely
irrelevant.

> >If you can force application developers to conform to the LSB why you
> >cannot do the same with the library level interface?

> If I want to access metadata with bash, do I patch bash to support
> both Gnome's and KDE's solutions? Was there one of XFCE too?
> And FooBarXyzzyWM that'll want to do it's own VFS next year?

It's your only option... or get them together and define a common
framework.

But then again, what would I want to do with metadata in bash? If needed,
it is probably much easier to write tools to extract whatever is needed, no
reason to futz around with the shell. That simple idea was the single most
important advance Unix introduced: The shell is a /simple/ program, it
doesn't do word processing and coffee brewing for you. That is handled by
other programs, one for each task.

> I'd also guess that the upstream guys would much rather have
> patches for their progs that conform to the kernel than some
> obscure neighbor userspace system.

Or just keep only their own obscure userspace system, no need to have to
mess with our own format and a kernel system.

> Sure looks like having this in the kernel makes it easiest; there's
> just one common denominator to patch for.

Again: API is API. If in kernel or in a standard library makes no
difference. Libary is /much/ easier to develop, and hugely more
flexible. It is for a reason that printf(3) and qsort(3) are /not/
in-kernel.

> This doesn't even invalidate the userland VFSs of the other guys,
> they're still needed for systems whose kernels don't have a
> metadata facility.

So the metadata facility in kernel won't be used, for portability's sake.
--=20
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
