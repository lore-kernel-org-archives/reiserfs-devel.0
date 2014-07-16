From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [veryRFC] [PATCH 0/2] reiser4: discard before dealloc: first approximation.
Date: Wed, 16 Jul 2014 15:24:02 +0400
Message-ID: <1405509844-30070-1-git-send-email-intelfx100@gmail.com>
References: <53C652BE.4010203@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gpyY/xzK5mCdaGdgKbPUEqyik7eof9V/U2+yEF/nKAo=;
        b=r0vRzFm9z/qoQMt9RpxwLlWDGiqAIFkGCt3rTWYwZLfbzlvP83+21lmkeEdXCbo13e
         yO3xRH0CWgRUoflAJSrNqQyjXKfYN25q06A0uf6UcqfdeI9MKy8BZxHgy3tO3wvIOVTt
         bA84cCsJMZOFC3tUvPUxWB6yeQpatDLeVyjxyySqgMdvz6GPG9j9T2hyvEEWFJSot52g
         TkKodcCrxUGb6uRWWwa2GZr7bkIPa66m5ElwZk9CNfobSUNJY+CYKMTfeWz9A6g2lpi3
         SMf3suLxTt9ebYmA5MLZtP0klF0EWBJGMbOA7Mmh8VynRqIpCgKaRqZhGRSkUoaro8nD
         JDuw==
In-Reply-To: <53C652BE.4010203@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: edward.shishkin@gmail.com
Cc: reiserfs-devel@vger.kernel.org, Ivan Shapovalov <intelfx100@gmail.com>

This needs your version of discard algorithm, because blocks inside extents of
discard set are now marked as allocated.

BTW, have you dropped the case with erase unit size < block size? This is
probably OK, but configurations with nonzero alignments are then broken. Not
worth handling these, I think, but nevertheless a warning could be useful ;)

Ivan Shapovalov (2):
  reiser4: discard support: perform discards and deallocations after writing logs.
  reiser4: discard support: proof-of-concept for "discard before dealloc".

 fs/reiser4/block_alloc.c | 48 +++++++++++++++++++-------------------
 fs/reiser4/discard.c     | 60 ++++++++++++++++++++++++++++++++++--------------
 fs/reiser4/discard.h     |  4 +++-
 fs/reiser4/txnmgr.c      | 35 ----------------------------
 fs/reiser4/txnmgr.h      | 13 ++---------
 fs/reiser4/wander.c      |  3 ++-
 6 files changed, 73 insertions(+), 90 deletions(-)

-- 
2.0.1

