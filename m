From: Oleg Drokin <green@namesys.com>
Subject: Re: anyone port data-logging patches to -rc3?
Date: Fri, 23 May 2003 13:46:33 +0400
Message-ID: <20030523094633.GA1005@namesys.com>
References: <20030523003033.GC6586@zero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14220-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030523003033.GC6586@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com, mason@suse.com

Hello!

On Thu, May 22, 2003 at 08:30:33PM -0400, Tom Vier wrote:

> i started to, but the change in reiserfs/inode.c:reiserfs_truncate_file() is
> more than i want to play w/ (my first time looking at reiserfs code). i
> don't want to trash my fs. 8)

Ok, replacement patches are in
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/data-logging-and-quota-2.4.21-rc3/

I tested it in all journaling modes and found zero problems. (have not tried crashing it,
though).

Chris: I optimized reiserfs_truncate_file() a bit so that it won't do kmap() on the same page twice.
Also I think I did correct thing with reiserfs_commit_for_tail/reiserfs_commit_for_inode stuff,
but I want you to take a look anyway.
And BTW, I think this "do O_DIRECT stuff on ordered/datalogging fs, receive error from write(2)" is counter-intuitive.
what do you think about just only setting reiserfs_address_space_operations->direct_IO to non-NULL
in case of writeback mount?
Also probably we do not want to allow remounting with different data-logging mode,
may be we should even add a check in reiserfs_remount() and spit out an error in such a case?

Bye,
    Oleg
