From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: reiserfs locking (v2)
Date: Sat, 3 Jul 2010 10:43:23 +0100
Message-ID: <20100703094323.GN31073@ZenIV.linux.org.uk>
References: <20100702093451.GA3973@swordfish.minsk.epam.com>
 <20100702131248.GA5324@nowhere>
 <20100703092441.GM31073@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100703092441.GM31073@ZenIV.linux.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <chris.mason@oracle.com>, Jeff Mahoney <jeffm@jeffreymahoney.com>

On Sat, Jul 03, 2010 at 10:24:42AM +0100, Al Viro wrote:

> Gyah...  For the 1001st time: readdir() is far from being the only thing that
> nests mmap_sem inside i_mutex.  In particular, write() does the same thing.
> 
> So yes, it *is* a real deadlock, TYVM, with no directories involved.  Open the
> same file twice, mmap one fd, close it, then have munmap() hitting i_mutex
> in reiserfs_file_release() race with write() through another fd.
> 
> Incidentally, reiserfs_file_release() checks in the fastpath look completely
> bogus.  Checking i_count?  What the hell is that one about?  And no, these
> checks won't stop open() coming between them and grabbing i_mutex, so they
> couldn't prevent the deadlock in question anyway.

... and unfortunately it's been that way since the the initial merge in 2.4.early.
FWIW, it seems that i_count check was a misguided attempt to check that no other
opened struct file are there, but it's
	a) wrong, since way, _way_ back - open() affects d_count, not i_count
	b) wrong even with such modification (consider hardlinks)
	c) wrong for even more reasons since forever - i_count and d_count could
be bumped by many things at any time
	d) hopelessly racy anyway, since another open() could very well have
happened just as we'd finished these checks.
