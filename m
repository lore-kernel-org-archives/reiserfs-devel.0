From: Fred Schaettgen <namesys.Sch@ttgen.net>
Subject: Re: Recursive modfied-timestamp?
Date: Sat, 1 Jan 2005 03:04:39 +0100
Message-ID: <200501010304.39517.namesys.Sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Saturday 01 January 2005 01:51, you wrote:
> Fred Schaettgen wrote on Fri, 31 Dec 2004 10:47:14 +0100:
> > The purpose btw. is to find all modified files in a tree as fast as
> > possible. There are quite a lot of application which would benefit from
> > it: desktop search engines, locate, build systems, tools which visualize
> > contents of a file system (like fsview in KDE), backup tools etc.
>
> Does it have to be recursive?  BeOS has an index for the last modified date
> of all files so it's easy to find all files modified in a given range of
> dates.  I expect that modern file systems could have something similar.
>
> However, the BeOS index system is global to a disk volume, so finding
> recently changed files in a tree means finding recent files then throwing
> out the ones outside the tree.  That awkwardness has grated against the
> nerves of many a BeOS user.  But nobody has sat down to figure out a
> better solution to the underlying problem (indices stored per directory?).

I see.. I didn't know about BeOS' file system, thanks :)
Having an index over various attributes is certainly a powerful feature. But
wouldn't it be better if we could extend the file system in a *minimal* way
which still makes it possible to create such indices efficiently in
userspace?
Moving too much logic into the file system has lots of drawbacks. It makes
 the file system complicated, so it will be less likely to be implemented at
 all. And if it's implemented, it much harder to keep it up to date than with
 userspace programs. It's harder to debug and it's harder to accept for
 people how want keep the file systems pure.
I'm not sure if my proposal in my other post in this thread would be more
efficient or easier to implement than a global index for the modification
times, but I guess it's more or less the same in the end. 
I don't know how the BeOS indices work, but it sounds like the index is
updated each time a file is modified, which is most likely more time
consuming than my proposal, where the changed-file-list is only updated when
a file is changed for the first time after the recursive mtime was requested
for it. So the performance for frequently updated files won't suffer much.

But from an application point of view, a BeOS-syle mtime-index would be just
as good, especially if there is a userspace layer in between, which allows
per-directory mtime range request or similar.
The changes to the file system itself should just so simple that we don't
 have to fight a never ending war for a whole new paradigma.

Fred

--
Fred Schaettgen
Sch@ttgen.net
