From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Mon, 07 Jul 2014 01:47:41 +0200
Message-ID: <53B9E01D.10503@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <1403434126-6390-4-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=UXCI7ziPggQIGbl/wIR+h/Tr/iFgXhRGOf7fCJILJJA=;
        b=a8G1L/lwxy7l0O+6O7XajvpY11ZwphZWu2fIhY6bT0e2s4gs4CZggy4rLmfvDq/qAv
         mRnjAulWVY5rJ6cKoQX90NBGfevOAdgjLGYDYRWhuSQ4ABYayvk+IQQ1DCRvCrke2J+L
         yCPL/NnWEbw4C0BlLwQMe90TV9pLqv6M/8UIsehZWi+6zrWWGys7ekqXvkAcM2nW6vFs
         js0AVAj4i1cWw9Cb9nXSNZCwwW0jiU7zyqd1eRETkr7cx7V1XRWw7Xn3ZFnbqyFo/6EB
         PeHbvz2HUZVBaVX1X3qNTrxB4V+9eJkoC2IRmIbG+wyt+hmd4dTQD8FGnWc5pfj5+onj
         v7CQ==
In-Reply-To: <1403434126-6390-4-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 06/22/2014 12:48 PM, Ivan Shapovalov wrote:
[...]
> +++ b/fs/reiser4/discard.c
> @@ -0,0 +1,216 @@
> +/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
> + * reiser4/README */
> +
> +/* TRIM/discard interoperation subsystem for reiser4. */
> +
> +/*
> + * This subsystem is responsible for populating an atom's ->discard_set and
> + * (later) converting it into a series of discard calls to the kernel.
> + *
> + * The discard is an in-kernel interface for notifying the storage
> + * hardware about blocks that are being logically freed by the filesystem.
> + * This is done via calling the blkdev_issue_discard() function. There are
> + * restrictions on block ranges: they should constitute at least one erase unit
> + * in length and be correspondingly aligned. Otherwise a discard request will
> + * be ignored.
> + *
> + * The erase unit size is kept in struct queue_limits as discard_granularity.
> + * The offset from the partition start to the first erase unit is kept in
> + * struct queue_limits as discard_alignment.
> + *
> + * At atom level, we record numbers of all blocks that happen to be deallocated
> + * during the transaction. Then we read the generated set, filter out any blocks
> + * that have since been allocated again and issue discards for everything still
> + * valid. This is what discard.[ch] is here for.
> + *
> + * However, simply iterating through the recorded extents is not enough:


I still don't understand this explanation..


> + * - if a single extent is smaller than the erase unit, then this particular
> + *   extent won't be discarded even if it is surrounded by enough free blocks
> + *   to constitute a whole erase unit;


Why not to discard the aligned and padded extent, which coincides
with the whole erase unit?


> + * - we won't be able to merge small adjacent extents forming an extent long
> + *   enough to be discarded.


At this point we have already sorted and merged everything.
So may be it makes sense just to check the head and tail of every resulted
extent and discard the aligned and padded one?

Please, consider such possibility. Iterating over erase units in 
discard_extent()
looks suboptimal.

Thanks,
Edward.
