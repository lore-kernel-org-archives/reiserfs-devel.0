From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 0/3] reiser4: space grabbing fixes.
Date: Mon, 18 Aug 2014 18:14:40 +0400
Message-ID: <1408371283-1319-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=gFQpgeGSyz6iFxYTnK86Qcqsfghg5U8I0kTOPMcoUy0=;
        b=ucEB2+d0YSGaMCU8iOodf24CvQX6KquVAm7J9Y+OfuGGUqw9VMFSmpg96mbQS1MyCk
         +LRVS5iFBMBHakWClQHei9AB++ZHQl6mSFEm9HSHyCdzCwPRltP4Yw7nw6qOKYX93kPS
         IYraLYMTceBiZJay02zkB/3PbbbiaCUIng0bxT/CT3OY6sB2B9RuHSAT9RCvDPsofYfF
         1mOgTx2zAEmvVjTBWdCIUS9vZPtmA0ALGnk470l76zlPyTWTVqEN/tTanQM7VVcPip/V
         fkxne3j3utcac8OHJ4sp64xIi2G/BMoMY6kRPG69Z3Hv1idc8yPajVMicbysk7Y3gTv2
         naEA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

These are mostly equivalent transformations (aside from the first patch)
I've done when I was experimenting with rwsems at zero-th iteration of
batch discard support.


Ivan Shapovalov (3):
  reiser4: block_alloc: improve error handling in reiser4_grab_reserved().
  reiser4: block_alloc: sanitize grab_enabled modifications.
  reiser4: do not mess with grab_enabled; instead, use BA_FORCE.

 fs/reiser4/block_alloc.c                 | 57 +++++++++++++++++---------------
 fs/reiser4/plugin/file/file.c            | 12 +++----
 fs/reiser4/plugin/file/file_conversion.c |  3 +-
 fs/reiser4/plugin/file/tail_conversion.c | 11 +++---
 fs/reiser4/plugin/item/extent_file_ops.c |  3 +-
 fs/reiser4/plugin/item/tail.c            |  3 +-
 fs/reiser4/safe_link.c                   |  4 +--
 7 files changed, 44 insertions(+), 49 deletions(-)

-- 
2.0.4

