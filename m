From: Jeremy West <jkwest@gmail.com>
Subject: Re: reiser4 and reiserfs co-existence?
Date: Tue, 9 Nov 2004 16:56:50 -0500
Message-ID: <b28a88610411091356160c6343@mail.gmail.com>
References: <b28a886104110808555d3f59dc@mail.gmail.com>
	 <1099997754.1373.72.camel@tribesman.namesys.com>
	 <b28a886104110907416476fb50@mail.gmail.com>
	 <662c77ee04110909473d0f6dd3@mail.gmail.com>
	 <b28a886104110909531ee7d29a@mail.gmail.com>
	 <852912156.20041109185702@tnonline.net>
	 <b28a8861041109100612d142bb@mail.gmail.com>
	 <20041109181154.GF26192@nysv.org>
	 <b28a8861041109132135c8530b@mail.gmail.com>
	 <662c77ee04110913347169a645@mail.gmail.com>
Reply-To: Jeremy West <jkwest@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22336-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <662c77ee04110913347169a645@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

that's an interesting idea.  Format a filesystem just for my
webserver.  It could help in the testing.  In the back of my mind I'm
still not sure if that would help though.  I mean I had it lock up the
otherday when scp'ing files from my machine to another.  Then the php
coincident, which I know is an issue.  But now with installing xoops?=20
I know it has to be a php file handling issue, but I'm not sure about
the scp'ing lockup.  I WAS using an older reiser4 patchset at the
time.  That could be it.

Too many variables.  I hate variables.  But I like testing


On Tue, 9 Nov 2004 16:34:17 -0500, Michael Barry <jabbera@gmail.com> wrote:
> This is obviously a reiserfs4 issue, so why not just install xoops
> into a loopback file that is formatted as ext2. Not necessarily your
> swap. Then when they fix the bug you can just copy everything you
> need.
>=20
> Mike
>=20
>=20
>=20
>=20
> On Tue, 9 Nov 2004 16:21:54 -0500, Jeremy West <jkwest@gmail.com> wrote:
> > Alright.  I got php installed using a loopback device formated at
> > ext2.  However in installing xoops php webpage stuff, it craped out
> > and I got a segfault again.
> >
> >
> >
> >
> > On Tue, 9 Nov 2004 20:11:54 +0200, Markus T=F6rnqvist <mjt@nysv.org> wr=
ote:
> > > On Tue, Nov 09, 2004 at 01:06:21PM -0500, Jeremy West wrote:
> > > >Ok.  I wouldn't call myself a linux newbie by any means.  However,
> > > >I've never had to do console logging or network logging.  Are there
> > > >some good docs somewhere on how to set this up?
> > >
> > > Network logging is well-documented in the kernel sources.
> > > Documentation/networking/netconsole.txt
> > >
> > > Recommend you compile netconsole and network card support monolithica=
lly.
> > >
> > > --
> > > mjt
> > >
> > >
> >
> >
> > --
> >
> >
> > Jeremy West
> > //---------------------------
> > "I had a life once... now I have a computer and DSL"
> >
>=20


--=20
Jeremy West
//---------------------------
"I had a life once... now I have a computer and DSL"
