From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] reiser4: fix readv
Date: Mon, 18 Sep 2006 16:19:02 +0200
Message-ID: <20060918141902.GA21430@lst.de>
References: <200609132212.54871.vs@namesys.com> <200609172239.08025.vs@namesys.com> <20060918123035.GB18367@lst.de> <200609181734.42341.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200609181734.42341.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Christoph Hellwig <hch@lst.de>, reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>, Badari Pulavarty <pbadari@us.ibm.com>

On Mon, Sep 18, 2006 at 05:34:42PM +0400, Vladimir V. Saveliev wrote:
> Can we put it that way: if a filesystem can use page_cache directly - it has to set f_op->aio_read to generic_file_aio_read
> and set f_op->read to NULL. If the filesystem wants to try to screw things up a bit - 
> it implements f_op->read and its f_op->read is called by sys_read and sys_readv
> regardless to whether it has aio_read or not?

Not entirely.  The idea I had in my mind was the following:

 - real filesystems should always implement the aio_ methods and must
   support async and vectored I/O
 - drivers or simple synthetic filesystems can implement just ->read and
   ->write and stay out of all the complexity.

In the end I would like to enforce and invariant where a fileesystem or
driver implements either the aio_ or normal methods, but we can't do
that yet as there are far too many places calling thos directly.  Thus
we have do_sync_read and do_sync_write that are used as read and write
methods for those more complex filesystems.  (Anyone's got an idea how
to enforce that people never set ->read and ->write to anything else
when they implement the aio methods?)

> > why does this matter for reiser4?
> > 
> 
> reiser4 reads some files via generic page cache routines. In that case reiser4' read calls do_sync_read. 
> Therefore, it has to define f_op->aio_read. 
> OTOH, there are files for which reiser4' read does not call do_sync_read.
> 
> In case of readv, f_op->aio_read is called directly (if it is defined), which may result in that reiser4' aio_read is called for files for which 
> reiser4' read would never call do_sync_read. 
> To avoid the problem we have to implement reiser4_aio_read which either calls generic_file_aio_read or does something very similar to do_loop_readv_writev.

In that case reiserfs should only implement aio_read and aio_write
methods and use do_loop_readv_writev which we should export for a
beginning.  Longer term you should try to implement full blown aio and
vector support even for those odd files (or find a way to migrate the
pagecache).  Do files change from odd to normal while they're
instanciated?  Otherwise you could just declare to sets of
file_operations, once that uses the pagecache and one that doesn't
and decide at inode instanciation time which one to use.
