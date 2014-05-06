From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 0/5] reiser4: discard support: initial implementation.
Date: Tue,  6 May 2014 09:30:18 +0400
Message-ID: <1399354223-5334-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=hXedwKAI5F9JgI+G6E/DvurxJE1GiiXno+w335Lw0Ys=;
        b=IbUKu7YQ/aNINN60OVPB0Q3Teiaj+4Md4j7lvd8tZFzIybAQo78rWhxUC9cB712KMA
         uLAXeGUJ22Sv9NRaFJ16+iPOlaKDj2OtXunka21AlenFV+zYOhCA+HzTZU4WXYXYm1XF
         /OIuhArt4V4NZj7lwow0Z3p1SIkP8i8XCxIiiT7zBCzCRU7f6wiskGOsk5+rfl/bGvzf
         eN/ShvDXqupYtLaH2nQR6wAMCrIolh7A9nsM/R7jwadY1EAU9i+oihvqQj2cSH6lbnBr
         SlBRMWsd5aQ9WO5zB2jDNJEztxkZHYnaX4dEaizG7nuLHTWmTAh/1mcS0g6UgCfedm3I
         grUQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Patches 1 and 2 are a re-send of v1 with some cleanup and fixes discovered after
enabling debug mode.
Next patches constitute new code since v1.

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
 fs/reiser4/discard.c                      | 484 ++++++++++++++++++++++++++++++
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
 16 files changed, 653 insertions(+), 55 deletions(-)
 create mode 100644 fs/reiser4/discard.c
 create mode 100644 fs/reiser4/discard.h

-- 
1.9.2

