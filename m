From: Fred Schaettgen <namesys.Sch@ttgen.net>
Subject: Re: Recursive modfied-timestamp?
Date: Sun, 2 Jan 2005 13:08:55 +0100
Message-ID: <200501021308.55437.namesys.Sch@ttgen.net>
References: <200501010304.39517.namesys.Sch@ttgen.net> <41D77841.70707@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D77841.70707@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sunday 02 January 2005 05:27, David Masover wrote:
> > Moving too much logic into the file system has lots of drawbacks. It
> > makes the file system complicated, so it will be less likely to be
> > implemented at all. And if it's implemented, it much harder to keep it up
> > to date than with userspace programs. It's harder to debug and it's
> > harder to accept for people how want keep the file systems pure.
>
> It also has the advantage of being faster, more universal, and more
> complete as a solution.  Remind me why you wanted your mtimes in the
> kernel?

I was just asking if such a feature is supported already. As I said before, 
the mtimes itself could be provided by a userspace library and it doesn't 
matter if they are stored in EAs or a userspace database or whatever. 

Actually I'm not concerned about this mtimes itself, but I want to invalidate 
items in a metadata cache if a file changes. The most simple feature (from a 
user's point of view) a filesystem could provide to make this cache 
invalidation more efficient seemed to be recursive mtimes, and so I was 
asking.

> > I don't know how the BeOS indices work, but it sounds like the index is
> > updated each time a file is modified, which is most likely more time
> > consuming than my proposal, where the changed-file-list is only updated
> > when a file is changed for the first time after the recursive mtime was
> > requested for it. So the performance for frequently updated files won't
> > suffer much.
>
> Speaking of which, how do you make this atomic without more help from
> the filesystem?

I don't know. I never worked on a file system before ;) But it doesn't need to 
be fully atomic. If a file is changed, then the entry in the changed-list 
must be created, but it would be acceptable if a file was listed as changed 
without the change really happening for some reason. This will result in an 
increased overhead when the mtimes are rebuild, but it won't break anything. 
I don't know if this weaker requirement is much easier to fulfill though.

> > The changes to the file system itself should just so simple that we don't
> >  have to fight a never ending war for a whole new paradigma.
>
> Which is why I like the caching idea.  See my last post.  Support for
> simple userland plugins, combined with intelligent caching by the
> kernel, means we don't have to touch the kernel or the filesystem for
> most kinds of customizable things we want to do.  Your mtime idea is
> nice -- it can be done with just those two things in the kernel.  What
> about a zipfile which is built from a directory tree every time it's
> read, but only if files in that tree have changed?  Not possible with
> only recursive-mtime support (though it would require it).

This is in fact possible with recursive mtimes, but just like you need 
userspace support for the mtimes itself in my proposal, you would also need 
userspace support to update your zip files. It wouldn't be transparent, but 
it would still be efficient.

We are talking about different goals here. 
You want the file system to do things automatically, which would have to be 
done by the user otherwise - probably by having the FS calling back to 
userspace.
All I would like to have is help from the file system to do certain things 
(updating userspace indices) much more efficiently than it is possible today.

The two concepts you need for your zipfile scenario is metadata-cache 
invalidation by the FS and hooks to call back to userspace. I am not 
concerned about the latter, but I really want a solution to invalidate cached 
metadata. You want to have the FS do that. By doing that you take away the 
choice of how to store the cached metadata. If the FS just reports the 
changed files somehow, you can decide what metadata needs to be invalidated 
in userspace. 
And since you have to call back to userspace for the zipfile scenario anyway, 
why not let userspace do the metadata cache invalidation too? 

Fred

-- 
Fred Schaettgen
Sch@ttgen.net
