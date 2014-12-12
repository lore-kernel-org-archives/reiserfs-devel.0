From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 0/6] reiser4: discard support: "precise discard" aka padding of extents to erase unit boundaries.
Date: Sat, 13 Dec 2014 00:10:26 +0300
Message-ID: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=TvocCdBNhpd9FHk5OnjGYsSZ8tMudLa+lugn6mRyVPw=;
        b=dwnCHr4jCMcw/pvkyOrqWMuYZcDE/S9o1pEpZ1NMICC1sOhEjrIyQ/BBkL5FRaMwnI
         qAyjfsHIyaS6nSL/yZC0shQEUtDDUxJei8xwZZYZb2VfGNvU0ENHs4Feti5VXaiQOS2y
         PuyQ3o1Kq2JkmaqS1d9VGYSwU9XxkuirDPCM/YKbiri7wpeJdcaNsyvwM4qAWesbcqmZ
         Rk7DfTIJgvNCDEh2h1itzPelaUFtEM4QeLV6OPvb2WZ+GyOF55MtnLyP9+bNslxFbTxJ
         UCsiNqhxgc7BlAidAYhfdvuSwqkB+zDUJIPKb70zzEM+WQYVrJij5ICBYJ57PNZsfRcT
         LvOw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

So, this patchset uses your algorithm of padding/gluing extents to be discarded.
I've added exact allocation primitives (is it what you've been talking about?),
made the discard procedure allocate blocks of all paddings it performs and
fixed an apparent bug in extent gluing which triggered the "edward-1635"
assertion.

Edward Shishkin (1):
  reiser4: iterate over extents in discard_atom

Ivan Shapovalov (5):
  reiser4: block_alloc: split block allocation accounting logic into separate functions for re-use.
  reiser4: block_alloc, plugin/space/bitmap: add a method for "exact" block allocation.
  reiser4: discard: don't be overly smart when gluing extents in discard_sorted_merged_extents().
  reiser4: blocknrlist: add operations blocknr_list_del() and blocknr_list_update_extent().
  reiser4: discard: allocate extent paddings.

 fs/reiser4/block_alloc.c                  | 175 +++++++++----
 fs/reiser4/block_alloc.h                  |   3 +
 fs/reiser4/blocknrlist.c                  |  38 +++
 fs/reiser4/discard.c                      | 410 +++++++++++++++++++++++++++---
 fs/reiser4/discard.h                      |   8 +-
 fs/reiser4/forward.h                      |   1 +
 fs/reiser4/init_super.c                   |   4 +
 fs/reiser4/plugin/space/bitmap.c          |  94 +++++--
 fs/reiser4/plugin/space/bitmap.h          |   3 +
 fs/reiser4/plugin/space/space_allocator.h |  10 +-
 fs/reiser4/super.h                        |   4 +
 fs/reiser4/txnmgr.h                       |   6 +
 12 files changed, 647 insertions(+), 109 deletions(-)

-- 
2.1.3

