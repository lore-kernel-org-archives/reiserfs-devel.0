From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] reiser4: fix up cluster nodes accounting
Date: Tue, 16 Jul 2013 19:01:26 +0200
Message-ID: <51E57C66.6070506@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030607060306020506070007"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=uW4TIk1JOgAFnrie7hWRMB9HrW88MGZl6xyp/KNJgLE=;
        b=o9SC22sbvjYJibjjoBcoiOFip2gwi4o/wLUCEusTaRDaSMD72BAvBq7yqtMrOWgumu
         01HiOdatEtggpcEENsX19TVK/RsR3m0BeELcuCcInByxUwQFv4kVDkRj5P1k7tkjLETm
         lLBsBh2/WPGB7vQ1EDJI8Mc+0kO7BMR1Y7QtAgG8pFCHbTmYeIM2mPxtZDJ3TNtcH/TI
         pnnoyol3cSeGvqISqsUaT6qSja2hgBtf1vcCJ7snrVu8/BweHEY75pT3XIJ4rFd+ydpl
         y+UmBFgZL8vA5ao9oVUclkdTkresuXAQmSv5D1tlgh1+ZGpbus8E/bLyFOdI/ifRm1RI
         fc5A==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030607060306020506070007
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------030607060306020506070007
Content-Type: text/x-patch;
 name="reiser4-fix-cluster-nodes-accounting.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-cluster-nodes-accounting.patch"

Problem:
Rare-occured oops when using transparent compression:
kernel BUG at fs/reiser4/block_alloc.c:151

The bug:
Incorrect accounting of nodes, occupied by cluster (ctail items group):
node, which contains the first item in the cluster wasn't take into account.

Fixup:
Increnent the counter of nodes, when the first item is found.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/file/cryptcompress.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-3.9.2.orig/fs/reiser4/plugin/file/cryptcompress.c
+++ linux-3.9.2/fs/reiser4/plugin/file/cryptcompress.c
@@ -816,6 +816,8 @@ static int find_cluster_item(hint_t * hi
 		/*
 		 * item has been found in the current node
 		 */
+		dclust_inc_extension_ncount(hint);
+
 		return CBK_COORD_FOUND;
 	}
  not_found:

--------------030607060306020506070007--
