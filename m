From: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] reiserfs : fix improper free in reiserfs_get_block
Date: Tue, 14 Jul 2020 06:12:47 -0700
Message-ID: <bc5a13bd-54c4-509d-7202-20c93f43e2f6@redhat.com>
References: <20200714130509.11791-1-trix@redhat.com>
 <20200714131043.GB12769@casper.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594732372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tcXLN2aOM5HyVPvW2nX/ENf3RMB6pm0tLQoN1DTr1NI=;
        b=JwMXQp6K5DrdVCVg3cKYHS0SvxmOveUmSRlyqRSP4zYPIL8jm5Fo2tOc+kaD6SHiFwd5jJ
        8lv3B/Z693dp4QtrxbQNvFy5nviQNThYfE3N3VODAnYemLoSmZ215KBir9HpOONgC7nQqZ
        GXHnCdfkuxrQ/Lv/WYQq4sOJS400824=
In-Reply-To: <20200714131043.GB12769@casper.infradead.org>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthew Wilcox <willy@infradead.org>
Cc: jack@suse.cz, william.kucharski@oracle.com, jeffm@suse.com, joseph.qi@linux.alibaba.com, liao.pingfang@zte.com.cn, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org


On 7/14/20 6:10 AM, Matthew Wilcox wrote:
> On Tue, Jul 14, 2020 at 06:05:09AM -0700, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> clang static analysis flags this error
>>
>> inode.c:1083:5: warning: Argument to kfree() is the address of the
>>   local variable 'unf_single', which is not memory allocated by
>>   malloc() [unix.Malloc]
>>                                 kfree(un);
>>                                 ^~~~~~~~~
>> Assignment of 'un'
>>
>> 	/*
>> 	 * We use this in case we need to allocate
>> 	 * only one block which is a fastpath
>> 	 */
>> 	unp_t unf_single = 0;
>>
>> 	...
>>
>> 	if (blocks_needed == 1) {
>> 		un = &unf_single;
>> 	} else {
>> 		un = kcalloc(min(blocks_needed, max_to_insert),
>> 			     UNFM_P_SIZE, GFP_NOFS);
>> 		if (!un) {
>> 			un = &unf_single;
>> 			blocks_needed = 1;
>> 			max_to_insert = 0;
>> 		}
>> 	}
>>
>> The logic to free 'un'
>>
>> 	if (blocks_needed != 1)
>> 		kfree(un);
>>
>> Because the kcalloc failure falls back to using unf_single,
>> the if-check for the free is wrong.
> I think you mean "Because clang's static analysis is limited, it
> warns incorrectly about this".  There's no path to get to the
> kfree with blocks_needed != 1 and un being equal to &unf_single.

Ok.


>> So improve the check.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  fs/reiserfs/inode.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
>> index 1509775da040..4d62148e43e6 100644
>> --- a/fs/reiserfs/inode.c
>> +++ b/fs/reiserfs/inode.c
>> @@ -1079,7 +1079,7 @@ int reiserfs_get_block(struct inode *inode, sector_t block,
>>  						     UNFM_P_SIZE *
>>  						     blocks_needed);
>>  
>> -			if (blocks_needed != 1)
>> +			if (un != &unf_single)
>>  				kfree(un);
> I don't actually object to this patch, but your analysis of clang's
> analysis is wrong.
>

