From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Sat, 04 Oct 2003 14:17:11 -0400 EDT
Message-ID: <3045199706-BeMail@cr593174-a>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

lrc1@st-andrews.ac.uk wrote on Sat,  4 Oct 2003 06:58:04 +0100:
> Yes, it is impossible to hard-link between two files on different volumes
> (except at mount points) in the Unix filesystem, but it shouldn't be. (More
> generally, with the necessary permissions it should be possible to make any
> file the child of any directory via a hard link, except where doing so would
> create a cycle.)

Or if the file system supports parent links for all objects, and does a bit
of graph traversal when deleting files, then you can have cycles.  It is
useful and more natural to organize information in a graph rather than a
hierarchy.  It's possible to do it with symbolic links, but hard links
make it more reliable (moving files around doesn't destroy the links).

Hard links across volumes or removable media isn't possible since you
don't have real time notification of changes; so the links would be
slightly-soft, squishy, firm, or some other such technical term :-).
I guess you could make such a firm link evaluation block the caller
until the system has gotten a lock on the target (insert removable
disk, establish network connection, etc).

> There's no semantic reason why it shouldn't be possible; in other words,
> if it's meaningful for a file to be named both /pub/pictures/sunrise and
> /home/alice/pictures/daylight , why would it in fact not be meaningful just
> because a volume is mounted at /home ?

I'd ditch the cool but mostly useless and confusing feature of having
different names for the same file.  Use symbolic links for that.  Having
a single name makes the implementation easier too (store the name in the
file's inode rather than in the directories).  This would slow down
directory traversal, but "ls" and other tools already stat() each file to
read its inode metadata anyway, so putting the name there wouldn't be
too bad.

> What if two children of hello.mp3/+/ have different permissions, and a third
> file is the child of both of them? And what about the proposal that ordinary,
> non-attribute files should inherit metadata from their parent directories? 

Good point.  I guess the inheritance algorithm should take multiple parents
into account when doing its traversal.  Or just restrict the use of
inheritance.

- Alex
