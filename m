From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 2/9] reiser4: block_alloc: add a "forward" parameter
 to reiser4_blocknr_hint to allocate blocks only in forward direction.
Date: Thu, 23 Oct 2014 16:37:00 +0200
Message-ID: <5449128C.4040501@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1408312379-1990-3-git-send-email-intelfx100@gmail.com> <544680BF.5040204@gmail.com> <3138233.23nIal2kT0@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=UbceaEtxmKhpzVCvj34J7T5QM3D4tRbHvZpS/DJvE3M=;
        b=RwAb2ZYhmCe+2E/vO/hx4fQcQeWgnPb6jqwse4q4m9QSg/tMu6Mmbk9GCfjts6mJl2
         8oVfVm95YBltntJArW0ERYj4I3qkVHhFtLN/NBAejJPRvindrncJiBL0ldsMjdKLcR9T
         GpsWm3aDIYAsAOVfFY5p0B+EYkpiu5Jf7CdYWcrL5wLjyJj7kQoDeEQZmwkmZM/4LTcQ
         d8PDpX9DvljGhxGxrQ00gdXGggFCRAUZkZnxp3ewQ4M/VSHUfoN7Q+EjYPB+u/M/sdc5
         rXF0dDyeJyvey5/541mbZHVEHeaFPJ0qlP3cB5o6mr1f3V0jyOjQ8QqIQHzr5na31plj
         uHJQ==
In-Reply-To: <3138233.23nIal2kT0@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 10/23/2014 09:24 AM, Ivan Shapovalov wrote:
> On Tuesday 21 October 2014 at 17:50:23, Edward Shishkin wrote:	
>> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
>>> Signed-off-by: Ivan Shapovalov<intelfx100@gmail.com>
>>> ---
>>>    fs/reiser4/block_alloc.h         | 5 +++--
>>>    fs/reiser4/plugin/space/bitmap.c | 3 ++-
>>>    2 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
>>> index bfc6be9..08b3941 100644
>>> --- a/fs/reiser4/block_alloc.h
>>> +++ b/fs/reiser4/block_alloc.h
>>> @@ -51,9 +51,10 @@ struct reiser4_blocknr_hint {
>>>    	/* block allocator assumes that blocks, which will be mapped to disk,
>>>    	   are in this specified block_stage */
>>>    	block_stage_t block_stage;
>>> -	/* If direction = 1 allocate blocks in backward direction from the end
>>> -	 * of disk to the beginning of disk.  */
>>> +	/* Allocate blocks only in backward direction starting from blk. */
>>>    	unsigned int backward:1;
>>> +	/* Allocate blocks only in forward direction starting from blk. */
>>> +	unsigned int forward:1;
>>
>> I suggest to call this bitfield "monotonic_forward"
> Isn't it an opposite of "backward"? Should we rename both?


No, it isn't. And this is the reason of the rename.
monotonic_forward is to skip the second pass in alloc_blocks_forward()


>
> BTW, in plugin/space/bitmap.c:1141 (around that line)
> in function alloc_blocks_forward()
> shouldn't the second scan be done with bitmap_alloc_backward(), as per the
> comment?


I think that those comment means a jump in backward direction
(to the start) and one more pass with bitmap_alloc_forward().
Such a "compound, non-monotonic" forward...

Edward.
