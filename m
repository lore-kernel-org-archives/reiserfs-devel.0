From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 22 Feb 2003 09:17:21 -0500
Message-ID: <1045923440.16042.338.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <20030222165406.A862@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12866-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030222165406.A862@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Sat, 2003-02-22 at 08:54, Oleg Drokin wrote:

> Replacement 05-data-logging-36.diff.gz file that applies to 2.4.21-pre4-ac5
> is available at
> ftp://namesys.com/pub/reiserfs-for-2.4/testing/05-data-logging-36-ac5.diff.gz

Thanks Oleg.

> It compiles, boots, survives my (simple) testing. (writing this email
> from patched 2.4.21-pre4-ac5, too). Quota works. symlinks are now have correct
> blocks count too
> The reason for rejects is mostly DIRECTIO fix that also went into current
> bk snapshot, so probably it will apply to Marcelo's bk tree, too.
>
> Chris: Is it intended that directio only works on data=writeback
> mounted filesystems?
> 

Yes, the way ordered writes work is the buffers are put onto a per
transaction list that gets flushed before the commit.  Since buffers can
only be on one list, this means they don't get onto the list of buffers
for that particular inode, and that makes it difficult to make sure all
pending io to the file is finished before allowing the directio to
proceed (just like the tail alias bug).

The only way to do it is by forcing a commit before the directio, which
would be horribly slow so I've disabled the data=ordered o_direct
support.  The real solution is to allocate a data structure and point to
it from the private journal pointer in the bh.  That requires some other
changes and other performance stuff is more important right now.

> Also following README file diff should be considered:
> 

Thanks, I'm uploading a few more optimizations shortly, I'll include
this change.

-chris


