From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 3/3
Date: Mon, 21 Nov 2005 01:40:30 -0500
Message-ID: <873blqtsf5.fsf@evinrude.uhoreg.ca>
References: <ff8010840511171942x2ae2ebd0m954209103da18740@mail.gmail.com>
	<878xvlqqhv.fsf@evinrude.uhoreg.ca>
	<ff8010840511192303o7c581368o119b68d78b2fe722@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ff8010840511192303o7c581368o119b68d78b2fe722@mail.gmail.com>
	(Leo Comerford's message of "Sun, 20 Nov 2005 07:03:03 +0000")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Sun, 20 Nov 2005 07:03:03 +0000, Leo Comerford <lrc1@st-andrews.ac.uk> said:

> On 11/19/05, Hubert Chan <hubert@uhoreg.ca> wrote:
>> P.S. your relational model can easily be expressed using file-as-dir
>> (well, actually, just standard directories):
>> 
>> /(something)/father-son/aardvark/father is a symlink to
>> '/(whatever)/portrait/Mike')
>> /(something)/father-son/aardvark/son is a symlink to
>> '/(whatever)/portrait/Bob')

> Yes absolutely. Yes, my relational model *does* uses standard
> directories, with three differences.

> 1) foofs's internal implementation of link-directories and "other"
> directories might be different. Or it might not. Entirely unimportant
> at this level.

Yes.  I think that we should distinguish between how the data is stored,
and how it is exported to the filesystem.  I think that anyone who tries
to take a relational table, and try to translate it directly into a
filesystem implementation is nuts.  They are very different data models,
and should not be confused.  (Filesystem is probably more like an
object-oriented database, or, if I remember correctly -- it's been a
while since my database course, a network model database, and not like a
relational model.)

However, I think that it is perfectly reasonable (or at least not
completely insane) to export a relational table through a filesystem
interface, and have filesystem operations reflect on the underlying
table.

> 2) gc might treat some link-directories differently to
> predicate-directories. (If Bob and Mike have been deleted, I don't
> want /(something)/father-son/aardvark/ lying around.)

Yes, I think that would require some entirely different magic.
(e.g. your relational model to know about primary keys and such.)

> 3) Say we just used standard directories to indicate relations. Then
> if a user comes across these "names" ...

[...]

> But what if she comes across

> /(something)/mumble
> /(something)/mumble/thingy/alpha
> /(something)/mumble/thingy/bravo

> ? Is alpha a '/(something)/mumble/thingy', or is it in the 'alpha'
> role of a '/(something)/mumble' relationship with another file? (Or it
> could be in the 'thingy/alpha' role of a '/(something)' relationship.)

A few points
- things should not be named "mumble" or "thingy" -- things should be
  named descriptively (obviously -- of course, people don't always
  follow these obvious rules)
- the user should be in charge of how he/she organizes the data, and so
  he/she should pick the names that he/she wants to use.  It shouldn't
  be mandated.  And anyone else who uses the data should have a
  reasonable expectation to have any confusing things documented.  At
  least database schemas are usually documented for those people who
  need to use them.
- you can still have some sort of marker to indicate what role each part
  of the name takes (e.g. the "...." delimiter to indicate
  pseudofiles).  Or you can use a special naming convention (e.g. tuples
  have a special prefix).  But I think that trying to introduce a new
  delimiter that does basically the same thing as '/' is going to cause
  a lot of problems.  (See Rob Pike's paper, "The Hideous Name", if you
  haven't read it already, for more on this.  It's cited in Hans'
  "Future Vision" paper.)


As a completely different side issue, I think that using random names
such as "aardvark" or "zebra" to refer to tuples is a bad idea (and I
know this isn't part of your proposal).  If you use things that are real
words, people will get confused, since they will try to associate
meaning to something that doesn't have meaning.  (e.g. "why is my
relationship called "dodo", while Bob's is called "tiger"?)  I think
that it's best to just assign random meaningless strings, so that people
will know that they are meaningless.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

