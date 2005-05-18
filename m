From: Leo Comerford <leocomerford@gmail.com>
Subject: Re: file as a directory
Date: Wed, 18 May 2005 12:50:38 +0100
Message-ID: <ff80108405051804503200b343@mail.gmail.com>
References: <ff80108405051605321df0d764@mail.gmail.com>
	 <92232506676-BeMail@cr593174-a>
Reply-To: lrc1@st-and.ac.uk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <92232506676-BeMail@cr593174-a>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

On 5/17/05, Alexander G. M. Smith <agmsmith@rogers.com> wrote:

This is a bit of a shotgun reply, but I hope this answers your
questions and clarifies things. If not, please ask again and I'll try
to give a better answer. There are some other things I should add soon
anyway. (Not immediately, though - I'll be very busy over the next few
days.)

In the photo-with-description use-case, if you want to give the photo
a name, don't link to the relationship between the photo and the
description. Just link straight to the photo file itself, more/less as
you would do today. Remember, in my example, the jpeg file's original
name is '~/photos/dessau-bauhaus' . That links straight to the actual
jpeg binary file itself. (The name would be
'~/photos/dessau-bauhaus.jpeg', but in my example we're not using file
extensions to track file type anymore.) And after I've come along and
associated the dessau-bauhaus jpeg with a description,
~/photos/dessau-bauhaus *still* just links straight to the jpeg
binary. As far as the pathname '~/photos/dessau-bauhaus' is concerned,
'/(something)/description/aardvark:described' is just another pathname
that happens to link to the same file as it. Inspecting the pathnames
of the file ~/photos/dessau-bauhaus will reveal
'/(something)/description/aardvark:described' along with all the other
names it has.

The directory /(something)/description/aardvark: is the link between
the photo and the description. (To be clear, the colon isn't part of
any name-segment. It's a delimiter betweeen name-segments: it's the
relation-directory equivalent of the forward-slash.) In OO terms, the
directory /(something)/description/aardvark: isA
'/(something)/description' and it hasA 'description' and a
'described'. Being the child of /(something)/description/ gives the
relation-directory its file type: it's the pathname
'/(something)/description/(whatever)' that tells us to interpret the
relation-directory as a link between a description and the file it
describes. Actually aardvark: "already" has a file type of
relation-directory - the link from /(something)/description/ specifies
what type of relation-directory it is. Every relation-dir that is a
description-described link is (by definition) in
/(something)/description/ , regardless of which files they have as
their 'description' or 'described'. (This is the sense in which
/(something)/description/ is an "association" - in OOese the term
means a /type/ of link between objects.)

For example, let's suppose a different user, Bob, decides to attach
some descriptions too. He puts a description on the jpeg file
/home/bob/photos/petit-trianon ; he also decides he doesn't like my
description of /home/leo/photos/dessau-bauhaus and puts his own
description on it. So now we have:

/(something)/description/aardvark:
/(something)/description/aardvark:description   -- this is
/home/leo/dessau-bauhaus
/(something)/description/aardvark:described     -- this is my description o=
f it
/(something)/description/manticore:
/(something)/description/manticore:description  -- this is
/home/leo/dessau-bauhaus again
/(something)/description/manticore:described    -- this is Bob's
description of it
/(something)/description/sheep:
/(something)/description/sheep:description        -- this is
/home/bob/petit-trianon
/(something)/description/sheep:described          -- this is Bob's
description of it

And now if I list the pathnames of ~/photos/dessau-bauhaus, I get both
'/(something)/description/aardvark:described' and
'/(something)/description/manticore:described' - telling me that there
are two different descriptions of the file. And everything still just
links directly to the jpeg file.

About the colon: there's nothing magic about the choice of character,
of course, but there does absolutely need to be a way to identify
links from relation-directories in pathnames. Programs (and humans)
need to be able to mechanically tell when (and where) a pathname
asserts part of a relation and when it asserts a predicate, just by
looking at it. Changing the delimiter is a good way to do it because
it highlights the important point: that the relationship between
aardvark and description is different to the relationship between a
(predicate-)directory and its child. (You could use file extensions as
a makeshift subsititute. How about .: ?)

> Are both methods useful?  Yup.  What's the difference between
> associations and properties?  Many-to-one and one-to-one?

The idea is that if you want to assert a single-place predicate of a
file, like "file x is important", you just use give the file an
approprate full path"name" ('~/important' or whatever). If you want to
assert a multi-place predicate - a relation - like "file x is more
important than file y" then you use a relation-directory. That goes
for every kind of multi-way relation/association you might want to
assert between files - one to one, one to many, many to many.
Actually, '/(something)/description' asserts a predicate just like
'~/important' does. But because it's a multi-place predicate, you
can't just link straight from it to the file(s) it applies to. You
need relation-directories to "break out" the different roles in each
instance of the predicate.

(In fact that isn't true in every case. The only reason you have a
separate description file in the photo-with-description example is
because the description is too big and clunky to fit in a file name
segment. In theory, what you really want is just to give the photo a
pathname that contains the description, but since that's not doable
you create a description file and assert a relation between that and
the photo. Back when I first made an earlier version of this proposal,
Hans had an alternative, possibly better, solution for cases like
this. (And it didn't involve subfiles!) But

a) it can probably be implemented using relations, and

b) it only substitutes for a link in the the special case where all
the other member files of the link only really exist to assert
metadata about one of the members. Many or most useful links aren't
like that - like the concatenation example.)

> Actually both can exist in the file system - when you do a directory
> listing of a thing (the photo "file"), you get the subfile listing
> (the text description file's name) and the parent directories listed
> too (like ".." in regular directory listings, but you'd have ..photos
> and ..aunt).

But if you have relation-directories and the ability to find the
pathnames of a given file, you can do everything you can do with
subfiles, just as nicely, and more besides. And if subfiles are
completely redundant and bad news anyway, we shouldn't have them.

Leo.
