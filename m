From: Leo Comerford <lrc1@st-andrews.ac.uk>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 1/3
Date: Fri, 18 Nov 2005 03:22:29 +0000
Message-ID: <ff8010840511171922n7b22194bodf91c0173f3e453f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26995-reiserfs=m.gmane.org@namesys.com>
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

Once again, I have to apologise for a stupidly long and stupidly late
reply. I've tried to make this thing a little more digestible by
chopping it into three chunks. In order to keep any replies together,
I suggest that people reply to the third part unless the reply is very
specific to one of the other parts. This first part is (I hope)
relatively fun.

First of all: I'll refer to 'relation-directories' as
'link-directories' from now on; the new term should be more
enlightening and less misleading. (Sorry if the change causes any
temporary confusion.) Again, each link-directory expresses one
instance of a relation; in RDB terms that's one tuple of a relation or
one row of a table, while in OO theory terms it's one link of a
relation. (In fact that's not completely and invariably true, because
of the "weakly-typed" nature of link-dirs.) The directory which (by
definition) has as its children every link-directory of a given type
is *not* a link-directory. (It is an ordinary predicate-directory.) In
RDB terms it is the table, and its children are its rows. In OO terms
it is the relation (which makes it a class) and its children are the
links of that relation (the objects which are instances of the
relation).

Second, in the coming examples, assume that the present working
"directory" can be set to any "name", those of ordinary atomic files
as well as those of link- and predicate-directories. This isn't
essential to anything that follows, but it does make things more tidy.
The ability to list the path"names" of a given file makes it useful to
have the pwd point to an atomic file: a command, say

$ ls -P

, can list (some of) the parents of the current file, whether or not
it is a directory. The change also creates consistency with
link-directories, which are non-(predicate-)directory files that can
be the target of the pwd.

On 5/28/05, Alexander G. M. Smith <agmsmith@rogers.com> wrote:
> Leo Comerford wrote on Wed, 18 May 2005 12:50:38 +0100:
> > But if you have relation-directories and the ability to find the
> > pathnames of a given file, you can do everything you can do with
> > subfiles, just as nicely, and more besides. And if subfiles are
> > completely redundant and bad news anyway, we shouldn't have them.
>
> I prefer subfiles (or fildirutes) as being easier to understand.  But
> maybe that's just due to lots of experience with using file hierarchies.
> I can see having a relational system, but I'd always want to also have
> a directory hierarchy namespace, so that all files can be named.
>
> Having those relationship directories seems kind of clunky - since
> they're not located near the object being investigated.  Though
> that's a GUI matter of making/(something)/friend the system file browser =
pop up a
> "Show Relationships..." menu item as contrasted with drilling down
> to a subfile directory listing by clicking on an item.

I'll start with an example here. Imagine a directory,

/(whatever)/portrait

, in which there are portrait photos of a number of men, one photo per
man. Each photo is identified under /(whatever)/portrait by the guy's
first name, so you have

/(whatever)/portrait/Mike
/(whatever)/portrait/Bob

and so on. Now suppose we use link-directories to express father/son
relationships between the guys in the photos. So, for example, if Mike
is Bob's father, we could have

/(something)/father-son/
/(something)/father-son/aardvark:
/(something)/father-son/aardvark:father (which is the file also known
as '/(whatever)/portrait/Mike')
/(something)/father-son/aardvark:son (the file also known as
'/(whatever)/portrait/Bob')

Using these link directories, we can easily express the information in
this (father's-side) family tree:

                                          --------   Mike  --------
                                          |                       |
                                          v                       v
                                 ------- Bob ------              Ted
                                 |        |       |               |
                                 v        v       v               v
                                Joe      Dean    Ed              Todd

, where Mike ----> Bob means "Mike is the picture of the father of the
guy pictured in Bob".

But this is where the clunkiness comes in. The family-tree
representation above is an obvious and natural way to conceive of and
manipulate the father/son relationships. We want there to be a
father-son link straight from Mike to Bob; what's more, we want to be
able to list the children (in the graph sense!) of Mike and see Bob
and Ted, and to move leafward from Mike to Bob or rootward from Bob to
Mike. But when we look at how we expressed the information using
link-directories, we see this instead:

        --------------- /(something)/father-son/ --------
        |                                               |
        v                                               v
    aardvark -----------------                     -- zebra ---
    |                        |                     |          |
    |:son                    |:father       :father|          |:son
    |                        |                     |          |
    v                        v                     v          v
(/(whatever)/portrait/Bob) (/(whatever)/portrait/Mike)
(/(whatever)/portrait/Ted)

... and so on for the other relationships. All the information in our
family tree is present and correct, but the way we chose to express it
has almost completely vanished. There is no link to follow from Mike
to Bob; instead we have to

1) find the /(something)/father-son/(animal name):father path"name"s
of /(whatever)/portrait/Mike
2) for each of the /(something)/father-son/(animal name) directories:
    2.1) find the /(whatever)/portrait/* path"name" of (animal name):son
    2.2) iff it's /(whatever)/portrait/Bob:
        2.2.1) success: cd /(something)/father-son/(animal name):son and st=
op
3) failure: announce failure and stop

That's easy to do; it's just a handful of ls es and optionally some cd
s. But it's going to get boring fast. More importantly, what we really
want to do is to be able to examine and move around the family tree in
just the same way that we ls and cd around the directory tree (or
rDAG, and in fact with link-directories it won't even always be
acyclic). But the edges in our family tree have become nodes in their
own right, in the form of the link-directories. In fact, there's
nothing to indicate that the family tree is a tree at all.

Oh well. At least we can save ourselves some physiotherapy by writing
a shell program that will allow us to move from father to son in a
single command. So, when the pwd is /(whatever)/portrait/Mike and we
give our command the argument 'Bob', it will use the procedure above
(plus some error-checking if we're being thorough) to change the pwd
to /(whatever)/portrait/Bob . So now we can do

$ cd /(whatever)/portrait/Mike
$ pwd
/(whatever)/portrait/Mike
$ cg Bob
$ pwd
/(whatever)/portrait/Bob

cg stands for 'change guy', of course. :) That improves things
somewhat. It won't be hard to add a command to list a man's sons:

$ lsg
Joe Dean Ed

What about his father?

$ gd
Mike

But we could take this further: since every man is a member of a tree
of father-son relationships, we could use an equivalent to filesystem
pathnames to express its position in the tree. So, if we use ls -P to
list the absolute pathnames of a file, we can also have lsg -P:

$ ls -P
/(whatever)/portrait/Bob
/(something)/father-son/aardvark:son
[etc. etc.]
$ lsg -P
^Mike-Bob

where the ^ indicates that Mike is a root, since we haven't entered a
father for him, and that Bob is his son. Then, finally, how about
these?

$ cg ..
$ lsg -P
^Mike
$ cg ^Mike-Ted-Todd
$ lng /(whatever)/portrait/Andy; lsg -P .-Andy
^Mike-Ted-Todd-Andy
$ cg ^ ; lsg -P
^Mike

Using cg, lsg and so on, the link-directory nodes appear as edges
between father and son, and the predicate-directories (such as
/(whatever)/portrait and /(something)/father-son ) disappear entirely.
So the tree is back. After we expressed the family tree in terms of
the filesystem "tree", we then built operators for the family tree out
of the operators for the filesystem "tree". That allows us to examine
and manipulate the family tree, as a tree, just as if it were
hardwired into the filesystem API. Looking at the family tree using
the low-level filesystem operators is like examining a JPEG file using
a hex debugger; of course what you see is not going to look anything
like the picture. The specialised operators provide the equivalent of
a JPEG viewer. And they're pleasingly "first-order" - just as much
"real" filesystem operators as ls, cd and so on. Not only are they
accessed through the same interface(s), but they move the same pwd
around, allowing us to freely intermix cg s and cd s, lsg s and ls es.

(Of course, this approach (build the data structures out of existing
types, then build the operators out of existing operators) is also
basically how you create a new type in a high-level programming
language. So it's not a very new or difficult insight, though
apparently it passed these people by

http://www.birdstep.com/database/collaterals/Publication%20-%20Network%20an=
d%20Relational%20Data%20Modeling%20(2004_01_01).pdf

and even eluded our industry leader

http://www.microsoft.com/windows2000/techinfo/howitworks/activedirectory/ds=
vsrd.asp

.)

We can of course take things further. For one thing, inventing and
remembering cute names for the operators on one type of link-directory
isn't hard, but it doesn't scale when we add operators for many other
types. So we can do with generic operators. For example, consider a
set of generic operators for inspecting and editing data as a tree, or
more precisely as a rooted digraph which may or may not be acyclic or
a tree. ch is the generic equivalent to cd or cg , and there are
equivalent equivalents (ahem) for ls/lsg, pwd/pwg and so on. So

$ ch -t /(something)/father-son ..

is equivalent to

$ cg ..

; the the -t argument tells ch to use the tree-browsing conventions
associated with the /(something)/father-son link-directories.
(Obviously ch could do this by invoking cg.) But naturally ch as used
above is too clunky to type regularly, so we could use

$ deftree /(something)/father-son

which sets the default value of -t for the generic tree operators,
after which we can simply type

$ ch ..

instead.

(It should go without saying that programs wouldn't have to use the
new operators by hauling text through standard IO. Part of every set
of rooted-digraph operators would be a library providing function
access to the filesystem "tree" presented by those operators - these
calls would of course be standard across different sets of
rooted-digraph operators, and probably identical to the corresponding
syscalls for the base fileysystem. The only library most programs
would have to load or compile would be that provided by the generic
rooted-digraph operators, which would multiplex between the different
operator-sets' calls in a manner similar to deftree or ch -t .)

The generic operators are quite a nice bit of abstraction. For
example, you could build a GUI tree/rooted-digraph browser as a skin
over ch and friends. Then, just as ch and friends provide a uniform
command-line interface to the tree representations of different file
relationships, the browser will automatically provide a visualisation
and graphical interface for them all - a semantically-aware GUI
relationship-browser rather than yet another single-purpose, ad-hoc
tool for slogging through the base filesystem tree. For example, you
could set it to /(something)/father-son mode and see the family tree,
complete with direct links between father and son, and nothing else.
Or you could show the family tree decorated with additional
information from the base filesystem tree, or vice versa.

(Continuing the JPEG-format analogy, today's filesystem browers do of
course display JPEGs and suchlike, but while they only provide
semantically-aware viewing of individual files (showing a JPEG file as
a JPEG thumbnail, a text file as the start of the text, etc.) our
relationship-browser provides the same for the relationships /between/
files. (Which is actually not so different, since link-directories
both describe relationships between files and in so doing constitute
compound files themselves.)

Now this is all fine, but we still need to create the equivalent of
cg, lsg and so on for each of the relations we define before the
filesystem can provide a high-level interface to them. Quite a bore if
we just want to lash up something quickly. Well, one legitimate
solution is simply not to bother creating the operators; nowhere is it
written that every relation must have a high-level interface. Perhaps
we will write operators for it later if it becomes worthwhile. But not
writing the operators leaves us clunking around in the low-level
representation of our relation; we need a truly lazy solution.

Well, every /(something)/father-son link-directory always has two
children, one named :father and the other :son. In the higher-level
tree interface we want to build, every link-directory represents a
parent-child relationship (in the graph sense), with the :father file
as the parent. Now, relations like that are going to be two a penny.
Instead of writing a different set of high-level tree operators for
/(something)/father-son and every relation like it, we can write an
universal implementation which can provide the operators for all of
them. (Don't confuse this with ch and so on, which provide a generic
/interface/ to the tree operators, so users don't have to remember
that the cd-equivalent for /(something)/father-son is called cg.) So
instead of writing code for cg etc. we can just give the universal
implementation the information it needs to cover=20
/(something)/father-son . The most important information the universal
implementation will need is what the two role-names are and which one
we want to present as the parent in the default semantic-level tree
interface. For nice name segments in the pathnames we should also
provide the name of some directory of which every one of the node
files is a child, such as /(whatever)/portrait for father-son. An
obvious way to provide this information would be to put the
information in a simple text file connected by a link-directory to
/(something)/father-son/ .

So now creating the new parent-child relation, complete with swishy
semantic-level integration to everything, is down to roughly a handful
of cd s and ln s and an echo . Of course, we can do better than that.

$ trel /(something)/father-son :father :son -d /(whatever)/portrait -o
cg lsg pwg lng [etc.]
$

Called thus, trel creates /(something)/father-son/ (if necessary) and
links to it the text file with the information for the universal
implementation of the high-level operators. The role-names are :father
and :son ; :father is made the parent role as it came first. The -d
option specifies /(whatever)/portrait as the name-segment directory.
The -o option takes a list of custom names for the operators; if it is
omitted, the operators can still be accessed using deftree and ch -t ,
and of course custom names can be added later. -d can be omitted. The
role-names can be omitted too, in which case trel uses the role-names
:parent and :child . The first argument specifying the
relation-directory can be replaced by -q foo, in which case the
relation-directory /(stuff)/quickrel/foo is created if necessary. And
finally,

$ trel -q foo . ../bar
$

not only creates /(stuff)/quickrel/foo/ if necessary, but also gives
the pwd the path /(stuff)/quickrel/foo/aardvark:parent and makes
../bar :child . It is equivalent to

$ qtr foo ../bar
$

You can naturally link to an existing directory from
/(stuff)/quickrel/ if you want. Of course, if we know that
/(something)/father-son has already been set up, we can also simply
say

$ cd /(whatever)/portrait/Mike
$ deftree /(something)/father-son
$ lk ../Bob
$

where lk is the generic ln/lng/etc. operator.

But enough. The point is made: a few well-chosen utilities make
link-directories convenient and unclunky, especially for simple tasks.

--
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
