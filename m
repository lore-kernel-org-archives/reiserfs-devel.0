From: Leo Comerford <lrc1@st-andrews.ac.uk>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 3/3
Date: Fri, 23 Dec 2005 05:39:35 +0000
Message-ID: <ff8010840512222139j224aa260i845e4ca70636bdb5@mail.gmail.com>
References: <ff8010840511171942x2ae2ebd0m954209103da18740@mail.gmail.com>
	 <878xvlqqhv.fsf@evinrude.uhoreg.ca>
	 <ff8010840511192303o7c581368o119b68d78b2fe722@mail.gmail.com>
	 <873blqtsf5.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: leocomerford@gmail.com
In-Reply-To: <873blqtsf5.fsf@evinrude.uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

On 11/21/05, Hubert Chan <hubert@uhoreg.ca> wrote:

[snip]

> A few points
> - things should not be named "mumble" or "thingy" -- things should be
>  named descriptively (obviously -- of course, people don't always
>  follow these obvious rules)

Well, sure. But even with the best efforts to choose clear and
descriptive "names", the meaning of every "name" will not always be
clear to every person, never mind to programs. For 'mumble' read
'[mumble]'.

> - the user should be in charge of how he/she organizes the data, and so
>  he/she should pick the names that he/she wants to use.  It shouldn't
>  be mandated.  And anyone else who uses the data should have a
>  reasonable expectation to have any confusing things documented.  At
>  least database schemas are usually documented for those people who
>  need to use them.

Documentation is good and important, but for all sorts of good and bad
reasons few filesystems will ever have good, up-to-date documentation
handy for every path"name". And, as Future Vision says, no-one has the
time or the inclination to study up on the format of every database
they might want to use. People like to learn by exploration, even when
they do also read the docs. And a shell utility can't use
human-readable documentation any more than it can apply human Unix
lore or common sense to interpreting the filesystem. To such a
program, every segment name is akin to 'mumble'; without some
additional information, it can't tell that /usr/bin is not an instance
of the relation /usr .

Which brings us back to semantics. I've compared the filesystem
interface to an ADT. But if that were all it is, if there were no
conventions about how to interpret a path"name", then it /would/ be
necessary to get out the manual and read up on the meaning of every
new path"name" you come across, because you would almost never be able
to infer anything about its meaning from looking at it. But the
filesystem isn't (just) a persistent-storage data structure or ADT;
it's a language through which both people and programs communicate.
I've described the semantics of that language before - '/usr/bin' is a
predicate which is asserted of all and only the opaque descendants of
/usr/bin, '/usr' is a predicate which is asserted of all and only the
opaque descendants of /usr, '/usr/passwd' is a predicate which is
asserted of /usr/passwd, etc. etc. ad nauseam. So if I come across
/foo/bar which links to a non-directory file then I know that the
predicate '/foo/bar' is asserted of that file (and that file only).
Even if 'foo' and/or 'bar' is mysterious to me, I already know a good
deal about the intended meaning of this bit of the filesystem, and I
can use what I know to help me deduce the meanings of mysterious
"name"-segments. (To plag^H^H^H^Hparaphrase one David Moser, imagine
walking into an office and seeing a Post-It note stuck on the side of
something. Even if the note contains many nonslarkish English
flutzpahs, you can glork much more of its pluggandisp than if it were
scr=EDofa i dteanga =E9igin eile.) Having this language also means that
even programs which never know the meaning of any "name"-segment can
extract useful information from pathnames in virtue of their form. For
example, listing the common attributes of two files is a matter of
listing the intersection of their pathnames.

But if we start using directories to assert relations as well as
predicates without distingushing those directories which assert
instances of a relation, then we make every sentence in the language
ambiguous. Now any given full path"name" /might/ assert a predicate,
or it might assert an instance of a relation instead. (Or in fact an
instance of any one of several relations, since '/foo:bar/baz',
'/foo/bar:baz', and '/foo:bar:baz' all ambiguate to '/foo/bar/baz' .)
Such an ambiguous language is much less useful. Before, for example,
it took a simple shell command to find the predicates asserted of a
file. When the ambiguity is introduced, that simple operation becomes
an exercise in manual-reading and guesswork.

Speaking of databases, if you ask someone like C.J. Date what the most
important feature of the relational database is, he won't talk about
view-construction or even ACID properties. He certainly won't say
anything about performance. The answer he will give you is
"well-defined semantics". While a subgraph of a network database is
basically just a bit of persistent-storage data-structure whose
meaning can only be discerned by reading the documentation, a table in
an RDB can (must) always be understood as expressing the present
instances of some relation.

> - you can still have some sort of marker to indicate what role each part
>  of the name takes (e.g. the "...." delimiter to indicate
>  pseudofiles).  Or you can use a special naming convention (e.g. tuples
>  have a special prefix).  But I think that trying to introduce a new
>  delimiter that does basically the same thing as '/' is going to cause
>  a lot of problems.  (See Rob Pike's paper, "The Hideous Name", if you
>  haven't read it already, for more on this.  It's cited in Hans'
>  "Future Vision" paper.)

':' does basically the same thing as '/' in the same sense that OR
does basically the same thing as AND. Writing '/' when you mean ':' is
like always writing OR when you mean AND (so P & (Q | R) becomes P &
(Q & R) ). Introducing ambiguity is not a great way to save a
primitive. Now you /can/ eliminate OR without ambiguity, by expressing
it in terms of AND and NOT  (so P & (Q | R) becomes P & ~(~Q & ~R) ).
(Or indeed by expressing all three in terms of NAND.) But this
approach won't work with ':' and '/', because it's 100% impossible to
express (multi-place) relations in terms of single-place predicates.
That leaves three basic options: introduce syntax for link-directories
(or some other primitive that indicates relations), never express
anything that requires relations, or embrace ambiguity.

Going for option 1 then creates the problem of how to hide the
relation information from (or indeed reveal it to) existing code that
doesn't know anything about new syntax for relations. This is
basically exactly the same problem as indicating the start of subfile
metadata to such code, so all the same fixes involving special
"name"-segments or segment prefixes etc. are available. I'll just add
that that whatever kludges have to be applied in the
POSIX-compatiblity interface, they shouldn't blight the
next-generation interface too; a delimiter like ':' is clearly nicer
than special magic "name"-segments when backwards compatibility is not
an issue.

[snip]

Leo.
--
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
