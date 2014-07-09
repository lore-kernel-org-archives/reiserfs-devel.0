From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Wed, 09 Jul 2014 18:35:48 +0200
Message-ID: <53BD6F64.80305@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <1403434126-6390-4-git-send-email-intelfx100@gmail.com> <53B9E01D.10503@gmail.com> <2011776.QNB5kWXL2t@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=D4IS5OGPvlBRLSVrsAaiakAXaBfxKKIgcYNvgMXO6x0=;
        b=sa/ctq6WkHKQbCo0ACPYmC1bFvxqYsIaqVT7MdgtQXUnZMEiIrfLgmgG+dphIcqOU+
         rlMypAmLfDkHOBiM4z4O8VqiywouU2DV2Cr5GZNpImI8rv60pKLH8glhfn1nJutQVyTn
         pkBLOObW9X+0dWEAa+UXS0GHU3IzHCVg/VzzPw8vAINpj3GLY2SRvc9a7i2zmnjpfNvC
         7X56zLSjkqLrj8uLkTVBx84DiqAKQQS7MnA+E+zN34gkbDD5krRpKFO+J+f7u04nEMpV
         Nk1kVXfR9Q6H9hewyQzMvvgDU/H1YmIC8QqUgC6HGMppg4YwsDVEMFSowRt664p2xUJP
         HCpw==
In-Reply-To: <2011776.QNB5kWXL2t@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 07/09/2014 02:40 PM, Ivan Shapovalov wrote:
> On Monday 07 July 2014 at 01:47:41, Edward Shishkin wrote:	
>> On 06/22/2014 12:48 PM, Ivan Shapovalov wrote:
>> [...]
>>> +++ b/fs/reiser4/discard.c
>>> @@ -0,0 +1,216 @@
>>> +/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
>>> + * reiser4/README */
>>> +
>>> +/* TRIM/discard interoperation subsystem for reiser4. */
>>> +
>>> +/*
>>> + * This subsystem is responsible for populating an atom's ->discard_set and
>>> + * (later) converting it into a series of discard calls to the kernel.
>>> + *
>>> + * The discard is an in-kernel interface for notifying the storage
>>> + * hardware about blocks that are being logically freed by the filesystem.
>>> + * This is done via calling the blkdev_issue_discard() function. There are
>>> + * restrictions on block ranges: they should constitute at least one erase unit
>>> + * in length and be correspondingly aligned. Otherwise a discard request will
>>> + * be ignored.
>>> + *
>>> + * The erase unit size is kept in struct queue_limits as discard_granularity.
>>> + * The offset from the partition start to the first erase unit is kept in
>>> + * struct queue_limits as discard_alignment.
>>> + *
>>> + * At atom level, we record numbers of all blocks that happen to be deallocated
>>> + * during the transaction. Then we read the generated set, filter out any blocks
>>> + * that have since been allocated again and issue discards for everything still
>>> + * valid. This is what discard.[ch] is here for.
>>> + *
>>> + * However, simply iterating through the recorded extents is not enough:
>>
>> I still don't understand this explanation..
> In short: we need to "screen" those extents to check whether they are still
> free.
>
>>
>>> + * - if a single extent is smaller than the erase unit, then this particular
>>> + *   extent won't be discarded even if it is surrounded by enough free blocks
>>> + *   to constitute a whole erase unit;
>>
>> Why not to discard the aligned and padded extent, which coincides
>> with the whole erase unit?
> With a number of whole erase units.
>
>>
>>> + * - we won't be able to merge small adjacent extents forming an extent long
>>> + *   enough to be discarded.
>> "I don't believe" (c) K. Stanislavski
>>
>> At this point we have already sorted and merged everything.
>> So may be it makes sense just to check the head and tail of every resulted
>> extent and discard the aligned and padded one?
> "Head and tail" is not sufficient. We may check the whole extent with a single
> bitmap request, but such algorithm will be very inefficient: it will miss many
> possibilities for discarding.
>
> Consider many-block extent, from which one block has been allocated again.
> In this case we miss (all-1) blocks to be discarded (if granularity = 1 block).
>
>> Please, consider such possibility. Iterating over erase units in
>> discard_extent()
>> looks suboptimal.
> Yes, it's costly... but I don't see any other ways to do the task efficiently.


"I don't believe!" (c) K. Stanislavski.

OK, I'll show my version of the discard-list-extents a bit later..
Please, consider implementation of the FITRIM ioctl based on the
current discard functionality, if possible.

Thanks!
Edward.
