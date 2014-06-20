From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation, refactored.
Date: Sat, 21 Jun 2014 00:39:54 +0400
Message-ID: <1403296798-11742-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=NW8urGEwQaIeWbJ6y77VrBK7+knu4ICYD/fM7PGJo0E=;
        b=YmRWPDKeeUFHDsVACmVSHZbAI3uUIKGVNNoQcdufd8ug6otv8hlHPs6D8Boa9EIxNv
         kXvw//9By6UT0GWqcdcG2mESeOg6qFqVIsn3u5QDi9bIoJgFK/eRtK86Nqxem/9HnLQz
         LYn5vTAOY7RqVKYq7JjQkE65u4+6K05ZUyncPGVxMXlzVKSk+Uhch0ayd0/VJwdALmRx
         UxNw+s0YZVIp2bFhbyZQCBJnaiIQgWJgL7fA0/5oKA3FbigDNIShD5UXS7VoXKp/pcix
         2QDkm+/lM2alfo6fufnedkHxcsYSZCpfz2mKORQKAI0pgtvvJYtbRJuZdPrQUs6K5Pja
         kjoA==
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

Ivan Shapovalov (4):
  reiser4: make space_allocator's check_blocks() reusable.
  reiser4: add an implementation of "block lists", splitted off the discard code.
  reiser4: add reiser4_debug(): a conditional equivalent of reiser4_log().
  reiser4: discard support: initial implementation using linked lists.

 fs/reiser4/Makefile                       |   2 +
 fs/reiser4/block_alloc.c                  |  49 ++---
 fs/reiser4/block_alloc.h                  |  14 +-
 fs/reiser4/blocknrlist.c                  | 315 ++++++++++++++++++++++++++++++
 fs/reiser4/debug.h                        |   4 +
 fs/reiser4/dformat.h                      |   2 +
 fs/reiser4/discard.c                      | 247 +++++++++++++++++++++++
 fs/reiser4/discard.h                      |  31 +++
 fs/reiser4/forward.h                      |   1 +
 fs/reiser4/init_super.c                   |   2 +
 fs/reiser4/plugin/space/bitmap.c          |  84 +++++---
 fs/reiser4/plugin/space/bitmap.h          |   2 +-
 fs/reiser4/plugin/space/space_allocator.h |   4 +-
 fs/reiser4/super.h                        |   4 +-
 fs/reiser4/txnmgr.c                       | 125 +++++++++++-
 fs/reiser4/txnmgr.h                       |  63 +++++-
 fs/reiser4/znode.c                        |   9 +-
 17 files changed, 884 insertions(+), 74 deletions(-)
 create mode 100644 fs/reiser4/blocknrlist.c
 create mode 100644 fs/reiser4/discard.c
 create mode 100644 fs/reiser4/discard.h

-- 
2.0.0

