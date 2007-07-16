From: Edward Shishkin <edward@namesys.com>
Subject: [patch 2/3] reiser4: fix read_tail
Date: Mon, 16 Jul 2007 22:51:00 +0400
Message-ID: <469BBE14.3030006@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030807070801090609000905"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Zan Lynx <zlynx@acm.org>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030807070801090609000905
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit




--------------030807070801090609000905
Content-Type: text/x-patch;
 name="reiser4-fix-read_tail.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-read_tail.patch"

Update hint when reading tails

Signed-off-by: Edward Shishkin <edward@namesys.com>
---
 linux-2.6.22-rc6-mm1/fs/reiser4/plugin/item/tail.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.22-rc6-mm1/fs/reiser4/plugin/item/tail.c.orig
+++ linux-2.6.22-rc6-mm1/fs/reiser4/plugin/item/tail.c
@@ -758,7 +758,7 @@
 		coord->unit_pos--;
 		coord->between = AFTER_UNIT;
 	}
-
+	reiser4_set_hint(hint, &f->key, ZNODE_READ_LOCK);
 	return 0;
 }
 


--------------030807070801090609000905--
