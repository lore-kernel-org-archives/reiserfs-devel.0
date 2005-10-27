From: John Gilmore <jgilmore@glycou.com>
Subject: Re: Our introduction to Reiser-list
Date: Thu, 27 Oct 2005 12:41:50 +0000
Message-ID: <200510271241.50381.jgilmore@glycou.com>
References: <34286000544-BeMail@AlexDualP3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <34286000544-BeMail@AlexDualP3>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 27 October 2005 12:05, Alexander G. M. Smith wrote:
> John Gilmore wrote on Wed, 26 Oct 2005 17:02:06 +0000:
> > I had understood that a big part of the issue with file-as-directory was
> > the same as the issue with hard links to directories. Which I thought is
> > that if you move one directory into another, you can lose the connection
> > to the root of the filesystem -- I.E. ../../.. etc is no longer
> > guaranteed to get you to / -- And of course this also means that there is
> > no way to get from / to your freshly moved files, and you've just lost a
> > chunk of disk space to complete inaccessibility. fsck would have to be
> > made smarter specifically to be able to figure that one out, too.
>
> The file move operation has to check that it doesn't break the graph into
> two graphs, thus disconnecting some files from the root.  Or you can think
> of it as being a way of deleting a whole subgraph of files all at once,
> kind of like an rmdir that works better than usual :-)
>
> Speaking of connecting to the root, one concept I found useful was to have
> a "True Path" to the root.  One of the hard links to a file / directory is
> considered to be the main one and the rest are auxiliary (easier done if
> each file/dir stores a list of parents).  The main one is guaranteed to
> lead to the root (a recursive property) and is used for ".." in directories
> and the equivalent operation for files.  Then when you want a canonical
> path, you build it by following the main parents up to the root.
>
> The "True Path" comes in useful for faking hard links for POSIX
> compatibility by misrepresenting them as symbolic links using the
> dynamically generated true path string.  As well, if you remove a hard link
> and it wasn't the main parent then you don't have to do any graph traversal
> to fix up things; all items will still have a valid link to the root
> through their unchanged main parent.

I'm getting confused. So forgive my if I become incoherent in my attempts to 
understand...

<rambling>

I'm failing to see the difference between a "true path" and a "not guaranteed 
true path" -- Don't all paths (that point "upwards") have to lead to root 
eventually? Hrm... Maybe you mean that an "upward path" (also called a "back 
reference" no?) is the one that is guaranteed to not lead into a cycle? Or at 
least to lead back out... So this "True Path" is a short name for "shortest 
path to root?" 

Or maybe you're storing only one parent pointer, and it's the "True Path" - 
but thats very expensive to update when the "true" reference is unlinked.

Or maybe you are talking about a backreference that isn't updated -- for 
efficiency reasons? Leading to stale backreferences, which of course would be 
more efficient only on delete, and then you'd still have to... Nevermind, no 
gains here.

I don't see a way to (safely) move (multiple hard-linked) directories around 
without requiring that the new connection to root be atomically verified. And 
that requires parent pointers. And multiple parent pointers, which in turn 
makes verifying the connection to root complex, and a "True Path" concept 
might be usefull. But it might better be called a 'guaranteed path'. But it's 
then just one way of maintaining some information to help you decide which of 
several parents you're going to ascend through when verifying a new 
connection to root.

Maybe there a better way to safely move (and delete, etc) multiple hard-linked 
directories?

Maybe some more complex method - some rule to insure the graph stays acyclic? 
But there's nothing inherently wrong with cycles, they are just hard to deal 
with.

</Rambling>

Wouldn't requiring parent pointers (and multiple parent pointers, at that) 
require that updates be done in (at least) two places every time that you did 
any linking/unlinking/link-changing? And wouldn't that kill performance 
pretty badly?
