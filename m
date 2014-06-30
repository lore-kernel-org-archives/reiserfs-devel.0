From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard implementation, part 2: FITRIM ioctl aka batch
 mode
Date: Mon, 30 Jun 2014 14:19:33 +0200
Message-ID: <53B155D5.4070700@gmail.com>
References: <1706370.uJ3CLsN3j1@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=ikOVOSXiiWTfjVOH4nmt/feeKXZhQJt9v+uAWV+bVsk=;
        b=qepfiVyDTLS2/A2svF3Hr+V4ou4NA5Z06+6CAbvfZ8wjmNrPCSoiIc46venGB1l7BR
         iyBCKwXk2f5eH5/f6fgp6S4Pj9bRkHS3ycQULK6gS5JtIRaTOrDxH8ehiLjLSXp3VquU
         XHhgXadWLH+dB22o7bcTlIXcHqWTLk2cCmOtMLDvXagZX8JGOQqLnV8X/UYs2ph4U8IW
         mBQ1O8yf7MzrkM0sXJ40km+W6aaoteBWbuoT7kWaJNwfTXq6RDbugBTIbRJtb+SJkD8V
         scCXWuEDa1jA19Pzd57MUZtp6pcwql6xwDbha2w6ED/dHLjsjhBHLpAGVZZ0DYPY6rTe
         pWtA==
In-Reply-To: <1706370.uJ3CLsN3j1@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi Ivan,

I think that everything should be quite simple.

Let the FITRIM ioctl spawn a process, which scans all the bitmap blocks
and puts the free-space-extents to the deferred delete_set. At the same
time, we mark them as "busy" in the WORKING bitmap to make sure that
nobody will touch them (the post_commit_hook will make them clean
again). Basically, that's all: our transaction manager and the discard
code will do all the other work :)

Details

First, the trim process reads up a bitmap node and puts it to the
transaction (see try_capture() and friends). Then we go from left to
right in the region of blocks covered by the bitmap node and handle
the "free extents". In every such iteration we lock the bitmap node,
locate the free extent, mark it dirty in the WORKING bitmap, put the
respective entry to the deferred delete_set and unlock the bitmap node.

NOTE that commit of atoms spawned by the trim process will be unusual:
no dirty jnodes, hence, no flush, no IOs (as RELOCATE and OVERWRITE
sets are empty). Only issuing discard requests.. Of course, this is
only in the case when other processes spawning dirty jnodes didn't
join our atom (they can do it perfectly, as we lock bitmaps only per a
free extent handling).

There can be potential problems around the "unusual" commits (false
positives in the debugging code, etc.), but I hope they are minor..

Thanks,
Edward.


On 06/30/2014 11:35 AM, Ivan Shapovalov wrote:
> Hi,
>
> I've started to think about implementing the second part of discard support,
> namely "batch mode" (FITRIM ioctl). And it seems like I don't yet quite
> understand how to do it.
>
> It had been suggested to reuse existing transaction and discard machinery for
> this feature: create a transaction, allocate+deallocate all possible blocks
> and then force-commit it.
>
> However, the algorithms of discard_atom() are very inoptimal for discarding
> large amounts of known free space -- a bitmap check is performed for every
> single discard unit. Repeatedly calling reiser4_alloc_blocks() to allocate
> every possible block also seems inefficient. And this will still miss those
> 10% of reserved space, IIUC.
>
> So the best way I can imagine is to introduce a new space allocator method,
> "iterate free space", and discard all reported extents (blkdev_issue_discard()
> will take care of aligning them properly).
>
> With such method, a question arises: how to prevent bitmap modifications
> and disk writes to free space when such iteration is in progress?
>
> Thanks,

