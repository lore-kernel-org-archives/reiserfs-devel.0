From: Jan Kara <jack@suse.cz>
Subject: [PATCH v2] reiserfs: Deprecate reiserfs
Date: Fri, 25 Feb 2022 13:54:45 +0100
Message-ID: <20220225125445.29942-1-jack@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1645793689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=K7v2cNhEfZttrym4TA/C4zAe3x6GtkUapRVJt+XXFK4=;
        b=CSrV+17MDK+t6ZvsPjS64C1wSAmbw4HwDvNdX8n74K+jS57XlGlfnn5pziXhONkAY17txA
        DHpFuzgyNxFnLDxTgPm3uvBUB9wPtyobeQvD4ihjnLr3J4d0gYINj5Y3OFmyqlsWq21Xhc
        K41m+1JRX0PuMztAXopKanOoARDHNHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1645793689;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=K7v2cNhEfZttrym4TA/C4zAe3x6GtkUapRVJt+XXFK4=;
        b=WQMDDJUn9uMBHuB59gDJll6gI+tPddGlRGlt2pYHmJ6jLgZty6aTcgyYprqRh8AzJIdMNn
        +D+IEq+9Mu/rzvAA==
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010; h=from:subject; bh=Gdd2dSmEmqLtoBu6wjiQ4Z7A5UpuySTnjTAtDhIu8qY=; b=owGbwMvMwME4Z+4qdvsUh5uMp9WSGJIkLrYUfLKOuN1aMGdraNS6zdGqM9VU2JwU9knv2DDLiL/R I/VqJ6MxCwMjB4OsmCLL6siL2tfmGXVtDdWQgRnEygQyhYGLUwAmYm/IwfD60pO4GbxFP0uz2O9wKN QeTXxc8P6hnTvnmRsPE1/EuodoSgRa+Hzcas+oGJUze58+i1nK0WebRH6vOF/21iKQO050ccTJS+bd 06fueCN4J+P2zHA9w7VuB+ZtjZb79rZNQdmo5s3y0/8Zv2xzr34SL7KLQ2oR1w4F7vtN/jHS4k8Ybb YGaV31aFy39yVXboI/0yYrqdjlmi9Dsps362q+uOKac0C4v49xl/aCbR1+Ot+e928MXnYgfsrFrzLh Ap2OEalhWXl58zssb2mccJLJ3OChfeJUbLXmuzWtk+J9K6adZTgQJNTs/JKnbbeZ8tOL4U9V5pq97L IN/iJfV6Fl6MTjGVvVVNloKXkCAA==
X-Developer-Key: i=jack@suse.cz; a=openpgp; fpr=93C6099A142276A28BBE35D815BC833443038D8C
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Edward Shishkin <edward.shishkin@gmail.com>, Matthew Wilcox <willy@infradead.org>, Byron Stanoszek <gandalf@winds.org>, Jan Kara <jack@suse.cz>

Reiserfs is relatively old filesystem and its development has ceased
quite some years ago. Linux distributions moved away from it towards
other filesystems such as btrfs, xfs, or ext4. To reduce maintenance
burden on cross filesystem changes (such as new mount API, iomap, folios
...) let's add a deprecation notice when the filesystem is mounted and
schedule its removal to 2025.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/Kconfig | 10 +++++++---
 fs/reiserfs/super.c |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

Changes since v1:
* Changed target year to 2025

If nobody has reasons against this, I'll send the patch to Linus during the
next merge window.

diff --git a/fs/reiserfs/Kconfig b/fs/reiserfs/Kconfig
index 8fd54ed8f844..33c8b0dd07a2 100644
--- a/fs/reiserfs/Kconfig
+++ b/fs/reiserfs/Kconfig
@@ -1,10 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config REISERFS_FS
-	tristate "Reiserfs support"
+	tristate "Reiserfs support (deprecated)"
 	select CRC32
 	help
-	  Stores not just filenames but the files themselves in a balanced
-	  tree.  Uses journalling.
+	  Reiserfs is deprecated and scheduled to be removed from the kernel
+	  in 2025. If you are still using it, please migrate to another
+	  filesystem or tell us your usecase for reiserfs.
+
+	  Reiserfs stores not just filenames but the files themselves in a
+	  balanced tree.  Uses journalling.
 
 	  Balanced trees are more efficient than traditional file system
 	  architectural foundations.
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 82e09901462e..a18be1a18f84 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1652,6 +1652,8 @@ static int read_super_block(struct super_block *s, int offset)
 		return 1;
 	}
 
+	reiserfs_warning(NULL, "", "reiserfs filesystem is deprecated and "
+		"scheduled to be removed from the kernel in 2025");
 	SB_BUFFER_WITH_SB(s) = bh;
 	SB_DISK_SUPER_BLOCK(s) = rs;
 
-- 
2.31.1

