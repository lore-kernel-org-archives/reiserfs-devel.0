From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv7 0/6] reiser4: discard support: simplified and race-free initial implementation.
Date: Thu, 31 Jul 2014 14:19:43 +0400
Message-ID: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=YvBVPQ8PqxP43i9gsh+ERdYMGTFtkLfT0FRUaCIvD1Q=;
        b=Hv08UH8dvAyfYBsm17JO+hS3QZwa2zwjG7raZw11M7X7vv6LGtd12IbCgQWsQ3sS3q
         7OZ2KdewO5S7eDLIzl4gF+jfYw8QVNgLydn95T6WE57ZyDygD9w3G/QlLrdIqGGuG3cz
         RdkFjI4AEhtFAFaEYDYYN+RuWzln1cTuv78soAe83bjRXxJcMTizgHnr8iWuazE0XpLA
         1kjRcACrb3uWCWi//LrqyAt0xAKeJMvyNkxICUcGBDfpNa6fKzZ3vvt+yQl+vtWpp84W
         k2Km3+TRCT5Fcg/ZYwQ+a5l2SxIuYexZfM7+3c5DpBU/44ghtde/iZz8BDoJ4Q1uvH2k
         uSIw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

v1: - initial implementation (patches 1, 2)

v2: - cleanup, fixes discovered in debug mode
    - saner logging
    - assertions
    - enablement of discard through mount option

v3: - fixed the extent merge loop in discard_atom()

v4: - squashed fix-ups into the main patch (with exception of reiser4_debug())
    - fixed bug in usage of division ops discovered while building on ARM

v5: - squashed mount option into the main patch
    - refactor based on discussion (see commit msg)
      - splitted off blocknr_list code
      - replaced ->discard_set with ->delete_set and ->aux_delete_set

v6: - actualized in-code comments
    - removed uber-verbose debug statements
    - fixed code-to-patch mapping
    - moved blocknrlist and blocknrset to kmem_cache instead of kmalloc/kfree
      (in a separate commit for ease of reviewing)
    - dropped the RFC label

v7: - squashed with PATCHv2 "perform discard before all deallocations"
    - dropped extent padding from discard_extent()
    - completed in-code comments, cosmetic fixups
    - added missing #include in block_alloc.c
    - added missing spin_unlock_atom() in discard_atom()

Ivan Shapovalov (6):
  reiser4: fix reiser4_post_{commit,write_back}_hook() and their invocations.
  reiser4: make space_allocator's check_blocks() reusable.
  reiser4: add an implementation of "block lists", splitted off the discard code.
  reiser4: blocknr_list: use kmem_cache instead of kmalloc for allocating entries.
  reiser4: blocknr_set: use kmem_cache instead of kmalloc for allocating entries.
  reiser4: discard support: initial implementation using blocknr_list, without extent padding.

 fs/reiser4/Makefile                       |   2 +
 fs/reiser4/block_alloc.c                  |  62 +++---
 fs/reiser4/block_alloc.h                  |  14 +-
 fs/reiser4/blocknrlist.c                  | 336 ++++++++++++++++++++++++++++++
 fs/reiser4/blocknrset.c                   |  34 ++-
 fs/reiser4/dformat.h                      |   2 +
 fs/reiser4/discard.c                      | 179 ++++++++++++++++
 fs/reiser4/discard.h                      |  42 ++++
 fs/reiser4/forward.h                      |   1 +
 fs/reiser4/init_super.c                   |   2 +
 fs/reiser4/plugin/space/bitmap.c          |  82 +++++---
 fs/reiser4/plugin/space/bitmap.h          |   2 +-
 fs/reiser4/plugin/space/space_allocator.h |   4 +-
 fs/reiser4/super.h                        |   4 +-
 fs/reiser4/super_ops.c                    |  14 ++
 fs/reiser4/txnmgr.c                       |  90 +++++++-
 fs/reiser4/txnmgr.h                       |  60 +++++-
 fs/reiser4/wander.c                       |   6 +-
 fs/reiser4/znode.c                        |   9 +-
 19 files changed, 859 insertions(+), 86 deletions(-)
 create mode 100644 fs/reiser4/blocknrlist.c
 create mode 100644 fs/reiser4/discard.c
 create mode 100644 fs/reiser4/discard.h

-- 
2.0.3

