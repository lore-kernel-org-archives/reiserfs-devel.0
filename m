From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: precise discard - general case
Date: Wed, 11 Feb 2015 09:23:34 +0100
Message-ID: <54DB1186.60505@gmail.com>
References: <5495DB0D.1080005@gmail.com> <1423600944.24885.9.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=HAcX7UvX3Y0wUgml71rLMiuxi1ghWBuzG001zD7+O9A=;
        b=UnQaJcTXhLaYT+2dpgbRdsfS9mZAhpeQm/ZcgSB9bTdhSeWPEOlwt8n5yfT0UmkUHx
         vQkFxV8/kdIRDwQ9dxWEUgmR0Fk6RxR54AGSJgDfuqgXqeOGH4ob/umWzdwf0BHBrv1r
         V66RaYEvOVHECK8+0hX9Dd2fjFmMD/BpMe2RnZVC90smA3hF0tkI87eav9F2eOGyiZcT
         Xz4LWOCeXS8XZ68/a3pSiXA1GPLJaDDwVIu7U5iv0R2r6AXi6nJAHMiDNVf/7ZP5rhKw
         9/+t7JtM07VFx0OCAcKElTXD8o2ZLhVbDoBFhN3Swv+nJS70h1JUXt4Mslz9XSjGlFr5
         XqKw==
In-Reply-To: <1423600944.24885.9.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


On 02/10/2015 09:42 PM, Ivan Shapovalov wrote:
> On 2014-12-20 at 21:24 +0100, Edward Shishkin wrote:
>> This is the promised generalization, which is supposed to work for all
>> discard
>> offsets and all discard unit sizes without any restrictions.
>>
>> Complications in comparison with the previous implementation:
>>
>> In this general case we need "precise" coordinates, where every
>> individual byte
>> can be addressed. All local variables, which represent precise
>> coordinates are
>> denoted with "prefixes" (a_len, d_off, p_tailp, etc). Local variables,
>> which represent
>> "non-precise" coordinates (they are usually of type reiser4_block_nr)
>> are denoted
>> without prefixes (start, len, end, tailp, etc).
>>
>> Blocks, which contain head and tail paddings are now calculated using the
>> function size_in_blocks(), which actually is an expression for the
>> minimal number
>> of blocks containing the precise extent.
>>
>> The next trouble is "peculiarity in 0", encountered when calculating the
>> blocks of
>> head padding. if discard offset is different from 0, then the first
>> discard unit of the
>> partition is partial (its other part doesn't belong to our partition, so
>> we can not
>> discard it). We handle this peculiarity by an additional check.
>>
>> In other bits everything is the same.
>>
>> Possible optimization: If discard unit sizes are always powers of 2,
>> then it makes
>> sense to replace "do_div(offset, unit_size)" with "offset & (unit_size -
>> 1)".
>>
>> Mount options discard.offset=xxx,discard.unit=yyy are to emulate various
>> discard unit sizes and offsets on devices _without_ trim support (e.g.
>> HDDs).
>> This is only for debugging purposes, don't use it for real SSD devices:
>> the kernel
>> retrieves the discard parameters on its own.
>>
>> This patch is against the patch series of Ivan Shapovalov:
>> http://marc.info/?l=reiserfs-devel&m=141841865432082&w=2
>>
>> Current status: not well-tested.
>>
>> Edward.
> Hi,
>
> I've found a bug in our implementation (don't know when it appeared,
> maybe it was quite some time ago). I've intended to fix it and send
> a patch along with description, but I still can't think of a viable fix.
>
> So: the problem is that check_free_blocks() isn't idempotent, because it
> allocates blocks if the whole extent is clean. Therefore, it must not be
> called for overlapping ranges. However, in some conditions tail padding
> of some extent and head padding of next extent may overlap in terms of
> disk blocks (gluing code only catches overlapping erase units).
>
> This will yield a false negative when checking the head padding, so it
> does not lead to any data losses (just to inefficiency).


You mean that sometimes we perform unneeded checks?
I see nothing criminal, as we don't exceed announced (2N_e)
number of checks, where N_e is number of extents in the
discard set.

As to fixup: I think that we need to set up the local variable
head_is_known_dirty properly..

Thanks,
Edward.
