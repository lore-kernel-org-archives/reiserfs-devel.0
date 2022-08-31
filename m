From: Zhang Yi <yi.zhang@huawei.com>
Subject: Re: [PATCH 02/14] fs/buffer: add some new buffer read helpers
Date: Wed, 31 Aug 2022 21:11:37 +0800
Message-ID: <df2738e4-493f-0dfd-95c4-b5f763561c63@huawei.com>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-3-yi.zhang@huawei.com>
 <20220831113029.fsywbjzk4qw24qdc@quack3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20220831113029.fsywbjzk4qw24qdc@quack3>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

Thanks for the review and suggestions.

On 2022/8/31 19:30, Jan Kara wrote:
> On Wed 31-08-22 15:20:59, Zhang Yi wrote:
>> Current ll_rw_block() helper is fragile because it assumes that locked
>> buffer means it's under IO which is submitted by some other who hold
>> the lock, it skip buffer if it failed to get the lock, so it's only
>> safe on the readahead path. Unfortunately, now that most filesystems
>> still use this helper mistakenly on the sync metadata read path. There
>> is no guarantee that the one who hold the buffer lock always submit IO
>> (e.g. buffer_migrate_folio_norefs() after commit 88dbcbb3a484 ("blkdev:
>> avoid migration stalls for blkdev pages"), it could lead to false
>> positive -EIO when submitting reading IO.
>>
>> This patch add some friendly buffer read helpers to prepare replace
>> ll_rw_block() and similar calls. We can only call bh_readahead_[]
>> helpers for the readahead paths.
>>
>> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> 
> This looks mostly good. Just a few small nits below.
> 
[..]
>> diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
>> index c3863c417b00..8a01c07c0418 100644
>> --- a/include/linux/buffer_head.h
>> +++ b/include/linux/buffer_head.h
[..]
>> +static inline void bh_read_nowait(struct buffer_head *bh, blk_opf_t op_flags)
>> +{
>> +	lock_buffer(bh);
>> +	__bh_read(bh, op_flags, false);
>> +}
>> +
>> +static inline int bh_read(struct buffer_head *bh, blk_opf_t op_flags)
>> +{
>> +	lock_buffer(bh);
>> +	return __bh_read(bh, op_flags, true);
>> +}
> 
> I would use bh_uptodate_or_lock() helper in the above two functions to
> avoid locking the buffer in case it is already uptodate.
> 
Yes, it's a good point, it seems we could also remove "if (!buffer_uptodate(bh))"
before above two helpers in the latter patches, like in fs/jbd2/journal.c.

@@ -1893,15 +1893,14 @@ static int journal_get_superblock(journal_t *journal)
 {
 	struct buffer_head *bh;
 	journal_superblock_t *sb;
-	int err = -EIO;
+	int err;

 	bh = journal->j_sb_buffer;

 	J_ASSERT(bh != NULL);
- 	if (!buffer_uptodate(bh)) {
-		ll_rw_block(REQ_OP_READ, 1, &bh);
-		wait_on_buffer(bh);
-		if (!buffer_uptodate(bh)) {
+	err = bh_read(bh, 0);
+	if (err) {
-			printk(KERN_ERR
-				"JBD2: IO error reading journal superblock\n");
-			goto out;
+		printk(KERN_ERR
+			"JBD2: IO error reading journal superblock\n");
+		goto out;
...

Thanks,
Yi.
