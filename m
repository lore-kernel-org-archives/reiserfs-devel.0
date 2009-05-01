From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 5/6] kill-the-BKL/reiserfs: release the write lock inside reiserfs_read_bitmap_block()
Date: Fri,  1 May 2009 04:44:21 +0200
Message-ID: <1241145862-21700-6-git-send-email-fweisbec@gmail.com>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=LfanmAbAL8wijIs2kjCa6Uime/AthnFx8p/FVDy+4sE=;
        b=Vi/sKTonMZhifSafBizV75ShuIJw7fPgEqkbM/hwVsJ1lJAhyXRvkXavaoSVFTnYAB
         ku7Kse3GqS64htCcrKw2jRWE0MYSB97HlDZu4VRRki0Lz/Gj/xHpqiq+DAAHW5qOohSI
         dISnchSNDdZvtJEbBN45qtPPmYiLXPatlGY/I=
In-Reply-To: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

reiserfs_read_bitmap_block() uses sb_bread() to read the bitmap block. This
helper might sleep.

Then, when the bkl was used, it was released at this point. We can then
relax the write lock too here.

[ Impact: release the reiserfs write lock when it is not needed ]

Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 fs/reiserfs/bitmap.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
index 1470334..6854957 100644
--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -1249,7 +1249,9 @@ struct buffer_head *reiserfs_read_bitmap_block(struct super_block *sb,
 	else if (bitmap == 0)
 		block = (REISERFS_DISK_OFFSET_IN_BYTES >> sb->s_blocksize_bits) + 1;
 
+	reiserfs_write_unlock(sb);
 	bh = sb_bread(sb, block);
+	reiserfs_write_lock(sb);
 	if (bh == NULL)
 		reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%u) "
 		                 "reading failed", __func__, block);
-- 
1.6.2.3

