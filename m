From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Our introduction to Reiser-list
Date: Fri, 28 Oct 2005 08:29:52 -0400 EDT
Message-ID: <2609102941-BeMail@AlexDualP3>
References: <200510271241.50381.jgilmore@glycou.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510271241.50381.jgilmore@glycou.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: John Gilmore <jgilmore@glycou.com>
Cc: reiserfs-list@namesys.com

John Gilmore wrote on Thu, 27 Oct 2005 12:41:50 +0000:
> I'm failing to see the difference between a "true path" and a "not guaranteed 
> true path" -- Don't all paths (that point "upwards") have to lead to root 
> eventually? Hrm... Maybe you mean that an "upward path" (also called a "back 
> reference" no?) is the one that is guaranteed to not lead into a cycle? Or at 
> least to lead back out... So this "True Path" is a short name for "shortest 
> path to root?"

This is in a file system that allows multiple parents - also known as hard
links to directories.  If you happen to repeatedly go up the wrong parents,
you can get stuck in a cycle.

> Or maybe you're storing only one parent pointer, and it's the "True Path" - 
> but thats very expensive to update when the "true" reference is unlinked.

Hans Reiser wrote on Thu, 27 Oct 2005 09:40:09 -0700:
> What do you do when unlinking the true path parent and there remain
> links to the others, do you check for connection to root then during unlink?

That's the expensive part.  Picking the new true path parent when the old
one is deleted can involve a traversal of the whole file system (if a link
near the root is affected).  At least all the descendants of the unlinked
directory will have to be processed (except for ordinary files - they're
inert).

> Wouldn't requiring parent pointers (and multiple parent pointers, at that) 
> require that updates be done in (at least) two places every time that you did 
> any linking/unlinking/link-changing? And wouldn't that kill performance 
> pretty badly?

Right - both the parent directory and the affected children need to be updated,
even regular hard link creation or file creation require two disk writes.  One
affecting the directory's data (list of children) and the other is in the target
file's inode (list of parents).  Regular performance will be less or the same
(creating a file in an ordinary file system requires writes to the directory
and to the file's inode anyway).  Only delete / rename performance can
occasionally be horrible.

Guess I should replay the AGMS link documentation (Alias Generated Morphing
Symbolic links, morphing since they appear as dynamically changing symbolic
links under POSIX though they are really hard links - otherwise "ls -R" and
other tools break).  Of note is the algorithm for doing delete updating at
the end of the listing.

- Alex


Because the presence of AGMS links allows for cycles in the file name tree
(turning it into a directed graph), we need graph traversal algorithms for
ensuring that all directories (except the root) always have a valid main
parent directory.  Another desired feature is that errors (such as out of
memory) during a rename or delete leave the file system unchanged.  This
leads to a transaction type of approach, where the code figures out all the
work that needs to be done, allocates items needed (such as strings for new
names), then goes and implements the changes in a way which avoids doing
anything that could fail.  If it fails at any step before the final
implementation step, it just frees what it had allocated and exits.

Most operations (create, stat, write, etc) don't involve changes that affect
more than one or two things in the file system, so they aren't covered here.
So only deletion and renaming need this fancy treatment.  Renaming because
rename a/b x/y unlinks b from directory a, unlinks y from directory x (maybe
deletes it too if it doesn't have any other parents) and adds a link in
directory x to b.

Deletion (actually, it's more like unlink; deletion of the object doesn't
happen until the last parent goes) of a directory can disconnect a
ring/cycle of subdirectories from the rest of the file system.  An example
of this is a tree of directories A/B/C with an AGMS link named D inside C
that goes back to B. B is essentially a subdirectory of directories A and C,
with B's main parent directory ".." leading to A and B's extra parent
directory "..." leading to C.

    A _      A has B as a subdirectory, ordinary (hard link) connection.
    |/ \
    B  |     B has C as a subdirectory.
    |  ^
    C  |     C contains an AGMS link named D.
    |  ^
   (D) |     D is an AGMS link pointing to B, () to show it is an AGMS link.
    \__/

Now remove the A-B link.  As part of that operation, C is promoted to be the
new main parent directory of B, and the now useless AGMS link D is
deallocated.

  A   _
     / \
    B  |     B has C as a subdirectory.
    |  ^
    C  |     C has B as a subdirectory.
    \__/

B now has C as a parent and C has B as a parent, so they won't get
deallocated because they still have parents.  However, there's no way of
accessing the B/C directories from anywhere else in the file system, or for
getting from B/C to the root via ".." operations.  We want to detect that.

As well you can unlink a directory which formerly provided the current path
to the root, leaving some other directories without a series of ".."
operations leading to the root.  Their main parent directories need to be
updated.  For example in directory A add an AGMS link X pointing to
directory C and then unlink B from A (cd A ; ln -d B/C X ; rmdir B).  B's
main parent becomes C (via AGMS link D which gets merged with B since you
can't have an AGMS link as the main parent directory).  Also the main parent
of C becomes A (via merging with X), since it has a connection to the root
while B just uselessly circles around to C again.  Watch out when merging a
directory with an AGMS link - there may be other AGMS links pointing to the
former AGMS link, which need to be fixed up to point to the directory.
Finally, C used to be inside B but when it switched its main parent
directory from B to A, it leaves behind a new AGMS link named Z in directory
B.

Initial situation:

   A   _      A has B as a subdirectory, and contains AGMS link X.
   /\ / \
 (X) B  |     B has C as a subdirectory.  Main parent is A.
   \ |  ^     X is an AGMS link in A which points to C.  Main parent A.
     C  |     C contains an AGMS link named D.  Main parent B.
     |  ^
    (D) |     D is an AGMS link pointing to B.  Main parent C.
     \__/

After "rmdir B":

   A          A just contains directory C.
   |   _
    \ / \
     C  |     C is a directory which contains B.  Main parent A.
     |  |
     B  |     B is a directory which contains AGMS link Z.
     |  ^
    (Z) |     Z is an AGMS link to C.
     \__/


It's actually not that simple, since when something merges with an AGMS
link, it takes on the name of the link.  Also, when a placeholder is left
behind, it has the old name of the thing that used to be there.  The actual
names would be:

   A          A just contains directory X (formerly an AGMS link).
   |   _
    \ / \
     X  |     X is a directory (formerly C), contains D.  Main parent is A.
     |  |
     D  |     D is a directory (formerly B) which contains AGMS link C.
     |  ^
    (C) |     C is a left behind placeholder AGMS link to X.
     \__/

/Test:
drwxrwxrwx   0 agmsmith agmsmith        1 Mar 17 11:42 .
drwxrwxrwx   1 agmsmith agmsmith        0 Mar 17 11:42 ..
drwxrwxrwx   1 agmsmith agmsmith        2 Mar 17 11:42 a
/Test/a:
drwxrwxrwx   1 agmsmith agmsmith        2 Mar 17 11:42 .
drwxrwxrwx   0 agmsmith agmsmith        1 Mar 17 11:42 ..
drwxrwxrwx   2 agmsmith agmsmith        1 Mar 17 11:42 b
lrwxrwxrwx   1 agmsmith agmsmith        1 Mar 17 11:43 x -> /Test/a/b/c
/Test/a/b:
drwxrwxrwx   2 agmsmith agmsmith        1 Mar 17 11:42 .
drwxrwxrwx   1 agmsmith agmsmith        2 Mar 17 11:42 ..
lrwxrwxrwx   0 agmsmith agmsmith        2 Mar 17 11:42 ... -> /Test/a/b/c
drwxrwxrwx   2 agmsmith agmsmith        1 Mar 17 11:42 c
/Test/a/b/c:
drwxrwxrwx   2 agmsmith agmsmith        1 Mar 17 11:42 .
drwxrwxrwx   2 agmsmith agmsmith        1 Mar 17 11:42 ..
lrwxrwxrwx   0 agmsmith agmsmith        2 Mar 17 11:42 ... -> /Test/a
lrwxrwxrwx   1 agmsmith agmsmith        1 Mar 17 11:43 d -> /Test/a/b

And after rmdir /Test/a/b the listing is:

/Test:
drwxrwxrwx   0 agmsmith agmsmith        1 Mar 17 11:42 .
drwxrwxrwx   1 agmsmith agmsmith        0 Mar 17 11:42 ..
drwxrwxrwx   1 agmsmith agmsmith        1 Mar 17 11:42 a
/Test/a:
drwxrwxrwx   1 agmsmith agmsmith        1 Mar 17 11:42 .
drwxrwxrwx   0 agmsmith agmsmith        1 Mar 17 11:42 ..
drwxrwxrwx   2 agmsmith agmsmith        1 Mar 17 11:42 x
/Test/a/x:
drwxrwxrwx   2 agmsmith agmsmith        1 Mar 17 11:42 .
drwxrwxrwx   1 agmsmith agmsmith        1 Mar 17 11:42 ..
lrwxrwxrwx   0 agmsmith agmsmith        2 Mar 17 11:42 ... -> /Test/a/x/d
drwxrwxrwx   1 agmsmith agmsmith        1 Mar 17 11:42 d
/Test/a/x/d:
drwxrwxrwx   1 agmsmith agmsmith        1 Mar 17 11:42 .
drwxrwxrwx   2 agmsmith agmsmith        1 Mar 17 11:42 ..
lrwxrwxrwx   1 agmsmith agmsmith        1 Mar 17 11:44 c -> /Test/a/x


The detection of cycles and fixing up of main parent directories is done in
three steps:

Step 1.
  Find all children of the unlinked objects.  This is done by having a list
  of objects needing to be examined, initialised with the one or two objects
  being unlinked.  Then while the pending examination list isn't empty, an
  object is removed from the pending list and added to the list of children
  found, and its children (just directory or AGMS link type children,
  including ones through a removed link but not through the new added link)
  are added to the pending examination list.

Step 2.
  Find the new main parent directory or AGMS link for each affected item.
  Start by adding all children found in step 1 to an orphan list.  Then
  while the orphan list isn't empty, repeatedly scan through it for an
  object that has some parent directory (excluding parents through removed
  links but including parents through the new added link) or parent AGMS
  link which isn't in also in the orphan list.  Mark that parent as the new
  main parent and remove the object from the orphan list (yes, other orphans
  can now use the object as a main parent if they are children), and resume
  scanning at the next orphan.  If the scan gets to the end of the list,
  restart scanning at the beginning.  If the scan goes from beginning to end
  of the non-empty list without finding any parents then we have a
  disconnected cycle, and an error code needs to be returned to the user.

Step 3.
  Change the main parents to the new choices.  For each item being
  re-parented, create a new AGMS link to the item in the former main parent
  directory.  If an AGMS link is the new main parent, merge with the AGMS
  link (replacing the AGMS link in effect, references to the old AGMS link
  are changed to point to the re-parented item, and the re-parented item
  takes on the name of the old AGMS link).

