From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Mon, 30 May 2005 15:00:52 +0400
Message-ID: <17050.62052.318426.711322@gargle.gargle.HOWL>
References: <200505281942.j4SJgbpi009886@turing-police.cc.vt.edu>
	<69914919964-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <69914919964-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

Alexander G. M. Smith writes:
 > Valdis.Kletnieks@vt.edu wrote on Sat, 28 May 2005 15:42:35 -0400:
 > > I'm not Hans, but I *will* ask "How much of this is *rationally* doable
 > > without some help from the VFS?".  At the very least, some of this stuff
 > > will require the FS to tell the VFS to suspend its disbelief (for starters,
 > > doing this without confusing the VFS's concepts of dentries/inodes/reference
 > > counts is going to be.... interesting... :)
 > 
 > Good point.  One way would be to cram it into the existing VFS (the
 > operating system's interface to file systems) as directories representing
 > the objects, containing a specially named file for the raw data, mixed in
 > with child items and symbolic links to parent objects.  Some inodes would
 > be fake ones, geneated as needed to represent the old style view of the
 > file / directory / attribute thing (such as the parent symbolic links).
 > 
 > But what would I (Hans likely has other views) like to see in a new VFS
 > to support files / directories / attributes all being the same kind of
 > object?  I'll talk about the user level API view of the VFS, rather than
 > the flip side for file systems or the gritty VFS internals, since it
 > doesn't need to be Linux specific.
 > 
 > For one, it would be almost the same as the existing VFS.  But when you
 > open a fildirute-thing, you can use the same file handle to read and
 > write its data and to list its children.

This is doable with the current VFS.

 > 
 > Thus open() and opendir() are combined into plain open().  It takes a
 > conventional hierarchical path (or later some of Hans Reiser's more
 > sophisticated namespaces?).  Returns a file handle.

opendir(3) is user level function. It calls open(2) system
call. telldir(3) and seekdir(3) also are functions that call lseek(2)
under the hood.

 > 
 > The resulting file handle can be used with read(), write(), seek(),
 > readdir(), rewinddir() and the rest of the usual directory and file
 > basic operations.  And of course, close() it when you're done.

Nothing in VFS prevents files from supporting both read(2) and
readdir(3). The problem is with link(2): VFS assumes that directories
form _tree_, that is, every directory has well-defined parent.

 > 
 > Stat() would disappear.  All the miscellaneous stat data would be
 > stored as sub-files, things like the date last modified, access
 > permissions and so on.  There would be a standard filename and file
 > type for those metadata subfiles to distinguish them from user created
 > subfiles (such as file/.meta.last_modified).  That also makes it
 > easier to add new kinds of metadata.
 > 
 > And that's about it for the basics.

Problem with that is that in "/etc/passwd/..foo-meta-thing"
"/etc/passwd" is both regular (possibly with multiple names), and
directory at the same time, which is problem for VFS, see above. Read
Documentation/filesystems/directory-locking and imagine the following:

$ touch a
$ ln a b
$ mv a/..uid b/..uid

(and yes, rename had to lock parent directories _before_ ever calling
into file system back-end, so reiser4 code cannot somehow magically hint
VFS that "a" and "b" are to be treated in a special way).

Nikita.
