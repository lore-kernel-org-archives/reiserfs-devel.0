From: Leo Comerford <lrc1@st-andrews.ac.uk>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 3/3
Date: Thu, 8 Dec 2005 08:53:30 +0000
Message-ID: <ff8010840512080053p9b490bdpc6c496670e9ed2be@mail.gmail.com>
References: <11589152124-BeMail@AlexDualP3>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27222-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: leocomerford@gmail.com
In-Reply-To: <11589152124-BeMail@AlexDualP3>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

On 11/19/05, Alexander G. M. Smith <agmsmith@rogers.com> wrote:
> Leo Comerford wrote on Fri, 18 Nov 2005 03:42:50 +0000:
> > [^.*$]
>
> Just a few points I thought of while reading through your text:
>
> Genealogy is an extremely structured arrangement of data, most people won=
't be
> doing something that complex - think of photo filing instead.  Also cycle=
s
> exist everywhere, even in genealogy.  So cycles should be supported by de=
fault.

Cycles? Sure. Hence all the quibbling about the generic "tree"
operators actually being rooted directed graph operators.

(In the case of geneaology, parent-child digraphs are acyclic unless
they involve Beeblebroxes, though they're *shudder* not invariably
/trees/.)

It's true that a lot of file metadata doesn't involve recursive
structure or suchlike, but you don't have to get very advanced or
esoteric to find file metadata that does. Expose your email's
Reply-to: information as file metadata and you have recursive
structure.

(Sidebar: Actually, you can think of the process of improving the
filesystem - large parts of that process, anyway - simply as the
process of fixing email. Every email ought to be an ordinary file like
any other document; instead emails live as entries in spool files
around which mail agents perform ritual lockfile dances. A filesystem
which handles smaller files more efficiently allows us to store each
email as a file, but you have to keep those files in a Maildir and
continue observing special safe-access rituals. Introduce transactions
and you can just put your emails into ordinary folders, but everyone
knows by now that just putting each of your emails into one folder or
another is a completely inadequate way of organising them. Introduce
pathname-listing and every email can usefully be in several
directories at once; this means that we can indicate all the
categories and "labels" we put on our emails by just putting them in
directories instead of having to use special data formats
understandable only to email clients (or worse, only to one email
client). But there is still the (meta)data in the email headers
themselves - we don't want to have to either duplicate or ignore it in
our directory metadata. So we use mount() to expose persistent queries
on the header data as directories.)

> You had a separate directory storing relationship links.  How about makin=
g that
> a subdirectory of the person?  If I wanted to do genealogy-as-a-file-syst=
em, I'd
> have a "children" subdirectory under the person; it would contain hard li=
nks to
> all the person's children.  If you want to find a person's mother or fath=
er,
> examine the list of their parent directories (a cyclic file system has mo=
re
> parents than just "..") to find the ones called "children".  The person's
> parents are the holders of those "children" directories.
>

You can use the same one-to-many approach with link-directories:
instead of creating a link directory for each (biological)
parent-child pair, create one for each parent which links it to all
its children. (Having the individual link-directories is better in one
way: it's safe to go from the one-to-one to the one-to-many form
without context knowledge, but not /vice versa/. In the case of the
parent-child relationship, if a person is a parent to a bunch of
children then that person is individually a parent to them all. But if
a person hasLessMoneyThan a bunch of people, then (s)he may not have
less money than any one of them.)

The (biological) parent-child relationship is kind to subfile metadata
again here: the one-to-many link makes the (biological) parent an even
more obvious candidate to go "on top". Problem five from part two is
as strong as ever, on the other hand: there's no way for a program to
tell without context knowledge that bob;children asserts a
relationship between bob and several other files, rather than
asserting some attributes of bob or describing some subparts of it.

> I wouldn't worry about naming conflicts (such as "children" being a magic=
 name)
> since most people only define a few dozen relationships, at least in BeOS=
.  [snip]

If the names are only being created and used by one person, then yes,
conflicts are likely to be rare and easily dealt with by hand. But if
you have more than one person involved, and especially if you are
trying to use different bundles of names created independently by
different groups, then people will soon resort to the usual defensive
practises used in package naming. Since any application could
potentially define and use a bunch of its own subfile names just as it
can create several (ordinary) directories, this situation will arise
as soon as subfile names become popular.

[snip]

>
> So to sum up, it seems that you're way more power hungry than I.  I just =
want
> something to make finding photos easier, not a whole database equivalent =
system
> (I'd use a database for that).  Early versions of BeOS did use a database=
 as
> the file system, which turned out to be more trouble than it was worth.  =
A file
> system can and perhaps should be something lighter.  But not as lightweig=
ht as
> plain Unix file systems - I want better searching and linking.

I could say quite a lot about this, but I'll try not to.

First, as the Reply-To: example shows, fairly high-powered filesystem
stuff is (at least) useful in many pretty ordinary and common
situations. And the goal of namespace integration involves the
high-powered stuff: eliminating things like RDBs or mbox files
altogether, or at least assimilating their interfaces to the
filesystem interface.

But I'm not just greedy for power here, I'm also greedy for elegance.
The reason why I dislike things like subfile metadata is not simply
because they're not powerful enough, but also because they're ad-hoc
weld-ons. I want to see the power of the Unix filesystem multiplied
without diluting its cleanness. The price to pay is that any
filesystem implementation which fully supports all that additional
power (with "good enough" performance all round) is going to be harder
to create than a traditional Unix filesystem, or (probably) even a
traditional Unix filesystem with a couple of extra widgets attached.

(Someone's going to have to sit down someday and come up with
conventions to disambiguate the n different meanings of the word
'filesystem' in the Unix context...)

> - Alex
>

Leo.

--
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
