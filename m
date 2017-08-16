From: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH] reiserfs: fix spelling mistake: "tranasction" ->
 "transaction"
Date: Wed, 16 Aug 2017 15:07:10 +0100
Message-ID: <e47d5ab6-2015-7bab-918c-a8df6e3b8bc3@canonical.com>
References: <20170816080620.8440-1-colin.king@canonical.com>
 <20170816140036.GE4898@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20170816140036.GE4898@quack2.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: Ingo Molnar <mingo@kernel.org>, Jens Axboe <axboe@fb.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On 16/08/17 15:00, Jan Kara wrote:
> On Wed 16-08-17 09:06:20, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Trivial fix to spelling mistake in reiserfs_warning message
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks. Added to my tree. BTW, why did you CC Ingo and Jens?

I believe get_maintainer.pl had their names in as contributing changes
unless I read it wrong, which is always possible.

Colin

> 
> 								Honza
> 
>> ---
>>  fs/reiserfs/journal.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
>> index a11d773e5ff3..0c882a0e2a6e 100644
>> --- a/fs/reiserfs/journal.c
>> +++ b/fs/reiserfs/journal.c
>> @@ -1481,7 +1481,7 @@ static int flush_journal_list(struct super_block *s,
>>  		if ((!was_jwait) && !buffer_locked(saved_bh)) {
>>  			reiserfs_warning(s, "journal-813",
>>  					 "BAD! buffer %llu %cdirty %cjwait, "
>> -					 "not in a newer tranasction",
>> +					 "not in a newer transaction",
>>  					 (unsigned long long)saved_bh->
>>  					 b_blocknr, was_dirty ? ' ' : '!',
>>  					 was_jwait ? ' ' : '!');
>> -- 
>> 2.11.0
>>

