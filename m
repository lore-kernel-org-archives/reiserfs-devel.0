From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv3 0/5] reiser4: discard support: initial implementation.
Date: Thu,  8 May 2014 22:45:45 +0400
Message-ID: <1399574750-10499-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=TlZ3GgJe/a4Yd1HcK/93E6CQzr4fqIq9g+VwycNj51I=;
        b=SGNhPqlKe/+HH5AMgyfrEReRuBzj+qRKLhZlFWZXbeTO9S5aG8K1v/wUFPKvUxTjyr
         Ukqgagna3yM01IlQnKFHcafY31yAJdiEf/E6EmE0q/mYZplt2zKLY8HSRjdOZ0AMoNMG
         o+oQgSrd4Ad9gm3fub/B/JpArcOKqC7A6HoO4KL6fzVGUMIHdUPAkFxucWMQW7gqajmw
         EeolGDwRayayjn6jtuLBDM947x8hWWn9YSs1/AQND4d1inhviK/Drrj/pVQuudt/gi42
         zbf6lyFGFHbEoegHTpt48bOlFxOij6KwVvX5/96kCAIXo5l7DoKz4B9ShZGn5HuTLsMX
         ySJA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

v1: - initial implementation (patches 1, 2)

v2: - cleanup, fixes discovered in debug mode
    - saner logging
    - assertions
    - enablement of discard through mount option

v3: - fixed the extent merge loop in discard_atom()

Ivan Shapovalov (5):
  reiser4: discard support: make space_allocator's check_blocks() reusable.
  reiser4: discard support: initial implementation using extent lists.
  reiser4: discard support: enable discard functionality through a mount option.
  reiser4: discard support: add assertions to all code written within this feature.
  reiser4: discard support: downgrade all reiser4_log() to reiser4_debug().

 fs/reiser4/Makefile                       |   1 +
 fs/reiser4/block_alloc.c                  |  38 ++-
 fs/reiser4/block_alloc.h                  |  14 +-
 fs/reiser4/debug.h                        |   4 +
 fs/reiser4/dformat.h                      |   2 +
 fs/reiser4/discard.c                      | 487 ++++++++++++++++++++++++++++++
 fs/reiser4/discard.h                      |  38 +++
 fs/reiser4/forward.h                      |   1 +
 fs/reiser4/init_super.c                   |   2 +
 fs/reiser4/plugin/space/bitmap.c          |  81 +++--
 fs/reiser4/plugin/space/bitmap.h          |   2 +-
 fs/reiser4/plugin/space/space_allocator.h |   4 +-
 fs/reiser4/super.h                        |   4 +-
 fs/reiser4/txnmgr.c                       |  19 ++
 fs/reiser4/txnmgr.h                       |   5 +
 fs/reiser4/znode.c                        |   9 +-
 16 files changed, 656 insertions(+), 55 deletions(-)
 create mode 100644 fs/reiser4/discard.c
 create mode 100644 fs/reiser4/discard.h

-- 
1.9.2

