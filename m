From: Tahsin Erdogan <tahsin@google.com>
Subject: [PATCH 09/28] ext4: extended attribute value size limit is enforced by vfs
Date: Wed, 31 May 2017 01:14:58 -0700
Message-ID: <20170531081517.11438-9-tahsin@google.com>
References: <20170531081517.11438-1-tahsin@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SmaYCPVbMhH8kC8XywMFu6kvpT+GhruHiVUsQRQbpuY=;
        b=iNsJD48t2r7we3khFtNVjch8BjZ3QW/yfsRBDEG9X5LX7W54iYp0HXmwFuF5xmp3IM
         inOp1gQaDOaDZXTqbgUm1PVsmU2Kg+aHAX3gHCgEvok01KER8R27lkcW63d8KjTXRLvq
         4093TZYFXSmxROgli2X+LBFp0g8rRe70u0ezcvVqwdWZjZD4+MG4EBL1QV+omkSawoTN
         rji65E7zdtRG7f/FxtdOpnA0GtqpTxC4DlWRe1hZV2dNM2YlQ1wbgc2dWA2k+LDpjubP
         cgu3/TlMnWZNUNssIS1fJZhzP+XgIF29D6j/mgKAkwbSkI3DTc9W966/LYkyTMpw9eWs
         +BkA==
In-Reply-To: <20170531081517.11438-1-tahsin@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, Tahsin Erdogan <tahsin@google.com>

EXT4_XATTR_MAX_LARGE_EA_SIZE definition in ext4 is currently unused.
Besides, vfs enforces its own 64k limit which makes the 1MB limit in
ext4 redundant. Remove it.

Signed-off-by: Tahsin Erdogan <tahsin@google.com>
---
 fs/ext4/ext4.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 5d5fc0d0e2bc..2cdd6070e348 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2221,12 +2221,6 @@ struct mmpd_data {
 #define EXT4_MMP_MAX_CHECK_INTERVAL	300UL
 
 /*
- * Maximum size of xattr attributes for FEATURE_INCOMPAT_EA_INODE 1Mb
- * This limit is arbitrary, but is reasonable for the xattr API.
- */
-#define EXT4_XATTR_MAX_LARGE_EA_SIZE    (1024 * 1024)
-
-/*
  * Function prototypes
  */
 
-- 
2.13.0.219.gdb65acc882-goog

