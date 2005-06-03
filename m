From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Performance Impacts of Graph Cycles due to Multiple Parents
Date: Thu, 02 Jun 2005 23:35:18 -0400 EDT
Message-ID: <11655571087-BeMail@cr593174-a>
References: <17054.55690.677507.949191@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17054.55690.677507.949191@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: reiserfs-list@namesys.com

Nikita Danilov wrote on Thu, 2 Jun 2005 14:03:54 +0400 in the
"Re: File as a directory - VFS Changes" thread:
> This is typical operation for a desktop usage, I agree. But desktop is
> not interesting. It doesn't pose technical difficulty to implement
> whatever indexing structure when your dataset is but a few dozen
> thousand objects [1].

Getting people to use something different does pose an interesting
social engineering problem :-).  I wonder how tough it was to move from
block records (descended from 80 byte punched cards) to streams of bytes.
I'd expect people complained of the inefficiencies of reading things
byte by byte, the uncertainty of where a record boundary was, and
possibly other limitations.  Did the complexity of having to put things
into directories, rather than just unassociated card decks, worry them?

> What _is_ interesting, is to make file system scalable. Solution
> that fails to move directory simply because sub-tree rooted at it
> is large is not scalable.

But that scalability isn't all that important, I don't see large systems
making use of a chaotic collection of cross links between items.  Since
they're so large, they're usually uniform and thus simple collections of
items, such as a series of scientific experiment observations over time.
Well, unless someone tries to do an AI knowledge representation as linked
files or something similarly weird.  Then it gets challenging.

There is some scalability in that operations going on in one subgraph
of the file system don't depend on things happening in the rest of it.

> That is, how atomicity guarantees of rename will be preserved? Note that
> many applications, like some mail servers crucially depend on rename
> atomicity to implement their transaction mini-engines.

Same as before.  Grab locks on all the children affected before doing
any work.  If there's a deadlock, or memory shortage, just report an
error back to the caller and don't change anything.  For the typical
mail server use, don't they just rename one file at a time?  If they
are moving whole large directories around, then it would be a problem.

Or require that the user move all the child files individually to avoid
dealing with deadlocks and long operations.  Simplistic you say?  As
simple as the kludge of doing "rm -r DirectoryName" to delete a
directory and all its contents just because a classical file system
can't handle the locking of large things.

> It happens all the time on my workstation, when I move Linux source
> trees around.

Good point.  Traversing all the children when you're moving the directory
would be expensive, and isn't needed if the children don't cause cycles.
A simple optimization for ordinary files (not cross linked) is to have a
flag saying "I am a tree" for every file system object.  Then when doing
a move or delete, the children of an object marked with that flag don't
need to be examined.  So for ordinary files, we can go back to getting
classical performance.  Maintaining the flag doesn't cost much if it
isn't changing, even less if directories (which means everything in a
directory-is-file system) keep a count the number of tree children they
have.  But when something does acquire or lose an extra parent, all its
parent directories have to be updated, possibly bubbling the change up
to the root.

- Alex
