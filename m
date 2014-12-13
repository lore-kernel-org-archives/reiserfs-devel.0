From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 0/6] reiser4: discard support: "precise discard" aka padding
 of extents to erase unit boundaries.
Date: Sat, 13 Dec 2014 23:38:02 +0100
Message-ID: <548CBFCA.60105@gmail.com>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=obV9gtxmlpG/QUg0RO3F9mQidX36Sgczc/oNliS/eBQ=;
        b=rPUPZt9QiTW1eKUn9uTJ7JUeAT/vPMDKMquRFgKYVCPscLhXQWj5AGoFHGJe2+FKWN
         5RYAlLVKZoAXqmMOWD9x92Mwf/UC9U336kGLEIdKjHES3KsKIJY7Tyo6qvAZPWmZrOS+
         yWxlKg4pjyFXKE/HRcTzwEc4wbZIwwvz5I6jihs2acfpVmGGP6PtMBs58aP4xcL4/fz8
         XrxEpSEuoY37rhBKW47ftN/+VYThUqFls5z4xJyZRGGtV+Fns/KBTgiMQJbH1agpQZe+
         7Sw3WoJpjvQqD3AmQ6Z/ioJ3xDXohB6ZVJ3kS/YeNjmIpghjVlVlJdXVvFlcSDFYZ7ac
         LqEQ==
In-Reply-To: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 12/12/2014 10:10 PM, Ivan Shapovalov wrote:
> So, this patchset uses your algorithm of padding/gluing extents to be discarded.
> I've added exact allocation primitives (is it what you've been talking about?


So, we found out that the old bitmap primitives don't allow us to implement
precise discard, and I asked for new ones. Also we wanted to implement the
general case, when precise discard works for any pair (offset, unit). 
Currently
it works only for ones determined by the function convert_lattice_params().
For some reasons (that I don't remember) I was sure, that the general case
should be obtained from this partial case by a small transformation of the
function discard_sorted_merged_extents().

Well, I'll try to dive into details and generalize things on the holidays.
If generalization is impossible, then we'll switch to non-precise 
discard every
time when convert_lattice_params() fails.

Thanks!
Edward.


> ),
> made the discard procedure allocate blocks of all paddings it performs and
> fixed an apparent bug in extent gluing which triggered the "edward-1635"
> assertion.
>
> Edward Shishkin (1):
>    reiser4: iterate over extents in discard_atom
>
> Ivan Shapovalov (5):
>    reiser4: block_alloc: split block allocation accounting logic into separate functions for re-use.
>    reiser4: block_alloc, plugin/space/bitmap: add a method for "exact" block allocation.
>    reiser4: discard: don't be overly smart when gluing extents in discard_sorted_merged_extents().
>    reiser4: blocknrlist: add operations blocknr_list_del() and blocknr_list_update_extent().
>    reiser4: discard: allocate extent paddings.
>
>   fs/reiser4/block_alloc.c                  | 175 +++++++++----
>   fs/reiser4/block_alloc.h                  |   3 +
>   fs/reiser4/blocknrlist.c                  |  38 +++
>   fs/reiser4/discard.c                      | 410 +++++++++++++++++++++++++++---
>   fs/reiser4/discard.h                      |   8 +-
>   fs/reiser4/forward.h                      |   1 +
>   fs/reiser4/init_super.c                   |   4 +
>   fs/reiser4/plugin/space/bitmap.c          |  94 +++++--
>   fs/reiser4/plugin/space/bitmap.h          |   3 +
>   fs/reiser4/plugin/space/space_allocator.h |  10 +-
>   fs/reiser4/super.h                        |   4 +
>   fs/reiser4/txnmgr.h                       |   6 +
>   12 files changed, 647 insertions(+), 109 deletions(-)
>

