From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: More on Hard Links (was A bold idea (Re: Carrying Attributes too
 Far))
Date: Fri, 05 Dec 2003 17:38:35 -0500 EST
Message-ID: <36084356861-BeMail@cr593174-a>
References: <16336.37772.88198.217245@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16256-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16336.37772.88198.217245@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com

Nikita Danilov wrote on Fri, 5 Dec 2003 17:17:48 +0300:
> Deadlock detection and/or avoidance will be a nightmare to
> implement. And at one point or another you need to keep all directories
> in the "closure" to be locked, which means, that their inodes have to be
> in memory, which means that if file-size / mem-size ratio is large, you
> are in trouble.

It was a bit of a pain.  If it runs out of in-memory inodes (the BeOS
equivalent), it just fails with a suitable error code (and log
message).  Then it's up to the user to delete things in smaller chunks.
Same sort of thing for deadlocks - after a while it times out and
the user has to do smaller deletions.

Incidentally, renaming files is a superset of the delete operation.
Implement that first, and you have delete for free.

- Alex

