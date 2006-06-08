From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] updated reiser4 - reduced cpu usage for writes by writing  more than 4k at a time (has implications for generic write code and eventually  for the IO layer)
Date: Thu, 8 Jun 2006 13:10:06 +0100
Message-ID: <20060608121006.GA8474@infradead.org>
References: <44736D3E.8090808@namesys.com> <20060524175312.GA3579@zero> <44749E24.40203@namesys.com> <20060608110044.GA5207@suse.de> <1149766000.6336.29.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1149766000.6336.29.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Jens Axboe <axboe@suse.de>, Hans Reiser <reiser@namesys.com>, Tom Vier <tmv@comcast.net>, Linux-Kernel@Vger.Kernel.ORG, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Thu, Jun 08, 2006 at 03:26:40PM +0400, Vladimir V. Saveliev wrote:
> > > It may go to the kernel as a 64MB write, but VFS sends it to the FS as
> > > 64MB/4k separate 4k writes.
> > 
> > Nonsense, 
> 
> Hans refers to generic_file_write which does
> prepare_write
> copy_from_user
> commit_write
> for each page.

That's not really the vfs but the generic pagecache routines.  For some
filesystems (e.g. XFS) only reservations for delayed allocations are
performed in this path so it doesn't really matter.  For not so advanced
filesystems batching these calls would definitly be very helpful.  Patches
to get there are very welcome.

