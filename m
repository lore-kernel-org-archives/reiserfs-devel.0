From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: More on Hard Links (was A bold idea (Re: Carrying Attributes too
 Far))
Date: Sat, 06 Dec 2003 21:42:16 -0500 EST
Message-ID: <5450026541-BeMail@cr593174-a>
References: <3FD27DA3.7030309@ninja.dynup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16270-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD27DA3.7030309@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <jedi@ninja.dynup.net>
Cc: reiserfs-list@namesys.com

David Masover wrote on Sat, 06 Dec 2003 19:08:51 -0600:
> Most of the time, rename over an existing file needs only a single 
> deletion, and renaming over a directory is (last I checked) impossible 
> with standard tools without removing or renaming the directory first.  

Correct.  But that's just a convention.  Perhaps it could be changed
to distinguish between  move a b/  and  mv a b  where one would move
"a" into "b" and the other would overwrite "b".

> Can we do that?  Last I checked, the file utilities (or maybe the fs 
> itself) won't let you move a directory to a child of itself, or a child 
> of a child of itself.

Actually, if you try that with the BeOS file system I was talking
about, it will detect the isolation of a large part of the name
space (by doing the graph traversal) and reject the operation.  It
could just as easily allow it (it would delete the isolated files and directories), but that would be a bad design choice for normal users.

- Alex
