From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Virtual Query Directories and Change Notification
Date: Sat, 20 Mar 2004 13:01:04 -0500 EST
Message-ID: <11252125287-BeMail@cr593174-a>
References: <1079658309.9815.62.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17345-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079658309.9815.62.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: reiserfs-list@namesys.com

Jonathan Briggs wrote on Thu, 18 Mar 2004 18:05:09 -0700 about
"Re: ReConfigurable Directory Structure & Agrregation of files
according to semantic.":
> mkdir querydir-whatever-name
> echo "..mimetype == text/plain and ..size <= 4096 and ..keywords
> contains 'Project Osprey'" > querydir-whatever-name/..query
> 
> This would then need to create indexes for attributes mimetype, size and
> keywords: then it could create the list dynamically.  Or it could search
> every object and then maintain a list in querydir which it updates
> whenever another object's mimetype, size or keyword attributes is
> updated.

In BeOS, users and applications create global (per disk volume) indices
for the attributes they think will improve their own speed.  The rest
of the attributes are unindexed.  The query optimizer will find the
most constraining index and iterate over that one to find files which
match the query.  If no index is suitable, it just iterates over all
the files in the "name" index.  Not as fancy as a database "join"
operation, but it gets the job done fast enough.

> If there's a good file change notification system running (better than
> the current Linux dnotify stuff), then a daemon could watch for ..query
> attribute updates and call reiser4() to set things up in whatever query
> bytecode the kernel might require.

Relying on multiple levels of change notifications is a bit slow -
better for the file system itself to keep track of indices.

I'd like to see the query language as a separate kernel library
so that each file system doesn't have to reinvent the query language,
plus it would make it possible to add new query languages.  The natural
split would be to have the file system just keep the indices up to date,
while the query library lives off notifications of attribute changes and
has access to the indices.

By the way, in BeOS, there is a change notification system using broadcast
messages.  Besides notifications for regular changes in the file system
(directory contents changed, files modified, for details see
http://bang.dhs.org/be/bebook/The%20Storage%20Kit/NodeMonitor.html), it
is also used for live queries.  That means a notification message whenever
a change to the file system results in a change to your opened query set.

If virtual query directories existed, then the normal change notification
for directory content changes would also serve for query changes, no need
for a special query API!

- Alex
