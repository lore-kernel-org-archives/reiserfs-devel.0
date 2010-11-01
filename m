From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 2/5] btrfs: close_bdev_exclusive() should use the same @flags as the matching open_bdev_exclusive()
Date: Mon,  1 Nov 2010 17:15:26 +0100
Message-ID: <1288628129-12811-3-git-send-email-tj__12881.5207317986$1288628300$gmane$org@kernel.org>
References: <1288628129-12811-1-git-send-email-tj@kernel.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1288628129-12811-1-git-send-email-tj@kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: axboe@kernel.dk, hch@infradead.org, linux-kernel@vger.kernel.org, petero2@telia.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jack@suse.cz, akpm@linux-foundation.org, adilge
Cc: Tejun Heo <tj@kernel.org>

In the failure path of __btrfs_open_devices(), close_bdev_exclusive()
is called with @flags which doesn't match the one used during
open_bdev_exclusive().  Fix it.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Chris Mason <chris.mason@oracle.com>
---
 fs/btrfs/volumes.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index cc04dc1..d395962 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -638,7 +638,7 @@ static int __btrfs_open_devices(struct btrfs_fs_devices *fs_devices,
 error_brelse:
 		brelse(bh);
 error_close:
-		close_bdev_exclusive(bdev, FMODE_READ);
+		close_bdev_exclusive(bdev, flags);
 error:
 		continue;
 	}
-- 
1.7.1

