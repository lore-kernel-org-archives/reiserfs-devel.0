From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 2/8] reiserfs: use kmap_local_folio() in
 _get_block_create_0()
Date: Sat, 17 Dec 2022 19:07:12 +0000
Message-ID: <Y54TYOqbPuKlfiHk@casper.infradead.org>
References: <20221216205348.3781217-1-willy@infradead.org>
 <20221216205348.3781217-3-willy@infradead.org>
 <Y5343RPkHRdIkR9a@iweiny-mobl>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=C/d4CkPzxxf9PWfMqX+OIeo1O9qLzk3Xkc5g2CBzozM=; b=HV9M0gN0vrn/zwQGC2UwIEuyl4
        3198pgg2q1IYlRflUnm4Vxdn8mYRLx51xVgP/C6PmztCsKiYKYNV1fWJNNbVFxaX6yrsOAlUCThpd
        3lzf49lTEYxuIkFvNP37LQeNETJbZBEzQ0mPBt+yjydQhLM/KAD6xdTum0qBgHTEFegZdSUSfmz6T
        IlSxFbsP7zGihzAlXNjEG34SUl6VjSdlKEU9lmu8S5tIIsm7vqhx9LnGACHJggqTAGOObkQyBFnRm
        JkVxGLjfMRNfNv01oTjaIhBjeF+ZU+9M0rKok135LUDLx477aE16F/6QoolPq1JxVVp+r0I2RmLax
        TBuRI1yw==;
Content-Disposition: inline
In-Reply-To: <Y5343RPkHRdIkR9a@iweiny-mobl>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ira Weiny <ira.weiny@intel.com>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

On Sat, Dec 17, 2022 at 09:14:05AM -0800, Ira Weiny wrote:
> On Fri, Dec 16, 2022 at 08:53:41PM +0000, Matthew Wilcox (Oracle) wrote:
> > Switch from the deprecated kmap() to kmap_local_folio().  For the
> > kunmap_local(), I subtract off 'chars' to prevent the possibility that
> > p has wrapped into the next page.
> 
> Thanks for tackling this one.  I think the conversion is mostly safe because I
> don't see any reason the mapping is passed to another thread.
> 
> But comments like this make me leary:
> 
>          "But, this means the item might move if kmap schedules"
> 
> What does that mean?  That seems to imply there is something wrong with the
> base code separate from the kmapping.

I should probably have deleted that comment.  I'm pretty sure what it
refers to is that we don't hold a lock that prevents the item from
moving.  When ReiserFS was written, we didn't have CONFIG_PREEMPT, so 
if kmap() scheduled, that was a point at which the item could move.
I don't think I introduced any additional brokenness by converting
from kmap() to kmap_local().  Maybe I'm wrong and somebody who
understands ReiserFS can explain.

> To the patch, I think subtracting chars might be an issue.  If chars > offset
> and the loop takes the first 'if (done) break;' path then p will end up
> pointing at the previous page wouldn't it?

I thought about that and managed to convince myself that chars was
always < offset.  But now I'm not sure again.  Easiest way to fix
this is actually to move the p += chars before the if (done) break;.

I also need to rev this patch because it assumes that b_folio is a
single page.

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 008855ddb365..be13ce7a38e1 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -295,7 +295,6 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 	int ret;
 	int result;
 	int done = 0;
-	unsigned long offset;
 
 	/* prepare the key to look for the 'block'-th block of file */
 	make_cpu_key(&key, inode,
@@ -380,17 +379,16 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 		set_buffer_uptodate(bh_result);
 		goto finished;
 	}
-	/* read file tail into part of page */
-	offset = (cpu_key_k_offset(&key) - 1) & (PAGE_SIZE - 1);
 	copy_item_head(&tmp_ih, ih);
 
 	/*
 	 * we only want to kmap if we are reading the tail into the page.
 	 * this is not the common case, so we don't kmap until we are
-	 * sure we need to.  But, this means the item might move if
-	 * kmap schedules
+	 * sure we need to.
 	 */
-	p = kmap_local_folio(bh_result->b_folio, offset);
+	p = kmap_local_folio(bh_result->b_folio,
+			offset_in_folio(bh_result->b_folio,
+					cpu_key_k_offset(&key) - 1));
 	memset(p, 0, inode->i_sb->s_blocksize);
 	do {
 		if (!is_direct_le_ih(ih)) {
@@ -413,12 +411,11 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 			chars = ih_item_len(ih) - path.pos_in_item;
 		}
 		memcpy(p, ih_item_body(bh, ih) + path.pos_in_item, chars);
+		p += chars;
 
 		if (done)
 			break;
 
-		p += chars;
-
 		/*
 		 * we done, if read direct item is not the last item of
 		 * node FIXME: we could try to check right delimiting key
