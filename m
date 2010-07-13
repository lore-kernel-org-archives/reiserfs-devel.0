From: Davidlohr Bueso <dave.bueso@gmail.com>
Subject: [PATCH RESEND reiserfs] trivial typo fix
Date: Tue, 13 Jul 2010 05:50:12 -0400
Message-ID: <1279014612.18280.1.camel@cowboy>
Reply-To: dave.bueso@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :content-type:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=VlkkAVAqx2cL3gCoLP68WBfvp34NrMaXNe5LWUsvld0=;
        b=tLL6TaDa31cBDJ95E4RsDSDqZ5qpsQvvUERrKqO803HH3aBf/DihM3iINbrq6ahKV9
         I7zfCnzpvtuiEJwROqQRl/npSWdoUlUtN1rE2m2YPI8ErUZFIcHytU+uJGaIZycj6sN8
         Fpm16+tA2rY3yTHih6nIF5VO+BBultYOWjycM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org, trivial@vger.kernel.org

Fix trivial typo in code comment (change adn for and), also change comment style for proper coding style.

Thanks,
Davidlohr

Signed-off-by: Davidlohr Bueso <dave@gnu.org>
---
 include/linux/reiserfs_fs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/reiserfs_fs.h b/include/linux/reiserfs_fs.h
index 3b603f4..ba39416 100644
--- a/include/linux/reiserfs_fs.h
+++ b/include/linux/reiserfs_fs.h
@@ -360,7 +360,7 @@ int is_reiserfs_jr(struct reiserfs_super_block *rs);
 /* the spot for the super in versions 3.5 - 3.5.10 (inclusive) */
 #define REISERFS_OLD_DISK_OFFSET_IN_BYTES (8 * 1024)
 
-// reiserfs internal error code (used by search_by_key adn fix_nodes))
+/* reiserfs internal error code (used by search_by_key and fix_nodes)) */
 #define CARRY_ON      0
 #define REPEAT_SEARCH -1
 #define IO_ERROR      -2
-- 
1.7.0.4




