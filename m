From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: precise discard - general case
Date: Sun, 08 Mar 2015 23:43:28 +0100
Message-ID: <54FCD090.3000005@gmail.com>
References: <5495DB0D.1080005@gmail.com> <1423600944.24885.9.camel@gmail.com> <54DB1186.60505@gmail.com> <1423649354.10127.16.camel@gmail.com> <54DBE880.4070902@gmail.com> <3C7880EC-12E3-4621-A3BE-353EFA032293@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=GZri4DET+Bx3f/y9FUDF3i+YPWykt7QuTAGGDZy6qeQ=;
        b=PE92WpvHa3M4LgsgXoe4T1pO5yRuhujMzIa/2U68vrwJAo036mKawR0/gvdi9bNqTO
         MTcDySeV82eCeItjKpLUWyXreG2BLTmkYyX9jfxq1EgNIOEH3egRMf9VN4c+7xa2YkAb
         gGNMxbTmNIz6MIuKsLlAA0R128VgykOKgjjlyVls7bAyjqSC1WP233mqtTGtYeCWhrSP
         CiXv2Y2ZtZEWkQ9Guy1HfROHEWF2uOhdisWhUNgJbiF84dLcov2pfRuuALXE07Z99AJQ
         UJqOX5/DdT+oq4IpOThG9/oQcGOsHHwPqiR7F8T2x5IqTQ0RSrWNdIYZMsX6lqdAqnlL
         g/YQ==
In-Reply-To: <3C7880EC-12E3-4621-A3BE-353EFA032293@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 02/12/2015 07:14 AM, Ivan Shapovalov wrote:
>> You mean that sometimes we perform unneeded checks?
>> I see nothing criminal, as we don't exceed announced (2N_e)
>> number of checks, where N_e is number of extents in the
>> discard set.
>>> No, I didn't talk about that.
>>>
>>>> As to fixup: I think that we need to set up the local variable
>>>> head_is_known_dirty properly..
>>> Hmm, head_is_known_dirty is an optimization: either known dirty
>>> (in which case we skip checking and cut the head), or unknown
>>> (in which case we do the check).
>>>
>>> I'm talking about a different scenario:
>>> - tail padding of an extent is clean
>>> - head padding of the next extent is clean
>>> - these two paddings overlap in terms of disk blocks
>>>
>>> In this case, the head padding check will yield false ("dirty") because
>>> part of it has been already allocated for the tail padding, but in fact
>>> it is clean. Thus a false negative: the head will be cut while it can be
>>> padded.
>>
>> Ah, you suspect non-preciseness (leak of "garbage")?
>>
>> If tail padding of the current extent overlaps with the head padding of
>> the next extent, then the end of the current extent and the beginning
>> of the next extent are in the same erase unit. Otherwise we'll end with
>> contradiction. Correct?
> Correct, but I'm talking about a different situation where the end of the current extent and the beginning of the next extent are in distinct erase units but in the same disk block. Then we'll end up checking that disk block twice.


You correctly pointed out the possibility of garbage leak
in the case of block_size > erase_unit_size. However, the
current gluing policy prevents such leak.

Indeed, let AB be a current extent, and CD - next extent


----*-----*-----*-----*-----*-----*-----*---> units
--|-----------|-----------|-----------|-----> blocks
   A           B           C           D


Note that since extents are sorted and merged, distance
between any 2 extents are not smaller than block_size.
In particular, |BC| >= block_size.                           (1)

Suppose that tail padding of the current extent and head
padding of the next extent are in the same disk block.
However, in this case, in accordance with the definitions
of tail and head paddings, we have that |BC| <= block_size.   (2)

 From (1) and (2) we have that |BC| == block_size, and
p_end + p_tailp == C == start-of-next-extent. Note, that
this satisfies the "gluing condition" (discard.c, line 362).
That is, we'll try to glue the current and the next extent.
It means that we'll check BC only once:

If BC is dirty, than gluing failed, and we don't allocate BC.

If BC is clean, than we allocate BC, jump to the next
extent and don't check its head padding (because it was
"glued" with the previous one).

Did I miss something?

Thanks,
Edward.
