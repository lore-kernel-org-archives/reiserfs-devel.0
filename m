From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: More on Hard Links (was A bold idea (Re: Carrying Attributes
 too Far))
Date: Fri, 5 Dec 2003 17:17:48 +0300
Message-ID: <16336.37772.88198.217245@laputa.namesys.com>
References: <2342084747-BeMail@cr593174-a>
	<3FD0912C.1090700@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD0912C.1090700@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <jedi@ninja.dynup.net>
Cc: reiserfs-list@namesys.com

David Masover writes:
 > -----BEGIN PGP SIGNED MESSAGE-----
 > Hash: SHA1
 > 
 > Alexander G. M. Smith wrote:
 > 
 > >David Masover wrote on Thu, 04 Dec 2003 21:58:42 -0600:
 > >  
 > >
 > >>I agree that hardlinking directories should be allowed, and I think it's
 > >>worth it to check whether it creates a loop, unless rm can be modified
 > >>to simply rm the directory, and the filesystem (and maybe VFS) would be
 > >>modified to have directories have link counts that don't include . or
 > >>.., so when a directory is to be deleted, the system does its own manual
 > >>deletion of each of the files within it.  Then, if I type 'rm loop' and
 > >>it removes the link of 'loop/loop' to 'loop', there are now no more
 > >>links to 'loop' and it gets destroyed.
 > >>    
 > >>
 > >
 > >I think you need more than link counts.  Like I mentioned earlier, I used
 > >a graph traversal in my BeOS file system to handle deletion of loops.
 > >
 > >Unfortunately that implies locking potentially large numbers of files while
 > >doing the traversal, which can fail or deadlock if the file system is in
 > >continuous use (like it might be on a server).  But then you already have
 > >that sort of problem on regular file systems, though only for one file at
 > >a time.
 > >  
 > >
 > Yes, locking, as a transaction.  Which means either the whole deletion 
 > fails (couldn't get the lock, user got annoyed and hit ^C) or it 
 > succeeds (got lock on all the files by doing some sort of recursive lock 
 > on the root dir).  From inside the transaction, it should look as though 
 > everything is happening in realtime, but it only flushes when it can get 
 > the lock.  (right?)

Deadlock detection and/or avoidance will be a nightmare to
implement. And at one point or another you need to keep all directories
in the "closure" to be locked, which means, that their inodes have to be
in memory, which means that if file-size / mem-size ratio is large, you
are in trouble.

Look at this from another point of view: deletion of a file when its
last name is removed is but a form of the garbage
collection. Traditionally UNIX implemented reference counted garbage
collectors for this, which was fine, because UNIX file system is a tree
(modulo dots and dotdots). But if multiple hard-links to the directories
are allowed, file system is an arbitrary graph. It makes little sense to
try to stretch reference counting to work in this situation. There are
much more efficient forms of garbage collection for this.

Nikita.
