From: Piotr Neuman <sikkh@wp.pl>
Subject: Re: Recursive modified-timestamp?
Date: Sat, 1 Jan 2005 18:08:21 +0100
Message-ID: <200501011808.21336.sikkh@wp.pl>
References: <1909372133-BeMail@cr593174-a> <200501011328.13093.sikkh@wp.pl> <200501011420.44734.namesys.Sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501011420.44734.namesys.Sch@ttgen.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dnia sobota 01 stycze=F1 2005 14:20, Fred Schaettgen napisa=B3:
> On Saturday 01 January 2005 13:28, Piotr Neuman wrote:
> > Linux has both inotify and dnotify. I really love the kind of threads
> > where nobody cares to do the research into existing solutions /approach=
es
> > and everybody are talking about their ideas (which is of course easier
> > than searching on google).
>
> I don't see how dnotify or inotify would help here. You can't monitor who=
le
> directory trees with it. inotify (which I admittedly didn't know about)
> seems to allow monitoring just about ~8000 files per device. And you don't
> have any guarantee that none of the files changed before the program using
> inotify starts up.

You have the source code, move that limit up, and change data structures if=
=20
it's necesary for efficient working with large trees...

Inotify has the big advantage of being filesystem agnostic, while reiser4=20
plugins do not.

> > ps. and yup the GNOME folks are busy coding for inotify instead of
> > imagining "something that may or may not exist". Just becose you send
> > stuff to technical mailing list, doesn't mean you have a clue...
>
> So do the KDE folks (not sure if it's dnotify or inotify or simply
> resorting to whatever FAM uses). But that's just a solution to a slightly
> different problem. So with respect to the question I was asking (after
> searching on google) the comment of Alexander about BeOS was much more
> relevant than yours. I don't know if this was directed towards me, but it=
's
> true, I don't have a clue about file systems. Maybe that's the reason I h=
ad
> to ask my question here. Or where else am I allowed to ask such a question
> in your opinion?

=46AM uses the outdated dnotify (just browse lkml.org for info on inotify=20
advantages). One of the goals of GNOME now is to have some platform to=20
compete with the "fabled" Microsoft WinFS. Inotify could replace the "not s=
o=20
small" FAM, for example read:

http://www.ussg.iu.edu/hypermail/linux/kernel/0407.2/0359.html
http://www.gnome.org/~veillard/gamin/overview.html

I hope that low footprint, inotify based solutions will become the standard=
=20
for Linux desktop.

Inotyfy does not support such queries as BeOS did, but knowing the reluctan=
cy=20
of kernel developers to do anything that may increase bloat and could be do=
ne=20
in userspace anyway, I don't think it will be supported.

Good luck on your searches for a new KDE file notification support/system.
