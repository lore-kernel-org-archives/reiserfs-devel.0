From: Fred Schaettgen <namesys.Sch@ttgen.net>
Subject: Re: Recursive modified-timestamp?
Date: Sat, 1 Jan 2005 01:43:48 +0100
Message-ID: <200501010143.48592.namesys.Sch@ttgen.net>
References: <200412311047.14634.namesys.Sch@ttgen.net> <41D5D762.8050603@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D5D762.8050603@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Friday 31 December 2004 23:49, David Masover wrote:
...
> Seems like all of those are really problems of caching/metadata, or more
> accurately, "things which Make would understand".  How about some more
> general way of caching or cache invalidation?

An entry in a metadata cache must become invalid if the corresponding file 
changes. That's exactly what my question was about. I don't want the 
filesystem to manage the metadata, just an efficient way to find files with 
outdated metadata. From an application's point of view, the recursive 
modified-timestamps look like the most intuitive solution for me. 

> Here's how I would do it.  I'd make a standard for object dependencies
> within the filesystem, some way like "make".  This is the same thing I
> ranted about as a way for accessing the contents of zipfiles as part of
> the filesystem, without a performance hit.  (cat foo.zip/bar.txt)

I don't want to see that much in the file system itself. I wouldn't even care 
if these timestamps had to be retrieved with the help of a userspace daemon 
and a library. But without some help of the filesystem itself you always have 
to traverse the whole directory tree to find modified files. 

> For instance, your search engine needs an index, which depends on (is
> built from) all the files in the filesystem except itself.  Thus you
> might have an index for each folder (starting with /).  Each index
> depends on the indices of its subdirectories.  When a search is run,
> everything has to be rebuilt, in "make"-like fashion, but it gives you
> one global place to add the "many things that could be done" to improve
> performance for all systems that do this kind of thing -- search engins,
> locate, build systems, fsview, and backup tools.

How would the filesystem help in that scenario? It could invalidate or delete 
the (sub)index or metadata cache if one of the files it depends on changes, 
ok. But can't you do that just as efficiently in userspace if the filesystems 
just provides the recursive timestamps?

...
> Seems like people use things like FAM nowdays.  But you're
> right, there needs to be a better way.  For instance, your desktop
> search engine should only rebuild even the stat data when a user enters
> a query, but it should be able to do it quickly (without searching the
> whole tree).

Yes, this is the problem. And recursively propagating modification timestamps 
look like a good solution to me. I am not saying that the file system should 
do that iself. Timestamps with this modified semantics would just exist as an 
interface to the applications. But the filesystem must help to keep these 
timestamps up to date.

The file system itself could help for instance by providing a new 
"change-monitor"-flag for a file. This flag would be set only from userspace 
and reset when the file is modified. If the flag is still set when the file 
is being modified, the filesystem would then create a symlink or something 
like for the file in a special directory.
The contents of this changed-files-directory will then be collected and 
removed by a daemon, which manages the recursive-mtime-database (no matter if 
they are stored as extended attributes or in a Berkely DB or whatever).
Now each application which has to manage a metadata cache could ask that 
daemon for the rec-mtime of / first and descent deeper if the rec-mtime is 
more recent than a stored timestamp etc.
Actually the "flag" would have to be something like a list of path names, 
since a file can be hard linked, but that doesn't change much (I hope).

With this approach, most of the work can be delayed until an application 
actually asks for rec-mtimes. The overhead while writing to a file (when the 
stat data is updated) would be to check if the change monitor flag is set and 
only if it is, remove it and put one - or sometimes a few - symlinks into the 
special folder with links to changed files.
Until this point there is no propagating changes up till "/". That would all 
be done by a userspace daemon at a later time. 
If just the test for the existance of the change monitor flag could be made 
efficient enough, then the overhead during regular operation would be 
negligible. 
I hope that this outline was clear enough to let you tell me if this is 
possible or why it isn't :)

bye and a happy new year to one half of the world!
Fred

-- 
Fred Schaettgen
Sch@ttgen.net
