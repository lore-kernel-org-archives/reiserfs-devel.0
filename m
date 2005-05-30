From: Hans Reiser <reiser@namesys.com>
Subject: Re: File as a directory - VFS Changes
Date: Mon, 30 May 2005 01:25:45 -0700
Message-ID: <429ACE09.9090802@namesys.com>
References: <69914919964-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24214-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <69914919964-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Valdis.Kletnieks@vt.edu, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

I think what Alex is suggesting below is reasonable and something
resembling it should be done, though I will not go into details on it
until we have some working code....

Hans

Alexander G. M. Smith wrote:

>Valdis.Kletnieks@vt.edu wrote on Sat, 28 May 2005 15:42:35 -0400:
>  
>
>>I'm not Hans, but I *will* ask "How much of this is *rationally* doable
>>without some help from the VFS?".  At the very least, some of this stuff
>>will require the FS to tell the VFS to suspend its disbelief (for starters,
>>doing this without confusing the VFS's concepts of dentries/inodes/reference
>>counts is going to be.... interesting... :)
>>    
>>
>
>Good point.  One way would be to cram it into the existing VFS (the
>operating system's interface to file systems) as directories representing
>the objects, containing a specially named file for the raw data, mixed in
>with child items and symbolic links to parent objects.  Some inodes would
>be fake ones, geneated as needed to represent the old style view of the
>file / directory / attribute thing (such as the parent symbolic links).
>
>But what would I (Hans likely has other views) like to see in a new VFS
>to support files / directories / attributes all being the same kind of
>object?  I'll talk about the user level API view of the VFS, rather than
>the flip side for file systems or the gritty VFS internals, since it
>doesn't need to be Linux specific.
>
>For one, it would be almost the same as the existing VFS.  But when you
>open a fildirute-thing, you can use the same file handle to read and
>write its data and to list its children.
>
>Thus open() and opendir() are combined into plain open().  It takes a
>conventional hierarchical path (or later some of Hans Reiser's more
>sophisticated namespaces?).  Returns a file handle.
>
>The resulting file handle can be used with read(), write(), seek(),
>readdir(), rewinddir() and the rest of the usual directory and file
>basic operations.  And of course, close() it when you're done.
>
>Stat() would disappear.  All the miscellaneous stat data would be
>stored as sub-files, things like the date last modified, access
>permissions and so on.  There would be a standard filename and file
>type for those metadata subfiles to distinguish them from user created
>subfiles (such as file/.meta.last_modified).  That also makes it
>easier to add new kinds of metadata.
>
>And that's about it for the basics.
>
>Standard utilities, like "ls" would have to be changed to use the new
>object structure - listing the contents of a thing and avoiding
>recursion down paths that lead to parent objects (just like "ls"
>currently avoids listing ".." recursively).  That may involve more
>work than the kernel changes!
>
>I'd add a multi-read function to replace stat().  Give it a list of
>sub-file names to read and it returns their names and contents in a
>packed list (like a dirent structure).  That way bulk reading date
>stamps, permissions and other attributish small metadata as subfiles
>won't have as much overhead as opening then individually.  Particularly
>if under the hood they are stored as fields in the file's inode rather
>than as totally separate files (this is what BeOS's BFS does for small
>attributes).  Though conceptually you treat them as separate subfiles.
>
>I'd also like to add indexing.  That could be done by creating a magic
>directory with an associated file type to index.  Then whenever a file
>with that file type is changed, the index is updated using the file's
>contents as the key, and a link to the file as the value.  The file
>type also implies the interpretation of the values for sorting
>purposes - as strings, binary numbers, etc.  Unlike BeOS, I'd expose
>the indices directly (appearing as a directory full of hard links)
>and have query languages implemented in userland libraries that make
>use the indices, rather than as part of the file system.  Now should
>indices be system wide and maintained by the VFS, or per-volume and
>maintained by the file system?  How about indices for things on network
>drives?  Things on public web sites for a web-view file system?
>
>I'd also like to add change notification.  If a file system object's
>child list changes, then a notification message gets sent to interested
>listeners.  Similarly for an object's data content change.  BeOS had
>useful notifications for live changes to a query - I'd punt this to
>the userland query library and have it build on the change notifications
>from an index directory.  The VFS and other parts of the OS would need
>to support change notification (BeOS used inter-process message queues).
>
>Can a file-as-directory system fit into Linux, or some other OS?
>I expect that it will only happen if the new system also exposes a
>backwards compatible view for old software, using the old APIs.
>After that's done, the first big user program that needs to be
>updated is the desktop file browser.  Once there's a good GUI for
>browsing file-as-directory file systems, the general public might
>become more aware of their advantages (easily drilling down inside
>files to attach a description subfile or add a bunch of MP3 tags,
>magic query directories and indexing to find things quickly, multiple
>parents to put the same file in multiple folders without the
>breakability of symbolic links or Mac aliases).  Then I can sit back
>and enjoy using the system rather than spending all this time debating
>and implementing it :-).
>
>- Alex
>
>
>  
>

