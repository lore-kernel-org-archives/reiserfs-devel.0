From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Recursive modified-timestamp?
Date: Sat, 01 Jan 2005 13:59:14 -0500 EST
Message-ID: <4329085595-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Fred Schaettgen wrote on Sat, 1 Jan 2005 12:56:33 +0100:
> Do you know if this service was actually provided by the file system or was it 
> just a clever use of a more simple feature of the fs which allows to do that?
> There are certainly a lot of things which could be done, if changed files can 
> be found quickly, but those things don't need to go into fs itself.

It was part of the file system.  The kernel / file system interface API has
a function that your file system calls to post a change notification, taking
a change code and up to three file inode numbers (useful for renaming
operations that move a file to a new directory) and a string:

int notify_listener (int op, nspace_id nsid, vnode_id vnida, vnode_id vnidb,
vnode_id vnidc, const char *name);

The kernel would then take care of building and sending messages to
interested programs, or do nothing if there were no listeners.  The API
for query updates is similar.


> With "change notification flag" I didn't mean to have the send messages, but 
> put links to the file into a folder, so a daemon can poll for changes. I 
> guess polling is better in this case, since it limits the overhead even in 
> persence of many changes.

Kind of like stored notifcations, saved for later use?  That could be a
concept to explore in general.  I can see making a special index that
would collect files which match a standing query, with the unusual option
of allowing the user to empty the index when they wish.  Cool.  Thanks for
the inspiration!  Now offline programs can catch up on changes that
happened while they weren't running.  I'll have to add it to my experimental
file system along with magic directories showing query results, whenever I
get time :-(.

An alternative would be to have attributes on files - some flag that gets
set during a build and cleared when you edit the source.  Or if the text
editor can't do attributes (or the kernel can't auto-wipe an attribute when
the file is changed), you could store the build date in the attribute
and compare it with the file modified date to find all files that are out
of date.  Or for that matter, just store the last build date somewhere
global and look for source files for your project which are more recent
using an index.  A path match or another attribute would mark files as
belonging to a particular project.

(last_modified>=2004.12.31)&&(Project=="MyProject")


> I claim that the approach I described...
> - ...allows all these things to be done efficiently in userspace.
> - ...is the smallest change to the fs neccessary for it.
> - ...could be implemented in reiser4 without significant performance losses.

Possibly.  But I'd like to generalize it a bit.  Percolated attributes are
perhaps a better more general idea.  We already have inherited attributes
(such as security of children being inherited from the parent) so going in
the other direction isn't all that big step, it just needs an application,
like your modification detection system.

- Alex
