From: Chris Mason <mason@suse.com>
Subject: [patch 2/6] reiserfs v3 patches
Date: Sun, 15 Jan 2006 19:50:04 -0500
Message-ID: <20060116005312.206779000@watt.suse.com>
References: <20060116005002.398989000@watt.suse.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline; filename=b_private-init
From: Chris Mason <mason@suse.com>
Subject: [patch 2/6] Zero b_private when allocating buffer heads
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@osdl.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

The b_private field in buffer heads needs to be zero filled
when the buffers are allocated.  Thanks to Nathan Scott for
finding this.  It was causing problems on systems with both XFS and
reiserfs.

diff -r 5ef1fa0a021a fs/buffer.c
--- a/fs/buffer.c	Fri Jan 13 13:50:39 2006 -0500
+++ b/fs/buffer.c	Fri Jan 13 13:51:09 2006 -0500
@@ -1022,6 +1022,7 @@ try_again:
 
 		bh->b_state = 0;
 		atomic_set(&bh->b_count, 0);
+		bh->b_private = NULL;
 		bh->b_size = size;
 
 		/* Link the buffer to its page */

--
