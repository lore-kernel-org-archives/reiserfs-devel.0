From: Fred Schaettgen <namesys.Sch@ttgen.net>
Subject: Re: Recursive modified-timestamp?
Date: Sat, 1 Jan 2005 12:56:33 +0100
Message-ID: <200501011256.33535.namesys.Sch@ttgen.net>
References: <1909372133-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1909372133-BeMail@cr593174-a>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Saturday 01 January 2005 04:12, you wrote:
...
> That reminds me that the other thing BeOS had was a change notification
> system using messaging.  If you requested monitoring of a directory or
> file (with flags to say which kind of changes are of interest) then
> it would send your program a BMessage with the details (such as a file
> being added to a directory).

Do you know if this service was actually provided by the file system or was it 
just a clever use of a more simple feature of the fs which allows to do that?
There are certainly a lot of things which could be done, if changed files can 
be found quickly, but those things don't need to go into fs itself.

> But I don't think that's quite what you wanted (and isn't as economical
> as your tree of percolated up modification times).  Though it would be
> nifty (but useless?) to have a build system (make-like) operating in real
> time - change a source file and the system automatically recompiles it
> immediately.

With "change notification flag" I didn't mean to have the send messages, but 
put links to the file into a folder, so a daemon can poll for changes. I 
guess polling is better in this case, since it limits the overhead even in 
persence of many changes.
It's certainly not most important for build systems, at least as long as the 
source tree is reasonable small. Just an example among others.

> > Moving too much logic into the file system has lots of drawbacks. It
> > makes the file system complicated, so it will be less likely to be
> > implemented at all.
>
> True.  That's why I think query evaluation should be outside the file
> system, with just the indices in the kernel / file system API.  But
> that's another story.

No, that's exacly the story. If you want to index various attributes of files, 
so that the index can be quickly updated when it's needed. We don't have to 
go into details about what you do with that indices in userspace. What we 
need to discuss is what changes to the file system would be neccessary, so 
that everything you have in mind could be done efficiently.
I claim that the approach I described...
- ...allows all these things to be done efficiently in userspace.
- ...is the smallest change to the fs neccessary for it.
- ...could be implemented in reiser4 without significant performance losses.

Of course I'm not at all sure about these claims, so that's why I'm asking ;)

bye and a Happy new year (to everyone this time)

Fred

-- 
Fred Schaettgen
Sch@ttgen.net
