From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: discard support: perform discard before
 all deallocations.
Date: Thu, 31 Jul 2014 23:29:05 +0200
Message-ID: <53DAB521.4090902@gmail.com>
References: <1405966771-12575-1-git-send-email-intelfx100@gmail.com> <53D637F9.2010304@gmail.com> <6214930.f2LU7SrKWL@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=XunktCqONZFuLYbDatSpBy76giihCtmlTIPjwxdNQVE=;
        b=WNgLwLH/+zZS4Whqo+SV94jw3y1PDFG2Mk091083UB6Ev1biqUsBQoMB7NY2w9JT4u
         U6Woq3unQJXcSwWQsHjXhrLI0i4QpcQ1Fz23crGXA+BFA/PEYaI5oCefvQsTxFfJFcOt
         Nb2nsyWSRQR//QQnusiZAS84NwcPpXaZ2kDksILBCVxCka3dWxHl5u+ylG87eh/2Tqte
         yM44kWkjW72PeR7E9QGAhACrUh3zhFGuH9ojuXRMdofqIPjeKY1NvmRj0+MYqbYsc8vf
         Ifi97o7VjbKj2N169JyDe94dh4w2xqgQWp5IF/7Judfe36fB/x+bforIQwHzrWAhoW5W
         BNIA==
In-Reply-To: <6214930.f2LU7SrKWL@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 07/29/2014 11:29 AM, Ivan Shapovalov wrote:
> On Monday 28 July 2014 at 13:46:01, Edward Shishkin wrote:	
>> Thanks, looks OK (I haven't tested it yet though..)
>>
>> I suggest to release a version without garbage collection for now
>> (just pass the sorted and merged extents to blkdev_issue_discard).
> Yeah, seems reasonable.
> I'll submit v7 of "initial implementation" shortly with simplified discard_extent(),
> then we could apply two patchsets and that'll be it.
>
> ----
> Regarding the "ideal" solution


BTW, do we need this "ideal solution" at all?
For example, my SSD Samsung 840 EVO shows erase_unit = 512 bytes,
and alignment = 0. It means that in my case everything will be discarded
in the best form with the simplified discard_extent().

I am not lazy, just want to make sure we do useful work :)
May be it makes sense to perform a small investigation of the SSD market
first?


> ----
>
> It seems that reiser4_alloc_blocks() can't be told to "allocate this exact
> count of blocks or fail". It allocates any number of blocks from 1 to needed,
> and actual count is returned in *len.
>
> Is it better to add an "exact" flag to reiser4_blocknr_hint or to add an
> "allocate" flag to reiser4_check_blocks()?


Let's decide what we want from check_blocks().

When (discard_offset % block_size != 0) we'll always need (even in the
case of empty headp (tailp) to check the left (right) neighbor block of
the extent. If it is busy, then we'll need to reduce alen (alen -= d_uni)
because of the "shift".

It means that we want check_blocks() to do the following:
. go leftward (rightward) and allocate not more than @count continuous
free blocks;
. return actual number of allocated blocks.

It seems that currently we don't have suitable primitives in our space
allocator. I prefer to not modify existing ones and write a new primitive.

Edward.
