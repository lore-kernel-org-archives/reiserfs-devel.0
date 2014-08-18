From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 0/2] reiser4: block deallocation fixes.
Date: Mon, 18 Aug 2014 15:31:09 +0400
Message-ID: <1408361471-1488-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=RTnTLrMLPwuJGyqf1hzD7VSbSgs1LobyXIUj16Ot9qY=;
        b=sud3hJOEH9VSlnSFRxrn4qp3vKtjjxZSPuaMRsmPdgvJxMkcxHDclNzgOSVeDr+9L6
         flCkbcD6i4FeQzLF6CVHLlQD7WZFUuPCamhGFsIy7asXqr9n150cYiVslNONdtSTpHdQ
         MO4Zm6iYbIU6l8QBWpyqUeKWosmqAwQGS1YiF85jTXVPMEsSeeLWZkK/cTpFD7xWjI3B
         LOtERDBvK/UU3dysWk44FYeviFxTI9fpQghHrbuMxnQy7LJ+oNOP05gc9iOTaTMPlc5O
         TyYpjWjsrk26Uje9T4CRqKhcx1C4RxWTW/0QqYR167hvmUbI0ymDxQtNdRiaIUG5PYmh
         ITWg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Actually, the idea of converting immediate allocations into deferred when
discard is enabled was flawed. Deferred deallocations ignore block stage
and additional flags, while some immediate deallocations use non-standard
stage/flags which do not match what's done by reiser4_post_write_back_hook().

So this patchset first tweaks deallocations a bit (while at it, I've
removed redundant and unused flags in some call-sites), so that immediate
deallocations for blocks that actually need to be discarded are properly
converted into deferred deallocations. Remaining instances of immediate
deallocations handle blocks which have been just allocated and not yet written
to, so they do not need to be discarded.

The second commit actually removes the wrong "conversion".

Ivan Shapovalov (2):
  reiser4: sanitize deallocations throughout the code.
  reiser4: block_alloc: get rid of discard-related hack in reiser4_dealloc_blocks().

 fs/reiser4/block_alloc.c  |  3 +--
 fs/reiser4/plugin/txmod.c | 18 ++++++------------
 fs/reiser4/tree.c         |  3 +--
 fs/reiser4/wander.c       |  5 ++---
 4 files changed, 10 insertions(+), 19 deletions(-)

-- 
2.0.4

