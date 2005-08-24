From: Leo Comerford <leocomerford@gmail.com>
Subject: Re: File as a directory - back to predicates
Date: Wed, 24 Aug 2005 07:51:19 +0100
Message-ID: <ff80108405082323511225c1f6@mail.gmail.com>
Reply-To: lrc1@st-and.ac.uk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25634-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

Firstly, I apologise for the absurdly late reply! Secondly, I'm going
to backtrack for a bit here. Let's forget about relations for the
moment, and concentrate solely on single-place predicates. I also
apologise for (partly) repeating myself at length like this, but this
time I have what I hope is a really nice explanation. So:

Consider an absolutely vanilla registry-type thing of the kind that
Joe Code would produce if you asked him to implement a metadata system
for files/objects/documents/whatever. Users can assign arbitrary
name-value pairs to the objects in the registry; they can also
delete/edit the pairs. And, of course, they can view all the
name-value pairs associated with a given object. The names are
strings. The objects are opaque binaries to the registry. So, in use,
a photo object in the registry might have something like the following
pairs associated with it:

date_taken=3D"2004-03-04"
title=3D"My dog Spot"
type=3D"photo"

(The order in which the pairs are listed is obviously arbitrary.)

Now note that the registry system could use Unix-style segmented
path"names" instead of name-value pairs, in the cases where the value
is a sufficiently short string. For example, we can think of

date_taken=3D"2004-03-04"

as alternative to

date_taken/2004-03-04

which could be further parsed up into

date_taken/2004/3/4

. There's nothing magic about name-value pairs: each one simply
asserts a predicate just as a Unix file"name" does. In fact, a
name-value pair where both the name and value are strings is in effect
just a limited Unix path"name" which must have exactly two segments.

So our mark-2 registry system assigns its objects Unix path"names"
instead of name-value pairs, and the photo object might have have the
following ones:

date_taken/2004/3/4
title/My\ dog\ Spot
type/photo

Isn't this new registry fundamentally very similar to a Unix
filesystem, in which each file has one or more such path"names"? No,
better than that. It *is* a Unix filesystem, subject to a few caveats.
It has the same syntax (it's built of files and pathnames); it has the
same semantics (pathnames express propositions which are asserted of
files); all it need is an implementation which can expose these to the
OS by being mounted. So a completely simple-minded iteration of the
registry "pattern", without any consideration for namespace
integration, Unix philosophy or what have you, translates almost
effortlessly into a Unix filesystem which uses the standard semantics.

This is strong evidence for the power of that filesystem, using those
semantics, to integrate different namespaces into itself. But more,
our registry is a data-to-metadata system: it is designed to allow the
user to find the metadata that has been associated with a particular
piece of data. ("When was this photo taken?", which in our revised
registry becomes "what date_taken path"name" does this file have?".)
Registry systems in general, file streams, stat blocks, subfile
metadata, and the old Macintosh resource fork are all data-to-metadata
systems. By contrast, the Unix file naming system is a
metadata-to-data system, designed to allow the user to find one or
more pieces of data (files) through the metadata that has been
associated with them. ("What photos were shot in 2004?", becoming
"what files are "in" the directory date_taken/2004 ?") But in the
example above, registry data - the metadata of the classical
data-to-metadata system - is being expressed in Unix filenames using
the standard semantics - the language of Unix's classical
metadata-to-data system. This shows the power of the Unix filesystem
to integrate both "d-to-m" and "m-to-d" systems into the one namespace
- the one language of pathnames-as-predicates. This is not so
surprising when you consider that at the semantic/logical level both
types of system are exactly the same: they both just associate
metadata with data.

At other levels, of course, the differences assert themselves. For one
thing, the normal Unix filesystem API doesn't have calls to, for
instance, check the path"names" asserted of a given file. That's
easily solved; just add the calls. Less easily solved are the
performance issues. rmdir date_taken/2004 is going to be rather slow
on a registry-type volume which contains many files, just as listing
all the pathnames through date_taken to a particular file is going to
be relatively painful on a volume which is closer to a traditional
Unix filesystem implementation. The important thing here is that these
/are/ *performance issues*, although certainly not trivial ones. By
stripping away the superficial differences between m-to-d and d-to-m
systems, we have revealed the real difference, performance. The
situation is similar to general programming languages. No-one would
dream of creating a language which has, say, two radically different
and incompatible function call interfaces, one of which is supposed to
be used by functions whose time performance is O(n) or better, while
the other is for > O(n) time functions. But of course we still have to
pay attention to the performances of our function implementations and
make decisions about them.

So, for example, if we decide to represent shooting-date metadata for
a vast number of photos using date_taken pathnames as above, we then
have to decide whether to place date_taken and its subdirectories on a
volume which will let us quickly find what the shooting date of a
given photo is, or a volume which will let us quickly find which
photos were shot in 2004. (Of course the photos don't, or shouldn't
have to be, in the same volume as the directory information in either
case. I'll need to say more about links again sometime.) This is just
like choosing between the array and the linked-list implementation for
some instance of a collection type. One freedom this gives us is that
we can later change the performance tradeoffs by moving date_taken
onto a different volume without breaking code that understands
date_taken .

Of course, the best choices are the ones you don't need to make. What
we /really/ want is a filesystem implementation that gives us
usually-good-enough worst-case performance both in space and in the
time required for all the common data-to-metadata and metadata-to-data
searches as well as all common changes (including moving directories),
all while providing other important features and not being too
arbitrarily limited. Then most of the time we could defer or avoid
worrying about performance by just putting our data on a volume of the
general-purpose filesystem implementation. (Special-purpose
filesystems offering better performance under certain conditions would
be used for further optimisation when necessary.) But while not having
to make performance trade-offs is convenient when we are laying out
metadata, it's even more valuable when we are using it. After all,
having to choose between being able to say when any specific photo was
taken and being able to find all the photos taken on some date is a
horrible decision. We're likely to want to do either or both. Again,
in reality there's just data and its metadata, so it's no surprise
that metadata doesn't divide conveniently into "d-to-m metadata" and
"m-to-d metadata". Even when we assume that some metadata is only
going to be useful in one "direction", we're quite likely going to be
proven wrong.

I don't know if a good-enough all-purpose filesystem implementation
like this is possible; I don't know what can pass as "good enough"
performance for every filesystem task, and I don't know if the hard
bounds on possible performance allow an implementation which is "good
enough" on all counts to exist. But I do know how great it would be to
have that filesystem if at all possible, or failing that one which
comes close without making too many horrible compromises.

That was the most, and least, important caveat; now for some others.

Just because we know that a file is a photo or that it was taken in
2004-03-04 doesn't mean that we don't want it to be deleted. So we
will usually want pathnames like type/photo and date_taken/2004/3/4 to
link weakly to their files. Symlinks are weak, but symlinks are also
symbolic, and when we don't want that indirection we don't want it. So
we need non-symbolic weak links. (Again, more about links later.)

What if two different photos have the same date_taken? They can't both
be /(whatever)/date_taken/2004/3/4 . One workaround is to append a
different, meaningless extra segment to each of their date_taken
path"names", so one photo is /(whatever)/date_taken/2004/3/4/aardvark
while the other is /(whatever)/date_taken/2004/3/4/zebra . That way,
'/(whatever)/date_taken/2004/3/4' is asserted of both files (recall,
of course, that both '/bin' and '/bin/touch' are asserted of whichever
non-directory file is /bin/touch ). This is of course a horrible
crock. The right solution is to allow final "name" segments to be
blank. Any and all of the links from a directory to its non-directory
children (and any future "opaque" links to directories, but no
ordinary directory-directory links) should be allowed to be blank. (No
more than one blank link should be permitted from the same directory
to the same child.) So we could have:

one file "named"  /(whatever)/date_taken/2004        (taken at some
unknown date in 2004)

two files "named" /(whatever)/date_taken/2004/3/4    (taken on 2004-03-04) =
and

one file "named"  /(whatever)/date_taken/2004/3/4/am (taken on the
morning of 2004-03-04).

ls /(whatever)/date_taken/2004 would produce something like

3/
1 blank

, while ls /(whatever)/date_taken/2004/3/4 would produce

am
2 blank

. The search "list by title the photos taken in 2004" (that is, list
the opaque descendants of /(whatever)/date_taken/2004/ by their
entries in /(whatever)/title/ ) will produce something like:

My\ cat\ Socks My\ dog\ Spot My\ gerbil\ Patch My\ turtle\ Alberich

Finally, what if the value in one of the registry's name-value pairs
is /not/ a string? For example, what if a photo object has a
name-value pair named "thumbnail" whose value is an image file?
(Similarly, what if a value is a string too long to be a "name"
segment? For example, the photo might also have a name-value pair
named "description" whose value is 150 words of text.) Hans' proposed
solution to (effectively) this problem was to allow non-textual
segments in names, so you get

date_taken/2004/3/4
title/My\ cow\ Daisy
type/photo
thumbnail/ ---------------
          |          (__) |
          |          (oo) |
          |   /-------\/  |
          |  / |     ||   |
          | *  ||----||   |
          |    ~~    ~~   |
           ---------------

. Obviously the technology to process JPEGs into ASCII art for
terminal display is still somewhat experimental. ;) Seriously, this
approach is probably the Right Thing, but it presents some issues.
(For example, would such a segment have a file type (as it were)
associated with it? Not having types would cause problems (who really
wants to rely on file(1) to help interpret a directory listing?), but
having them raises an dilemma: if two different Postscript files
generate identical images, are they the same thing for naming
purposes? If so, that leads to problems with namespace collision, as
there's obviously no hope of reliably detecting such identities.) An
alternative approach is to put the non-textual (or, er, long-textual)
value in a file and relate it to the file it describes using a
relation-directory. (My previous file-and-description-relation example
is of course an instance of this approach.) This is less correct than
Hans' method - it certainly damages the elegance of the translation
from registry to filesystem - and it's subject to one or two of the
same issues. But it's obviously easier to implement, if you have
relation-directories. I think the best solution may be Hans' approach
using relation-directories as part of the underlying implementation.

In sum: All you need, and all you should need, to assert of a file a
single-place predicate like "was shot on 2004-03-04" is to give the
file one (more) ordinary path"name".

Back to relations next.

Leo.

--=20
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
