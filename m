From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: File as a directory - back to predicates
Date: Thu, 01 Sep 2005 22:30:43 -0600
Message-ID: <87vf1k6qh8.fsf@evinrude.uhoreg.ca>
References: <ff80108405082323511225c1f6@mail.gmail.com> <87irxt94yy.fsf@evinrude.uhoreg.ca>
 <ff801084050828083330679bdd@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ff801084050828083330679bdd@mail.gmail.com> (Leo Comerford's
 message of "Sun, 28 Aug 2005 16:33:37 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Sun, 28 Aug 2005 16:33:37 +0100, Leo Comerford <leocomerford@gmail.com> said:

> On 8/25/05, Hubert Chan <hubert@uhoreg.ca> wrote:
>> On Wed, 24 Aug 2005 07:51:19 +0100, Leo Comerford
>> <leocomerford@gmail.com> said:
>> 
>> [... lots of stuff snipped ...]
>> 
>>> At other levels, of course, the differences assert themselves. For
>>> one thing, the normal Unix filesystem API doesn't have calls to,
>>> for instance, check the path"names" asserted of a given
>>> file. That's easily solved; just add the calls.
>> 
>> It's not so easy.  You need to determine how to figure out the
>> pathnames.  UN*X filesystems and filesystems for UN*X-like operating
>> systems don't store uplinks,

> Yes, I know.

>>  so there's no quick way to figure out the
>> pathnames; the only way currently is to traverse the entire tree.

> And that's exactly the point. ("Less easily solved are the performance
> issues.")

Actually, the performance issues are very easily solved in a simple
filesystem model, if you can write a filesystem from scratch: just take
a standard filesystem and add bits to store the uplinks.

(Much harder if you put queries in the filesystem, as proposed by the
Future Vision paper, since any file could potentially have an infinite
number of possible pathnames, and it usually takes a long time to
generate an infinite number of responses.  Of course, you could say that
the "find all pathnames" API is only limited to real non-query
pathnames, but that limits the whole thing very greatly.)

It is much harder to convince everyone to add a new filesystem API.
Especially since performance would suck horribly on almost every other
filesystem, and provides little perceived benefit.  Have you noticed how
hard it's been to try to convince people that file-as-dir is a good
idea?

The problem is not implementing a filesystem where you can get good
normal filesystem performance plus good performance on "find all
pathnames".  The problem is that the "find all pathnames" API would suck
on all current filesystems, and you would face tremendous resistance if
you tried to get it added.

> Again, if you took the expanded API and put a typical Unix filesystem
> implementation behind it, you would find that its performance at
> things like finding pathnames was abysmally slow, while its
> performance at doing the traditional Unix-filesystem things was as
> good as ever. Conversely, if you mounted some kind of registry system

I have no idea what you mean by a "registry system".

> instead (or as well) you' d find that it was very fast at finding
> pathnames, but very slow at many traditional-Unix-filesystem tasks
> (for example rename()ing a directory). Again, consider the analogy of
> an abstract collection type with two or more different concrete
> implementations. The data model is not any of its implementations.
> Just because two different data systems have different performance
> characteristics doesn't mean they need to present different data
> models.

But some times it is better to present different data models to let the
user know of performance issues.  Especially if it is that abysmal.  I
would hope that if I asked my filesystem to find all the pathnames for
some file, then it would say that it was not implemented, instead of
stalling my process for four hours while it searches the entire tree.
IMHO, if an operation takes a horrendously long time, the user should be
forced to implement it themselves if they really, really want to do it.
The system should not aid the user in doing stupid things, unless it has
large flashing warning lights.

>> P.S. most of the stuff that you're saying is already in the Future
>> Vision paper.  At least the main idea of trying to query via
>> metadata.

> Future Vision is predominantly about searching from metadata to data.
> ("Which files are emails about Santa?") It says almost nothing about
> going from data to metadata. ("Is this file an email?")

Is foo an email?
# cat foo/..../mime-type

Much simpler and faster than "find all pathnames, and see if /emails (or
whatever magic path)" is one of them.  And can be done from the command
line too.

The file-as-dir metadata doesn't seem to be in Future Vision, but has
been discussed to death on this mailing list.

> (This is especially unfortunate since Future Vision is in large part
> about how to improve the effectiveness of search in the real world,
> and one of the most ubiquitous, natural and effective real-world
> search strategies is to start with an m-to-d search, then apply d-to-m
> searching on the results. An example:

> "I remember Santa flamed somebody out a while ago. Let's see - search
> for emails from Santa. Hm, thirty hits. [m-to-d]

> Let's take a look... This one here also relates to elves and a strike
> - /that's/ what it was about, I remember now! [d-to-m]

> Any other elf strike emails from Santa? No, just the one: bingo!
> [m-to-d again]".)

> The one thing it /does/ say about data-to-metadata searching is that
> file streams are inelegant, and should be replaced by ... pathname
> metadata, yet another way to represent "d-to-m metadata" that is
> separate from file naming. By contrast, my email argues that unifying
> all OS namespaces into the file naming system, as proposed by Hans in
> Future Vision, is such a good idea that it ought to be applied
> properly to "d-to-m metadata" too. Especially since the only non-bogus
> distinction between "m-to-d metadata" and "d-to-m metadata" is their
> performance requirements.

I don't see any advantage to your scheme over file-as-dir metadata.

(Actually, if you were trying to unify namespaces, you wouldn't be
adding a new API for finding all pathnames.  You would just
"cat foo/..../pathnames".)

BTW, in order to achieve what Future Vision asks for, the underlying
storage system has to be more like a database.  For example, when you
do: "echo message/rfc822 > file/..../mime-type", the filesystem will
automagically store that in an index.  Then, when you do:
"ls ~/[mime-type=message/rfc822]" (or whatever magic path would be
used to search for emails), the filesystem would look in the index for
all the files that have ..../mime-type set to message/rfc822 and
dynamically construct the directory contents.  So you can't think of the
Future Vision filesystem in terms of traditional filesystem storage.  It
will need a bunch of extra data, but should be able to do everything
reasonably quickly, avoiding the "array vs. linked-list" types of
questions (when in reality, the right answer might be a tree).

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

