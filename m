From: David Masover <ninja@slaphack.com>
Subject: Re: Recursive modfied-timestamp?
Date: Sat, 01 Jan 2005 22:27:45 -0600
Message-ID: <41D77841.70707@slaphack.com>
References: <200501010304.39517.namesys.Sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501010304.39517.namesys.Sch@ttgen.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred Schaettgen <namesys.Sch@ttgen.net>
Cc: reiserfs-list@namesys.com

Fred Schaettgen wrote:
> On Saturday 01 January 2005 01:51, you wrote:
> 
>>Fred Schaettgen wrote on Fri, 31 Dec 2004 10:47:14 +0100:
>>
>>>The purpose btw. is to find all modified files in a tree as fast as
>>>possible. There are quite a lot of application which would benefit from
>>>it: desktop search engines, locate, build systems, tools which visualize
>>>contents of a file system (like fsview in KDE), backup tools etc.
>>
>>Does it have to be recursive?  BeOS has an index for the last modified date
>>of all files so it's easy to find all files modified in a given range of
>>dates.  I expect that modern file systems could have something similar.
>>
>>However, the BeOS index system is global to a disk volume, so finding
>>recently changed files in a tree means finding recent files then throwing
>>out the ones outside the tree.  That awkwardness has grated against the
>>nerves of many a BeOS user.  But nobody has sat down to figure out a
>>better solution to the underlying problem (indices stored per directory?).
> 
> 
> Moving too much logic into the file system has lots of drawbacks. It makes
>  the file system complicated, so it will be less likely to be implemented at
>  all. And if it's implemented, it much harder to keep it up to date than with
>  userspace programs. It's harder to debug and it's harder to accept for
>  people how want keep the file systems pure.

It also has the advantage of being faster, more universal, and more 
complete as a solution.  Remind me why you wanted your mtimes in the kernel?

> I don't know how the BeOS indices work, but it sounds like the index is
> updated each time a file is modified, which is most likely more time
> consuming than my proposal, where the changed-file-list is only updated when
> a file is changed for the first time after the recursive mtime was requested
> for it. So the performance for frequently updated files won't suffer much.

Speaking of which, how do you make this atomic without more help from 
the filesystem?

> The changes to the file system itself should just so simple that we don't
>  have to fight a never ending war for a whole new paradigma.

Which is why I like the caching idea.  See my last post.  Support for 
simple userland plugins, combined with intelligent caching by the 
kernel, means we don't have to touch the kernel or the filesystem for 
most kinds of customizable things we want to do.  Your mtime idea is 
nice -- it can be done with just those two things in the kernel.  What 
about a zipfile which is built from a directory tree every time it's 
read, but only if files in that tree have changed?  Not possible with 
only recursive-mtime support (though it would require it).
