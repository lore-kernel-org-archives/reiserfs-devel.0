From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] Adjust reiser4 for 3.15: replace truncate_inode_pages(...,
 0) with truncate_inode_pages_final(...).
Date: Mon, 03 Oct 2016 16:29:06 +0200
Message-ID: <57F26B32.7040807@gmail.com>
References: <20160930063629.13794-1-intelfx@intelfx.name>        <20160930064332.19365-1-intelfx@intelfx.name> <1475218025.19471.1.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=4jg4PFlggj/4wd2hRbbsFhMROhkuDdYGNo0EsO3MDaQ=;
        b=wIjCKa7ipNrDR1rtj2cYbfpK3Iqn82EKl2Arjp6pSlbaq5S3Bgm90319cmseIxnfmc
         UXkox/MdRSnuDPVfaGYnEUu6fE8L1Z8UczxmXZnuMEUFSzEqIXRN6VEFlMZdpunm3YL6
         f3EPjCN+rvAQePs9FcMcmaxoVCA8k4BGGl/wOSGfyM/d1QwO9mcG9F1y3adL9dRBPYsB
         eOBmhur65wb8GFBcH5HU1c4ECo6NuCxHvEarnprdamrFNUPt/CkqivLbgSOJh5Gp6PFe
         trLE8heNInDPji+W2fR8mY0/GlXima1wh52ltCsH6GPMGw5u6UmS0DdSeMD2RUJERyAo
         nAow==
In-Reply-To: <1475218025.19471.1.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, reiserfs-devel@vger.kernel.org

On 09/30/2016 08:47 AM, Ivan Shapovalov wrote:
> On 2016-09-30 at 09:43 +0300, Ivan Shapovalov wrote:
>> Upstream commit 91b0abe36a7b2b3b02d7500925a5f8455334f0e5
>> "mm + fs: store shadow entries in page cache".
>>
>> Moreover, the truncate_inode_pages(..., 0) in
>> delete_object_cryptcompress()
>> is not needed at all.
>>
>> Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
>> ---
>>   plugin/file/cryptcompress.c | 2 --
>>   super_ops.c                 | 2 +-
>>   2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/plugin/file/cryptcompress.c
>> b/plugin/file/cryptcompress.c
>> index 59d8df8..5433de9 100644
>> --- a/plugin/file/cryptcompress.c
>> +++ b/plugin/file/cryptcompress.c
>> @@ -3595,8 +3595,6 @@ int delete_object_cryptcompress(struct inode
>> *inode)
>>   			(unsigned long long)get_inode_oid(inode),
>>   			result);
>>   	}
>> -	truncate_inode_pages(inode->i_mapping, 0);
>> -	assert("edward-1487", pages_truncate_ok(inode, 0));
>>   	/* and remove stat data */
>>   	return reiser4_delete_object_common(inode);
>>   }
>> diff --git a/super_ops.c b/super_ops.c
>> index 73c18f2..697580c 100644
>> --- a/super_ops.c
>> +++ b/super_ops.c
>> @@ -215,7 +215,7 @@ static void reiser4_evict_inode(struct inode
>> *inode)
>>   			fplug->delete_object(inode);
>>   	}
>>   
>> -	truncate_inode_pages(&inode->i_data, 0);
>> +	truncate_inode_pages_final(&inode->i_data);
>>   	inode->i_blocks = 0;
>>   	clear_inode(inode);
>>   	reiser4_exit_context(ctx);
> BTW, this raises a question: in the ->evict_inode path, are we ever
> allowed to call plain truncate_inode_pages() (i. e. not *_final())?

Actually, I would like to see a kind of assertion 1487 instead:
everything should be already truncated at that point.

>
> The ->delete_object plugin methods do this as part of their logic,
> actually. At least the cryptcompress plugin calls
> truncate_inode_pages(..., new_size) at the end of
> prune_cryptcompress(), however I suspect that the regular file plugin
> also does this deep inside reiser4's guts.

File body is truncated item-by-item from right to left. For each item
its ->kill_hook() method is called. It is responsible for truncating
attached pages. Bodies of cryptcompress files are not connected:
there can be pages without "parent" items (in the case of holes), so
in addition we call truncate_inode_pages() in prune_cryptcompress()
to kill those pages.

Edward.
