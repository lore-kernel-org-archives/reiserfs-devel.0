From: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 3 Sep 2004 11:14:51 +0200
Message-ID: <2f4958ff04090302141bc222e5@mail.gmail.com>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <200408290004.i7T04DEO003646@localhost.localdomain> <20040901224513.GM31934@mail.shareable.org> <20040903082256.GA17629@kroah.com> <2f4958ff04090301326e7302c1@mail.gmail.com> <41383142.4080201@hist.no>
Reply-To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21420-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41383142.4080201@hist.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Helge Hafting <helge.hafting@hist.no>
Cc: Greg KH <greg@kroah.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Fri, 03 Sep 2004 10:54:26 +0200, Helge Hafting <helge.hafting@hist.no> w=
rote:
> Grzegorz Ja=C5=9Bkiewicz wrote:
>=20
> >
> >devfs was very natural, and simple solution. But to have it right, it
> >would have to be the only /dev filesystem.
> >But no, we like choices, so we have chaos.
> >Udev is just another thing adding to that chaos.
> >
> >Someone was numbering things that are good in BSD design, in that
> >thread. One of those things was going for devfs. No cheap solutions.
> >One fs for /dev. And it works great.
> >
> >Sorry for bit of trolling.
> >
> >
> Devfs was a ver good idea.  The implementation of it
> was a problem, and after some time nobody maintained it.
> No surprise it had to go.  Now udev+tmpfs can do the same
> job, and more.

udef is a one big mistake, having need for userspace tool to use FS is
at least silly.
I can understeand need for some things in kernel to have userspace
daemon. But FS is out of question the least one.

I am supprised noone wanted to maintain devfs. Maybe because people
didn't want to go to devfs only. But still to have classic /dev. It's
also silly, because person writing driver needs to choose between, or
implement all. That's more than bad. Once I have loads of time, and no
work in KDE, I can take over devfs happily :-)

--=20
GJ
