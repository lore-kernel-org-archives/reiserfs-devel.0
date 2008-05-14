From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: [patch 2/3] [PATCH] reiserfs: convert j_flush_sem to mutex
Date: Wed, 14 May 2008 23:52:01 +0530
Message-ID: <482B2DC9.3050503@linux.vnet.ibm.com>
References: <20080508063557.757413878@suse.com> <20080508063651.715221085@suse.com> <482AFA28.8020403@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <482AFA28.8020403@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Andrew Morton <akpm@osdl.org>

Jeff Mahoney wrote:
> Jeff Mahoney wrote:
>>  j_flush_sem is a semaphore but uses it as if it were a mutex. This
>>  patch converts it to a mutex.
>> --- a/fs/reiserfs/journal.c
>> +++ b/fs/reiserfs/journal.c
>> @@ -1411,8 +1411,8 @@ static int flush_journal_list(struct sup
>>  
>>  	/* if flushall == 0, the lock is already held */
>>  	if (flushall) {
>> -		down(&journal->j_flush_sem);
>> -	} else if (!down_trylock(&journal->j_flush_sem)) {
>> +		mutex_lock(&journal->j_flush_mutex);
>> +	} else if (!mutex_trylock(&journal->j_flush_mutex)) {
>>  		BUG();
>>  	}
> 
> Oops. This chunk didn't get refreshed, here's the right one.
> 
> -Jeff

Thanks, the patch resolves the kernel bug.

Tested-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> ---
>  fs/reiserfs/journal.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -1410,7 +1410,7 @@ static int flush_journal_list(struct sup
>  	/* if flushall == 0, the lock is already held */
>  	if (flushall) {
>  		mutex_lock(&journal->j_flush_mutex);
> -	} else if (!mutex_trylock(&journal->j_flush_mutex)) {
> +	} else if (mutex_trylock(&journal->j_flush_mutex)) {
>  		BUG();
>  	}
> 


-- 
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
