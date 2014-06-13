From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv4 0/4] reiser4: discard support: initial implementation.
Date: Fri, 13 Jun 2014 18:58:10 +0400
Message-ID: <1402671494-24513-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=DBeGj6iAP2e9z50fX4vm2ib773ta4uqOri9kp7PpQCk=;
        b=pHoBMX/GZmqJuBHRQ/P6q+YBsYQUPIwLiGT7+E+/J1eaQNT9ou5q0WFwxK7KE1DK+0
         uDkdFsgrqxBDhjABdhzvxPJfyimDJ0yWxRErdRLSJOxD0VRUAb9fS4Abvf5XE2Q4pUp1
         ODra9o7M0wzpBsvk9oUimY3+7lRby5PnOROfYt9REWzJtAcvXaSEN1AnUi2Xdas1dqr+
         cFZ055OYfGCtuv/VyWYIdiDkZZ/I9IjeCPESHTYAhlnQGriD5xP7aJzdz5PklZGWedyn
         zjPV1say/cOcINOwHxlbaAk1GoEVpapKyfLDflBNfGaYaqbd79PTYyjfIxNpEKm24mSJ
         1eRw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

...I'm back on board, now more or less till September.

v1: - initial implementation (patches 1, 2)

v2: - cleanup, fixes discovered in debug mode
    - saner logging
    - assertions
    - enablement of discard through mount option

v3: - fixed the extent merge loop in discard_atom()

v4: - squashed fix-ups into the main patch (with exception of reiser4_debug())
    - fixed bug in usage of division ops discovered while building on ARM

BTW, it seems that I've understood the logic of block allocation/deallocation
(the disk space leak problem you mentioned earlier), and... this breaks the
idea of ->discard_set (i. e. "log everything").
I'll write a follow-up once I verify the (in-)consistency of my thoughts :)

Ivan Shapovalov (4):
  reiser4: discard support: make space_allocator's check_blocks() reusable.
  reiser4: add reiser4_debug(): a conditional equivalent of reiser4_log().
  reiser4: discard support: initial implementation using extent lists.
  reiser4: discard support: enable discard functionality through a mount option.

 fs/reiser4/Makefile                       |   1 +
 fs/reiser4/block_alloc.c                  |  38 ++-
 fs/reiser4/block_alloc.h                  |  14 +-
 fs/reiser4/debug.h                        |   4 +
 fs/reiser4/dformat.h                      |   2 +
 fs/reiser4/discard.c                      | 488 ++++++++++++++++++++++++++++++
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
 16 files changed, 657 insertions(+), 55 deletions(-)
 create mode 100644 fs/reiser4/discard.c
 create mode 100644 fs/reiser4/discard.h

-- 
2.0.0

