From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Recursive modified-timestamp?
Date: Fri, 31 Dec 2004 22:12:48 -0500 EST
Message-ID: <1909372133-BeMail@cr593174-a>
References: <200501010143.48592.namesys.Sch@ttgen.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23015-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501010143.48592.namesys.Sch@ttgen.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Fred Schaettgen <namesys.Sch@ttgen.net>
Cc: reiserfs-list@namesys.com

Fred Schaettgen wrote on Sat, 1 Jan 2005 01:43:48 +0100:
> The file system itself could help for instance by providing a new 
> "change-monitor"-flag for a file. This flag would be set only from userspace 
> and reset when the file is modified. If the flag is still set when the file 
> is being modified, the filesystem would then create a symlink or something 
> like for the file in a special directory.

That reminds me that the other thing BeOS had was a change notification
system using messaging.  If you requested monitoring of a directory or
file (with flags to say which kind of changes are of interest) then
it would send your program a BMessage with the details (such as a file
being added to a directory).

This was also extended to monitor changes to the indices: you gave it a
query expression and the kernel/file system then would send notification
messages if a change to a file (or its attributes) added or removed that
file from the set of files matching the query.  Seems like a lot of
overhead, but it wasn't that noticable and did make the OS a lot more
useful (cooler too, directory windows or even complex Find results were
always up to date even as files changed).

But I don't think that's quite what you wanted (and isn't as economical
as your tree of percolated up modification times).  Though it would be nifty
(but useless?) to have a build system (make-like) operating in real time -
change a source file and the system automatically recompiles it immediately.

> Moving too much logic into the file system has lots of drawbacks. It
> makes the file system complicated, so it will be less likely to be
> implemented at all.

True.  That's why I think query evaluation should be outside the file
system, with just the indices in the kernel / file system API.  But
that's another story.

- Alex
