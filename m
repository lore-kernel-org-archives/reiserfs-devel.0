From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 13:33:14 -0400
Message-ID: <200506221733.j5MHXEoH007541@laptop11.inf.utfsm.cl>
References: <dedekind@yandex.ru>
Return-path: <reiserfs-list-return-24471-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from "Artem B. Bityuckiy" <dedekind@yandex.ru> 
   of "Wed, 22 Jun 2005 20:20:37 +0400." <42B98FD5.6050201@yandex.ru> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Cc: =?KOI8-R?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Artem B. Bityuckiy <dedekind@yandex.ru> wrote:
> Markus T=D0=96rnqvist wrote:
> > So merge it as it is=20

Fix it first. The "merge as it stands" just gives rise to stuff that is
/never/ fixed properly.

> >                      and move the stuff to the VFS as needed or
> > deemed necessary. And enable the pseudo interface, or at least
> > set it in menuconfig and enable by default, it needs testing too.

Then test it out of the standard tree...

> Reiser4 has a number of great (IMO) things like file as directory,

Urgh.

> atomic operations,

What is atomic that isn't in the standard filesystems? How do you guarantee
it doesn't stop the system dead in its tracks waiting for some very long
transaction to finish?

>                    different kinds of stat data,

Usefulness? Sounds like kernel bloat leading to userspace bloat and
applications/users wondering what the heck goes on when they don't grok the
particular stat format.

>                                                  fibretions, etc,

???

> etc. Some thing is not yet ready - doesn't matter. Some of this is of
> general interest, some is Reiser4-dedicated.

I don't see anything that would interest me at least, so you can safely
scratch the "general interest" part.

> New interfaces are needed to allow users to utilize that all.

That is a quite strong argument /against/ it all in my book. It means bloat
in /every/ filesystem, and they have shown to be able to do without for
some 30 years now. I'd need /very/ strong reasons for adding something.

>                                                               My point
> is that the things that are of general interest must not be
> Reiser4-only.

Reiser4-only stuff is of very limited use, if it isn't just internal
stuff. And that doesn't need any changes.

>               For example, I should have a possibility to implement
> files-like-dir in _another_ FS using the same interfaces that Reiser4
> uses. That's all I wanted to say.

It has been argued over and over that that particular feature /can't/ be
implemented sanely anyway, so it has to stay out. Besides not making any
sense. "You've got files and directories" is a bit asymetrical and so not
quite nice; "all you have is directories" is symmetrical, estetic, and
completely useless; "some files are directories, some aren't; files in
file-directories are different than regular files in directory-directories"
is just a mindless jumble.

> The other question that it may be difficult to foresee everything and
> it may make sense to move some things upper in future.

Another good reason to keep it out ;-)
--=20
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
