From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Tue, 22 Jul 2014 10:57:03 +0200
Message-ID: <53CE275F.5050605@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <53CC2EF1.8010705@gmail.com> <53CC476A.4000704@gmail.com> <7768685.ZxsNAV9AVN@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=o1+NwxmaKV+hq7JM74a5TnnMGuPBLYpdgF60bMMAv5w=;
        b=i8Vm4+ilH3NpFJu1YG5p+kNIDY8TP9OCXIakcIUrgy8nlfV1UH8ZkA7xhnwwW9Anjt
         AUxp74sn4zg7Wnff2Fx07CVkQi/qndVtRNQxlEu8S1b3vmpS/lQurr94nNySCKnCM9I2
         0LBWROhscmA29T/g8MHzg8lIvqp4eFKY8/Ay47OfSXQdD5ON88eylCDN+26kKn1JUpHU
         lw2WX0znKU2PD/s9sK29BUnjIb1E3AhE2fT045hwo1KYN0ERHRUVk/hWTfGZSpoxrJlr
         urvokaPG/mJtYMof5b0ZuwvKFFiyu6LXuYlU9lfrCc6rToBjifrdi50K7shmZ3Xg1aPc
         E5+Q==
In-Reply-To: <7768685.ZxsNAV9AVN@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>


On 07/21/2014 01:14 AM, Ivan Shapovalov wrote:
> On Monday 21 July 2014 at 00:49:14, Edward Shishkin wrote:	
[...]
>>
>> Actually, this is not so simple. E.g. I got a deadlock..
>> Another option is to make head/tail paddings dirty with the
>> following update of the extent of the delete_set.
>> One more option is to not support such discard params.
>>
>> Actually what we are trying to implement is "precise discard". This is
>> rather complicated task. I looked at other file systems: nobody bother
>> with paddings, just stupidly pass a freed extent to blkdev_issue_discard(),
>> which cuts the head and the tail. I suggest to do the same. We have done
>> our best. Someone can not afford even to accumulate the extents.
>>
>> Edward.
> Let's do it ideally, after all, this is reiser4 ;) I also think that we can
> just mark paddings as allocated and add them to extent in question (so that
> they will be freed by reiser4_post_commit_hook). This looks simple enough.
>
> The block allocator interface, IIRC, allows us to tell it "allocate right here
> or return failure".
>
> /* I had no time to look into any code during this weekend. Tomorrow I'll
> hopefully repost the discard-before-dealloc patches and look into this.. */

I think we'll also need a "leftward" version of check_blocks() to check
head paddings. The most unpleasant thing is when check fails at the
next bitmap node. It seems that the most reasonable way in this case
would be just to return 0 (dirty) and clear everything when applying
the "updated" delete set.

Edward.
