From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 0/3] reiser4: another batch of fixes for 4.2.
Date: Sun, 25 Oct 2015 02:02:17 +0300
Message-ID: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=iyl/lTP8aaJhieQla/gy/RYNkcJZG67oedxHsrgKW1w=;
        b=NdB2lFV1qUGoJecfTvELMwI2xHgRLCTIPD6mPR/myxTxbe+tS3DwSlr9ZZJfAgVaDY
         lo19qROMVuWftP1SGggwPtofup5I6wRXDI69owu25DkqaRyqH8/WyIOWI6QgBNQ4/Ups
         V/plxJMSqUu8SEYOGlc1Cs7PmbAF2VqsCcHhcmq8MTicAG5RFLD2Ho7s6zqfx8unonJj
         ZZhuvdnuKOmFg+VSnHKPvUD/9ZrWDI2CBX3CYMm5PZEZITaTpS+7LykJ4ciuM52f8jQN
         FOzhbtxih4iRYqbqIPHVZ4pSUkk8p+ow+bJGF0Ahrlpnu16+2GwyN6WsYX8aPBxNJ+v0
         zsxw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

These are the fixes for issues I've discovered during migration to 4.2.
Last one is a real issue causing a reproducible oops in my configuration,
first two are byproducts.

v2: The 3/3 is now a real fix instead of a blind duct-tape fixup.

Ivan Shapovalov (3):
  reiser4: remove last traces of JNODE_NEW in the debugging code.
  reiser4: call account_page_redirty() on re-dirtying pages before giving them to entd.
  reiser4: mark pages created during tail2extent conversion as dirty.

 fs/reiser4/entd.c                        | 1 +
 fs/reiser4/jnode.c                       | 3 +--
 fs/reiser4/plugin/file/tail_conversion.c | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.6.2

