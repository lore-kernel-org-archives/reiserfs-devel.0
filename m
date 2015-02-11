From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: precise discard - general case
Date: Thu, 12 Feb 2015 00:40:48 +0100
Message-ID: <54DBE880.4070902@gmail.com>
References: <5495DB0D.1080005@gmail.com>	 <1423600944.24885.9.camel@gmail.com> <54DB1186.60505@gmail.com> <1423649354.10127.16.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=/gpieOOS4DuicwLW2isCHA7JS8EA+JixgHFiwHbxM7Y=;
        b=eih9rkTCxKTAewkyIERJ8q+PRm/btDUPqGnjgTiCiwbtHMFKWkJ9S8uNvnhROTiB/o
         SXGyVGECcclpKkuZYbr+p76QzB/XBTLh6B3XlAHqvPoJk6sru43Eg50+jXFqXe2hh17y
         /oQ3Eh8Efpwr37hZBTaaREImLKib6Dgq1LofnROcHp1xCzB5BSJz+AJjV4NxFDC/WvWc
         Uxno1HLUVEH02Zo0CYowqLpCyGWYAk+7FAFUQDWIWhGm24iHp9nR2Xo7jtwC2zq3OvLj
         AymZ2UPLUOpderZFq2xca+g7pHRJS5+8NvX6i+IzyfOEFPuo9tEYlS3WioOJwg8JTRZu
         aaqg==
In-Reply-To: <1423649354.10127.16.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


On 02/11/2015 11:09 AM, Ivan Shapovalov wrote:
> On 2015-02-11 at 09:23 +0100, Edward Shishkin wrote:
>> On 02/10/2015 09:42 PM, Ivan Shapovalov wrote:
>>> On 2014-12-20 at 21:24 +0100, Edward Shishkin wrote:
>>>> This is the promised generalization, which is supposed to work for=
 all
>>>> discard
>>>> offsets and all discard unit sizes without any restrictions.
>>>>
>>>> Complications in comparison with the previous implementation:
>>>>
>>>> In this general case we need "precise" coordinates, where every
>>>> individual byte
>>>> can be addressed. All local variables, which represent precise
>>>> coordinates are
>>>> denoted with "prefixes" (a_len, d_off, p_tailp, etc). Local variab=
les,
>>>> which represent
>>>> "non-precise" coordinates (they are usually of type reiser4_block_=
nr)
>>>> are denoted
>>>> without prefixes (start, len, end, tailp, etc).
>>>>
>>>> Blocks, which contain head and tail paddings are now calculated us=
ing the
>>>> function size_in_blocks(), which actually is an expression for the
>>>> minimal number
>>>> of blocks containing the precise extent.
>>>>
>>>> The next trouble is "peculiarity in 0", encountered when calculati=
ng the
>>>> blocks of
>>>> head padding. if discard offset is different from 0, then the firs=
t
>>>> discard unit of the
>>>> partition is partial (its other part doesn't belong to our partiti=
on, so
>>>> we can not
>>>> discard it). We handle this peculiarity by an additional check.
>>>>
>>>> In other bits everything is the same.
>>>>
>>>> Possible optimization: If discard unit sizes are always powers of =
2,
>>>> then it makes
>>>> sense to replace "do_div(offset, unit_size)" with "offset & (unit_=
size -
>>>> 1)".
>>>>
>>>> Mount options discard.offset=3Dxxx,discard.unit=3Dyyy are to emula=
te various
>>>> discard unit sizes and offsets on devices _without_ trim support (=
e.g.
>>>> HDDs).
>>>> This is only for debugging purposes, don't use it for real SSD dev=
ices:
>>>> the kernel
>>>> retrieves the discard parameters on its own.
>>>>
>>>> This patch is against the patch series of Ivan Shapovalov:
>>>> http://marc.info/?l=3Dreiserfs-devel&m=3D141841865432082&w=3D2
>>>>
>>>> Current status: not well-tested.
>>>>
>>>> Edward.
>>> Hi,
>>>
>>> I've found a bug in our implementation (don't know when it appeared=
,
>>> maybe it was quite some time ago). I've intended to fix it and send
>>> a patch along with description, but I still can't think of a viable=
 fix.
>>>
>>> So: the problem is that check_free_blocks() isn't idempotent, becau=
se it
>>> allocates blocks if the whole extent is clean. Therefore, it must n=
ot be
>>> called for overlapping ranges. However, in some conditions tail pad=
ding
>>> of some extent and head padding of next extent may overlap in terms=
 of
>>> disk blocks (gluing code only catches overlapping erase units).
>>>
>>> This will yield a false negative when checking the head padding, so=
 it
>>> does not lead to any data losses (just to inefficiency).
>>
>> You mean that sometimes we perform unneeded checks?
>> I see nothing criminal, as we don't exceed announced (2N_e)
>> number of checks, where N_e is number of extents in the
>> discard set.
> No, I didn't talk about that.
>
>> As to fixup: I think that we need to set up the local variable
>> head_is_known_dirty properly..
> Hmm, head_is_known_dirty is an optimization: either known dirty
> (in which case we skip checking and cut the head), or unknown
> (in which case we do the check).
>
> I'm talking about a different scenario:
> - tail padding of an extent is clean
> - head padding of the next extent is clean
> - these two paddings overlap in terms of disk blocks
>
> In this case, the head padding check will yield false ("dirty") becau=
se
> part of it has been already allocated for the tail padding, but in fa=
ct
> it is clean. Thus a false negative: the head will be cut while it can=
 be
> padded.


Ah, you suspect non-preciseness (leak of "garbage")?

If tail padding of the current extent overlaps with the head padding of
the next extent, then the end of the current extent and the beginning
of the next extent are in the same erase unit. Otherwise we'll end with
contradiction. Correct? Now note that we'll try to glue such extents
(the current one and its right neighbor).

If this gluing failed (the "area" between the extents is dirty), then w=
e
set head_is_known_dirty =3D 1, so that head padding of the next extent
won't be checked.

If this gluing successful, then we won't check the head of the next
extent. Because we jump to this next extent and try to glue its right
neighbor.

That is, I still don't see any problems.

Edward.


> More generally, our check_free_blocks() is not idempotent. After a
> positive result has been returned for a given range [A;B),
> check_free_blocks() must not be called for any range [A';B') such tha=
t
> [A;B) =E2=88=A9 [A';B') =E2=89=A0 =E2=88=85. Otherwise a false negati=
ve can be returned.
>
> Actually, during the last night I've *apparently* came up with a
> solution for this :) I'll send a patch once I figure out how to expla=
in
> it properly in the comments...
>
> Thanks,

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
