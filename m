From: =?ISO-8859-1?Q?J=FCrgen_Botz?= <jurgen@botz.org>
Subject: Re: software packaging and ReiserFS v4
Date: Wed, 03 Sep 2003 14:18:07 -0700
Message-ID: <3F565A8F.4010209@botz.org>
References: <20030903165409.GD4714@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15535-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030903165409.GD4714@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bennett Todd <bet@rahul.net>
Cc: reiserfs-list@namesys.com

Bennett Todd wrote:
> As I've gotten deeper into the project, I've had my nose rubbed in
> the fact that rpm is the accumulating cruft heart; it's the worst.

Amen.  It's so bad that RH can't even fix it anymore... It took
them the better part of a year to fix the widely reported hanging
bug that appeared in RH 8.0.

> Then I started thinking about the database that a good software
> packging tool needs to maintain. After a bit, it hit me that
> ReiserFS 4 would be _killer_!

Uh-huh.  I've been dreaming about something like this for 10 years,
even since I first played around with the Prospero file system.
In its implementation Prospero fell short of its promise, but it
demonstrated the revolutionary idea that closure enabled complete
customization of namespaces in a file system.

> With ReiserFS v4 its as natural as can be; a file /usr/bin/foo,
> installed by a package foo, would simply have a symlink
>=20
> 	/usr/bin/foo/pkg -> /var/lib/pkg/foo
>=20
> Besides scaling elegantly and staying wonderfully simple, this has
> the additional otherwise-impossible feature that the package
> attribution automatically correctly updates if you move the file
> (although the forward mappings within /var/lib/pkg/foo wouldn't
> update automagically).

They could, with the right plug-in.  Without such a plug-in I don't
see why you need reiser4 for this... in fact, this kind of scheme
has already been implemented in some older package managers.  There
are several LISA papers talking about this kind of thing since
the early 90s.  In particular the CMU "depot" system comes to mind.

But take this idea further.... in my ideal system there is no /usr.
/usr is just a historical artifact, anyway.

Nor is there a $HOME.  Depending on your point of view (more about
that below) there is only /, /bin, /lib, /etc, and maybe /man or
/doc, plus any directories you create.  Your files go into /.  Or
at least that's what you think...

In /bin are the programs you use.  There are all the standard Unix
utils, of course, but if you're an emacs user there's /bin/emacs, and
if you're a vi user there's /bin/vi.  That's for you as a user... for
root all commands that are installed in the system are in /bin.  If
you become a heretic ;-) and convert from emacs to vi, you just use
a UI that lets you deselect the emacs package from being included in
your namespace and select the vi package.

The key to this are what we might call "perspectives".  Every user
has their own perspective, or maybe more than one that they can
chose between.  There's also a special perspective that
shows every package in its own hierarchy, i.e.
/pkg/emacs/20.1/{bin,lib,man}.  This perspective is your "package
manager" if you will.  In addition every execution context
has its own perspective... when emacs runs it always sees itself and
all its files as "/pkg/emacs/20.1/...".  This is closure, and
it guarantees that every reference can always be resolved.  It once
and for all solves the "hardcoded path" problem.  It also resolves
name collision problems, multiple installed package version problems,
etc., etc.

Reiser4 as it is today can't do this yet.  But it provides the
infrastructure on which such a system (and others) can be built.

I have learned that very few people actually understand the importance
and power of flexible namespaces, never mind closure in namespaces.
Fortunately Hans Reiser does, and since his wonderful filesystem has
other benefits is being adopted in spite of people's ignorance of
its far-ranging implications!  ;-)

:j

--
J=FCrgen Botz               | While differing widely in the various
jurgen@botz.org           | little bits we know, in our infinite
                           | ignorance we are all equal. -Karl Popper

