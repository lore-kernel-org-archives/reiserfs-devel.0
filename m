From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [PATCH] reiser4: fix readv
Date: Mon, 18 Sep 2006 17:34:42 +0400
Message-ID: <200609181734.42341.vs@namesys.com>
References: <200609132212.54871.vs@namesys.com> <200609172239.08025.vs@namesys.com> <20060918123035.GB18367@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29925-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060918123035.GB18367@lst.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>
Cc: reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>, Badari Pulavarty <pbadari@us.ibm.com>

Hello

On Monday 18 September 2006 16:30, Christoph Hellwig wrote:
> On Sun, Sep 17, 2006 at 10:39:07PM +0400, Vladimir V. Saveliev wrote:
> > It seems the problem can be fixed a bit simpler. Currently, there is a difference between read and readv: read calls f_op->read if it is defined,
> > but readv calls f_op->read if f_op->aio_read is not defined. The latest is a bit unlogical imho: 
> > wouldn't it be more consistent if readv worked via f_op->read if it is defined?
> > If we fixed readv (do_readv_writev) that way - reiser4 would not need anything from its aio_read but generic_file_aio_read.
> 
> This behaviour is historic baggae.  readv used to call ->readv and fall
> back to ->read when it wasn't available.  We now merged ->readv into
> ->aio_read and kept that behaviour.  I think it makes sense, though - if
> the filesystem supports vator operations via ->aio_read we should use
> them and not fall back to the manual looping around ->read.
> 
> I'd rather change read to do the same thing as readv so we have
> consistent behaviour.
> 

Can we put it that way: if a filesystem can use page_cache directly - it has to set f_op->aio_read to generic_file_aio_read
and set f_op->read to NULL. If the filesystem wants to try to screw things up a bit - 
it implements f_op->read and its f_op->read is called by sys_read and sys_readv
regardless to whether it has aio_read or not?

> why does this matter for reiser4?
> 

reiser4 reads some files via generic page cache routines. In that case reiser4' read calls do_sync_read. 
Therefore, it has to define f_op->aio_read. 
OTOH, there are files for which reiser4' read does not call do_sync_read.

In case of readv, f_op->aio_read is called directly (if it is defined), which may result in that reiser4' aio_read is called for files for which 
reiser4' read would never call do_sync_read. 
To avoid the problem we have to implement reiser4_aio_read which either calls generic_file_aio_read or does something very similar to do_loop_readv_writev.


 
