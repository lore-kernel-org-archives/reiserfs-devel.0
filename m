From: Stoyan Gaydarov <stoyboyker@gmail.com>
Subject: [PATCH 22/25] [reiserfs] BUG to BUG_ON changes
Date: Tue, 10 Mar 2009 00:10:47 -0500
Message-ID: <1236661850-8237-23-git-send-email-stoyboyker@gmail.com>
References: <1236661850-8237-1-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-2-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-3-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-4-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-5-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-6-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-7-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-8-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-9-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-10-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-11-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-12-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-13-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-14-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-15-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-16-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-17-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-18-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-19-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-20-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-21-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-22-git-send-email-stoyboyker@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=UqIgIMqafHitpWzcsXc4pLSqoy02+p6sudykZ/xTYX8=;
        b=ocYH8at0og2z/BP1YzmZqzqvse1N2mTuBirhrijCnkoPZRKwiPI3S/eFgUr7Qv1GD+
         dD/ob6s+aSOFS7qyeUJ3IANvCWws4Hohlgnru4PrpK9vmlA+GtSA/LdLKKlBOFAlNeVK
         JPuV+YUl8Oov+TWxoF7k9sLNmrkIAh0k+kW18=
In-Reply-To: <1236661850-8237-22-git-send-email-stoyboyker@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Stoyan Gaydarov <stoyboyker@gmail.com>, reiserfs-devel@vger.kernel.org

Signed-off-by: Stoyan Gaydarov <stoyboyker@gmail.com>
---
 include/linux/reiserfs_fs.h |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/include/linux/reiserfs_fs.h b/include/linux/reiserfs_fs.h
index bc5114d..67a38f5 100644
--- a/include/linux/reiserfs_fs.h
+++ b/include/linux/reiserfs_fs.h
@@ -1707,8 +1707,7 @@ static inline int reiserfs_transaction_running(struct super_block *s)
 	struct reiserfs_transaction_handle *th = current->journal_info;
 	if (th && th->t_super == s)
 		return 1;
-	if (th && th->t_super == NULL)
-		BUG();
+	BUG_ON(th && th->t_super == NULL);
 	return 0;
 }
 
-- 
1.6.1.3

