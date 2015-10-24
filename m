From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 3/3] reiser4: mark pages created during tail2extent conversion as dirty.
Date: Sun, 25 Oct 2015 02:02:20 +0300
Message-ID: <1445727740-12361-4-git-send-email-intelfx100@gmail.com>
References: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zEELBmcY3Lrw7ZH8BGh3+w13jbpYr113lRRRthm2CMw=;
        b=IhGSi0TTr123FwCbvewyTP+q7KOsV+ez7MtKXL7vF1PV3Ac6FqhDFVvbgxJMZHBqhr
         9IArefacDyV5j+8IIqlF5osyngxYFqeODc6+xMtIqqYe2oUL6fh1fnL5UTbXX+/l42F7
         ywDCirPyRkZmS//AVnFJqxQo/HMs4rQkA1vLuL/0DV0JHc/iiErldq+J0/C9kC3qw2FI
         hjufYxHj3BY+gMzFaLE+epilckySAMURl8yHYGP8L2L5FSWXVhAfL5LyP12ghyW1eEqx
         DBPoqcVHR+hikFrTA8RadHxfVCFw2MTgd6dJLjQZv8aXP+HvCG+ze5T8Y7Qq2qnadApX
         mz8Q==
In-Reply-To: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

This is responsible for an oops in v4.2 in
write_jnodes_to_disk_extent() -> set_page_writeback().

The pages needs to be marked dirty before marked writeback.

From a similar problem in f2fs:
"The cgroup attaches inode->i_wb via mark_inode_dirty and when
set_page_writeback is called, __inc_wb_stat() updates i_wb's stat.

So, we need to explicitly call set_page_dirty->__mark_inode_dirty in
prior to any writebacking pages."

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/plugin/file/tail_conversion.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/reiser4/plugin/file/tail_conversion.c b/fs/reiser4/plugin/file/tail_conversion.c
index 7542c03..c856b73 100644
--- a/fs/reiser4/plugin/file/tail_conversion.c
+++ b/fs/reiser4/plugin/file/tail_conversion.c
@@ -175,6 +175,7 @@ static int replace(struct inode *inode, struct page **pages, unsigned nr_pages,
 								i_mapping));
 		if (result)
 			break;
+		set_page_dirty_notag(pages[i]);
 		unlock_page(pages[i]);
 		result = find_or_create_extent(pages[i]);
 		if (result) {
-- 
2.6.2

