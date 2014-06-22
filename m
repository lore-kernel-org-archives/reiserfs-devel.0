From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv6 0/5] reiser4: discard support: initial implementation.
Date: Sun, 22 Jun 2014 14:48:41 +0400
Message-ID: <1403434126-6390-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=58AQdo5oCDNxBpWqSSSzg+41MSSjUFww2a94rwlAkAU=;
        b=jm4CgYkCO7WS9SALO4cQG+6M5FJIMsfOfyY0KAjX1E9IQJXiyYkKLpBqgbUQpuVuS8
         BvZtMUk1C09pqArlG2RJlqNIXl56gAlmL7JKMGIHaOUBCr165DJpf/pq5TEY+Ur1Dh4e
         sQoguTXW0SPByIBaipeLU4LVIIy+0cmkwNMJcgilsMi8wcI1Elb+jwNewqV6bLgMCVWQ
         k1GSH8pedaw+boLlXvMNJjC06sNz8nKZqhxIADT610IwM7NNUT81BjpLKYkyfNuaP0N4
         77UNmFU5hCa3vvH4w4kOXMnl3MSp4VOOACx+uuLf+GUL5bpIBwx+/2wRM9GyobzOnU16
         dOfw==
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

Ivan Shapovalov (5):
  reiser4: make space_allocator's check_blocks() reusable.
  reiser4: add an implementation of "block lists", splitted off the discard code.
  reiser4: discard support: initial implementation using linked lists.
  reiser4: blocknr_list: use kmem_cache instead of kmalloc for allocating entries.
  reiser4: blocknr_set: use kmem_cache instead of kmalloc for allocating entries.

 fs/reiser4/Makefile                       |   2 +
 fs/reiser4/block_alloc.c                  |  48 +++--
 fs/reiser4/block_alloc.h                  |  14 +-
 fs/reiser4/blocknrlist.c                  | 336 ++++++++++++++++++++++++++++++
 fs/reiser4/blocknrset.c                   |  34 ++-
 fs/reiser4/dformat.h                      |   2 +
 fs/reiser4/discard.c                      | 216 +++++++++++++++++++
 fs/reiser4/discard.h                      |  31 +++
 fs/reiser4/forward.h                      |   1 +
 fs/reiser4/init_super.c                   |   2 +
 fs/reiser4/plugin/space/bitmap.c          |  84 +++++---
 fs/reiser4/plugin/space/bitmap.h          |   2 +-
 fs/reiser4/plugin/space/space_allocator.h |   4 +-
 fs/reiser4/super.h                        |   4 +-
 fs/reiser4/super_ops.c                    |  14 ++
 fs/reiser4/txnmgr.c                       | 125 ++++++++++-
 fs/reiser4/txnmgr.h                       |  67 +++++-
 fs/reiser4/znode.c                        |   9 +-
 18 files changed, 918 insertions(+), 77 deletions(-)
 create mode 100644 fs/reiser4/blocknrlist.c
 create mode 100644 fs/reiser4/discard.c
 create mode 100644 fs/reiser4/discard.h

-- 
2.0.0

