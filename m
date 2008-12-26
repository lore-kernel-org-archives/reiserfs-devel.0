From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/2] reiser4: adjust to the new aops fixup
Date: Sat, 27 Dec 2008 02:33:34 +0300
Message-ID: <495569CE.2030400@gmail.com>
References: <20080924234116.GC30307@wotan.suse.de> <20081017173445.GA10293@infradead.org> <1224269128.15582.9.camel@badari-desktop> <20081021062020.GA17785@wotan.suse.de> <20081021174305.0320f52f.akpm@linux-foundation.org> <4927DB6A.50802@gmail.com> <20081127103418.GK28285@wotan.suse.de> <492EAFF2.9070605@gmail.com> <20081127144811.GS28285@wotan.suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050308000504010004020102"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20081127144811.GS28285@wotan.suse.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: torvalds@linux-foundation.org, hch@infradead.org, linux-fsdevel@vger.kernel.org, pbadari@us.ibm.com, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050308000504010004020102
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Nick Piggin wrote:
> On Thu, Nov 27, 2008 at 05:34:26PM +0300, Edward Shishkin wrote:
>   
>> reiser4_write_{begin,end} works only in splice.c (i.e. only for
>> loopback functionality) in the chunk of code which looks like this:
>>
>> pagecache_write_begin();
>> ...
>> memcpy(.., to_page);
>> ...
>> pagecache_write_end(.., to_page, ..);
>>
>> i.e. there can not be short writes and everything is uptodate.
>>     
>  
> Ah OK, indeed you are right. Although that's not to say that some
> other kernel code may not be able to start doing interruptible
> copies, although it would be fairly unlikely. Maybe if you just have
> a BUG_ON(!(flags & AOP_FLAG_UNINTERRUPTIBLE)); or something to just
> make sure?
Yup, I would say, it's a must..

Thanks,
Edward.

--------------050308000504010004020102
Content-Type: text/x-patch;
 name="reiser4-adjust-to-the-new-aops-fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-adjust-to-the-new-aops-fixup.patch"

Make sure that reiser4_write_begin()
is not called for interruptible copies.

Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
---
 linux-2.6.28-rc2-mm1/fs/reiser4/plugin/file/file_conversion.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-2.6.28-rc2-mm1/fs/reiser4/plugin/file/file_conversion.c.orig
+++ linux-2.6.28-rc2-mm1/fs/reiser4/plugin/file/file_conversion.c
@@ -682,6 +682,12 @@ int reiser4_write_begin_careful(struct f
 	reiser4_context *ctx;
 	struct inode * inode = file->f_dentry->d_inode;
 
+	/**
+	 * reiser4_write_end() can not cope with
+	 * short writes for now
+	 */
+	BUG_ON(!(flags & AOP_FLAG_UNINTERRUPTIBLE));
+
 	index = pos >> PAGE_CACHE_SHIFT;
 	start = pos & (PAGE_CACHE_SIZE - 1);
 	end = start + len;

--------------050308000504010004020102--
