From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Thu, 2 Jun 2005 14:03:54 +0400
Message-ID: <17054.55690.677507.949191@gargle.gargle.HOWL>
References: <17053.38119.167800.192791@gargle.gargle.HOWL>
	<52654743428-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <52654743428-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

Alexander G. M. Smith writes:

[...]

 > 
 > The typical worst case operation will be deleting a link to your photo
 > from a directory you decided didn't classify it properly.  The photo may
 > be in several directories, such as Cottage, Aunt and Bottles if it is
 > a picture of a champaign bottle you polished off at your aunt's cottage.
 > You decide that it shouldn't really be in the Aunt folder, so you delete
 > it (or rather the link) from there.

This is typical operation for a desktop usage, I agree. But desktop is
not interesting. It doesn't pose technical difficulty to implement
whatever indexing structure when your dataset is but a few dozen
thousand objects [1]. What _is_ interesting, is to make file system
scalable. Solution that fails to move directory simply because sub-tree
rooted at it is large is not scalable.

 > 
 > The traversal starts with recursively finding all the children of the
 > deleted object, which will include the photo and all attributish
 > subobjects (thumbnail, description, ...).  Not too bad, maybe a
 > dozen objects.  Then reconnect those children to objects which have
 > a known good path to the root, reached through whatever parents remain.

And at that moment user hits ^C...

That is, how atomicity guarantees of rename will be preserved? Note that
many applications, like some mail servers crucially depend on rename
atomicity to implement their transaction mini-engines.

And concurrency issues also don't look bright: what if while

        mv /d0/d1/d2/d2 /b0/b1/b2

is performed and thread is in the middle of scanning descendants of
/d0/d1/d2/d2 recursively, another thread does

        mv /d0/d1 /c0/c1/c2

? Obviously scanning cannot take locks on individual files as it sees
them (because, namespace being an arbitrary graph, this will
deadlock). The only remaining solution is to take whole-fs-lock during
every rename/link/unlink operation. Which is another nail to the
scalability coffin.

[...]

 > 
 > Now if you move the directory containing millions of files, then it's
 > going to take a while.  And if it has a hard link down to another
 > directory, that gets traversed too.  But that won't happen too often,
 > only around spring time when you're reorganizing your mail archives.

It happens all the time on my workstation, when I move Linux source
trees around.

 > 
 > - Alex

Nikita.

Footnotes: 
[1]  Implementing things like Spotlight does not require
any innovation at the file system layer (and not coincidentally,
Spotlight is based on almost 20 years old BSDLite kernel code).

