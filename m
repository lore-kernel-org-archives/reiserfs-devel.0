From: Chris Mason <mason@suse.com>
Subject: Re: anyone port data-logging patches to -rc3?
Date: 23 May 2003 08:28:19 -0400
Message-ID: <1053692899.5455.44.camel@tiny.suse.com>
References: <20030523003033.GC6586@zero> <20030523094633.GA1005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14221-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030523094633.GA1005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Tom Vier <tmv@comcast.net>, reiserfs-list@namesys.com

On Fri, 2003-05-23 at 05:46, Oleg Drokin wrote:
> Hello!
> 
> On Thu, May 22, 2003 at 08:30:33PM -0400, Tom Vier wrote:
> 
> > i started to, but the change in reiserfs/inode.c:reiserfs_truncate_file() is
> > more than i want to play w/ (my first time looking at reiserfs code). i
> > don't want to trash my fs. 8)
> 
> Ok, replacement patches are in
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/data-logging-and-quota-2.4.21-rc3/
> 
> I tested it in all journaling modes and found zero problems. (have not tried crashing it,
> though).
> 

Thanks Oleg, I'm integrating all of this today.

> Chris: I optimized reiserfs_truncate_file() a bit so that it won't do kmap() on the same page twice.
> Also I think I did correct thing with reiserfs_commit_for_tail/reiserfs_commit_for_inode stuff,
> but I want you to take a look anyway.

Will do.

> And BTW, I think this "do O_DIRECT stuff on ordered/datalogging fs, receive error from write(2)" is counter-intuitive.
> what do you think about just only setting reiserfs_address_space_operations->direct_IO to non-NULL
> in case of writeback mount?

They'd get the same error, just sooner.  I'm more inclined to fix things
so that data=ordered works with O_DIRECT, lets see what I can come up
with.

> Also probably we do not want to allow remounting with different data-logging mode,
> may be we should even add a check in reiserfs_remount() and spit out an error in such a case?

Jeff Mahoney managed to trigger a race by switching between data=journal
and the other modes.  All we really need to do is be able to switch data
mode when remounting from readonly to rw (as in for the root FS), so
I'll limit the remounting code to that.

-chris


