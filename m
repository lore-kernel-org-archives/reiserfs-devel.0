From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] reiser4: fix readv
Date: Sun, 17 Sep 2006 12:53:57 -0700
Message-ID: <20060917125357.0e42a8fa.akpm@osdl.org>
References: <200609132212.54871.vs@namesys.com>
	<20060914192415.a356d950.akpm@osdl.org>
	<200609172239.08025.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609172239.08025.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Christoph Hellwig <hch@lst.de>, Badari Pulavarty <pbadari@us.ibm.com>


btw, please be aware that the post-2.6.17 deadlock fixes which went into
generic_file_buffered_write() caused a few problems:

a) Significant NFS overwrite performance regression (due to running
   prepare_write/commit_write) against each writev segment.

b) Smaller but significant performance regression for all writev()
   usages (I expect - haven't measured this yet).

c) It's still theoretically deadlockable.

I am (slowly) working on addressing these issues - more info later.

Basically, we will again need to be able to traverse multiple iovec
segments within a single prepare_write/commit_write instance.  This will
impact your batch_write patch, because that patch somewhat codifies in the
function layout the concept that we do one-segment-pre-prepare_write().

So that patch will need significant rework, I suspect.

What I'm hoping to be able to do is to simply revert the two deadlock-fix
patches (so we go back to the 2.6.17 code) and to remove
fault_in_pages_readable() and to simply unlock the page after
->prepare_write() and lock it again prior to ->commit_write().  But I
haven't tried that yet - there's quite a bit of preparatory work needed.
