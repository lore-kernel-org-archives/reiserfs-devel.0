From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 1/9] reiser4: block_alloc: add BA_SOME_SPACE flag
 for grabbing a fixed amount of space.
Date: Tue, 21 Oct 2014 12:32:24 +0200
Message-ID: <54463638.7090606@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1408312379-1990-2-git-send-email-intelfx100@gmail.com> <54443577.3050700@gmail.com> <3239928.cvXopdq3l9@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=8M7zNW8zTOuWkkRp6eKGfL9m1g+Zl3d1AJkP7gdp+Vs=;
        b=n+Xi7mOx3mMRa3XWDP7znA2DmouEL3kcUhvonExtqAYCpsFftVSL6VLf6d92qC37hK
         Osoo0aMJ+1BJCvb76PY89qjWN8U1yAk5NcRAwhKVQAs5BaRlGfPVZ7D3DYIdjhi1xxRO
         1EVWH6aoFypdo5kHgRHrCzHGWnD/yTI2TOSGV7y1HrC7myeY8ZELveE29VYF8xn/FTTr
         aK6ebaQomev+PycVoGu9GG4+FZwHP1s7U7EcomLhc2FjObIrhF6rNpQ0RtwB2rLPUYfk
         uBPzLf0eBwymtpvJR7Doa+Z9Hjbz4G2/cxpWCagGFMmXdevks8mk+IC5IPRk3kmP9fvj
         WOig==
In-Reply-To: <3239928.cvXopdq3l9@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 10/20/2014 12:36 PM, Ivan Shapovalov wrote:
> On Monday 20 October 2014 at 00:04:39, Edward Shishkin wrote:	
>> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
>>> This is used for FITRIM ioctl which will iteratively grab, allocate and trim disk space
>>> bit by bit to avoid starving the rest of system.
>>>
>>> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
>>> ---
>>>    fs/reiser4/block_alloc.c | 5 +++++
>>>    fs/reiser4/block_alloc.h | 5 ++++-
>>>    2 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
>>> index d3d730c..9eed7fc 100644
>>> --- a/fs/reiser4/block_alloc.c
>>> +++ b/fs/reiser4/block_alloc.c
>>> @@ -276,6 +276,11 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
>>>    
>>>    	free_blocks = sbinfo->blocks_free;
>>>    
>>> +	if (flags & BA_SOME_SPACE) {
>>> +		/* Reserve 25% of all free space. */
>> if (free_blocks == 0) {
>>           /* nothing to trim */
>>           ret= RETERR(-ENOSPC);
>>           goto unlock_and_ret;
>> }
> Makes sense, but IMO without returning error. TRIM'ing a completely full
> filesystem is a no-op (== all blocks busy, nothing to trim), not a failure.


(sbinfo->blocks_free) is a rather bad estimation of free space amount,
but we have nothing better. I suggest to return -ENOSPC here, and use
reiser4_grab_space() with BA_CAN_COMMIT to make sure that FITRIM
ioctl gets the "second soft ENOSPC".

Thanks,
Edward.

