From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv2 0/3] reiser4: block deallocation fixes.
Date: Mon, 08 Sep 2014 21:03:17 +0200
Message-ID: <540DFD75.8090003@gmail.com>
References: <1410201831-11722-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=FPMTGYDJdDDJDX1fpZrieF23mH6tbysMrG9OBSVOBwo=;
        b=SJ3979OEZVcY9DvY4ZItCWE9PFUl1eU/1+DvJd66MV8LN6hI6mzUAXHZ1cag8N/lVO
         +kgqYJiL09rC39iyj4zdog4XQRslmnnkRSpTUbZdGDXzJhvKi+pikcsg+Vj6zqTZmDqF
         4vSf52cAk+xBarFQ7VnfkVFfNF1CnnzaQ3m5IjxskTnOPQFvaeB5TSUmhoytWsnihtmP
         ZBsYiBj8Op593szTHwlg2lT48fog7MwAkB5D968boXts6yLC+AYF8GaLOtar2gBFXL/3
         eviU35auxW4ysMkM7BMbmML/UC81X6yadUcJ8TicT5V/8mBLWRE5WNEDAuVgX++gRTM/
         nCkg==
In-Reply-To: <1410201831-11722-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Ok, I'll include this to the 3.15.2-reiser4-basic-discard-support.patch

As to 3.16: unfortunately the ancient bug, which leads to non-deleted
directories raised the head in 3.16. I don't want to release buggy stuff.
So let's work around the stable 3.15 for now..

Thanks,
Edward.


On 09/08/2014 08:43 PM, Ivan Shapovalov wrote:
> Actually, the idea of converting immediate allocations into deferred when
> discard is enabled was flawed. Deferred deallocations ignore block stage
> and additional flags, while some immediate deallocations use non-standard
> stage/flags which do not match what's done by reiser4_post_write_back_hook().
>
> While at it, I've removed specifications of block stage in deferred deallocations.
> It is not used anyway. This is first commit.
>
> Next commit does the following. Actually, most of the immediate deallocations
> do not need to be considered for discarding: these are deallocations done in
> error paths, and respective blocks are never written between their allocation
> and deallocation. Two exceptions are deallocations in wandering log code. In these
> cases, blocks are allocated, then written, then deallocated without BA_DEFER.
> I've just made these deallocations explicitly deferred, which is OK because they
> have a suitable block stage.
>
> Last commit actually removes wrong code, again making immediate deallocations
> always immediate.
>
> Ivan Shapovalov (3):
>    reiser4: deferred (BA_DEFER) deallocations do not make use of target stage.
>    reiser4: mark final deallocations in wandering log code as deferred.
>    reiser4: block_alloc: get rid of discard-related hack in reiser4_dealloc_blocks().
>
>   fs/reiser4/block_alloc.c  |  9 +++++++--
>   fs/reiser4/plugin/txmod.c | 15 +++++----------
>   fs/reiser4/wander.c       |  6 +++---
>   3 files changed, 15 insertions(+), 15 deletions(-)
>

