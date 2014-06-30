From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard implementation, part 2: FITRIM ioctl aka batch
 mode
Date: Tue, 01 Jul 2014 01:59:14 +0200
Message-ID: <53B1F9D2.4050304@gmail.com>
References: <1706370.uJ3CLsN3j1@intelfx-laptop> <53B155D5.4070700@gmail.com> <4560396.zXPdZqCS3Y@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=SrTVEaGRhoC0xMur3RaPCjuyKpCiN+ZhRZdlGIHH51c=;
        b=DE/wevAefPK9w8rhQbGTo2gMuCnt6Y2QR+P7aSrE/tjq9GoQLj4rMhjXmthGh6xkfU
         zzis85v/KE/PGnoUcXxtJ2V9Z9a3UNtN41bLtQpAI7lNMTl0pci3+G6IzdWcxWKT1O8E
         K5yGDB9IL4NkqkwNasV0h7oHgqLGv2H38apxEqqjUsSK8oYcSnNqyXPyi9WbSbPLyPUs
         mFHyKTovHnBsf4S7oyn4c/AiYsgsmJ31vdqmcDw4gZxICs20yhtuPxjwqRtvvVDRop+8
         9+wp5A1mZVCcA+FC8fL3f7f0YEa/BDlm7v4DOuSgB1xBhSvDuJA/I90Q7CSqNGtUrJCO
         xyzA==
In-Reply-To: <4560396.zXPdZqCS3Y@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 06/30/2014 03:24 PM, Ivan Shapovalov wrote:
> On Monday 30 June 2014 at 14:19:33, Edward Shishkin wrote:	
>> Hi Ivan,
>>
>> I think that everything should be quite simple.
>>
>> Let the FITRIM ioctl spawn a process, which scans all the bitmap blocks
>> and puts the free-space-extents to the deferred delete_set. At the same
>> time, we mark them as "busy" in the WORKING bitmap to make sure that
>> nobody will touch them (the post_commit_hook will make them clean
>> again). Basically, that's all: our transaction manager and the discard
>> code will do all the other work :)
> As I've stated, I'm afraid that it will be very inoptimal. The current
> algorithm used for "real-time" discard is not suited for discarding
> big chunks of known free space:


So who knows the size of free-space extents when we run the ioctl?


>   it verifies each discard unit by
> querying the bitmap. (This is even worse as current implementation
> is simplified to do one bitmap query per each discard unit, not checking
> if a bitmap block is bigger than a discard unit,


Why do we need to check it? One bitmap block covers 128MiB.
Are there such discard units in the nature?


>   thus it can result
> in doing multiple bitmap queries for the same block.)
>
> However, we can add a per-transaction flag "batch mode discard" which changes
> the discard algorithm to something suitable for this scenario.
> If this "discard transaction" can be merged with usual ones, we still
> need to verify all extents... But it can be done not so thoroughly.
> - do one bitmap query per each recorded extent
> - if OK, then discard
> - if not, just skip the whole extent


The only optimization I can see is skipping the phases of sorting and
merge. Because we scan bitmaps from left to right and nobody
breaks the order of extents in the delete set (assuming that nobody
joins our atom, see below). In other bits everything looks like in the
case of "real-time" discard, that is like "capturing" free-space extents
of random offsets and sizes. No?


>
>> Details
>>
>> First, the trim process reads up a bitmap node and puts it to the
>> transaction (see try_capture() and friends). Then we go from left to
> Hm, bitmap nodes are never captured by current code, so won't this effectively
> be a no-op?


Perhaps, my information about the transaction manages is outdated.
We don't fuse atoms on common bitmap nodes? Excellent. Don't capture
bitmaps then and skip the sorting phase. Just add a check that extents
go in the right order when issuing discard requests.

Edward.

>
>> right in the region of blocks covered by the bitmap node and handle
>> the "free extents". In every such iteration we lock the bitmap node,
>> locate the free extent, mark it dirty in the WORKING bitmap, put the
>> respective entry to the deferred delete_set and unlock the bitmap node.
> This can be done on allocator level by adding an "iterate free space"
> interface method...
>
>> NOTE that commit of atoms spawned by the trim process will be unusual:
>> no dirty jnodes, hence, no flush, no IOs (as RELOCATE and OVERWRITE
>> sets are empty). Only issuing discard requests.. Of course, this is
>> only in the case when other processes spawning dirty jnodes didn't
>> join our atom (they can do it perfectly, as we lock bitmaps only per a
>> free extent handling).
> Again, bitmap nodes are not captured by current code. Is it critical that we
> fuse with anything modifying the bitmaps?
>
> Thanks,

