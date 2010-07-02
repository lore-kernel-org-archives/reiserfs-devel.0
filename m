From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: reiserfs locking (v2)
Date: Fri, 02 Jul 2010 15:44:27 +0200
Message-ID: <1278078267.1917.254.camel@laptop>
References: <20100702093451.GA3973@swordfish.minsk.epam.com>
	 <20100702131248.GA5324@nowhere>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20100702131248.GA5324@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <chris.mason@oracle.com>, Jeff Mahoney <jeffm@jeffreymahoney.com>

On Fri, 2010-07-02 at 15:12 +0200, Frederic Weisbecker wrote:
> 
> I don't think the deadlock can really happen, as we can't release the directory while
> we are reading it. Plus I guess we can't mmap a directory (someone correct me if
> I'm wrong).
> 

> Is there someone who could give me a hint here?

If its purely directories you can try and give directory inode locks a
different class.
