From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] reiser4: fix readv
Date: Mon, 18 Sep 2006 14:30:35 +0200
Message-ID: <20060918123035.GB18367@lst.de>
References: <200609132212.54871.vs@namesys.com> <20060914192415.a356d950.akpm@osdl.org> <200609172239.08025.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200609172239.08025.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, reiserfs-list@namesys.com, Christoph Hellwig <hch@lst.de>, Badari Pulavarty <pbadari@us.ibm.com>

On Sun, Sep 17, 2006 at 10:39:07PM +0400, Vladimir V. Saveliev wrote:
> It seems the problem can be fixed a bit simpler. Currently, there is a difference between read and readv: read calls f_op->read if it is defined,
> but readv calls f_op->read if f_op->aio_read is not defined. The latest is a bit unlogical imho: 
> wouldn't it be more consistent if readv worked via f_op->read if it is defined?
> If we fixed readv (do_readv_writev) that way - reiser4 would not need anything from its aio_read but generic_file_aio_read.

This behaviour is historic baggae.  readv used to call ->readv and fall
back to ->read when it wasn't available.  We now merged ->readv into
->aio_read and kept that behaviour.  I think it makes sense, though - if
the filesystem supports vator operations via ->aio_read we should use
them and not fall back to the manual looping around ->read.

I'd rather change read to do the same thing as readv so we have
consistent behaviour.

why does this matter for reiser4?

