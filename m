From: Leo Comerford <lrc1@st-andrews.ac.uk>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 3/3
Date: Fri, 18 Nov 2005 03:42:50 +0000
Message-ID: <ff8010840511171942x2ae2ebd0m954209103da18740@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26998-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: leocomerford@gmail.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

(This is the third and final choke-sized chunk. In order to keep any
replies together, I suggest that people reply to this part unless the
reply is very specific to one of the others.)

File-as-dir is a flawed way of expressing parent-child relations.
Unfortunately, when it comes to relations, expressing two-way
parent-child links and providing a tree view of them is what
file-as-dir does /best/.

Even simple two-way relationships that don't have an obvious
parent-child nature cause additional problems. Say we decided to
create metadata to record which of the men are friends. So if Dean
gets along with his brother Ed we could create

/(something)/friend/aardvark:
/(something)/friend/aardvark:1 (which is the file also known as
'/(whatever)/portrait/Ed')
/(something)/friend/aardvark:2 (which is the file also known as
'/(whatever)/portrait/Dean')

using link-directories. In fact, if we have anonymous last name
segments, we can just create

/(something)/friend/aardvark: , which links anonymously to both the Ed
and Dean photos.

But try to express this using subfiles: which of the two brothers will
we arbitrarily choose to make the subfile of the other?

In general, because the subfile relationship is always parent-child,
to express a symmetric relationship in it we have to make up spurious
extra data, declaring one participant in the relationship to be the
'parent' when no such distinction exists. Ed and Dean are unlikely to
care about this, but try deciding whether Sales worksClosely with
Marketing or Marketing worksClosely with Sales on your firm's
computerised org chart. (Apparently things like LDAPisation projects
have provoked wars over less.) And in the link-directory example using
anonymous links, even the dumbest program that knows nothing about
either /(something)/friends or friendship can tell that
/(something)/friends/aardvark: is symmetric. In the link-directory
example that doesn't use anonymous links, it doesn't know that - and
subfile metadata will actively give it the false parent/child
information. And of course even if we already know that a specific
relationship is symmetric, or if it's not important that we find out,
problems two and four from part two bite hard. For example, reliably
finding all of Ed's friends' photos requires looking for both all his
photo's ;friends children and all its ;friends parents every time. We
have similar problems for relationships that aren't symmetric, but for
which we don't want to have to declare one role to be the parent of
the other. Which party in a is-husband-of/is-wife-of relation should
be indicated as the parent?

Then there are (>2)-way relations. Here's a good example of a
three-way relation, lifted from the
Rumbaugh-Blaha-Premerlani-Eddy-Lorensen OO book. Say that we have
files representing programmers, software projects and programming
languages. Now say that, for example, Bob is using Algol 68 on the
Foomatic and both SNOBOL and PL/1 on Project Omega, while Dean is
coding in PL/1 on the Computron and in PILOT on Project Omega, and
Todd is formally specifying the Foomatic in Z. We would represent this
information using link-directories by creating

/(thingy)/impl-lang/aardvark:coder --> /(whatever)/portrait/Bob
/(thingy)/impl-lang/aardvark:lang   --> /bin/algol68
/(thingy)/impl-lang/aardvark:proj    --> /(whatever)/projects/foomatic
/(thingy)/impl-lang/zebra:coder --> /(whatever)/portrait/Dean
/(thingy)/impl-lang/zebra:lang   --> /bin/pilot
/(thingy)/impl-lang/zebra:proj    --> /(whatever)/projects/foomatic

and so on: one link-directory for each triple of programmer, project
and language. If we want to express the same information using subfile
metadata we are going to have to create something like

/(whatever)/portrait/Bob;impl-lang/1/proj   --> /bin/algol68
/(whatever)/portrait/Bob;impl-lang/1/lang   --> /(whatever)/projects/foomat=
ic
/(whatever)/portrait/Dean;impl-lang/1/proj  --> /bin/pilot
/(whatever)/portrait/Dean;impl-lang/1/lang  --> /(whatever)/projects/foomat=
ic

and so on. Problem two is worse in this case. Not only do we have to
look through the path"name"s of /(whatever)/projects/foomatic in order
to find out what programmers are working on it, but in order to find
out what languages Bob is using on the Foomatic we have to find the
/(whatever)/portrait/Bob;impl-lang/* directories among the path"name"s
of /(whatever)/projects/foomatic and then examine those directories'
./language names. And to find out what projects Bob is working on, we
have to list all the /(whatever)/projects/* files which are linked
from /(whatever)/portrait/Bob;impl-lang/*/project . All this is
basically the same as working with link-directories using
base-filesystem commands; indeed /(whatever)/portrait/Bob;impl-lang/1
is basically /(thingy)/impl-lang/aardvark: shoved under an arbitrary
choice of one of the three files it relates.

We created tools so that we could handle parent-child relations
expressed as link-directories without clunkiness; naturally we can do
similar things for relations of other kinds. One generally useful tool
would be something like rels below:

$ cd /(whatever)/portrait/Dean
$ rels
/(something)/father-son (:son) :father
/(thingy)/impl-lang (:coder) :lang :proj
/(thingy)/impl-lang (:coder) :lang :proj
/(something)/friend
$

rels lists the link-directories of which /(whatever)/portrait/Dean is
a descendant. The animal names at the end of each link-directory's
"name" have been omitted, because they don't convey any information
beyond distinguishing between different link-directories in the
relation-directory. (The last "name"-segment of a link-directory isn't
always thus; in my other email to you shortly I discuss how programs
can sensibly identify the ones that are.) Some other compression is
obviously possible too. It would be possible to create a program (or
an ls option) that worked like ls -P (as described above) except that
instead of printing pathnames through link-directories it would
substitute the corresponding rels entry. And those who really,
absolutely demand to deal with relations via subfile metadata could
create a set of tree operators to simulate it by presenting the
non-relational pathnames of the base filesystem tree as well as
pathnames like this:

/(whatever)/portrait/Dean;(something)/father-son[son]:father
/(whatever)/portrait/Dean;(thingy)/impl-lang/zebra[coder]:lang
/(whatever)/portrait/Dean;(thingy)/impl-lang/zebra[coder]:proj
/(whatever)/portrait/Dean;(thingy)/impl-lang/giraffe[coder]:lang
/(whatever)/portrait/Dean;(thingy)/impl-lang/giraffe[coder]:proj
/(whatever)/portrait/Dean;(something)/friend

. (If (something)/father-son and so on seem rather bulky in this
context, remember problem one from part two; real-world
subfile-metadata names will probably be just as long.)

Other possible things include:

$ cd /(whatever)/portrait/Bob
$ go /(something)/father-son/manticore:son
$ pwd
/(whatever)/portrait/Dean
$ langs-used
pl1 pilot
$ go /(something)/friend
$ pwd
/(whatever)/portrait/Ed
$ go /(something)/father-son/:father
$ pwd
/(whatever)/portrait/Bob
$

.

Using subfile metadata automatically creates a rooted-digraph
representation of the (meta)data: if Mike is the father of Bob, you
express that by using a subfile link to make Bob's photo an actual
subfile of Mike's in the base filesystem "tree". So you can go "down"
the subfile link from Mike to Bob and (maybe) "up" again to Bob. We
saw earlier how we can instead present tree presentations of arbitrary
link-directory metadata. This alternative approach, providing

$ pwg
^Mike-Ted-Todd
$ lsg
Andy

instead of

$ pwd
/(whatever)/portrait/Mike;son-photo;son-photo
$ ls
son-photo employs random-stuff irrelevant whats_this ~ [etc. etc.]

, is more powerful and more pleasant even if all you want is a single
rooted-digraph presentation of the (meta)data you are using. But of
course we don't always want to look at everything as a rooted digraph.
Some data we don't want to present as a rooted digraph at all. Imagine
we have a large body of heavily interconnected /(something)/friend
links , making for a big and definitely rootless graph. We could just
present this as a rooted digraph by arbitrarily choosing one person's
photo to be the root, but we really don't want to have to do this,
just as we don't want to have to choose one person's photo to be the
parent in an individual photo-of-friend/photo-of-friend relationship.
So we need operators to explore and manipulate rootless graphs too.
Something like

$ pwd
/(whatever)/portrait/Ed/(whatever)/portrait/Ed
$ defrel /(something)/friend
# some metadata off /(something)/friend/ is specifying a name-segment
# directory, as with /(something)/father-son/ above, so we do:
$ go Dean
$ rel
Ed
$

would provide the basic "ls" and "cd", and obviously we can do much
more. And one important application of a set of generic rootless-graph
operators is that it gives us a graph presentation of both all
symmetric two-way links (like /(whatever)/friend ) and all asymmetric
two-way links for which we don't have metadata to indicate which role
to think of as the parent.

And naturally data doesn't have to be relational to demand a
non-rooted-digraph representation. Say I attach metadata to the
/(whatever)/photos files specifying for each photo the co-ordinates of
the pictured man's house. Operators which present a geometric rather
than a graph view can then be employed:

$ pwd # current location
/(whatever)/portrait/Bob
$ pwg # current location
^Mike-Bob
$ loc # current location
39=B0 45.38' N 105=B0 00.55' W  1610
$ range 5 # everything within 5 kilometres
/(whatever)/portrait/Ed /(whatever)/portrait/Jeff
$ cg Dean # move from father to son
$ up 500; north 20 # move up 500 m and north 20km
$ loc
41=B0 04.203' N 81=B0 31.442' W 782
$pwd
/(stuff)/coords/earth/039_56.163N105_00.55W2110/aardvark

. :)

One of the nice things about using rooted digraphs to represent data
is that so many things can be thought of as special cases of them, and
so represented as them. For example, we can sensibly represent a stack
as a tree, with the tail as the root. But of course all trees that
represent stacks in this way have additional constraints: for example,
there is at most one child per parent. So while we can use all the
generic "tree" operators on our stack-as-a-tree, we can also provide
other operators that won't (reliably) work on other tree
representations, including an operator to move to the head and
operators to push and pop. So where possible, we should create
non-rooted-graph presentations of the filesystem by extending the
rooted-graph presentation; we could implement a completely new set of
operators to present stacks and the like, but why do so? Only when the
new presentation can't reasonably be seen as an extension of the
rooted-graph presentation should we make a whole new set of operators;
this is the case with the rootless-graph and geometric presentations
discussed above.

There is also a lot of information that can reasonably be presented as
a rooted digraph but which we may want to present in other ways too.
One example is the base filesystem "tree" metadata itself. In many
ways it's best to think of the filesystem as consisting of files, with
attributes (their (full, opaque) pathnames) attached, floating around
inside their volumes in a completely unstructured fashion. Directories
are basically searches-by-attribute which return an unordered set of
the matching files, with the additional wrinkle that files which have
a more specialised version of the attribute appear in subdirectories.
(For example, all the files with opaque pathname '/usr/[aardvark]' are
children of /usr/, while all the files with the opaque pathname
'/usr/bin/[zebra]' are children of /usr/bin/, despite the fact that
having the pathname '/usr/bin/[zebra]' means that '/usr' is also
asserted of them.) So we need an operator which works like ls/lsg/etc.
except that instead of listing the children of a file it lists all
(and only) its opaque descendants. Beyond that though, you don't
actually much need extra shell operators to support the "bunch of
files searchable by attribute" way of looking at the filesystem; most
of what you need is at the levels above (the visual presentation of
directories/search results in the GUI) and below (using mount() to
expose persistent queries as directories). So it's actually an
untypical, bad example. :)

Speaking of GUIs, the improved filesystem GUI mentioned earlier which
works as a skin over the generic rooted-digraph operators (ch et al.)
can obviously provide a skin over other sets of generic operators too.
For example, it can provide a special GUI representation for stacks,
queues and deques as a thin skin over a set of generic
stack/queue/dequeue operators (itself an extension of the set of
generic rooted-digraph operators, as discussed above). Similarly it
could provide a GUI for unrooted graphs expressed through the generic
graph operators, a 2D or 3D-plot representation of data presented
through the geometric operators, and so on. So it could present a GUI
to the /(something)/friend data that decorates each node with
/(something/father-son and /(stuff)/coords/earth information, or
indeed use a specialised position-on-earth GUI to display the
/(stuff)/coords/earth data of the /(whatever)/portrait files with the
/(something)/friend information represented as great-circle lines
charted between the locations of each pair of friends. The important
point here is how thin a layer this GUI is, knowing nothing about the
syntax or semantics of the data it is representing beyond what it gets
from the operators it supports. This gives it extreme flexibility:
flicking between the two GUI presentations described above, or
replacing the /(something)/friend lines on the globe display with
/(something)/father-son ones, is a matter of one or two commands
rather than recoding GUI components. The power this could afford is
considerable.

And finally, there is the information that we want to be able to view
both as a rooted digraph and as ... a different rooted digraph (or as
more than two different ones). For example, the subfile-metadata
representation of the of the picture-of-father/picture-of-son metadata
discussed above presents it as a descendant chart showing (photos of)
(some of) the descendants of (most obviously) Mike. But parent/child
relationships can just as easily be thought of as creating a pedigree,
giving information about people's ancestors. In other words, it's just
as correct to think of (for example) Joe as being at the root of a
pedigree. Now it happens that the partial pedigrees expressed by our
photo-of-father/photo-of-son relationship metadata are all degenerate
trees, but that's only because everyone has only one father. Bring
mothers and daughters into the picture as well and the answer to
"which way is root?" becomes entirely relative, no pun intended. So we
might want to be able to view parent/child (in the biology sense)
relationships both as descendant charts and as pedigrees. This is easy
to do using the link-directories approach: just tell the "tree-view"
operators to regard :son rather than :father as being the rootward
role, or vice versa. (Note that we can do something similar with
rootless graphs: specify a root node using a command like

$ setroot /(whatever)/friend/Ed

and then you can use the rooted-digraph operators on the graph.) But
the subfile-metadata approach only provides us with one presentation
or the other unless we duplicate or rejig the data, or use a custom
persistent query.

In sum: "file-as-a-directory" gives us nothing, in terms of power,
unambiguousness, or convenience, that we can't get from
link-directories plus a small set of convenience utilities. The
reverse is emphatically not the case. Furthermore, link-directories
plus some more convenience utilities give us powerful things that are
pretty much beyond the ken of "file-as-a-directory" altogether.

But why not build the new tools to work on top of subfile metadata
rather than link-directories? Firstly, because subfile metadata is not
a sound foundation to build them on. Due to things like problem five
in part two and the problems with symmetric links above, subfile
metadata is ambiguous and sometimes downright misleading, so the
amount you can safely infer from it without extra context information
is limited. Secondly, once we have implemented the tools - once we
can, for example, present the ;son-photo subfile metadata as a
pedigree using the rooted-digraph operators and use those operators to
navigate and tweak the pedigree just as easily as if it were expressed
in the base filesystem tree - the advantages of using subfile metadata
are gone. The ;son-photo links give us a rough-and-ready tree
representation of the descendant chart for free, but we can get a
better, cleaner tree representation of the descendant chart using the
same class of operators we use to navigate the pedigree. So why put up
with the pain that the file-as-dir kludge will cause us when it no
longer satisfies any of our needs? Providing both file-as-dir and
link-directories is a bad idea too, for roughly the same reasons.

> - Alex
>

Leo.

--
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
