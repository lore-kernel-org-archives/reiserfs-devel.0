From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv2 2/3] reiser4: block_alloc: sanitize grab_enabled modifications.
Date: Sun, 16 Nov 2014 10:53:03 +0100
Message-ID: <546873FF.6040804@gmail.com>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com> <1414048685-4224-3-git-send-email-intelfx100@gmail.com> <2228941.DWoZ5v2hiQ@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=TERGtdsr5YPrwDSnjUFZLrcaSFwMtrVJQxAvi8mKQIA=;
        b=nUnPTIFhjYEnGUtgYsMXLWYWvPyRzY6jArMjs8bFd3EYbv/F+cdaf0NtBQmfB0JPS1
         PGvn9SNAZNu48YafWaKOqr+kp+UcS7QTDKHOMaUtWOxyV7rmSK/uHpqF/uosckBB2+BS
         +8zTzPHpcmsyKTULVtAq/K7MeRZuny60QiauOT23rVHgRByhh7hFdCnPboiw0TjWevq5
         CJGSpgt01Qh8uiaiKF4AS4d2F3L0/QseC9yepKV1HcvcbNosvHvAKeyuESJIYjufDrin
         fJmQK0NWh4dHEEKL+p8OEB5VJ9AQVyF9aCf73uOOzg7kmbsHxZ7JS5sF8NVF92ONcHEW
         cBbg==
In-Reply-To: <2228941.DWoZ5v2hiQ@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 11/16/2014 06:38 AM, Ivan Shapovalov wrote:
> On Thursday 23 October 2014 at 11:18:04, Ivan Shapovalov wrote:	
>> - check and modify ctx->grab_enabled in reiser4_grab_space(), not reiser4_grab()
>> - do not re-enable grab before doing second attempt in BA_CAN_COMMIT sequence
>>    (it is unneeded given the first change)
> ...testing has revealed that this is wrong. Please see below.
>
>> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
>> ---
>>   fs/reiser4/block_alloc.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
>> index 7f9f910..9339de7 100644
>> --- a/fs/reiser4/block_alloc.c
>> +++ b/fs/reiser4/block_alloc.c
>> @@ -270,12 +270,6 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
>>   
>>   	assert("vs-1276", ctx == get_current_context());
>>   
>> -	/* Do not grab anything on ro-mounted fs. */
>> -	if (rofs_super(ctx->super)) {
>> -		ctx->grab_enabled = 0;
>> -		return 0;
>> -	}
>> -
>>   	sbinfo = get_super_private(ctx->super);
>>   
>>   	spin_lock_reiser4_super(sbinfo);
>> @@ -300,9 +294,6 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
>>   
>>   	assert("nikita-2986", reiser4_check_block_counters(ctx->super));
>>   
>> -	/* disable grab space in current context */
>> -	ctx->grab_enabled = 0;
>> -
>>   unlock_and_ret:
>>   	spin_unlock_reiser4_super(sbinfo);
>>   
>> @@ -321,6 +312,12 @@ int reiser4_grab_space(__u64 count, reiser4_ba_flags_t flags)
>>   	if (!(flags & BA_FORCE) && !is_grab_enabled(ctx))
>>   		return 0;
>>   
>> +	/* Do not grab anything on ro-mounted fs. */
>> +	if (rofs_super(ctx->super)) {
>> +		ctx->grab_enabled = 0;
>> +		return 0;
>> +	}
>> +
>>   	ret = reiser4_grab(ctx, count, flags);
>>   	if (ret == -ENOSPC) {
>>   
>> @@ -328,10 +325,15 @@ int reiser4_grab_space(__u64 count, reiser4_ba_flags_t flags)
>>   		   present */
>>   		if (flags & BA_CAN_COMMIT) {
>>   			txnmgr_force_commit_all(ctx->super, 0);
>> -			ctx->grab_enabled = 1;
>>   			ret = reiser4_grab(ctx, count, flags);
>>   		}
> Here, txnmgr_force_commit_all() performs space grabbing (with BA_FORCE flag)
> and as such indirectly sets ctx->grab_enabled to 0.
>
> Initial problem.
> Situation: ctx->grab_enabled == 0
> Call: reiser4_grab_space(toomany, BA_FORCE | BA_CAN_COMMIT)
> * first reiser4_grab() returns -ENOSPC
> * txnmgr_force_commit_all() is called
> * ctx->grab_enabled is set to 1 by us
> * second reiser4_grab() returns -ENOSPC as well
> Result: ctx->grab_enabled == 1
>
> Problem with this patch.
> Situation: ctx->grab_enabled == 1
> Call: reiser4_grab_space(toomany, BA_CAN_COMMIT)
> * first reiser4_grab() returns -ENOSPC
> * txnmgr_force_commit_all() is called and sets ctx->grab_enabled to 0
> * second reiser4_grab() returns -ENOSPC as well
> Result: no grab performed, but ctx->grab_enabled == 0.
>   
> Solution 1:
> save and restore ctx->grab_enabled across call to txnmgr_force_commit_all();
>
> Solution 2:
> make txnmgr_force_commit_all() not touch ctx->grab_enabled,
> i. e. set ctx->grab_enabled to 0 only if !BA_FORCE.
>
> What would you suggest?


Could you please remind, what problem
this patch series (sanitize grab_enabled) fixes?

Thanks,
Edward.


>

