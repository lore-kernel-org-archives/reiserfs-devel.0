From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [veryRFC] [PATCH 0/2] reiser4: discard before dealloc: first
 approximation.
Date: Thu, 17 Jul 2014 01:35:20 +0200
Message-ID: <53C70C38.3080002@gmail.com>
References: <53C652BE.4010203@gmail.com> <1405509844-30070-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=CiKt999MEtJGKg+ujZNXU2r52Z9lI+nBu7gSgiiyGwk=;
        b=aPCyxT2wBgEGUrBQxyHPWmSrYb7MDSKZ5etSEvLLIONqII1IVTUB5/rzd6Em+1HRop
         CypqXv1hH/xCI95Z8hCn1NniWxP+qS240PWHwDgZuwn6D8YaLhV0QzJZ7vsMR2Ekwm2s
         xNGQIkGEwxakUA7jAfLGppZpmmw+S5VQlSDGqVM56hWt5ndYwkhhr6Eq3BWZSymeadmD
         eK+gotJWiQfeG2uk+htQglW0F9u6zus0d8KGACNyxobgIweWraSCaE/R1pbBugw2zSso
         jWMY11TjhTcuFIQbIFbmuLvaWNY3U7ojmVERuw1R3RR+Aril4mtUnGshAIjHvQzw9oHH
         +jJQ==
In-Reply-To: <1405509844-30070-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 07/16/2014 01:24 PM, Ivan Shapovalov wrote:
> This needs your version of discard algorithm, because blocks inside extents of
> discard set are now marked as allocated.


OK, I'll try to finish it in weekends..


> BTW, have you dropped the case with erase unit size < block size?


In my version all erase units are supported except ones which are
not a power of 2. We can support all erase units without exceptions,
if needed.


>   This is
> probably OK, but configurations with nonzero alignments are then broken.


I support alignments with (bdev_discard_alignment % sb->s_blocksize == 0)
We can support all alignments without exceptions, but it will lead to 
complications
in discard_sorted_extents().


>   Not
> worth handling these, I think, but nevertheless a warning could be useful ;)

Agreed. It is important.

Thanks!
Edward.


>
> Ivan Shapovalov (2):
>    reiser4: discard support: perform discards and deallocations after writing logs.
>    reiser4: discard support: proof-of-concept for "discard before dealloc".
>
>   fs/reiser4/block_alloc.c | 48 +++++++++++++++++++-------------------
>   fs/reiser4/discard.c     | 60 ++++++++++++++++++++++++++++++++++--------------
>   fs/reiser4/discard.h     |  4 +++-
>   fs/reiser4/txnmgr.c      | 35 ----------------------------
>   fs/reiser4/txnmgr.h      | 13 ++---------
>   fs/reiser4/wander.c      |  3 ++-
>   6 files changed, 73 insertions(+), 90 deletions(-)
>

