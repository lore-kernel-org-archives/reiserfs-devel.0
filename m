From: Leo Comerford <leocomerford@gmail.com>
Subject: Re: File as a directory - back to predicates
Date: Sun, 28 Aug 2005 16:33:37 +0100
Message-ID: <ff801084050828083330679bdd@mail.gmail.com>
References: <ff80108405082323511225c1f6@mail.gmail.com>
	 <87irxt94yy.fsf@evinrude.uhoreg.ca>
Reply-To: lrc1@st-and.ac.uk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25677-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87irxt94yy.fsf@evinrude.uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

On 8/25/05, Hubert Chan <hubert@uhoreg.ca> wrote:
> On Wed, 24 Aug 2005 07:51:19 +0100, Leo Comerford <leocomerford@gmail.com=
> said:
>=20
> [... lots of stuff snipped ...]
>=20
> > At other levels, of course, the differences assert themselves. For one
> > thing, the normal Unix filesystem API doesn't have calls to, for
> > instance, check the path"names" asserted of a given file. That's
> > easily solved; just add the calls.
>=20
> It's not so easy.  You need to determine how to figure out the
> pathnames.  UN*X filesystems and filesystems for UN*X-like operating
> systems don't store uplinks,

Yes, I know.

 so there's no quick way to figure out the
> pathnames; the only way currently is to traverse the entire tree.

And that's exactly the point. ("Less easily solved are the performance
issues.") Again, if you took the expanded API and put a typical Unix
filesystem implementation behind it, you would find that its
performance at things like finding pathnames was abysmally slow, while
its performance at doing the traditional Unix-filesystem things was as
good as ever. Conversely, if you mounted some kind of registry system
instead (or as well) you' d find that it was very fast at finding
pathnames, but very slow at many traditional-Unix-filesystem tasks
(for example rename()ing a directory). Again, consider the analogy of
an abstract collection type with two or more different concrete
implementations. The data model is not any of its implementations.
Just because two different data systems have different performance
characteristics doesn't mean they need to present different data
models.

> P.S. most of the stuff that you're saying is already in the Future
> Vision paper.  At least the main idea of trying to query via metadata.

Future Vision is predominantly about searching from metadata to data.
("Which files are emails about Santa?") It says almost nothing about
going from data to metadata. ("Is this file an email?") (This is
especially unfortunate since Future Vision is in large part about how
to improve the effectiveness of search in the real world, and one of
the most ubiquitous, natural and effective real-world search
strategies is to start with an m-to-d search, then apply d-to-m
searching on the results. An example:

"I remember Santa flamed somebody out a while ago. Let's see - search
for emails from Santa. Hm, thirty hits. [m-to-d]

Let's take a look... This one here also relates to elves and a strike
- /that's/ what it was about, I remember now! [d-to-m]

Any other elf strike emails from Santa? No, just the one: bingo!
[m-to-d again]".)

The one thing it /does/ say about data-to-metadata searching is that
file streams are inelegant, and should be replaced by ... pathname
metadata, yet another way to represent "d-to-m metadata" that is
separate from file naming. By contrast, my email argues that unifying
all OS namespaces into the file naming system, as proposed by Hans in
Future Vision, is such a good idea that it ought to be applied
properly to "d-to-m metadata" too. Especially since the only non-bogus
distinction between "m-to-d metadata" and "d-to-m metadata" is their
performance requirements.

[snip]
--=20
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
