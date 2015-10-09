From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 2/3] reiser4: call account_page_redirty() on re-dirtying pages before giving them to entd.
Date: Fri,  9 Oct 2015 14:16:56 +0300
Message-ID: <1444389417-14929-3-git-send-email-intelfx100@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LB6oh6BOXCzIYvKeX0eVD+j7C6r083chPky5GzVLA28=;
        b=UG5QDQVaIa8g0u5Wjoj8RnExoFbBEbQN830NMsbcXNh0lyQTKcsLkFx9LUkQ5VmkPj
         hBk+XUs5131EiIs57hEReOrGvAJfcNvPlrLvle6RUOmPBv2Kjp0R2N+W+yPAgjpQWjg4
         7a4oFCs5+uugfYUzA13b+qR8doSPuX39d6zp1yMsUDqVOcpQ02EtLeIKxURRNqPdXfVR
         p1CYqd4N6QRLAuEsOgh0oODjGE7oOLyVowbIuORm1FUk4ArlsN2ttW8RLh6RSvmB6Z7o
         hHXI6L5laoJ3r5nc0Dt5xQpFHa7W0LVVwO3lZNN5I9/4ffO96fEV6tG2exqYhfkSlGVt
         CUBQ==
In-Reply-To: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

I guess we want that to rollback effects of account_page_dirtied()
in set_page_dirty_notag().

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

As always -- I'm not sure that this change is correct, but it seems so.

 fs/reiser4/entd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/reiser4/entd.c b/fs/reiser4/entd.c
index bff4bfa..c254e71 100644
--- a/fs/reiser4/entd.c
+++ b/fs/reiser4/entd.c
@@ -303,6 +303,7 @@ int write_page_by_ent(struct page *page, struct writeback_control *wbc)
 	 * write it - it will remain dirty
 	 */
 	set_page_dirty_notag(page);
+	account_page_redirty(page);
 
 	/*
 	 * pin inode in memory, unlock page, entd_flush will iput. We can not
-- 
2.6.0

