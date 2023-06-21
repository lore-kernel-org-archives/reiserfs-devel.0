From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] reiserfs: Replace one-element array with
 flexible-array member
Date: Wed, 21 Jun 2023 16:43:54 -0600
Message-ID: <ZJN9Kqhcs0ZGET/8@work>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687387378;
        bh=4kl07al0Jzvum5d8UANt44upxbmeLGvcypOHEKRd24g=;
        h=Date:From:To:Cc:Subject:From;
        b=a2QblHnOuvKjfWHwLNTTBOT/dKg0l/lM4+DxplEJkUhTJBJFfJfSaLpbh8VpmRh2M
         Fdm/WkVndX/G1Jkz7Yaf4kT+3GsgDZD+doKNXwWCP3GcJrfvBPuJpKaATiwz8n2fZR
         zkMHGCDvuhEJYb0P1StefrO2WIE2K1vdXtrNGWv6bFbzDhA4RBPC7A2tSe8q+GWwkK
         oIQbxvwrLwpQDF1Co2k9cudV2F8MdEECv1lDox7ulPYrukl8oPD18cO1LUfo3XEiQE
         Dkx00pw2DQ0ZnpmrWePGzR4e1Q4AU34al9+hS7sQ2q0oqDuSa5CERmUghq+IYLVeps
         02aR1CvCvJdOg==
Content-Disposition: inline
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>

One-element arrays are deprecated, and we are replacing them with flexible
array members instead. So, replace one-element array with flexible-array
member in direntry_uarea structure, and refactor the rest of the code,
accordingly.

Worth mentioning is that before these changes, the original implementation
was returning two-too many bytes in function direntry_create_vi():

fs/reiserfs/item_ops.c:464:     int size = sizeof(struct direntry_uarea);
...
fs/reiserfs/item_ops.c-490-     size += (dir_u->entry_count * sizeof(short));
...
fs/reiserfs/item_ops.c-517-     return size;

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/290
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 fs/reiserfs/fix_node.c | 5 +++--
 fs/reiserfs/reiserfs.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
index fefe87e1c099..6c13a8d9a73c 100644
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -2252,8 +2252,9 @@ static int get_virtual_node_size(struct super_block *sb, struct buffer_head *bh)
 
 	return sizeof(struct virtual_node) +
 	    max(max_num_of_items * sizeof(struct virtual_item),
-		sizeof(struct virtual_item) + sizeof(struct direntry_uarea) +
-		(max_num_of_entries - 1) * sizeof(__u16));
+		sizeof(struct virtual_item) +
+		struct_size_t(struct direntry_uarea, entry_sizes,
+			      max_num_of_entries));
 }
 
 /*
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 55e85256aae8..b81749492ef9 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -2373,7 +2373,7 @@ struct virtual_node {
 struct direntry_uarea {
 	int flags;
 	__u16 entry_count;
-	__u16 entry_sizes[1];
+	__u16 entry_sizes[];
 } __attribute__ ((__packed__));
 
 /***************************************************************************
-- 
2.34.1

