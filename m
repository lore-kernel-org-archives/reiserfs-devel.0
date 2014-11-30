From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/3] reiser4: don't panic in do_readpage_ctail
Date: Sun, 30 Nov 2014 22:42:28 +0100
Message-ID: <547B8F44.3080408@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060708020602010905000709"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=rOj7bWWbRgilfrXUBHz6tKZBi2/n72dj9jqcSR0tGqU=;
        b=J9HhjuXv9Q0BdhM56DnnhZSNiCS2LQzZ7vM7NdsVWMR6sWlOeVv27EaCadtp7HoStV
         H8Dr/7dqgfY3e63rAWpFAuC4sUFmQ60Yi953/V0u7KKMzbhu4rmtBfiHjHBnoZ94YF9A
         lpp5b0gZozqW5cBIz0OzU1UDJUtMFX6VTD7BP74NE+OsJMHoKUcoC2xQ9Kn+6BMcNRYj
         jD4rOXnvP9vTPcydak4lWZZKplivoJqf6IBrotwh2TNS3sAIZGgg/LACtZFJSCxSvaiy
         3DM703MoS4CFDOGijpniacDOVJtoVNEEJHjErkMTelOo3/7Th4YF5wrMmEQhT1odUpDP
         EAoQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060708020602010905000709
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

--------------060708020602010905000709
Content-Type: text/x-patch;
 name="reiser4-fix-do_readpage_ctail.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-do_readpage_ctail.patch"

Don't panic when unprepped ctail cluster is found.
Instead, return error and suggest to fsck.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/item/ctail.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

--- a/fs/reiser4/plugin/item/ctail.c
+++ b/fs/reiser4/plugin/item/ctail.c
@@ -666,7 +666,15 @@ int do_readpage_ctail(struct inode * ino
 
 	switch (clust->dstat) {
 	case UNPR_DISK_CLUSTER:
-		BUG_ON(1);
+		/*
+		 * Page is not uptodate and item cluster is unprepped:
+		 * this must not ever happen.
+		 */
+		warning("edward-1632",
+			"Bad item cluster %lu (Inode %llu). Fsck?",
+			clust->index,
+			(unsigned long long)get_inode_oid(inode));
+		return RETERR(-EIO);
 	case TRNC_DISK_CLUSTER:
 		/*
 		 * Race with truncate!

--------------060708020602010905000709--
