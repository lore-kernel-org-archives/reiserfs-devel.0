From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: reiserfs locking (v2)
Date: Fri, 02 Jul 2010 16:38:33 +0200
Message-ID: <1278081513.1917.260.camel@laptop>
References: <20100702093451.GA3973@swordfish.minsk.epam.com>
	 <20100702131248.GA5324@nowhere> <1278078267.1917.254.camel@laptop>
	 <20100702143419.GC5324@nowhere>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20100702143419.GC5324@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <chris.mason@oracle.com>, Jeff Mahoney <jeffm@jeffreymahoney.com>

On Fri, 2010-07-02 at 16:34 +0200, Frederic Weisbecker wrote:
> vfs_readdir() locks the directory before calling the fs, and none
> of the nested classes would be in its good right there, as the
> directory is the current inode to work on, not a parent nor a
> child or so. 

Nah, what I was referring to is sticking the i_mutex into a different
class on inode creation, but apparently we already do, see
unlock_new_inode().

So its not a pure directory thing.. 
