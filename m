From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: More on Hard Links (was A bold idea (Re: Carrying Attributes too
 Far))
Date: Fri, 05 Dec 2003 08:16:12 -0500 EST
Message-ID: <2342084747-BeMail@cr593174-a>
References: <3FD00272.7040607@ninja.dynup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD00272.7040607@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <jedi@ninja.dynup.net>
Cc: reiserfs-list@namesys.com

David Masover wrote on Thu, 04 Dec 2003 21:58:42 -0600:
> I agree that hardlinking directories should be allowed, and I think it's
> worth it to check whether it creates a loop, unless rm can be modified
> to simply rm the directory, and the filesystem (and maybe VFS) would be
> modified to have directories have link counts that don't include . or
> .., so when a directory is to be deleted, the system does its own manual
> deletion of each of the files within it.  Then, if I type 'rm loop' and
> it removes the link of 'loop/loop' to 'loop', there are now no more
> links to 'loop' and it gets destroyed.

I think you need more than link counts.  Like I mentioned earlier, I used
a graph traversal in my BeOS file system to handle deletion of loops.

Unfortunately that implies locking potentially large numbers of files while
doing the traversal, which can fail or deadlock if the file system is in
continuous use (like it might be on a server).  But then you already have
that sort of problem on regular file systems, though only for one file at
a time.

- Alex
