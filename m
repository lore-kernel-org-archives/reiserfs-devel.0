From: Leo Comerford <lrc1@st-andrews.ac.uk>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 2/3
Date: Fri, 18 Nov 2005 03:29:37 +0000
Message-ID: <ff8010840511171929y2f8cbd1bpd1b703003f10bc56@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: leocomerford@gmail.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

(This long essay has been posted in three parts. In order to keep any
replies together, I suggest that people reply to the third part unless
the reply is very specific to one of the others. This is part two, in
which I criticise file-as-directory some more - far from exciting, but
apparently still necessary. Things should pick up in part three.)

But now let's try to express the father's/son's-photo relationships
between the /(whatever)/portrait photos using subfile metadata instead
of link-directories. /(whatever)/portrait/Mike is (the photo of) the
father of (the man pictured in) /(whaterver)/portrait/Bob - how to
express that using "files as directories"? We could decide that
/(whatever)/portrait/Bob should have the additional path"name"
/(whatever)/portrait/Mike/son-photo . But that would mangle the
filesystem semantics: /(whatever)/portrait/Mike/son-photo isNotA
/(whatever)/portrait/Mike . We need to distinguish the links from
files to their "metadata files" from ordinary directory-to-directory
and directory-to-file links. As the man said, don't try to make things
simpler than possible. So let's call our new pathname
/(whatever)/portrait/Mike;son-photo instead, where ';' is a "name"
segment delimiter in the same way that '/' or (in my examples) ':' is.
(Having a reserved segment-name like ..metas is an alternative
implementation of the same idea.) Now this seems to work fairly well,
but there are problems. Here are some of them.

Problem one: We can assume that the partial pathname after the ';' ,
from the "file-as-directory" to the "metadata file", describes the
type of relationship between the two files. So, for example,
';son-picture' describes one type of relationship, while others could
be ';friend-picture', ';thumbnail' or ';social-sec-no'. So are all
files in the same namespace as regards these relationship-names or
not? In other words, if I see /(whatever)/foo;aardvark and
/(something)/bar;aardvark , can I always safely assume that
/(something)/bar;aardvark is to /(something)/bar as
/(whatever)/foo;aardvark is to /(whatever)/foo ? If so, then there
will be substantial risk of namespace collisions. So in practise, the
"subfile" part of file"name"s will probably have to be fairly
long-winded to minimise the risk: not ';foo' but
';something/not/altogether/unlike/a/third-party/java/package/name/foo'
. If not, if there is some context in which I should interpret what
';aardvark' means, so that it can mean one thing for one
"file-as-directory" and something else for another, what is that
context and how can I know about it? Might it have something to do
with the "file-as-directory"'s file type? (As defined how?) With one
or more of the path"names" that the "file-as-directory" might have? By
contrast, the type of a link-directory is defined by the
predicate-directory it is a child of (by a non-opaque link). So the
namespace of link-directory types is the same namespace of path"names"
that all predicate-directories are in. Path"names" aren't necessarily
very concise either, but at least we're not creating a second
namespace, and equivalent path"name"s ought to be a lot shorter on
average when you have pathname-listing and advanced searching on
pathnames; for example, a user binary can have the two path"name"s
/usr and /bin rather than one long path"name" /usr/bin.

Problem two: consider that you discover Mike's photo-of-son by looking
into its "subfiles" and seeing /(whatever)/portrait/Mike;son-photo ,
while you discover Bob's is-son-photo-of (in effect, its
photo-of-father) by looking through its path"names" and also seeing
/(whatever)/portrait/Mike;son-photo . To find all the relationships
which a given file is involved in, you must check both its "subfiles"
and its path"names". And whether a given relationship will be found
among one or the other is arbitrary. Had we chosen to use
;father-photo rather than ;son-photo links, then Bob's metadata would
have been a "subfile" while Mike's would have been a path"name".

But, one could argue, this is only a problem in the special cases
where both "directions" of a two-part relationship are worth
expressing. It just so happens that the reverse of the is-son-of
relation is a useful relation to consider. It just happens to be the
case that every man is a father to all his sons; or rather, the
reverse of 'x is the son of y' - 'y has the son x' - happens to be
important enough to have another form, 'y is the father of x'. So in
these special cases, we can create a link in both directions: for
example, we can create both /(whatever)/portrait/Mike;son-photo and
/(whatever)/portrait/Bob;father-photo . Then the user can find all of
a file's useful file-is-dir metadata by inspecting its subfiles, and
so happily ignore its subfile pathnames.

But creating both /(whatever)/portrait/Mike;son-photo and
/(whatever)/portrait/Bob;father-photo means having a cycle in the
representation of some simple non-cyclic data. Also, the fact that
Mike was the parent of Bob through a ;son-photo in the base filesystem
tree conveyed that we should see Mike as the parent (in the graph
sense) of Bob in terms of the ;son-photo relationship too. (Thus the
filesystem gave us a tree-based representation of the father-son data
for free using base filesystem operators; we cd ed "up" from Bob to
Mike,"down" from Mike to Bob and "down" again from Bob to Dean or
Joe.) But if Mike and Bob are both parents of each other, then the
subfile metadata doesn't indicate a "direction" we should think of as
rootward any more than a link-directory does. Like a link-directory,
we either have to provide extra metadata to indicate "which way is up"
or rely on users having context information. The two links also
duplicate data: how would the subfile metadata for both "directions"
be kept in sync? The only robust way to do it would be to set up a
persistent query to dynamically generate the links in one "direction"
from the links in the other; significant overkill.

And what about the relations we don't duplicate? Saying that one
"direction" in a given two-part relation will never be important to
anyone is begging to be proven wrong; it amounts to speaking the fatal
words "no-one will ever want to ...". As an example, consider the
relationship between an image file and another image file that is a
thumbnail for it. This is probably as good a candidate as any for
subfile metadata: just create /(whatever)/portrait/Mike;thumbnail or
whatever. But then suppose someone comes across the thumbnail image,
under some different "name", and decides they want to put it onto
their website. Is there a larger version of the image, they wonder,
that can be displayed if the user clicks on it? Well, obviously the
fact that there is a larger image that it is a thumbnail of is now
rather important. So at best we look rather silly when the user finds
what they want via a "boring" link. Alternatively, the user doesn't,
or can't (see problem four), check through the "boring" links and so
doesn't find her file at all.

(There is also the fact that it might make more sense to express the
interesting directions as path"names" and leave "subfiles" for the
boring reverse directions, since all of a file's ordinary,
non-relational path"names" are considered to be interesting.)

So an alternative argument is to say that having to check both
subfiles and path"names" to find all a file's relations is exactly
what we want: relationships in which that file is the child show up as
path"name"s, while relationships in which it is the parent show up as
subfile metadata. This is a better approach, but it has problems
discussed in part three. It also sharpens problem four.

Problem three: the interaction of relations of different types can
easily create cycles even when both relations describe simple acyclic
data. If I give /(whatever)/portrait/Mike the pathname
/(whatever)/portrait/Bob;employs , asserting that Bob employs Mike,
then I have created a cycle. Once again subfile metadata creates a
cycle in the base filesystem representation where none exists in the
data being expressed. (By contrast, link-directories often keep cycles
out of the base filesystem representation of data that contain
cycles.)

Problem four: without the ability to list pathnames of a file, our
problems with pathnames worsen. How to tell that
/(whatever)/portrait/Mike;son-photo is /(whatever)/portrait/Bob ? We
could search through the possibly many entries in /(whatever)/portrait
looking for the file that is /(whatever)/portrait/Mike;son-photo; this
boils down to searching by hand for the /(whatever)/portrait/*
pathnames of /(whatever)/portrait/Mike;son-photo . Or we could have
/(whatever)/portrait/Mike;son-photo/Bob instead of
/(whatever)/portrait/Mike;son-photo , but this is duplicated data
which will break silently if someone renames /(whatever)/portrait/Bob
. To prevent this, we could decide that the file that is
/(whatever)/portrait/Mike;son-photo/Bob should not have a
/(whatever)/portrait/Bob pathname at all. But this will, for example,
mean that /(whatever)/portrait , intended to be a list of all
portraits, will in fact contain only /(whatever)/portrait/Mike . This
solution "ghettoizes" subfiles: any information I might want to know
about Mike's son-photo (as that) must be stuck into the son-photo
pathname, and no other pathname to the file that is Mike's son-photo
can safely duplicate any of the information packed into the son-photo
pathname. The only other way out is to use dynamically-generated
path"name"s, but this is significant overkill, and in any case any
code that (for example) generates /(whatever)/portrait/* paths from
/(whatever)/portrait/Mike;son-photo/* paths itself needs some way to
keep aware of all /(whatever)/portrait/Mike;son-photo/* paths. So the
only reasonable approach is to implement pathname-listing as well as
file-as-directory.

(Problem five: the overloading of file-as-dir to express single-place
predicates, relations and compound files makes the meaning of a piece
of subfile metadata ambiguous without context. A bit more on this
sometime.)

So file-as-dir is a flawed way of expressing parent-child relations.
Unfortunately, when it comes to relations, expressing two-way
parent-child links and providing a tree view of them is what
file-as-dir does /best/.

--
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
