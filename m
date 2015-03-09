From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: precise discard - general case
Date: Mon, 09 Mar 2015 11:38:43 +0100
Message-ID: <54FD7833.6090604@gmail.com>
References: <5495DB0D.1080005@gmail.com>	 <1423600944.24885.9.camel@gmail.com> <54DB1186.60505@gmail.com>	 <1423649354.10127.16.camel@gmail.com> <54DBE880.4070902@gmail.com>	 <3C7880EC-12E3-4621-A3BE-353EFA032293@gmail.com>	 <54FCD090.3000005@gmail.com> <1425865575.11071.11.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=cl4xal4s+nMRUgMdP4YRE6o9uKlHeR5P234fZ1k5aqo=;
        b=SdtlP7C+oFldUNXct+gSWtd4ZS6P5wo0qYu5fuu7yXgioXm0R8Fd91RJNQ55zzZj+z
         wGbu6qgNuhyjF8v9uYqsWUNWsK3mxvZwc1SBmc6HgOkOTwDjx1xwL4FR5C0mPiuPbDgG
         iCywgmPs3OfEXEteHfbCSo6fC+cupYuEpqGMF5+aG3oWMIfDufOLn178z+DNGJC53dAb
         XFc8/n0lk0NuAJnwgkZiBhcYceVlgMgnkCpNu/X/1KjGn6OXdKAeqKxl/XdW3jlnTSvF
         lARIZ2s2POOjUsekW3yCd5zLppxfR/z3MJehrNCjnF18cMQ8qDQn1TQZxGe/BgYLlDwH
         5c4A==
In-Reply-To: <1425865575.11071.11.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


On 03/09/2015 02:46 AM, Ivan Shapovalov wrote:
> On 2015-03-08 at 23:43 +0100, Edward Shishkin wrote:
>> [...]
>>
>> You correctly pointed out the possibility of garbage leak
>> in the case of block_size > erase_unit_size. However, the
>> current gluing policy prevents such leak.
>>
>> Indeed, let AB be a current extent, and CD - next extent
>>
>>
>> ----*-----*-----*-----*-----*-----*-----*---> units
>> --|-----------|-----------|-----------|-----> blocks
>>     A           B           C           D
>>
>>
>> Note that since extents are sorted and merged, distance
>> between any 2 extents are not smaller than block_size.
>> In particular, |BC| >= block_size.                           (1)
>>
>> Suppose that tail padding of the current extent and head
>> padding of the next extent are in the same disk block.
>> However, in this case, in accordance with the definitions
>> of tail and head paddings, we have that |BC| <= block_size.   (2)
>>
>>   From (1) and (2) we have that |BC| == block_size, and
>> p_end + p_tailp == C == start-of-next-extent.
> This is not correct. p_* variables are byte-granular, so p_end + p_tailp
> ends up somewhere between B and C. More precisely, it will point at the
> first unit-unit boundary inside (B; C). So the condition referenced
> below is not fulfilled.
>
> That is, we only glue extents which overlap in terms of erase units,
> not in terms of disk blocks after padding.


Yes, you are right, I was confused with the notations.


>
> One may suggest to relax the condition instead; in other words, to make
> it look something like this:
>
>      if (end + tailp >= blocknr_list_entry_start(next))
>
> However, it potentially makes us discard already clean units. I don't
> remember if there are any other problems with this approach.


I guess that excessive discards is also not fine...

Unfortunately the precise solutions looks too complicated:
I simply don't have a time to approve or disapprove it.
It seems that next 4 months I'll be busy.

Thanks,
Edward.
