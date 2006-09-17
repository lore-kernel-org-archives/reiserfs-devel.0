From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [PATCH] reiser4: fix readv
Date: Sun, 17 Sep 2006 22:39:07 +0400
Message-ID: <200609172239.08025.vs@namesys.com>
References: <200609132212.54871.vs@namesys.com> <20060914192415.a356d950.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29915-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060914192415.a356d950.akpm@osdl.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: reiserfs-list@namesys.com, Christoph Hellwig <hch@lst.de>, Badari Pulavarty <pbadari@us.ibm.com>

Hello

On Friday 15 September 2006 06:24, Andrew Morton wrote:
> On Wed, 13 Sep 2006 22:12:54 +0400
> "Vladimir V. Saveliev" <vs@namesys.com> wrote:
> 
> > Hello, Andrew
> > 
> > reiser4 in 2.6.18-rc6-mm2 has a bug. It can not do readv.
> > 
> > The attached patch fixes it by implementing reiser4' aio_read file operation.
> > Unfortunately, it appeared to get a loop which is very similar to the one of
> > fs/read_write.c:do_loop_readv_writev().
> > Alternatively, if do_loop_readv_writev were EXPORT_SYMBOL-ed
> > reiser4' aio_read could use it instead. But, there is a problem with do_loop_readv_writev EXPORT_SYMBOL-ing:
> > one if its arguments is io_fn_t, which is declared in fs/read_write.h.
> > If it is ok to move io_fn_t and do_loop_readv_writev declarations to include/linux/fs.h and to EXPORT_SYMBOL 
> > do_loop_readv_writev the fix will be smaller. Please, let me know what would you prefer.
> > 
> 
> Yes, I'd say that do_loop_readv_writev() is suitable for exporting to
> filesystems, and that doing so is preferable to duplicating it.
> 
> That'd be two patches, please: one to do the export and one to use it in
> reiser4.
> 
> I assume there's a good reason why reiser4 cannot use
> generic_file_aio_read() or vfs_readv().  Please capture that discussion in
> the changelog for the first patch, thanks.
> 

It seems the problem can be fixed a bit simpler. Currently, there is a difference between read and readv: read calls f_op->read if it is defined,
but readv calls f_op->read if f_op->aio_read is not defined. The latest is a bit unlogical imho: 
wouldn't it be more consistent if readv worked via f_op->read if it is defined?
If we fixed readv (do_readv_writev) that way - reiser4 would not need anything from its aio_read but generic_file_aio_read.


From: Vladimir Saveliev <vs@namesys.com>

There is some asymmetry between read and readv:
read (vfs_read, namely) calls f_op->read when it is defined,
while readv (do_readv_writev) calls f_op->read when f_op->aio_read is not defined.
This patch makes do_readv_writev to call do_loop_readv_writev
(which calls f_op->read for each segment of i/o vector) if f_op->read is defined.

Signed-off-by: Vladimir Saveliev <vs@namesys.com>




diff -puN fs/read_write.c~fix-do_readv_writev fs/read_write.c
--- linux-2.6.18-rc6-mm2/fs/read_write.c~fix-do_readv_writev	2006-09-15 17:46:03.000000000 +0400
+++ linux-2.6.18-rc6-mm2-vs/fs/read_write.c	2006-09-17 23:01:17.000000000 +0400
@@ -608,7 +608,6 @@ static ssize_t do_readv_writev(int type,
 	if (ret)
 		goto out;
 
-	fnv = NULL;
 	if (type == READ) {
 		fn = file->f_op->read;
 		fnv = file->f_op->aio_read;
@@ -617,11 +616,11 @@ static ssize_t do_readv_writev(int type,
 		fnv = file->f_op->aio_write;
 	}
 
-	if (fnv)
+	if (fn)
+		ret = do_loop_readv_writev(file, iov, nr_segs, pos, fn);
+	else
 		ret = do_sync_readv_writev(file, iov, nr_segs, tot_len,
 						pos, fnv);
-	else
-		ret = do_loop_readv_writev(file, iov, nr_segs, pos, fn);
 
 out:
 	if (iov != iovstack)

_
