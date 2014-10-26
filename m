From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 2/9] reiser4: block_alloc: add a "forward" parameter
 to reiser4_blocknr_hint to allocate blocks only in forward direction.
Date: Sun, 26 Oct 2014 17:45:33 +0100
Message-ID: <544D252D.9070606@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <3138233.23nIal2kT0@intelfx-laptop> <5449128C.4040501@gmail.com> <2901509.x8vlNgQx5H@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=D0c3Le2iuY00R295mct9Hn8RbQR5rzwLan1f8McHt+0=;
        b=ZNTHV+f9yjqASXZ8JOv8BaI2PAQlkb0vey8UJx95QHAhRGWMSYK1Ck+AT+Ph1NUimY
         mRWhLheJ48hrGTLYKdkma70HQL7wbtqcDp/oA6TdH1oKhYE2tdk/xW2KVwKxeYy3mVUl
         2OreBNhWGNUpsr8L5EQa8jxtdVrzLrjdLFc5BCH/StGMF8z3xwtDQFbq5s3XJHneRJOk
         IWO35+2M1RBazy0GPp40eA+VweIctI40XBlNpNpOWPYsVUtCcp/6okQqthYVHGJOB4g7
         NM9WNIFMHg7hdldNCfiqYix7y7JYZt0CokOUWbpSHDM1asrZgl8BjSGRVniVd5e699qw
         6Ilg==
In-Reply-To: <2901509.x8vlNgQx5H@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 10/23/2014 10:58 PM, Ivan Shapovalov wrote:
> On Thursday 23 October 2014 at 16:37:00, Edward Shishkin wrote:	
>> On 10/23/2014 09:24 AM, Ivan Shapovalov wrote:
>>> On Tuesday 21 October 2014 at 17:50:23, Edward Shishkin wrote:	
>>>> [...]
>>>>
>>>> I suggest to call this bitfield "monotonic_forward"
>>> Isn't it an opposite of "backward"? Should we rename both?
>>
>> No, it isn't. And this is the reason of the rename.
>> monotonic_forward is to skip the second pass in alloc_blocks_forward()
> OK, will rename.
>
>>> BTW, in plugin/space/bitmap.c:1141 (around that line)
>>> in function alloc_blocks_forward()
>>> shouldn't the second scan be done with bitmap_alloc_backward(), as per the
>>> comment?
>>
>> I think that those comment means a jump in backward direction
>> (to the start) and one more pass with bitmap_alloc_forward().
>> Such a "compound, non-monotonic" forward...
> I don't intend to argue here, but doesn't that defeat the purpose of hint->blk?
> The first pass begins from the *closest* blocks. And if it fails, the second
> pass begins from the *most distant* blocks...
>
> ("closest" and "most distant" terms are used here with respect to hint->blk)


You don't like the block allocator?
Actually it was a subject of long investigations in ReiserFS (v3).
You can find a number of block allocators in ./fs/reiserfs/bitmap.c
I don't know which one went to reiser4..

Edward.
