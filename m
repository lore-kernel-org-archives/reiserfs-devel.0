From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Longhorn FS being removed to Blackcomb (end of decade)
Date: Fri, 09 Apr 2004 13:33:44 -0600
Message-ID: <1081539224.19257.55.camel@localhost.localdomain>
References: <3DF9165145FACB4C96977FF650C1E9040C469DD0@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C469DD0@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Burnes, James" <james.burnes@gwl.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Fri, 2004-04-09 at 11:32, Burnes, James wrote:
> Just thought this might be interesting to some of you.  The
> database-like FS for Longhorn has just been delayed until the end of the
> decade.  That's great.  It means that Microsoft's attempt to copy the
> BeOS filesystem is not meeting with much success.
> 
> Which leads to my follow on...
> 
> I think I remember database-like file system capabilities in Reiser are
> scheduled for V5? Or could it be done with plugins?
> 
> It would be great to beat MS to the DB filesystem punch.  Maybe with
> object-oriented plugins in V4 that won't matter as much.
[snip]

I've been thinking about the filesystem database idea a lot recently. 
I'm not a famous database or filesystem designer, but I've got opinions
:-)

I think the best way to be doing database features is with a fast,
robust file change notification feature, and do the database in user
space.  Some filesystem features would be required, but I think metadata
and two-way hard links is all we need.

I came to the conclusion that doing the search and indexing in the
filesystem isn't necessary if a userspace daemon can track file and
metadata changes and update index/search directories with hard links. 
One of the Reiser4 pseudo files needs to be a list of hard links to the
file, so the daemon can find each reference and update or delete links
as needed.

The daemon could watch directory creation and look for query metadata on
directories.  When found, it would use index directories or full
filesystem search to fill in the query results.

I think we could do this in Reiser4.  Some of the security auditing work
being done in the kernel could be adapted for filesystem change
notification.  Then we need some Reiser4 plugins for tracking hard links
and metadata.  Then we need the daemon to watch file changes and create
index and query results.

Whee!  I make it sound so easy!

> (Hans in the background: You want more features, how about writing it
> yourself.  I mumble something about being in the middle of a move to
> Denver).

Hey, great!  I'm living near Boulder (close to Denver) and I love it
here.  I think you will too.
-- 
Jonathan Briggs
jbriggs@esoft.com

