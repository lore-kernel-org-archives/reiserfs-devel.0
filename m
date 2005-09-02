From: michael chang <thenewme91@gmail.com>
Subject: Re: File as a directory - back to predicates
Date: Fri, 2 Sep 2005 11:57:20 -0400
Message-ID: <b14e81f00509020857251b0f22@mail.gmail.com>
References: <ff80108405082323511225c1f6@mail.gmail.com>
	 <87irxt94yy.fsf@evinrude.uhoreg.ca>
	 <ff801084050828083330679bdd@mail.gmail.com>
	 <87vf1k6qh8.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25824-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87vf1k6qh8.fsf@evinrude.uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

On 9/2/05, Hubert Chan <hubert@uhoreg.ca> wrote:
> On Sun, 28 Aug 2005 16:33:37 +0100, Leo Comerford <leocomerford@gmail.com=
> said:
>=20
> > On 8/25/05, Hubert Chan <hubert@uhoreg.ca> wrote:
> >> On Wed, 24 Aug 2005 07:51:19 +0100, Leo Comerford
> >> <leocomerford@gmail.com> said:
> >> It's not so easy.  You need to determine how to figure out the
> >> pathnames.  UN*X filesystems and filesystems for UN*X-like operating
> >> systems don't store uplinks,
> > Yes, I know.
> >>  so there's no quick way to figure out the
> >> pathnames; the only way currently is to traverse the entire tree.
> > And that's exactly the point. ("Less easily solved are the performance
> > issues.")
> Actually, the performance issues are very easily solved in a simple
> filesystem model, if you can write a filesystem from scratch: just take
> a standard filesystem and add bits to store the uplinks.

But that may introduce incompatabilities with older kernels, and cause
kernel panics, and so on... Logically, the idea is that you're
supposed to think of such things the first time around.  Pity people
don't.

> It is much harder to convince everyone to add a new filesystem API.
> Especially since performance would suck horribly on almost every other
> filesystem, and provides little perceived benefit.  Have you noticed how
> hard it's been to try to convince people that file-as-dir is a good
> idea?

People are stubborn -- they don't like change.  What would be the
point of the API, though, if it could only be used on newer somethings
(filesystems, kernels, whatever you want or can think of).  People'd
want backward compatability to filesystems in the 2.2 kernels...

> The problem is not implementing a filesystem where you can get good
> normal filesystem performance plus good performance on "find all
> pathnames".  The problem is that the "find all pathnames" API would suck
> on all current filesystems, and you would face tremendous resistance if
> you tried to get it added.

Could it end up being a user-space/high-level library?  Manually
implementing this as it is will have sucky performance anyways.  The
idea would be to discourage it's use unless it's necessary, at least
on older FSes.  Then the API wouldn't get adopted, however.

> > good as ever. Conversely, if you mounted some kind of registry system
>=20
> I have no idea what you mean by a "registry system".

I think he means like an index.  You know, like the kind of index
Windows or Google uses for searches.

> > Just because two different data systems have different performance
> > characteristics doesn't mean they need to present different data
> > models.
>=20
> But some times it is better to present different data models to let the
> user know of performance issues.  Especially if it is that abysmal.  I
> would hope that if I asked my filesystem to find all the pathnames for
> some file, then it would say that it was not implemented, instead of
> stalling my process for four hours while it searches the entire tree.

And then someone would make a even higher level function or API that
checks for the function, and upon failure, it would search the tree
manually at the switch of a flag.  It'd still end up taking 4 hours.

> IMHO, if an operation takes a horrendously long time, the user should be
> forced to implement it themselves if they really, really want to do it.
> The system should not aid the user in doing stupid things, unless it has
> large flashing warning lights.

Definately true.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
