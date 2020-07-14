From: trix@redhat.com
Subject: [PATCH] reiserfs : fix improper free in reiserfs_get_block
Date: Tue, 14 Jul 2020 06:05:09 -0700
Message-ID: <20200714130509.11791-1-trix@redhat.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594731920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=6VIoOR5Zq1Eiat1CGdfDl2SCC7HipCcOifvnlXpfoZM=;
        b=gk/Cv5KjdD1GxEyjoEnVGcskFFvAkad281touT6cmtbU59CpplKv5Lhuoo3w6ytmkJJTyk
        fhALV/MyJlUy72Phy25SBFhnUpj1jOVWKJ9MNqXl3LeFieiCYie5coJGCEUO+5PH3aNHLh
        FGhFao8m080mSgZJHZZh5wwit7wysA8=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jack@suse.cz, william.kucharski@oracle.com, jeffm@suse.com, willy@infradead.org, joseph.qi@linux.alibaba.com, liao.pingfang@zte.com.cn
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>

From: Tom Rix <trix@redhat.com>

clang static analysis flags this error

inode.c:1083:5: warning: Argument to kfree() is the address of the
  local variable 'unf_single', which is not memory allocated by
  malloc() [unix.Malloc]
                                kfree(un);
                                ^~~~~~~~~
Assignment of 'un'

	/*
	 * We use this in case we need to allocate
	 * only one block which is a fastpath
	 */
	unp_t unf_single = 0;

	...

	if (blocks_needed == 1) {
		un = &unf_single;
	} else {
		un = kcalloc(min(blocks_needed, max_to_insert),
			     UNFM_P_SIZE, GFP_NOFS);
		if (!un) {
			un = &unf_single;
			blocks_needed = 1;
			max_to_insert = 0;
		}
	}

The logic to free 'un'

	if (blocks_needed != 1)
		kfree(un);

Because the kcalloc failure falls back to using unf_single,
the if-check for the free is wrong.

So improve the check.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/reiserfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 1509775da040..4d62148e43e6 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -1079,7 +1079,7 @@ int reiserfs_get_block(struct inode *inode, sector_t block,
 						     UNFM_P_SIZE *
 						     blocks_needed);
 
-			if (blocks_needed != 1)
+			if (un != &unf_single)
 				kfree(un);
 
 			if (retval) {
-- 
2.18.1

