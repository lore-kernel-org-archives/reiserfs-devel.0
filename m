From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: File as a directory - VFS Changes
Date: Wed, 01 Jun 2005 21:58:47 -0400 EDT
Message-ID: <52654743428-BeMail@cr593174-a>
References: <17053.38119.167800.192791@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17053.38119.167800.192791@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: reiserfs-list@namesys.com

Nikita Danilov wrote on Wed, 1 Jun 2005 14:58:47 +0400:
> For example: mv /d0 /d1
> 
> To check that this doesn't introduce a cycle one has to load each child
> of /d0 (which may be millions) and recursively check that from none of
> them /d1 is reachable. This has to be done on each rename. I believe
> this is unacceptable overhead.

That's where we differ.  I think it is an acceptable overhead.  It also
only happens on rename and delete operations for objects with multiple
parents or descendants.  If you just move or delete an ordinary file
that's got just one parent directory and no children, the cost is
ordinary too.

If it's a fildirute object with a dozen attribute type things as
children, then it will need to traverse those dozen children.  Not
a big deal.  Consider this example:

The typical worst case operation will be deleting a link to your photo
from a directory you decided didn't classify it properly.  The photo may
be in several directories, such as Cottage, Aunt and Bottles if it is
a picture of a champaign bottle you polished off at your aunt's cottage.
You decide that it shouldn't really be in the Aunt folder, so you delete
it (or rather the link) from there.

The traversal starts with recursively finding all the children of the
deleted object, which will include the photo and all attributish
subobjects (thumbnail, description, ...).  Not too bad, maybe a
dozen objects.  Then reconnect those children to objects which have
a known good path to the root, reached through whatever parents remain.
That path through the new link becomes their true path name.  The photo
goes first, finding one of the alternative parent directories, say
Cottage as its new main parent.  Then the other children find the Photo
as their main parent.

In other words, the cycle checker has to find all the children of the
deleted object(s).  In most cases there aren't very many of them.

Now if you move the directory containing millions of files, then it's
going to take a while.  And if it has a hard link down to another
directory, that gets traversed too.  But that won't happen too often,
only around spring time when you're reorganizing your mail archives.

- Alex
