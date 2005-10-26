From: John Gilmore <jgilmore@glycou.com>
Subject: Re: Our introduction to Reiser-list
Date: Wed, 26 Oct 2005 17:02:06 +0000
Message-ID: <200510261702.06844.jgilmore@glycou.com>
References: <200510251558.13860.pvh@uvic.ca> <435FB231.5070507@nauticom.net> <5c49b0ed0510261540l370acbfepfe4b6649c91cee61@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26672-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5c49b0ed0510261540l370acbfepfe4b6649c91cee61@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 26 October 2005 22:40, Nate Diller wrote:
> File-as-Directory
>   The issue with file-as-directory (FaD) is that it removes the Acyclic
> property of the namespace graph.  This is because anything which contains
> file data can be hard-linked, even if that item is also a directory.  It
> would be unreasonable to discard hard links entirely, they are quite useful
> and would be much more useful, in fact, with FaD enabled.  So the new
> namespace would be a directed graph, with cycles. Since unix operating
> systems are responsible for deleting unused data in file systems (garbage
> collection), any algorithm used for that purpose has to satisfy strict
> requirements, for CPU and memory use, but more importantly for reliability.
>  The algorithm must not fail the deletion unless the system is OOM, and it
> must always free the file's resources.  Reference counting has always been
> used for this task. It's been awhile since I took graph theory, and I got a
> C in it anyway, but the algorithms I have seen for determining graph
> connectivity end up traversing to every node in the graph in the worst
> case.  This means that the file system would potentially have to read in
> the directory data for every link to every file in the system, for a single
> deletion operation.

If the issue is really the matter of removing the acyclic property, wouldn't 
that be solved by requiring that the file contains no non-dynamically 
generated subdirectories? That way, the graph is still acyclic, making 
reference counting work again.

I had understood that a big part of the issue with file-as-directory was the 
same as the issue with hard links to directories. Which I thought is that if 
you move one directory into another, you can lose the connection to the root 
of the filesystem -- I.E. ../../.. etc is no longer guaranteed to get you 
to / -- And of course this also means that there is no way to get from / to 
your freshly moved files, and you've just lost a chunk of disk space to 
complete inaccessibility. fsck would have to be made smarter specifically to 
be able to figure that one out, too.

Forbiding subdirectories in file-as-directory solves that problem too, because 
a normal file cannot be moved into anothers' file-as-directory. You could 
make it lose its meta-data, I suppose, but that's potentially lossy, which mv 
isn't allowed to be.

Actually, when I had first read about file-as-directory, I had assumed that 
the content was either dynamically generated from the on-disk metadata (like 
uid, gid, etc) or stored as a "sideband" type stream in the file itself, like 
some of the MAC OS file systems (and others) do, or generated via a plugin 
connecting to user-space, for ID3 tags on mp3 files and other information 
which can easily be obtained from the file itself.

