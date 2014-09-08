From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 0/3] reiser4: block deallocation fixes.
Date: Mon,  8 Sep 2014 22:43:48 +0400
Message-ID: <1410201831-11722-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=ZxYQz3B0o3pVw0In9bVWnBQoQcUxxQtg51skq4pieQs=;
        b=0ANA1m7/ccrPA9TZlZ4VgFo6kMjxFknm6bGR46t3QAi1YnbmRGP344Szt/esDxCIIu
         VVMBcuiJhhzNvCSvA50I6DB5saxKXP/fdKWbRuPeaws6A8PfBEu60b5W4YxKm4HHifY6
         elSXPFFhFUW26GZSFUX6wWGi52EYD287CNUqOUkeWlMt1YulC+FtqlY4u7LA/5MHSxWT
         hMyWHlvax7dCQ6N+QGh8mg9O+Ld17c52L7Vbm5jiF1pf4uohThYBlxHbqDNgAS1YXXsj
         8M8Er57o7NxjHKjlsnhLXXM1asMYznELvqsHDZhnlXguf3QCjwAbEyodeqdU/lK1pWhP
         40Vw==
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

While at it, I've removed specifications of block stage in deferred deallocations.
It is not used anyway. This is first commit.

Next commit does the following. Actually, most of the immediate deallocations
do not need to be considered for discarding: these are deallocations done in
error paths, and respective blocks are never written between their allocation
and deallocation. Two exceptions are deallocations in wandering log code. In these
cases, blocks are allocated, then written, then deallocated without BA_DEFER.
I've just made these deallocations explicitly deferred, which is OK because they
have a suitable block stage.

Last commit actually removes wrong code, again making immediate deallocations
always immediate.

Ivan Shapovalov (3):
  reiser4: deferred (BA_DEFER) deallocations do not make use of target stage.
  reiser4: mark final deallocations in wandering log code as deferred.
  reiser4: block_alloc: get rid of discard-related hack in reiser4_dealloc_blocks().

 fs/reiser4/block_alloc.c  |  9 +++++++--
 fs/reiser4/plugin/txmod.c | 15 +++++----------
 fs/reiser4/wander.c       |  6 +++---
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.1.0

