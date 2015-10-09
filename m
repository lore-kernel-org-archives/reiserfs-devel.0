From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 0/3] reiser4: another batch of fixes for 4.2.
Date: Fri,  9 Oct 2015 14:16:54 +0300
Message-ID: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=U2ptDRZZ6SmUj1RmeleopTcLPTYqvKRqpBg+ZSq1Qq0=;
        b=GQAVR9YMr2kqI3l33wWTWY0vIqzsidlTLjbzw8hzrrmbTTItbyclSR3pUf80b7BM1j
         I+Nmj0M4DC2XRo78jJtPy1GoIxMK7DCEqVYvC919ORFvwTUrYQ0ms3p1tJ71KFZwdV4r
         TDrREOGRCYuoWqjGztqn12zPrNWz0A9xLQi7PePnJ6iplWyZFwhs78ZclYE6O4yDRf2C
         hmR9fvpmMIWS3YR9zmqSfXTdTBJOJoVy0N2W6EHNuQtSllHrGHj98NzPecZScApMLapV
         Nh1RV+q2OHqyX3rUVb1szEU4+Weu+hbLMDXHx1e1AQuS/XTP2qtrdH9mR6ScJoDeMLf+
         g4UA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

These are the fixes for issues I've discovered during migration to 4.2.
Last one is a real issue causing a reproducible oops in my configuration,
first two are byproducts.

Ivan Shapovalov (3):
  reiser4: remove last traces of JNODE_NEW in the debugging code.
  reiser4: call account_page_redirty() on re-dirtying pages before giving them to entd.
  reiser4: in our own sync writes, mark pages dirty before marking them writeback.

 fs/reiser4/entd.c   | 1 +
 fs/reiser4/jnode.c  | 3 +--
 fs/reiser4/wander.c | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.6.0

