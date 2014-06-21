From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation,
 refactored.
Date: Sat, 21 Jun 2014 13:20:18 +0200
Message-ID: <53A56A72.3050608@gmail.com>
References: <1403296798-11742-1-git-send-email-intelfx100@gmail.com> <3309631.pk4ACE3OmJ@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=hJw72w5YSNqxtaMXC4X/ubdXkv5fSjmNGbPyFfQ64Hc=;
        b=LGjlKKn2yg4ivnqWrGLDRvQRWdTeXdbPJx0EzYK6GfDraKSe+Xo5zuolg3u+HHVRzR
         xdDbVowZIcbu/TLLbfRLVsVoz2mlbwP639JDS0tbs9NjUqFrtp11TEd+aFHltvVppMAw
         VceEAdXGoQxb9meMGdEN1FlhFMEgTHZM+T+8l0E46LMnQ091uf7oqXIHwVvrlJGcCY6F
         sC0xSLyJe36YQogACla55YTtrTIQcwfZz6Njj6m5OQ60ZxrZFRusmW8aQl/ukPei8MNn
         nzaXACjRLlszmE+K7RKbx69Go/gPm2ZHZbf1yXzYhf4koXA5sv2Sq6rUfQ8gNMkL2Jwa
         MLUQ==
In-Reply-To: <3309631.pk4ACE3OmJ@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 06/21/2014 12:35 AM, Ivan Shapovalov wrote:
> On Saturday 21 June 2014 at 00:39:54, Ivan Shapovalov wrote:	
>> v1: - initial implementation (patches 1, 2)
>>
>> v2: - cleanup, fixes discovered in debug mode
>>      - saner logging
>>      - assertions
>>      - enablement of discard through mount option
>>
>> v3: - fixed the extent merge loop in discard_atom()
>>
>> v4: - squashed fix-ups into the main patch (with exception of reiser4_debug())
>>      - fixed bug in usage of division ops discovered while building on ARM
>>
>> v5: - squashed mount option into the main patch
>>      - refactor based on discussion (see commit msg)
>>        - splitted off blocknr_list code
>>        - replaced ->discard_set with ->delete_set and ->aux_delete_set
>>
>> Ivan Shapovalov (4):
>>    reiser4: make space_allocator's check_blocks() reusable.
>>    reiser4: add an implementation of "block lists", splitted off the discard code.
>>    reiser4: add reiser4_debug(): a conditional equivalent of reiser4_log().
>>    reiser4: discard support: initial implementation using linked lists.
>>
>>   fs/reiser4/Makefile                       |   2 +
>>   fs/reiser4/block_alloc.c                  |  49 ++---
>>   fs/reiser4/block_alloc.h                  |  14 +-
>>   fs/reiser4/blocknrlist.c                  | 315 ++++++++++++++++++++++++++++++
>>   fs/reiser4/debug.h                        |   4 +
>>   fs/reiser4/dformat.h                      |   2 +
>>   fs/reiser4/discard.c                      | 247 +++++++++++++++++++++++
>>   fs/reiser4/discard.h                      |  31 +++
>>   fs/reiser4/forward.h                      |   1 +
>>   fs/reiser4/init_super.c                   |   2 +
>>   fs/reiser4/plugin/space/bitmap.c          |  84 +++++---
>>   fs/reiser4/plugin/space/bitmap.h          |   2 +-
>>   fs/reiser4/plugin/space/space_allocator.h |   4 +-
>>   fs/reiser4/super.h                        |   4 +-
>>   fs/reiser4/txnmgr.c                       | 125 +++++++++++-
>>   fs/reiser4/txnmgr.h                       |  63 +++++-
>>   fs/reiser4/znode.c                        |   9 +-
>>   17 files changed, 884 insertions(+), 74 deletions(-)
>>   create mode 100644 fs/reiser4/blocknrlist.c
>>   create mode 100644 fs/reiser4/discard.c
>>   create mode 100644 fs/reiser4/discard.h
> Also I would like if this code could be given a review. :)

Great! Looks nice for me, thanks!
There are 2 issues, though...

1) kmalloc/kfree a huge number of 32-byte chunks (blocknr_list entries) is
suboptimal. There is a special low-level memory allocator for such purposes.
Take a look how we initialize so-called "slab cache" for jnodes 
(_jnode_slab),
atoms (_atom_slab), etc, and allocate memory for them (kmem_cache_alloc()).

2) A lot of blocknr_list entries are allocated at flush time, when the 
high-level
allocator (txmod.c) makes "relocation decisions" (especially when txmod=wa).
The problem is that the flush (with the following commit) usually is the 
file system
response to memory pressure notifications, when additional memory allocation
is not desirable.

I think that with the fixed (1) we'll include the discard support (if 
everything will
be OK in the next 1-2 weeks).

As to (2): that is a common problem of all Linux subsystems which want 
memory
to free memory. It is unresolvable, however, we can improve the 
situation. It
would be nice to implement a per-atom pool of memory (as a list of 
kmalloc-ed
buffers with "cursors") with an optional possibility to pre-allocate 1-2 
such buffers
at atom initialization time. But this is for the future...

I don't see other urgent improvements. Yes, overall scalability of 
rb-trees is better,
as we found, however, merging rb-trees is more expensive, plus atom's fusion
is not a background process, so it can lead to performance drop. There are
rb-trees with fingers, however I haven't seen their implementation on C 
language
(it can be not so simple).

Thanks!
Edward.

